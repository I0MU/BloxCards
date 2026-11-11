



local replicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")
local httpService: HttpService = game:GetService("HttpService")
local loadLibrary = require(replicatedStorage:WaitForChild("NevermoreEngine")).LoadLibrary
local v4 = loadLibrary("qSystems")

loadLibrary("qString")

local v5 = loadLibrary("qMath")
local v6 = loadLibrary("Easing")
local round = v4.Round

local function EncodeColor3(p1)
	return httpService:JSONEncode({ p1.r, p1.g, p1.b })
end
local function DecodeColor3(p2)
	if p2 then
		local decodedJson: any = httpService:JSONDecode(p2)

		if decodedJson then
			return Color3.new(unpack(decodedJson))
		end

		return nil
	end

	return nil
end

local lerpNumber = v5.LerpNumber

v5 = function(p3, p4, p5)
	local color3New = Color3.new
	local v21 = lerpNumber(p3.r, p4.r, p5)
	local v22 = lerpNumber(p3.g, p4.g, p5)

	return color3New(v21, v22, lerpNumber(p3.b, p4.b, p5))
end

local module: {[any]: any} = {
	EncodeColor3 = EncodeColor3,
	encodeColor3 = EncodeColor3,
	Encode = EncodeColor3,
	encode = EncodeColor3,
	DecodeColor3 = DecodeColor3,
	decodeColor3 = DecodeColor3,
	Decode = DecodeColor3,
	decode = DecodeColor3,
	LerpColor3 = v5,
	lerpColor3 = v5
}

function module.LerpColor3HSL(p6, p7, p8)
	local v26, v27, v28 = module.RGBtoHSL(p6.r, p6.g, p6.b)
	local v29, v30, v31 = module.RGBtoHSL(p7.r, p7.g, p7.b)
	local color3New = Color3.new
	local hsLtoRGB = module.HSLtoRGB
	local v34 = lerpNumber(v26, v29, p8)
	local v35 = lerpNumber(v27, v30, p8)

	return color3New(hsLtoRGB(v34, v35, lerpNumber(v28, v31, p8)))
end
function module.Color3ToByte(p9)
	local v37 = round(p9.r * 255)
	local v38 = round(p9.g * 255)

	return v37, v38, round(p9.b * 255)
end
local function rGBtoHSL(p10, p11, p12)
	local v42 = math.min(p10, p11, p12)
	local v43 = math.max(p10, p11, p12)
	local n1 = v43 - v42
	local n2 = 0
	local n3 = 0
	local n4 = (v43 + v42) / 2

	if n1 ~= 0 then
		n3 = if n4 < 0.5 then n1 / (v43 + v42) else n1 / (2 - v43 - v42)

		local n5 = ((v43 - p10) / 6 + n1 / 2) / n1
		local n6 = ((v43 - p11) / 6 + n1 / 2) / n1
		local n7 = ((v43 - p12) / 6 + n1 / 2) / n1

		if p10 == v43 then
			n2 = n7 - n6
		elseif p11 == v43 then
			n2 = 0.3333333333333333 + n5 - n7
		elseif p12 == v43 then
			n2 = 0.6666666666666666 + n6 - n5
		end

		if n2 < 0 then
			n2 += 1
		end

		if n2 > 1 then
			n2 -= 1
		end
	end

	return n2, n3, n4
end

module.RGBtoHSL = rGBtoHSL

function module.Color3ToHSL3(p13)
	return Color3.new(rGBtoHSL(p13.r, p13.g, p13.b))
end
function module.Color3ToHSL(p14)
	return rGBtoHSL(p14.r, p14.g, p14.b)
end
function module.HueToRGB(p15, p16, p17)
	if p17 < 0 then
		p17 += 1
	end

	if p17 > 1 then
		p17 -= 1
	end

	if 6 * p17 < 1 then
		return p15 + (p16 - p15) * 6 * p17
	end

	if 2 * p17 < 1 then
		return p16
	end

	if 3 * p17 < 2 then
		return p15 + (p16 - p15) * (0.6666666666666666 - p17) * 6
	end

	return p15
end
local function hSLtoRGB(p18, p19, p20)
	if p19 == 0 then
		return p20, p20, p20
	end

	local n1 = p20 < 0.5 and p20 * (1 + p19) or p20 + p19 - p19 * p20
	local n2 = 2 * p20 - n1
	local n3 = p18 + 0.3333333333333333

	if n3 < 0 then
		n3 += 1
	end

	if n3 > 1 then
		n3 -= 1
	end

	local n4 = if 6 * n3 < 1 then n2 + (n1 - n2) * 6 * n3 else if 2 * n3 < 1 then n1 else if 3 * n3 < 2 then n2 + (n1 - n2) * (0.6666666666666666 - n3) * 6 else n2
	local v63 = p18

	if v63 < 0 then
		v63 += 1
	end

	if v63 > 1 then
		v63 -= 1
	end

	n3 = if 6 * v63 < 1 then n2 + (n1 - n2) * 6 * v63 else if 2 * v63 < 1 then n1 else if 3 * v63 < 2 then n2 + (n1 - n2) * (0.6666666666666666 - v63) * 6 else n2

	local n5 = p18 - 0.3333333333333333

	if n5 < 0 then
		n5 += 1
	end

	if n5 > 1 then
		n5 -= 1
	end

	if 6 * n5 < 1 then
		return n4, n3, n2 + (n1 - n2) * 6 * n5
	end

	if 2 * n5 < 1 then
		return n4, n3, n1
	end

	if 3 * n5 < 2 then
		return n4, n3, n2 + (n1 - n2) * (0.6666666666666666 - n5) * 6
	end

	return n4, n3, n2
end

module.HSLtoRGB = hSLtoRGB

function module.HSL3toColor3(p21)
	return Color3.new(hSLtoRGB(p21.r, p21.g, p21.b))
end
function module.SetSaturation(p22, p23)
	local v68, v69, v70 = rGBtoHSL(p22.r, p22.g, p22.b)

	return Color3.new(hSLtoRGB(v68, p23, v70))
end
function module.SetLuminance(p24, p25)
	local v73, v74, v75 = rGBtoHSL(p24.r, p24.g, p24.b)

	return Color3.new(hSLtoRGB(v73, v74, p25))
end
function module.SetHue(p26, p27)
	local v78, v79, v80 = rGBtoHSL(p26.r, p26.g, p26.b)

	return Color3.new(hSLtoRGB(v78, v79, p27))
end
function module.AdjustColorTowardsWhite(p28)
	local v82, v83, v84 = rGBtoHSL(p28.r, p28.g, p28.b)
	local v85 = v83
	local v86 = v84
	local v87 = v6.inOutCubic(v85, 0, 1, 0.8)

	return Color3.new(hSLtoRGB(v82, v87, v86 + (1 - v86) * (1 - v85) * 0.75))
end
function module.SetSaturationAndLuminance(p29, p30, p31)
	local v91, v92, v93 = rGBtoHSL(p29.r, p29.g, p29.b)

	return Color3.new(hSLtoRGB(v91, p30, p31))
end

return module
