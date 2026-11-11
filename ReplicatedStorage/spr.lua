



local runService: RunService = game:GetService("RunService")
local mathExp = math.exp
local mathSin = math.sin
local mathCos = math.cos
local mathMin = math.min
local mathSqrt = math.sqrt
local mathRound = math.round

local function magnitudeSq(p1)
	local n1 = 0

	for iterFirst, iterSecond in p1 do
		n1 += iterSecond ^ 2
	end

	return n1
end
local function distanceSq(p2, p3)
	local n1 = 0

	for iterFirst, iterSecond in p2 do
		n1 += (p3[iterFirst] - iterSecond) ^ 2
	end

	return n1
end

local t1: {[any]: any} = {}

t1.__index = t1

function t1.new(p4, p5, p6, p7, p8)
	local v41 = p7.toIntermediate(p6)
	local v42 = table.create(#v41, 0)

	return (setmetatable({
		d = p4,
		f = p5,
		g = v41,
		p = v41,
		v = v42,
		typedat = p7,
		rawTarget = p8
	}, t1))
end
function t1.setGoal(p9, p10)
	p9.rawTarget = p10
	p9.g = p9.typedat.toIntermediate(p10)
end
function t1.canSleep(p11)
	local n1 = 0

	for iterFirst, iterSecond in p11.v, nil, nil do
		n1 += iterSecond ^ 2
	end

	if n1 > 0.0001 then
		return false
	end

	local g = p11.g

	n1 = 0

	for iterFirst2, iterSecond2 in p11.p, nil, nil do
		n1 += (g[iterFirst2] - iterSecond2) ^ 2
	end

	if n1 > 6.781684027777778E-8 then
		return false
	end

	return true
end
function t1.step(p12, p13)
	local d = p12.d
	local n1 = p12.f * 6.283185307179586
	local g = p12.g
	local p = p12.p
	local v = p12.v

	if d == 1 then
		local v59 = mathExp(-n1 * p13)
		local n2 = p13 * v59

		for i = 1, #p do
			local n3 = p[i] - g[i]

			p[i] = n3 * (v59 + n2 * n1) + v[i] * n2 + g[i]
			v[i] = v[i] * (v59 - n2 * n1) - n3 * (n2 * n1 * n1)
		end
	elseif d < 1 then
		local v63 = mathExp(-d * n1 * p13)
		local v64 = mathSqrt(1 - d * d)
		local v65 = mathCos(p13 * n1 * v64)
		local v66 = mathSin(p13 * n1 * v64)
		local n4 = p13 * n1
		local n5 = if v64 > 0.00001 then v66 / v64 else n4 + (n4 * n4 * (v64 * v64) * (v64 * v64) / 20 - v64 * v64) * (n4 * n4 * n4) / 6
		local n6

		if n1 * v64 > 0.00001 then
			n6 = v66 / (n1 * v64)
		else
			local n7 = n1 * v64

			n6 = p13 + (p13 * p13 * (n7 * n7) * (n7 * n7) / 20 - n7 * n7) * (p13 * p13 * p13) / 6
		end

		for i = 1, #p do
			local n8 = p[i] - g[i]

			p[i] = (n8 * (v65 + n5 * d) + v[i] * n6) * v63 + g[i]
			v[i] = (v[i] * (v65 - n5 * d) - n8 * (n5 * n1)) * v63
		end
	else
		local v73 = mathSqrt(d * d - 1)
		local n9 = -n1 * (d - v73)
		local n10 = -n1 * (d + v73)
		local v76 = mathExp(n9 * p13)
		local v77 = mathExp(n10 * p13)

		for i = 1, #p do
			local n11 = p[i] - g[i]
			local n12 = (v[i] - n11 * n9) / (2 * n1 * v73)
			local n13 = v76 * (n11 - n12)

			p[i] = n13 + n12 * v77 + g[i]
			v[i] = n13 * n9 + n12 * v77 * n10
		end
	end

	return p12.typedat.fromIntermediate(p12.p)
end
local function inverseGammaCorrectD65(p14)
	return p14 < 0.0404482362771076 and p14 / 12.92 or 0.87941546140213 * (p14 + 0.055) ^ 2.4
end
local function gammaCorrectD65(p15)
	return p15 < 0.0031306684425 and 12.92 * p15 or 1.055 * p15 ^ 0.4166666666666667 - 0.055
end
local function rgbToLuv(p16)
	local r = p16.R
	local n1 = r < 0.0404482362771076 and r / 12.92 or 0.87941546140213 * (r + 0.055) ^ 2.4
	local g = p16.G
	local n2 = g < 0.0404482362771076 and g / 12.92 or 0.87941546140213 * (g + 0.055) ^ 2.4
	local b = p16.B
	local n3 = b < 0.0404482362771076 and b / 12.92 or 0.87941546140213 * (b + 0.055) ^ 2.4
	local n4 = 0.2125862307855956 * n1 + 0.7151703037034108 * n2 + 0.0722004986433362 * n3
	local n5 = 3.6590806972265884 * n1 + 11.442689580057424 * n2 + 4.114991502426484 * n3
	local n6 = n4 > 0.008856451679035631 and 116 * n4 ^ 0.3333333333333333 - 16 or 903.296296296296 * n4
	local n7
	local n8

	if n5 > 1E-14 then
		n7 = n6 * (0.9257063972951867 * n1 - 0.8333736323779866 * n2 - 0.09209820666085898 * n3) / n5
		n8 = n6 * (9 * n4 / n5 - 0.46832)
	else
		n7 = -0.19783 * n6
		n8 = -0.46832 * n6
	end

	return { n6, n7, n8 }
end
local function luvToRgb(list)
	local v97 = list[1]

	if v97 < 0.0197955 then
		return Color3.new(0, 0, 0)
	end

	local n1 = list[2] / v97 + 0.19783
	local n2 = list[3] / v97 + 0.46832
	local n3 = (v97 + 16) / 116

	n3 = n3 > 0.20689655172413793 and n3 * n3 * n3 or 0.12841854934601665 * n3 - 0.01771290335807126
	v97 = n3 * n1 / n2

	local n4 = n3 * ((3 - 0.75 * n1) / n2 - 5)

	n2 = 7.2914074 * v97 - 1.537208 * n3 - 0.4986286 * n4
	n1 = -2.180094 * v97 + 1.8757561 * n3 + 0.0415175 * n4

	local n5 = 0.1253477 * v97 - 0.2040211 * n3 + 1.0569959 * n4

	if n2 < 0 and n1 > n2 and n2 < n5 then
		n1 -= n2
		n5 -= n2
		n2 = 0
	elseif n1 < 0 and n1 < n5 then
		n2 -= n1
		n5 -= n1
		n1 = 0
	elseif n5 < 0 then
		n2 -= n5
		n1 -= n5
		n5 = 0
	end

	local color3New = Color3.new
	local v104 = mathMin(n2 < 0.0031306684425 and 12.92 * n2 or 1.055 * n2 ^ 0.4166666666666667 - 0.055, 1)
	local v105 = mathMin(n1 < 0.0031306684425 and 12.92 * n1 or 1.055 * n1 ^ 0.4166666666666667 - 0.055, 1)
	local v106 = mathMin(n5 < 0.0031306684425 and 12.92 * n5 or 1.055 * n5 ^ 0.4166666666666667 - 0.055, 1)

	return color3New(v104, v105, v106)
end

local t2: {[any]: any} = {
	springType = t1.new,
	toIntermediate = function(p18)
		return { if p18 then 1 else 0 }
	end,
	fromIntermediate = function(p19)
		return p19[1] >= 0.5
	end
}

local t3: {[any]: any} = {
	springType = t1.new,
	toIntermediate = function(p20)
		return { p20 }
	end,
	fromIntermediate = function(p21)
		return p21[1]
	end
}

local t4: {[any]: any} = {
	springType = t1.new,
	toIntermediate = function(p22)
		return { p22.Min, p22.Max }
	end,
	fromIntermediate = function(list)
		return NumberRange.new(list[1], list[2])
	end
}

local t5: {[any]: any} = {
	springType = t1.new,
	toIntermediate = function(p24)
		return { p24.Scale, p24.Offset }
	end,
	fromIntermediate = function(list)
		local uDimNew = UDim.new
		local v116 = list[1]
		local v117 = mathRound(list[2])

		return uDimNew(v116, v117)
	end
}

local t6: {[any]: any} = {
	springType = t1.new,
	toIntermediate = function(p26)
		local x = p26.X
		local y = p26.Y

		return { x.Scale, x.Offset, y.Scale, y.Offset }
	end,
	fromIntermediate = function(list)
		local uDim2New = UDim2.new
		local v123 = list[1]
		local v124 = mathRound(list[2])
		local v125 = list[3]
		local v126 = mathRound(list[4])

		return uDim2New(v123, v124, v125, v126)
	end
}

local t7: {[any]: any} = {
	springType = t1.new,
	toIntermediate = function(p28)
		return { p28.X, p28.Y }
	end,
	fromIntermediate = function(list)
		return Vector2.new(list[1], list[2])
	end
}

local t8: {[any]: any} = {
	springType = t1.new,
	toIntermediate = function(p30)
		return { p30.X, p30.Y, p30.Z }
	end,
	fromIntermediate = function(list)
		local vector3 = Vector3.new(list[1], list[2], list[3])

		return vector3
	end
}

local t9: {[any]: any} = {
	springType = t1.new,
	toIntermediate = rgbToLuv,
	fromIntermediate = luvToRgb
}

local t10: {[any]: any} = {
	springType = t1.new,
	toIntermediate = function(p32)
		local keypoints = p32.Keypoints
		local v134 = rgbToLuv(keypoints[1].Value)
		local v135 = rgbToLuv(keypoints[#keypoints].Value)

		return { v134[1], v134[2], v134[3], v135[1], v135[2], v135[3] }
	end,
	fromIntermediate = function(list)
		local colorSequenceNew = ColorSequence.new
		local v138 = luvToRgb({ list[1], list[2], list[3] })

		return colorSequenceNew(v138, luvToRgb({ list[4], list[5], list[6] }))
	end
}

local t11: {[any]: any} = {}

runService.Heartbeat:Connect(function(deltaTime: number)
	for key, value in t11 do
		for iterFirst, iterSecond in value do
			if iterSecond:canSleep() then
				value[iterFirst] = nil
				key[iterFirst] = iterSecond.rawTarget
			else
				key[iterFirst] = iterSecond:step(deltaTime)
			end
		end

		if not next(value) then
			t11[key] = nil
		end
	end
end)

local function assertType(p35, p36, p37, p38)
	local typeName: string = typeof(p38)

	if not p37:find(typeName) then
		local typeName2: string = typeof(p38)
		local v150 = ("bad argument #%d to %s (%s expected, got %s)"):format(p35, p36, p37, typeName2)

		error(v150, 3)
	end
end

local t12: {[any]: any} = {
	boolean = t2,
	number = t3,
	NumberRange = t4,
	UDim = t5,
	UDim2 = t6,
	Vector2 = t7,
	Vector3 = t8,
	Color3 = t9,
	ColorSequence = t10
}

return table.freeze({
	target = function(p39, p40, p41, p42)
		if not ("Instance"):find((typeof(p39))) then
			local v155 = ("bad argument #%d to %s (%s expected, got %s)"):format(1, "spr.target", "Instance", (typeof(p39)))

			error(v155, 3)
		end

		if not ("number"):find((typeof(p40))) then
			local v156 = ("bad argument #%d to %s (%s expected, got %s)"):format(2, "spr.target", "number", (typeof(p40)))

			error(v156, 3)
		end

		if not ("number"):find((typeof(p41))) then
			local v157 = ("bad argument #%d to %s (%s expected, got %s)"):format(3, "spr.target", "number", (typeof(p41)))

			error(v157, 3)
		end

		if not ("table"):find((typeof(p42))) then
			local v158 = ("bad argument #%d to %s (%s expected, got %s)"):format(4, "spr.target", "table", (typeof(p42)))

			error(v158, 3)
		end

		if p40 ~= p40 or p40 < 0 then
			local v159 = ("expected damping ratio >= 0; got %.2f"):format(p40)

			error(v159, 2)
		end

		if p41 ~= p41 or p41 < 0 then
			local v160 = ("expected undamped frequency >= 0; got %.2f"):format(p41)

			error(v160, 2)
		end

		local t13 = t11[p39]

		if not t13 then
			t13 = {}
			t11[p39] = t13
		end

		for iterFirst, iterSecond in p42 do
			local v164 = p39[iterFirst]
			local typeName: string = typeof(iterSecond)
			local typeName3: string = typeof(v164)

			if typeName ~= typeName3 then
				local typeName4: string = typeof(v164)
				local typeName5: string = typeof(iterSecond)
				local v169 = ("bad property %s to spr.target (%s expected, got %s)"):format(iterFirst, typeName4, typeName5)

				error(v169, 2)
			end

			local v170 = t13[iterFirst]

			if not v170 then
				local typeName6: string = typeof(iterSecond)
				local v172 = t12[typeName6]

				if not v172 then
					local typeName7: string = typeof(iterSecond)

					error("unsupported type: " .. typeName7, 2)
				end

				v170 = v172.springType(p40, p41, v164, v172, iterSecond)
				t13[iterFirst] = v170
			end

			v170.d = p40
			v170.f = p41
			v170:setGoal(iterSecond)
		end
	end,
	stop = function(p43, p44)
		if not ("Instance"):find((typeof(p43))) then
			local v176 = ("bad argument #%d to %s (%s expected, got %s)"):format(1, "spr.stop", "Instance", (typeof(p43)))

			error(v176, 3)
		end

		if not ("string|nil"):find((typeof(p44))) then
			local v177 = ("bad argument #%d to %s (%s expected, got %s)"):format(2, "spr.stop", "string|nil", (typeof(p44)))

			error(v177, 3)
		end

		if p44 then
			local v178 = t11[p43]

			if v178 then
				v178[p44] = nil

				return
			end
		else
			t11[p43] = nil
		end
	end
})
