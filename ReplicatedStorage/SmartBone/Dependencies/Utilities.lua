



local httpService: HttpService = game:GetService("HttpService")
local config = require(script.Parent:WaitForChild("Config"))
local defaultObjectSettings = require(script.Parent:WaitForChild("DefaultObjectSettings"))
local t1: {[any]: any} = {
	Block = "Box",
	Ball = "Sphere",
	Capsule = "Capsule",
	Sphere = "Sphere",
	Box = "Box",
	Cylinder = "Cylinder"
}

local function SafeUnit(p1)
	if p1.Magnitude == 0 then
		return Vector3.new(-0, -1, -0)
	end

	return p1.Unit
end

local module: {[any]: any} = {
	LogIndent = 0,
	GetRotationBetween = function(p2, p3)
		local v10 = p2:Dot(p3)
		local v11 = p2:Cross(p3)
		local v12 = math.atan2(v11.Magnitude, v10)
		local v13 = p2:Cross(p3)

		return CFrame.fromAxisAngle(if v13.Magnitude == 0 then Vector3.new(-0, -1, -0) else v13.Unit, v12)
	end,
	GetCFrameAxis = function(p4, p5)
		local v16, v17, v18 = p4:ToEulerAnglesXYZ()

		if p5 == "X" then
			return v16
		end

		if p5 == "Y" then
			return v17
		end

		if p5 == "Z" then
			return v18
		end

		return nil
	end,
	GatherObjectSettings = function(p6)
		local t3: {[any]: any} = {}

		local function Expect(p7, p8, p9)
			local typeName: string = typeof(p7)

			if p8 ~= typeName then
				local v129 = p6.Name
				local typeName2: string = typeof(p7)
				local v131 = ("[SmartBone][Object] Expected attribute %* on %* to be of type %*, got type %*"):format(p9, v129, p8, typeName2)

				warn(v131)

				return false
			end

			return true
		end

		for iterFirst, iterSecond in defaultObjectSettings do
			local attributeValue = p6:GetAttribute(iterFirst)

			if attributeValue ~= nil then
				local typeName: string = typeof(iterSecond)
				local u26

				if typeof(attributeValue) ~= typeName then
					local v27 = p6.Name
					local typeName3: string = typeof(attributeValue)
					local v29 = ("[SmartBone][Object] Expected attribute %* on %* to be of type %*, got type %*"):format(iterFirst, v27, typeName, typeName3)

					warn(v29)
					u26 = false
				else
					u26 = true
				end

				if not u26 then
					attributeValue = nil
				end
			end

			t3[iterFirst] = attributeValue == nil and iterSecond or attributeValue
		end

		return t3
	end,
	GatherBoneSettings = function(p10)
		local function Attrib(p11)
			return p10:GetAttribute(p11)
		end
		local function Expect(p12, p13, p14)
			local typeName: string = typeof(p12)

			if p13 ~= typeName then
				local v137 = p10.Name
				local typeName4: string = typeof(p12)
				local v139 = ("[SmartBone][Bone] Expected attribute %* on %* to be of type %*, got type %*"):format(p14, v137, p13, typeName4)

				warn(v139)
			end
		end

		local v33 = p10:GetAttribute("XAxisLocked") or false
		local v34 = p10:GetAttribute("YAxisLocked") or false
		local v35 = p10:GetAttribute("ZAxisLocked") or false
		local v36 = p10:GetAttribute("XAxisLimits") or NumberRange.new(-math.huge, math.huge)
		local v37 = p10:GetAttribute("YAxisLimits") or NumberRange.new(-math.huge, math.huge)
		local v38 = p10:GetAttribute("ZAxisLimits") or NumberRange.new(-math.huge, math.huge)
		local v39 = p10:GetAttribute("Radius") or 0.25
		local v40 = p10:GetAttribute("RotationLimit") or 180
		local v41 = p10:GetAttribute("Force") or "¬"
		local v42 = p10:GetAttribute("Gravity") or "¬"

		if typeof(v33) ~= "boolean" then
			local v43 = p10.Name
			local typeName: string = typeof(v33)
			local v45 = ("[SmartBone][Bone] Expected attribute XAxisLocked on %* to be of type boolean, got type %*"):format(v43, typeName)

			warn(v45)
		end

		if typeof(v34) ~= "boolean" then
			local v46 = p10.Name
			local typeName: string = typeof(v34)
			local v48 = ("[SmartBone][Bone] Expected attribute YAxisLocked on %* to be of type boolean, got type %*"):format(v46, typeName)

			warn(v48)
		end

		if typeof(v35) ~= "boolean" then
			local v49 = p10.Name
			local typeName: string = typeof(v35)
			local v51 = ("[SmartBone][Bone] Expected attribute ZAxisLocked on %* to be of type boolean, got type %*"):format(v49, typeName)

			warn(v51)
		end

		if typeof(v36) ~= "NumberRange" then
			local v52 = p10.Name
			local typeName: string = typeof(v36)
			local v54 = ("[SmartBone][Bone] Expected attribute XAxisLimits on %* to be of type NumberRange, got type %*"):format(v52, typeName)

			warn(v54)
		end

		if typeof(v37) ~= "NumberRange" then
			local v55 = p10.Name
			local typeName: string = typeof(v37)
			local v57 = ("[SmartBone][Bone] Expected attribute YAxisLimits on %* to be of type NumberRange, got type %*"):format(v55, typeName)

			warn(v57)
		end

		if typeof(v38) ~= "NumberRange" then
			local v58 = p10.Name
			local typeName: string = typeof(v38)
			local v60 = ("[SmartBone][Bone] Expected attribute ZAxisLimits on %* to be of type NumberRange, got type %*"):format(v58, typeName)

			warn(v60)
		end

		if typeof(v39) ~= "number" then
			local v61 = p10.Name
			local typeName: string = typeof(v39)
			local v63 = ("[SmartBone][Bone] Expected attribute Radius on %* to be of type number, got type %*"):format(v61, typeName)

			warn(v63)
		end

		if typeof(v40) ~= "number" then
			local v64 = p10.Name
			local typeName: string = typeof(v40)
			local v66 = ("[SmartBone][Bone] Expected attribute RotationLimit on %* to be of type number, got type %*"):format(v64, typeName)

			warn(v66)
		end

		if v41 ~= "¬" and typeof(v41) ~= "Vector3" then
			local v67 = p10.Name
			local typeName: string = typeof(v41)
			local v69 = ("[SmartBone][Bone] Expected attribute Force on %* to be of type Vector3, got type %*"):format(v67, typeName)

			warn(v69)
		end

		if v41 ~= "¬" and typeof(v42) ~= "Vector3" then
			local v70 = p10.Name
			local typeName: string = typeof(v42)
			local v72 = ("[SmartBone][Bone] Expected attribute Gravity on %* to be of type Vector3, got type %*"):format(v70, typeName)

			warn(v72)
		end

		return {
			AxisLocked = { v33, v34, v35 },
			XAxisLimits = v36,
			YAxisLimits = v37,
			ZAxisLimits = v38,
			RotationLimit = v40,
			Radius = v39,
			Force = v41,
			Gravity = v42
		}
	end,
	ClosestPointOnLine = function(p15, p16, p17, p18)
		local v77 = (p18 - p15):Dot(p16)
		local v78 = math.clamp(v77, -p17, p17)

		return p15 + p16 * v78
	end,
	ClosestPointInBox = function(p19, p20, p21)
		local v82 = p19:PointToObjectSpace(p21)
		local x = p20.X
		local v84 = p20.X
		local z = p20.Z
		local v86 = v82.X
		local y = v82.Y
		local v88 = v82.Z

		if v82 == v82 and p20 == p20 then
			local v89 = math.clamp(v86, -x * 0.5, x * 0.5)
			local v90 = math.clamp(y, -v84 * 0.5, v84 * 0.5)
			local v91 = math.clamp(v88, -z * 0.5, z * 0.5)

			if v89 == v86 and v90 == y and v91 == v88 then
				local n1 = v86 - x * 0.5
				local n2 = y - v84 * 0.5
				local n3 = v88 - z * 0.5
				local n4 = -v86 - x * 0.5
				local n5 = -y - v84 * 0.5
				local n6 = -v88 - z * 0.5
				local v98 = math.max(n1, n2, n3, n4, n5, n6)

				if v98 == n1 then
					local vector3 = Vector3.new(x * 0.5, y, v88)

					return true, p19 * vector3, p19.XVector
				end

				if v98 == n2 then
					local vector3 = Vector3.new(v86, v84 * 0.5, v88)

					return true, p19 * vector3, p19.YVector
				end

				if v98 == n3 then
					local vector3 = Vector3.new(v86, y, z * 0.5)

					return true, p19 * vector3, p19.ZVector
				end

				if v98 == n4 then
					local vector3 = Vector3.new(-x * 0.5, y, v88)

					return true, p19 * vector3, -p19.XVector
				end

				if v98 == n5 then
					local vector3 = Vector3.new(v86, -v84 * 0.5, v88)

					return true, p19 * vector3, -p19.YVector
				end

				if v98 == n6 then
					local vector3 = Vector3.new(v86, y, -z * 0.5)

					return true, p19 * vector3, -p19.ZVector
				end

				warn("CLOSEST POINT ON BOX FAIL")

				return false, Vector3.new(0, 0, 0), Vector3.new(0, 1, 0)
			end

			local vector3 = Vector3.new(v89, v90, v91)
			local n7 = p19 * vector3

			return false, n7, (p21 - n7).unit
		end

		return false, p19.Position, Vector3.new(0, 1, 0)
	end,
	GetCollider = function(p22)
		local foundChild = p22:FindFirstChild("self.Collider")
		local v109 = nil

		if foundChild and foundChild:IsA("ModuleScript") then
			local v110 = require(foundChild)
			local decodedJson = nil

			pcall(function()
				decodedJson = httpService:JSONDecode(v110)
			end)
			v109 = decodedJson
		end

		if v109 then
			return v109
		end

		local function GetShapeName(p23)
			local colliderShape = p23:GetAttribute("ColliderShape")

			if colliderShape then
				return colliderShape
			end

			if p23:IsA("Part") then
				return p23.Shape.Name
			end

			return "Box"
		end

		local colliderShape = p22:GetAttribute("ColliderShape")
		local v114 = if colliderShape then colliderShape else if p22:IsA("Part") then p22.Shape.Name else "Box"

		return { {
			ScaleX = 1,
			ScaleY = 1,
			ScaleZ = 1,
			OffsetX = 0,
			OffsetY = 0,
			OffsetZ = 0,
			RotationX = 0,
			RotationY = 0,
			RotationZ = 0,
			Type = t1[v114] or "Box"
		} }
	end
}

function module.SB_INDENT_LOG()
	local v115: {[any]: any} = module

	v115.LogIndent = v115.LogIndent + 1
end
function module.SB_UNINDENT_LOG()
	local v116: {[any]: any} = module

	v116.LogIndent = v116.LogIndent - 1
	module.LogIndent = math.max(module.LogIndent, 0)
end
function module.SB_ASSERT_CB(p24, p25, ...)
	if p24 == false or p24 == nil then
		p25(...)
	end
end
function module.SB_VERBOSE_LOG(p26)
	if not config.LOG_VERBOSE then
		return
	end

	local v120 = ("%*[SmartBone][Log]: %*"):format(string.rep("    ", module.LogIndent), p26)

	print(v120)
end
function module.SB_VERBOSE_WARN(p27)
	if not config.LOG_VERBOSE then
		return
	end

	local v122 = ("%*[SmartBone][Warn]: %*"):format(string.rep("    ", module.LogIndent), p27)

	warn(v122)
end
function module.SB_VERBOSE_ERROR(p28)
	if not config.LOG_VERBOSE then
		return
	end

	local v124 = ("%*[SmartBone][Error]: %*"):format(string.rep("    ", module.LogIndent), p28)

	error(v124)
end

return module
