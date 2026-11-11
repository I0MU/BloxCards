



local function set(p1, p2, p3)
	p1[p2] = p3
end

local module: {[any]: any} = {
	isAnInstance = function(p4)
		local ok, result = pcall(game.IsA, p4, "Instance")

		return result == true
	end,
	isALibrary = function(p5)
		if pcall(function()
			local typeName: string = type(p5.GetApi)

			assert(typeName == "function")
		end) then
			local ok, result = pcall(string.dump, p5.GetApi)

			return result == "unable to dump given function"
		end

		return false
	end,
	isAnEnum = function(p6)
		return pcall(Enum.Material.GetEnumItems, p6) == true
	end
}

function module.coerceIntoEnum(p7, p8)
	if module.isAnEnum(p8) then
		local v23, v24 = p8:GetEnumItems()

		for iterKey, iterValue in next, v23, v24 do
			if p7 == iterValue or p7 == iterValue.Name or p7 == iterValue.Value then
				return iterValue
			end
		end
	else
		error("The 'enum' argument must be an enum.", 2)
	end

	error("The value cannot be coerced into a enum item of the specified type.", 2)
end
function module.isOfEnumType(p9, p10)
	if module.isAnEnum(p10) then
		return pcall(module.coerceIntoEnum, p9, p10) == true
	end

	error("The 'enum' argument must be an enum.", 2)
end

local color3Value: Color3Value = Instance.new("Color3Value")

function module.isAColor3(p11)
	return pcall(set, color3Value, "Value", p11) == true
end

local cFrameValue: CFrameValue = Instance.new("CFrameValue")

function module.isACoordinateFrame(p12)
	return pcall(set, cFrameValue, "Value", p12) == true
end

local brickColorValue: BrickColorValue = Instance.new("BrickColorValue")

function module.isABrickColor(p13)
	return pcall(set, brickColorValue, "Value", p13) == true
end

local rayValue: RayValue = Instance.new("RayValue")

function module.isARay(p14)
	return pcall(set, rayValue, "Value", p14) == true
end

local vector3Value: Vector3Value = Instance.new("Vector3Value")

function module.isAVector3(p15)
	return pcall(set, vector3Value, "Value", p15) == true
end
function module.isAVector2(p16)
	return pcall(function()
		return Vector2.new() + p16
	end) == true
end

local frame: Frame = Instance.new("Frame")

function module.isAUdim2(p17)
	return pcall(set, frame, "Position", p17) == true
end
function module.isAUDim(p18)
	return pcall(function()
		return UDim.new() + p18
	end) == true
end

local arcHandles: ArcHandles = Instance.new("ArcHandles")

function module.isAAxis(p19)
	return pcall(set, arcHandles, "Axes", p19) == true
end

local handles: Handles = Instance.new("Handles")

function module.isAFace(p20)
	return pcall(set, handles, "Faces", p20) == true
end
function module.isASignal(p21)
	local ok, result = pcall(function()
		return game.AllowedGearTypeChanged.connect(p21)
	end)

	if ok and result then
		result:disconnect()

		return true
	end
end
function module.getType(p22)
	local typeName: string = type(p22)

	if typeName == "userdata" then
		if module.isAnInstance(p22) then
			return p22.ClassName
		end

		if module.isAColor3(p22) then
			return "Color3"
		end

		if module.isACoordinateFrame(p22) then
			return "CFrame"
		end

		if module.isABrickColor(p22) then
			return "BrickColor"
		end

		if module.isAUDim2(p22) then
			return "UDim2"
		end

		if module.isAUDim(p22) then
			return "UDim"
		end

		if module.isAVector3(p22) then
			return "Vector3"
		end

		if module.isAVector2(p22) then
			return "Vector2"
		end

		if module.isARay(p22) then
			return "Ray"
		end

		if module.isAnEnum(p22) then
			return "Enum"
		end

		if module.isASignal(p22) then
			return "RBXScriptSignal"
		end

		if module.isALibrary(p22) then
			return "RbxLibrary"
		end

		if module.isAAxis(p22) then
			return "Axes"
		end

		if module.isAFace(p22) then
			return "Faces"
		end

		return
	end

	return typeName
end
function module.isAnInt(p23)
	local u45: boolean = false

	if type(p23) == "number" then
		u45 = p23 % 1 == 1
	end

	return u45
end
function module.isPositiveInt(p24)
	local u47: boolean = false

	if type(p24) == "number" then
		u47 = false

		if p24 > 0 then
			local floored = math.floor(p24)

			u47 = p24 == floored
		end
	end

	return u47
end
function module.isAnArray(p25)
	if type(p25) == "table" then
		local n1 = 0
		local n2: number = 0

		for k, _ in pairs(p25) do
			if not module.isPositiveInt(k) then
				return false
			end

			n1 = math.max(n1, k)
			n2 += 1
		end

		return n1 == n2
	end

	return false
end

return module
