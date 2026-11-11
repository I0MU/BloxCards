



local replicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")
local httpService: HttpService = game:GetService("HttpService")
local loadLibrary = require(replicatedStorage:WaitForChild("NevermoreEngine")).LoadLibrary
local v4 = loadLibrary("qSystems")

loadLibrary("qInstance")

local make = v4.Make
local t1: {[any]: any} = {
	Vector3.new(-1, -1, -1),
	Vector3.new(1, -1, -1),
	Vector3.new(-1, 1, -1),
	Vector3.new(1, 1, -1),
	Vector3.new(-1, -1, 1),
	Vector3.new(1, -1, 1),
	Vector3.new(-1, 1, 1),
	Vector3.new(1, 1, 1)
}

local function QuaternionFromCFrame(p2)
	local v37, v38, v39, v40, v41, v42, v43, v44, v45, v46, v47, v48 = p2:components()
	local n1 = v40 + v44 + v48

	if n1 > 0 then
		local squareRoot = math.sqrt(1 + n1)
		local n2 = 0.5 / squareRoot

		return (v47 - v45) * n2, (v42 - v46) * n2, (v43 - v41) * n2, squareRoot * 0.5
	end

	local n3: number = 0

	if v40 < v44 then
		n3 = 1
	end

	if v48 > (n3 == 0 and v40 or v44) then
		n3 = 2
	end

	if n3 == 0 then
		local squareRoot = math.sqrt(v40 - v44 - v48 + 1)
		local n4 = 0.5 / squareRoot

		return squareRoot * 0.5, (v43 + v41) * n4, (v46 + v42) * n4, (v47 - v45) * n4
	end

	if n3 == 1 then
		local squareRoot = math.sqrt(v44 - v48 - v40 + 1)
		local n5 = 0.5 / squareRoot

		return (v41 + v43) * n5, squareRoot * 0.5, (v47 + v45) * n5, (v42 - v46) * n5
	end

	if n3 == 2 then
		local squareRoot = math.sqrt(v48 - v40 - v44 + 1)
		local n6 = 0.5 / squareRoot

		return (v42 + v46) * n6, (v45 + v47) * n6, squareRoot * 0.5, (v43 - v41) * n6
	end
end
local function QuaternionToCFrame(p3, p4, p5, p6, p7, p8, p9)
	local n1 = p6 + p6
	local n2 = p7 + p7
	local n3 = p8 + p8
	local n4 = p9 * n1
	local n5 = p9 * n2
	local n6 = p9 * n3
	local n7 = p6 * n1

	n1 = p6 * n2

	local n8 = p6 * n3
	local n9 = p7 * n2

	n2 = p7 * n3

	local n10 = p8 * n3

	return CFrame.new(p3, p4, p5, 1 - (n9 + n10), n1 - n6, n8 + n5, n1 + n6, 1 - (n7 + n10), n2 - n4, n8 - n5, n2 + n4, 1 - (n7 + n9))
end
local function QuaternionSlerp(list, list2, p12)
	local n1 = list[1] * list2[1] + list[2] * list2[2] + list[3] * list2[3] + list[4] * list2[4]
	local n2
	local n3

	if not (n1 >= 0.0001) then
		if 1 + n1 > 0.0001 then
			local v84 = math.acos(-n1)
			local n4 = 1 / math.sin(v84)

			n2 = math.sin((p12 - 1) * v84) * n4
			n3 = math.sin(p12 * v84) * n4
		else
			n2 = p12 - 1
			n3 = p12
		end
	elseif 1 - n1 > 0.0001 then
		local v86 = math.acos(n1)
		local n5 = 1 / math.sin(v86)

		n2 = math.sin((1 - p12) * v86) * n5
		n3 = math.sin(p12 * v86) * n5
	else
		n2 = 1 - p12
		n3 = p12
	end

	return list[1] * n2 + list2[1] * n3, list[2] * n2 + list2[2] * n3, list[3] * n2 + list2[3] * n3, list[4] * n2 + list2[4] * n3
end
local function TweenPart(p13, p14, p15, p16)
	local t3: {[any]: any} = { QuaternionFromCFrame(p14) }
	local t4: {[any]: any} = { QuaternionFromCFrame(p15) }
	local x = p14.x
	local y = p14.y
	local z = p14.z
	local v96 = p15.x
	local v97 = p15.y
	local v98 = p15.z
	local n1: number = 0
	local n2 = 0
	local timestamp = tick()

	while true do
		wait()

		local n3 = (tick() - timestamp) / p16
		local n4 = 1 - n3

		if n3 > 1 then
			break
		end

		local timestamp2 = tick()
		local cFrame = QuaternionToCFrame(n4 * x + n3 * v96, n4 * y + n3 * v97, n4 * z + n3 * v98, QuaternionSlerp(t3, t4, n3))
		local timestamp3 = tick()

		n2 += timestamp3 - timestamp2
		n1 += 1
		p13.CFrame = cFrame
	end
end
local function SlerpCFrame(p21, p22, p23)
	local n1 = 1 - p23

	return QuaternionToCFrame(n1 * p21.x + p23 * p22.x, n1 * p21.y + p23 * p22.y, n1 * p21.z + p23 * p22.z, QuaternionSlerp({ QuaternionFromCFrame(p21) }, { QuaternionFromCFrame(p22) }, p23))
end

local vector3New = Vector3.new
local mathAcos = math.acos
local components = CFrame.new().components
local inverse = CFrame.new().inverse
local cFrameFromAxisAngle = CFrame.fromAxisAngle
local mathAbs = math.abs

local function AxisAngleInterpolate(p24, p25, p26)
	local v114 = inverse(p24)
	local v115, v116, v117, v118, v119, v120, v121, v122, v123, v124, v125, v126 = components(v114 * p25)

	v114 = (v118 + v122 + v126 - 1) / 2

	local n1 = (p25.p - p24.p) * p26
	local v128 = mathAbs(v114) < 0.99999 and vector3New(v125 - v123, v120 - v124, v121 - v119) or Vector3.new(0, 1, 0)
	local v129 = mathAcos(if v114 > 1 then 1 else if v114 < -1 then -1 else v114)
	local v130 = cFrameFromAxisAngle(v128, v129 * p26)

	return p24 * v130 + n1
end

local toObjectSpace = CFrame.new().toObjectSpace
local toWorldSpace = CFrame.new().toWorldSpace

local function TransformModel(p27, p28, p29)
	for _, v in pairs(p27) do
		v.CFrame = toWorldSpace(p29, toObjectSpace(p28, v.CFrame))
	end
end
local function MakeModelTransformer(p30, p31)
	local t5: {[any]: any} = {}

	for _, v in pairs(p30) do
		t5[v] = toObjectSpace(p31, v.CFrame)
	end

	return function(p32)
		for k, v in pairs(t5) do
			k.CFrame = toWorldSpace(p32, v)
		end
	end
end

local pointToObjectSpace = CFrame.new().pointToObjectSpace

local function PointInsidePart(p33, p34)
	local n1 = p33.Size / 2
	local v144 = p33.CFrame:pointToObjectSpace(p34)

	if v144.X >= -n1.X and v144.X <= n1.X then
		if not (v144.Y >= -n1.Y) or not (v144.Y <= n1.Y) then
		elseif v144.Z >= -n1.Z and v144.Z <= n1.Z then
			return true
		end

		return false
	end

	return false
end

local workspaceFindPartOnRayWithIgnoreList = workspace.FindPartOnRayWithIgnoreList

local function AdvanceRaycast(p35, p36, p37, p38, p39, p40, p41)
	local typeName: string = type(p40)

	assert(typeName == "number", "MaximumCastCount is not a number")

	local typeName2: string = type(p37)

	assert(typeName2 == "number", "TransparencyThreshold must be a number")

	local n1: number = 0

	local function CastAttempt(p42)
		if n1 >= p40 then
			return
		end

		n1 += 1

		local v407, v408 = workspaceFindPartOnRayWithIgnoreList(workspace, p42, p36, p39)

		if v407 and v408 then
			if p41 and p41(v407, v408) then
				return v407, v408
			end

			if p38 and v407.CanCollide == false then
				p36[#p36 + 1] = v407

				return CastAttempt(p42)
			end

			if p37 and v407.Transparency >= p37 then
				p36[#p36 + 1] = v407

				return CastAttempt(p42)
			end

			return v407, v408
		end
	end

	local unit = p35.Direction.unit
	local magnitude = p35.Direction.magnitude
	local n2 = 0

	while magnitude > n2 do
		local n3 = magnitude - n2

		if n3 > 999.5 then
			n3 = 999
		end

		local ray = Ray.new(p35.Origin + unit * n2, unit * n3)
		local v161, v162 = CastAttempt(ray)

		if v161 then
			return v161, v162
		end

		n2 += n3

		if p40 <= n1 then
			local n4: number = n1

			print("[AdvanceRaycast] - Reached maximum cast count @ " .. n4 .. "; MaximumCastCount = " .. p40)

			return nil
		end
	end
end
local function WeldTogether(parent, part1, p45, _, p47)
	local v169 = p47 or parent.CFrame
	local v170 = Instance.new(p45 or "Weld")

	v170.Part0 = parent
	v170.Part1 = part1
	v170.C0 = parent.CFrame:toObjectSpace(v169)
	v170.C1 = part1.CFrame:toObjectSpace(v169)
	v170.Parent = parent

	return v170
end
local function WeldParts(p48, parent, p50, p51)
	for _, v in pairs(p48) do
		if v ~= parent then
			local CFrame = nil

			CFrame = parent.CFrame

			local v178 = CFrame

			CFrame = Instance.new(p50 or "Weld")
			CFrame.Part0 = parent
			CFrame.Part1 = v
			CFrame.C0 = parent.CFrame:toObjectSpace(v178)
			CFrame.C1 = v.CFrame:toObjectSpace(v178)
			CFrame.Parent = parent
		end
	end

	if not p51 then
		for _, v in pairs(p48) do
			v.Anchored = false
		end

		parent.Anchored = false
	end
end

local module: {[any]: any} = {
	GetBoundingBox = function(p1)
		local t6: {[any]: any} = { -math.huge, math.huge, -math.huge, math.huge, -math.huge, math.huge }

		for _, v in pairs(p1) do
			local n1 = v.Size / 2
			local vCFrame = v.CFrame

			for _, iterValue in pairs(t1) do
				local cFrame = CFrame.new(n1 * iterValue)
				local n2 = vCFrame * cFrame.p

				if n2.x > t6[1] then
					t6[1] = n2.x
				end

				if n2.x < t6[2] then
					t6[2] = n2.x
				end

				if n2.y > t6[3] then
					t6[3] = n2.y
				end

				if n2.y < t6[4] then
					t6[4] = n2.y
				end

				if n2.z > t6[5] then
					t6[5] = n2.z
				end

				if n2.z < t6[6] then
					t6[6] = n2.z
				end
			end
		end

		local vector3 = Vector3.new(t6[1] - t6[2], t6[3] - t6[4], t6[5] - t6[6])
		local vector32 = Vector3.new((t6[1] + t6[2]) / 2, (t6[3] + t6[4]) / 2, (t6[5] + t6[6]) / 2)

		return vector3, vector32
	end,
	QuaternionFromCFrame = QuaternionFromCFrame,
	quaternionFromCFrame = QuaternionFromCFrame,
	QuaternionToCFrame = QuaternionToCFrame,
	quaternionToCFrame = QuaternionToCFrame,
	QuaternionSlerp = QuaternionSlerp,
	quaternionSlerp = QuaternionSlerp,
	TweenPart = TweenPart,
	tweenPart = TweenPart,
	EncodeQuaternionCFrame = function(p17)
		return httpService:JSONEncode({ p17.x, p17.y, p17.z, QuaternionFromCFrame(p17) })
	end,
	DecodeQuaternionCFrame = function(p18)
		if p18 then
			local decodedJson: any = httpService:JSONDecode(p18)

			if decodedJson then
				return QuaternionToCFrame(unpack(decodedJson))
			end

			return nil
		end

		return nil
	end,
	EncodeCFrame = function(p19)
		return httpService:JSONEncode({ p19:components() })
	end,
	DecodeCFrame = function(p20)
		if p20 then
			local decodedJson: any = httpService:JSONDecode(p20)

			if decodedJson then
				return CFrame.new(unpack(decodedJson))
			end

			return nil
		end

		return nil
	end,
	QuaternionSlerpCFrame = SlerpCFrame,
	quaternionSlerpCFrame = SlerpCFrame,
	AxisAngleInterpolate = AxisAngleInterpolate,
	axisAngleInterpolate = AxisAngleInterpolate,
	FastSlerp = AxisAngleInterpolate,
	fastSlerp = AxisAngleInterpolate,
	SlerpCFrame = AxisAngleInterpolate,
	slerpCFrame = AxisAngleInterpolate,
	TransformModel = TransformModel,
	transformModel = TransformModel,
	MakeModelTransformer = MakeModelTransformer,
	makeModelTransformer = MakeModelTransformer,
	pointToObjectSpace = pointToObjectSpace,
	PointToObjectSpace = pointToObjectSpace,
	PointInsidePart = PointInsidePart,
	pointInsidePart = PointInsidePart,
	AdvanceRaycast = AdvanceRaycast,
	advanceRaycast = AdvanceRaycast,
	WeldTogether = WeldTogether,
	WeldTogether = WeldTogether,
	WeldParts = WeldParts,
	weldParts = WeldParts
}

WeldParts = function(p52, p53)
	local n1 = p52.CFrame:toObjectSpace(CFrame.new(p53)).p / ((p52.Size - Vector3.new(0.02, 0.02, 0.02)) / 2)
	local absoluteValue = math.abs(n1.X)
	local absoluteValue2 = math.abs(n1.Y)
	local absoluteValue3 = math.abs(n1.Z)
	local vector3 = Vector3.new(absoluteValue, absoluteValue2, absoluteValue3)
	local vectorValue = Vector3.new(0, 1, 0)

	if p52:IsA("Part") and (p52.Shape == Enum.PartType.Ball or p52.Shape == Enum.PartType.Cylinder) then
		return (p53 - p52.Position).unit
	end

	if p52:IsA("WedgePart") and (n1.Y > 0 or n1.Z < 0) and vector3.X < 1 and vector3.Y < 1 and vector3.Z < 1 then
		local cFrameNew = CFrame.new
		local v208 = p52.Position
		local v209 = p52.CFrame
		local cFrame = CFrame.new(0, p52.Size.Z, -p52.Size.Y)

		return cFrameNew(v208, (v209 * cFrame).p).lookVector
	end

	if math.abs(n1.X) > math.abs(n1.Y) and math.abs(n1.X) > math.abs(n1.Z) then
		local n2 = module.vecRight(p52.CFrame) * n1.X
		local absoluteValue4 = math.abs(n1.X)

		return n2 / absoluteValue4
	end

	if math.abs(n1.Y) >= math.abs(n1.X) and math.abs(n1.Y) >= math.abs(n1.Z) then
		local n3 = module.vecUp(p52.CFrame) * n1.Y
		local absoluteValue5 = math.abs(n1.Y)

		return n3 / absoluteValue5
	end

	local absoluteValue6 = math.abs(n1.Z)
	local absoluteValue7 = math.abs(n1.X)

	if absoluteValue6 > absoluteValue7 and math.abs(n1.Z) > math.abs(n1.Y) then
		local n4 = module.vecForwards(p52.CFrame) * -n1.Z
		local absoluteValue8 = math.abs(n1.Z)

		vectorValue = n4 / absoluteValue8
	end

	return vectorValue
end
module.GetSurfaceNormal = WeldParts
module.getSurfaceNormal = WeldParts
WeldParts = function(p54)
	local v220, v221, v222, v223, v224, v225, v226, v227, v228, v229, v230, v231 = p54:components()
	local vector3 = Vector3.new(v223, v226, v229)

	return vector3
end
module.GetRightVector = WeldParts
module.getRightVector = WeldParts
AxisAngleInterpolate = function(p55)
	local v234, v235, v236, v237, v238, v239, v240, v241, v242, v243, v244, v245 = p55:components()
	local vector3 = Vector3.new(-v237, -v240, -v243)

	return vector3
end
module.GetLeftVector = AxisAngleInterpolate
module.getLeftVector = AxisAngleInterpolate
AxisAngleInterpolate = function(p56)
	local v248, v249, v250, v251, v252, v253, v254, v255, v256, v257, v258, v259 = p56:components()
	local vector3 = Vector3.new(v252, v255, v258)

	return vector3
end
module.GetTopVector = AxisAngleInterpolate
module.getTopVector = AxisAngleInterpolate
AxisAngleInterpolate = function(p57)
	local v262, v263, v264, v265, v266, v267, v268, v269, v270, v271, v272, v273 = p57:components()
	local vector3 = Vector3.new(-v266, -v269, -v272)

	return vector3
end
module.GetBottomVector = AxisAngleInterpolate
module.getBottomVector = AxisAngleInterpolate
AxisAngleInterpolate = function(p58)
	local v276, v277, v278, v279, v280, v281, v282, v283, v284, v285, v286, v287 = p58:components()
	local vector3 = Vector3.new(v281, v284, v287)

	return vector3
end
module.GetBackVector = AxisAngleInterpolate
module.getBackVector = AxisAngleInterpolate

local function getFrontVector(p59)
	local v290, v291, v292, v293, v294, v295, v296, v297, v298, v299, v300, v301 = p59:components()
	local vector3 = Vector3.new(-v295, -v298, -v301)

	return vector3
end

module.GetFrontVector = getFrontVector
module.getFrontVector = getFrontVector

local function getCFrameFromTopBack(p60, p61, p62)
	local v306 = p61:Cross(p62)

	return CFrame.new(p60.x, p60.y, p60.z, v306.x, p61.x, p62.x, v306.y, p61.y, p62.y, v306.z, p61.z, p62.z)
end

module.GetCFrameFromTopBack = getCFrameFromTopBack
module.getCFrameFromTopBack = getCFrameFromTopBack

local function getRotationInXZPlane(p63)
	local v308, v309, v310, v311, v312, v313, v314, v315, v316, v317, v318, v319 = p63:components()
	local vector3 = Vector3.new(v313, v316, v319)
	local p = p63.p
	local vector33 = Vector3.new(vector3.x, 0, vector3.z)

	return getCFrameFromTopBack(p, Vector3.new(0, 1, 0), vector33.unit)
end

module.GetRotationInXZPlane = getRotationInXZPlane
module.getRotationInXZPlane = getRotationInXZPlane

local function findFaceFromCoord(p64, p65)
	local n1 = -p64 / 2
	local n2 = p64 / 2
	local absoluteValue = math.abs(p65.x - n1.x)
	local absoluteValue9 = math.abs(p65.x - n2.x)
	local v329 = math.min(absoluteValue, absoluteValue9)
	local absoluteValue10 = math.abs(p65.y - n1.y)
	local absoluteValue11 = math.abs(p65.y - n2.y)
	local v332 = math.min(absoluteValue10, absoluteValue11)
	local absoluteValue12 = math.abs(p65.z - n1.z)
	local absoluteValue13 = math.abs(p65.z - n2.z)
	local v335 = math.min(absoluteValue12, absoluteValue13)

	if v329 < v332 and v329 < v335 then
		local absoluteValue14 = math.abs(p65.x - n1.x)
		local absoluteValue15 = math.abs(p65.x - n2.x)

		if absoluteValue14 < absoluteValue15 then
			return Enum.NormalId.Left
		end

		return Enum.NormalId.Right
	end

	if v329 > v332 and v332 < v335 then
		local absoluteValue16 = math.abs(p65.y - n1.y)
		local absoluteValue17 = math.abs(p65.y - n2.y)

		if absoluteValue16 < absoluteValue17 then
			return Enum.NormalId.Bottom
		end

		return Enum.NormalId.Top
	end

	if v329 > v335 and v332 > v335 then
		local absoluteValue18 = math.abs(p65.z - n1.z)
		local absoluteValue19 = math.abs(p65.z - n2.z)

		if absoluteValue18 < absoluteValue19 then
			return Enum.NormalId.Front
		end

		return Enum.NormalId.Back
	end
end

module.FindFaceFromCoord = findFaceFromCoord
module.findFaceFromCoord = findFaceFromCoord

local function GetCFramePitch(p66)
	return CFrame.Angles(p66, 0, 0)
end

module.GetCFramePitch = GetCFramePitch
module.getCFramePitch = GetCFramePitch
GetCFramePitch = function(p67)
	return CFrame.Angles(0, p67, 0)
end
module.GetCFrameYaw = GetCFramePitch
module.getCFrameYaw = GetCFramePitch
GetCFramePitch = function(p68)
	return CFrame.Angles(0, 0, p68)
end
module.GetCFrameRoll = GetCFramePitch
module.getCFrameRoll = GetCFramePitch
GetCFramePitch = function(p69)
	return -math.asin(p69.Y) + 1.5707963267948966
end
module.GetPitchFromLookVector = GetCFramePitch
module.getPitchFromLookVector = GetCFramePitch
GetCFramePitch = function(p70)
	return -math.atan2(p70.Z, p70.X) - 1.5707963267948966
end
module.GetYawFromLookVector = GetCFramePitch
module.getYawFromLookVector = GetCFramePitch
GetCFramePitch = function(p71)
	local cFrame = CFrame.new(p71.p, p71.p + p71.lookVector)
	local v349, v350, v351, v352, v353, v354, v355, v356, v357, v358, v359, v360 = cFrame:toObjectSpace(p71):components()
	local vector3 = Vector3.new(v352, v355, v358)

	return (math.atan2(vector3.Y, vector3.X))
end
module.GetRollFromCFrame = GetCFramePitch
module.getRollFromCFrame = GetCFramePitch
GetCFramePitch = function(p72, p73, p74)
	local drawnRay: Part = Instance.new("Part", p74 or workspace)

	drawnRay.FormFactor = "Custom"
	drawnRay.Size = Vector3.new(0.2, p72.Direction.magnitude, 0.2)

	local cFrame = CFrame.new(p72.Origin + p72.Direction / 2, p72.Origin + p72.Direction)
	local v367 = CFrame.Angles(1.5707963267948966, 0, 0)

	drawnRay.CFrame = cFrame * v367
	drawnRay.Anchored = true
	drawnRay.CanCollide = false
	drawnRay.Transparency = 0.5
	drawnRay.BrickColor = p73 or BrickColor.new("Bright red")
	drawnRay.Name = "DrawnRay"
	Instance.new("SpecialMesh", drawnRay)

	return drawnRay
end
module.DrawRay = GetCFramePitch
module.drawRay = GetCFramePitch
GetCFramePitch = function(p75, p76, p77)
	local pointRender: Part = Instance.new("Part")

	pointRender.Parent = p77 or workspace
	pointRender.Size = Vector3.new(1, 1, 1)
	pointRender.Transparency = 0.5
	pointRender.BrickColor = p76 or BrickColor.new("Bright red")
	pointRender.Name = "PointRender"
	pointRender.Archivable = false
	pointRender.Anchored = true
	pointRender.CanCollide = false
	pointRender.TopSurface = "Smooth"
	pointRender.BottomSurface = "Smooth"
	pointRender.Shape = "Ball"
	pointRender.CFrame = CFrame.new(p75)

	return pointRender
end
module.DrawPoint = GetCFramePitch
module.drawPoint = GetCFramePitch
GetCFramePitch = function(p78, p79)
	local v374 = findFaceFromCoord(p78.Size, p78.CFrame:toObjectSpace(CFrame.new(p79)))

	if v374 then
		local n1 = p78.CFrame - p78.Position
		local v376 = Vector3.FromNormalId(v374)

		v376 = (n1 * v376).unit:Dot(Vector3.new(0, -1, 0))
		n1 = math.acos(v376)

		return (math.abs(n1 - 3.141592653589793))
	end

	print("[GetSlopeRelativeToGravity] No face found")

	return nil
end
module.GetSlopeRelativeToGravity = GetCFramePitch
module.getSlopeRelativeToGravity = GetCFramePitch
GetCFramePitch = function(p80, p81, p82)
	local v380 = findFaceFromCoord(p80.Size, p80.CFrame:toObjectSpace(CFrame.new(p81)))

	if v380 then
		local n1 = p80.CFrame - p80.Position
		local v382 = Vector3.FromNormalId(v380)

		v382 = (n1 * v382).unit:Dot(p82)
		n1 = math.acos(v382)

		return (math.abs(n1 - 3.141592653589793))
	end

	print("[GetSlopeRelativeToGravity] No face found")

	return nil
end
module.GetSlopeRelativeToVector = GetCFramePitch
module.getSlopeRelativeToVector = GetCFramePitch

function module.LookCFrame(p83, p84, p85)
	local n1 = p85 and p85 / 2 or 0.5
	local unit = (p83:inverse() * p84).unit
	local u388 = false

	if math.abs(unit.z) < 1 then
		u388 = math.acos(-unit.z)
	end

	local v389 = u388

	if v389 then
		local sine = math.sin(n1 * u388)
		local sine2 = math.sin((1 - n1) * u388)
		local vector3 = Vector3.new(0, 0, sine2)
		local sine3 = math.sin(u388)

		v389 = (sine * unit - vector3) / sine3
	end

	return v389 and p83 * CFrame.new(0, 0, 0, v389.y, -v389.x, 0, -v389.z) or p83
end

local dot = Vector3.new().Dot

function module.VectorClosestPointOnRayAToRayB(p86, p87, p88, p89)
	local v398 = dot(p89, p87)
	local v399 = dot(p89, p89)
	local n1 = v398 * p89 - v399 * p87
	local v401 = dot(p86 - p88, n1)
	local v402 = dot(p87, n1)

	return p86 - v401 / v402 * p87
end

return module
