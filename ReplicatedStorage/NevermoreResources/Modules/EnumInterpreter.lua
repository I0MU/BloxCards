



local replicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")
local v2 = require(replicatedStorage:WaitForChild("NevermoreEngine")).LoadLibrary("qString")

local function Scan(p1, p2)
	for k, v in pairs(p1) do
		if v2.CompareStrings(v, p2) then
			return k
		end
	end

	return nil
end
local function ScanName(p3, p4)
	for _, v in pairs(p3) do
		if v2.CompareStrings(v, p4) then
			return v
		end
	end

	return nil
end
local function GetEnum(p5, p6)
	if tonumber(p6) and p5[tonumber(p6)] then
		return p6
	end

	local v17 = Scan(p5, p6)

	if v17 and tonumber(v17) then
		return v17
	end

	local text: string = tostring(p6)

	error("EnumValue expected, could not interpret '" .. text .. "' into an Enum #")
end
local function GetEnumName(p7, p8)
	if tonumber(p8) and p7[tonumber(p8)] then
		local numberValue: number? = tonumber(p8)

		return p7[numberValue]
	end

	local v22 = ScanName(p7, p8)

	if v22 then
		return v22
	end

	local text: string = tostring(p8)

	error("EnumValue expected, could not interpret '" .. text .. "' into an Enum #")
end

return {
	getEnum = GetEnum,
	GetEnum = GetEnum,
	get_enum = GetEnum,
	getEnumName = GetEnumName,
	GetEnumName = GetEnumName,
	get_enum_name = GetEnumName
}
