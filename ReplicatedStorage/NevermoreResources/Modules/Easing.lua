



local mathPow = math.pow
local mathSin = math.sin
local mathCos = math.cos
local mathSqrt = math.sqrt
local mathAbs = math.abs
local mathAsin = math.asin

local function inElastic(p117, p118, p119, p120, p121, p122)
	if p117 == 0 then
		return p118
	end

	local n1 = p117 / p120

	if n1 == 1 then
		return p118 + p119
	end

	if not p122 then
		p122 = p120 * 0.3
	end

	local n2

	if p121 and not (p121 < mathAbs(p119)) then
		local v18 = mathAsin(p119 / p121)

		n2 = p122 / 6.283185307179586 * v18
	else
		p121 = p119
		n2 = p122 / 4
	end

	local n3 = n1 - 1
	local v20 = mathPow(2, 10 * n3)
	local v21 = mathSin((n3 * p120 - n2) * 6.283185307179586 / p122)

	return -(p121 * v20 * v21) + p118
end
local function outElastic(p123, p124, p125, p126, p127, p128)
	if p123 == 0 then
		return p124
	end

	local n1 = p123 / p126

	if n1 == 1 then
		return p124 + p125
	end

	if not p128 then
		p128 = p126 * 0.3
	end

	local n2

	if p127 and not (p127 < mathAbs(p125)) then
		local v30 = mathAsin(p125 / p127)

		n2 = p128 / 6.283185307179586 * v30
	else
		p127 = p125
		n2 = p128 / 4
	end

	local v31 = mathPow(2, -10 * n1)
	local v32 = mathSin((n1 * p126 - n2) * 6.283185307179586 / p128)

	return p127 * v31 * v32 + p125 + p124
end
local function outBounce(p161, p162, p163, p164)
	local n1 = p161 / p164

	if n1 < 0.36363636363636365 then
		return p163 * (7.5625 * n1 * n1) + p162
	end

	if n1 < 0.7272727272727273 then
		local n2 = n1 - 0.5454545454545454

		return p163 * (7.5625 * n2 * n2 + 0.75) + p162
	end

	if n1 < 0.9090909090909091 then
		local n3 = n1 - 0.8181818181818182

		return p163 * (7.5625 * n3 * n3 + 0.9375) + p162
	end

	local n4 = n1 - 0.9545454545454546

	return p163 * (7.5625 * n4 * n4 + 0.984375) + p162
end

return {
	linear = function(p1, p2, p3, p4)
		return p3 * p1 / p4 + p2
	end,
	inQuad = function(p5, p6, p7, p8)
		local v49 = mathPow(p5 / p8, 2)

		return p7 * v49 + p6
	end,
	outQuad = function(p9, p10, p11, p12)
		local n1 = p9 / p12

		return -p11 * n1 * (n1 - 2) + p10
	end,
	inOutQuad = function(p13, p14, p15, p16)
		local n1 = p13 / p16 * 2

		if n1 < 1 then
			local v60 = mathPow(n1, 2)

			return p15 / 2 * v60 + p14
		end

		return -p15 / 2 * ((n1 - 1) * (n1 - 3) - 1) + p14
	end,
	outInQuad = function(p17, p18, p19, p20)
		if p17 < p20 / 2 then
			local n1 = p17 * 2 / p20

			return -(p19 / 2) * n1 * (n1 - 2) + p18
		end

		local v66 = mathPow((p17 * 2 - p20) / p20, 2)

		return p19 / 2 * v66 + (p18 + p19 / 2)
	end,
	inCubic = function(p21, p22, p23, p24)
		local v71 = mathPow(p21 / p24, 3)

		return p23 * v71 + p22
	end,
	outCubic = function(p25, p26, p27, p28)
		local v76 = mathPow(p25 / p28 - 1, 3)

		return p27 * (v76 + 1) + p26
	end,
	inOutCubic = function(p29, p30, p31, p32)
		local n1 = p29 / p32 * 2

		if n1 < 1 then
			return p31 / 2 * n1 * n1 * n1 + p30
		end

		local n2 = n1 - 2

		return p31 / 2 * (n2 * n2 * n2 + 2) + p30
	end,
	outInCubic = function(p33, p34, p35, p36)
		if p33 < p36 / 2 then
			local v87 = mathPow(p33 * 2 / p36 - 1, 3)

			return p35 / 2 * (v87 + 1) + p34
		end

		local v88 = mathPow((p33 * 2 - p36) / p36, 3)

		return p35 / 2 * v88 + (p34 + p35 / 2)
	end,
	inQuart = function(p37, p38, p39, p40)
		local v93 = mathPow(p37 / p40, 4)

		return p39 * v93 + p38
	end,
	outQuart = function(p41, p42, p43, p44)
		local v98 = mathPow(p41 / p44 - 1, 4)

		return -p43 * (v98 - 1) + p42
	end,
	inOutQuart = function(p45, p46, p47, p48)
		local n1 = p45 / p48 * 2

		if n1 < 1 then
			local v104 = mathPow(n1, 4)

			return p47 / 2 * v104 + p46
		end

		local v105 = mathPow(n1 - 2, 4)

		return -p47 / 2 * (v105 - 2) + p46
	end,
	outInQuart = function(p49, p50, p51, p52)
		if p49 < p52 / 2 then
			local v110 = mathPow(p49 * 2 / p52 - 1, 4)

			return -(p51 / 2) * (v110 - 1) + p50
		end

		local v111 = mathPow((p49 * 2 - p52) / p52, 4)

		return p51 / 2 * v111 + (p50 + p51 / 2)
	end,
	inQuint = function(p53, p54, p55, p56)
		local v116 = mathPow(p53 / p56, 5)

		return p55 * v116 + p54
	end,
	outQuint = function(p57, p58, p59, p60)
		local v121 = mathPow(p57 / p60 - 1, 5)

		return p59 * (v121 + 1) + p58
	end,
	inOutQuint = function(p61, p62, p63, p64)
		local n1 = p61 / p64 * 2

		if n1 < 1 then
			local v127 = mathPow(n1, 5)

			return p63 / 2 * v127 + p62
		end

		local v128 = mathPow(n1 - 2, 5)

		return p63 / 2 * (v128 + 2) + p62
	end,
	outInQuint = function(p65, p66, p67, p68)
		if p65 < p68 / 2 then
			local v133 = mathPow(p65 * 2 / p68 - 1, 5)

			return p67 / 2 * (v133 + 1) + p66
		end

		local v134 = mathPow((p65 * 2 - p68) / p68, 5)

		return p67 / 2 * v134 + (p66 + p67 / 2)
	end,
	inSine = function(p69, p70, p71, p72)
		local v139 = mathCos(p69 / p72 * 1.5707963267948966)

		return -p71 * v139 + p71 + p70
	end,
	outSine = function(p73, p74, p75, p76)
		local v144 = mathSin(p73 / p76 * 1.5707963267948966)

		return p75 * v144 + p74
	end,
	inOutSine = function(p77, p78, p79, p80)
		local v149 = mathCos(3.141592653589793 * p77 / p80)

		return -p79 / 2 * (v149 - 1) + p78
	end,
	outInSine = function(p81, p82, p83, p84)
		if p81 < p84 / 2 then
			local v154 = mathSin(p81 * 2 / p84 * 1.5707963267948966)

			return p83 / 2 * v154 + p82
		end

		local n1 = p83 / 2
		local v156 = mathCos((p81 * 2 - p84) / p84 * 1.5707963267948966)

		return -n1 * v156 + n1 + (p82 + p83 / 2)
	end,
	inExpo = function(p85, p86, p87, p88)
		if p85 == 0 then
			return p86
		end

		local v161 = mathPow(2, 10 * (p85 / p88 - 1))

		return p87 * v161 + p86 - p87 * 0.001
	end,
	outExpo = function(p89, p90, p91, p92)
		if p89 == p92 then
			return p90 + p91
		end

		local v166 = mathPow(2, -10 * p89 / p92)

		return p91 * 1.001 * (-v166 + 1) + p90
	end,
	inOutExpo = function(p93, p94, p95, p96)
		if p93 == 0 then
			return p94
		end

		if p93 == p96 then
			return p94 + p95
		end

		local n1 = p93 / p96 * 2

		if n1 < 1 then
			local v172 = mathPow(2, 10 * (n1 - 1))

			return p95 / 2 * v172 + p94 - p95 * 0.0005
		end

		local v173 = mathPow(2, -10 * (n1 - 1))

		return p95 / 2 * 1.0005 * (-v173 + 2) + p94
	end,
	outInExpo = function(p97, p98, p99, p100)
		if p97 < p100 / 2 then
			local n1 = p97 * 2
			local n2 = p99 / 2

			if p100 == n1 then
				return p98 + n2
			end

			local v180 = mathPow(2, -10 * n1 / p100)

			return n2 * 1.001 * (-v180 + 1) + p98
		end

		local n3 = p97 * 2 - p100
		local n4 = p98 + p99 / 2
		local n5 = p99 / 2

		if n3 == 0 then
			return n4
		end

		local v184 = mathPow(2, 10 * (n3 / p100 - 1))

		return n5 * v184 + n4 - n5 * 0.001
	end,
	inCirc = function(p101, p102, p103, p104)
		local v189 = mathPow(p101 / p104, 2)
		local v190 = mathSqrt(1 - v189)

		return -p103 * (v190 - 1) + p102
	end,
	outCirc = function(p105, p106, p107, p108)
		local v195 = mathPow(p105 / p108 - 1, 2)
		local v196 = mathSqrt(1 - v195)

		return p107 * v196 + p106
	end,
	inOutCirc = function(p109, p110, p111, p112)
		local n1 = p109 / p112 * 2

		if n1 < 1 then
			local v202 = mathSqrt(1 - n1 * n1)

			return -p111 / 2 * (v202 - 1) + p110
		end

		local n2 = n1 - 2
		local v204 = mathSqrt(1 - n2 * n2)

		return p111 / 2 * (v204 + 1) + p110
	end,
	outInCirc = function(p113, p114, p115, p116)
		if p113 < p116 / 2 then
			local v209 = mathPow(p113 * 2 / p116 - 1, 2)
			local v210 = mathSqrt(1 - v209)

			return p115 / 2 * v210 + p114
		end

		local v211 = mathPow((p113 * 2 - p116) / p116, 2)
		local v212 = mathSqrt(1 - v211)

		return -(p115 / 2) * (v212 - 1) + (p114 + p115 / 2)
	end,
	inElastic = inElastic,
	outElastic = outElastic,
	inOutElastic = function(p129, p130, p131, p132, p133, p134)
		if p129 == 0 then
			return p130
		end

		local n1 = p129 / p132 * 2

		if n1 == 2 then
			return p130 + p131
		end

		if not p134 then
			p134 = p132 * 0.44999999999999996
		end

		if not p133 then
			p133 = 0
		end

		local n2

		if p133 and not (p133 < mathAbs(p131)) then
			local v221 = mathAsin(p131 / p133)

			n2 = p134 / 6.283185307179586 * v221
		else
			p133 = p131
			n2 = p134 / 4
		end

		if n1 < 1 then
			local n3 = n1 - 1
			local v223 = mathPow(2, 10 * n3)
			local v224 = mathSin((n3 * p132 - n2) * 6.283185307179586 / p134)

			return -0.5 * (p133 * v223 * v224) + p130
		end

		local n4 = n1 - 1
		local v226 = mathPow(2, -10 * n4)
		local v227 = mathSin((n4 * p132 - n2) * 6.283185307179586 / p134)

		return p133 * v226 * v227 * 0.5 + p131 + p130
	end,
	outInElastic = function(p135, p136, p137, p138, p139, p140)
		if p135 < p138 / 2 then
			return (outElastic(p135 * 2, p136, p137 / 2, p138, p139, p140))
		end

		return (inElastic(p135 * 2 - p138, p136 + p137 / 2, p137 / 2, p138, p139, p140))
	end,
	inBack = function(p141, p142, p143, p144, p145: number)
		if not p145 then
			p145 = 1.70158
		end

		local n1 = p141 / p144

		return p143 * n1 * n1 * ((p145 + 1) * n1 - p145) + p142
	end,
	outBack = function(p146, p147, p148, p149, p150: number)
		if not p150 then
			p150 = 1.70158
		end

		local n1 = p146 / p149 - 1

		return p148 * (n1 * n1 * ((p150 + 1) * n1 + p150) + 1) + p147
	end,
	inOutBack = function(p151, p152, p153, p154, p155: number)
		if not p155 then
			p155 = 1.70158
		end

		local n1: number = p155 * 1.525
		local n2 = p151 / p154 * 2

		if n2 < 1 then
			return p153 / 2 * (n2 * n2 * ((n1 + 1) * n2 - n1)) + p152
		end

		local n3 = n2 - 2

		return p153 / 2 * (n3 * n3 * ((n1 + 1) * n3 + n1) + 2) + p152
	end,
	outInBack = function(p156, p157, p158, p159, p160)
		if p156 < p159 / 2 then
			local v259 = p160 or 1.70158
			local n1 = p156 * 2 / p159 - 1

			return p158 / 2 * (n1 * n1 * ((v259 + 1) * n1 + v259) + 1) + p157
		end

		local v261 = p160 or 1.70158
		local n2 = (p156 * 2 - p159) / p159

		return p158 / 2 * n2 * n2 * ((v261 + 1) * n2 - v261) + (p157 + p158 / 2)
	end,
	inBounce = function(p165, p166, p167, p168)
		local v267 = outBounce(p168 - p165, 0, p167, p168)

		return p167 - v267 + p166
	end,
	outBounce = outBounce,
	inOutBounce = function(p169, p170, p171, p172)
		if p169 < p172 / 2 then
			local v272 = outBounce(p172 - p169 * 2, 0, p171, p172)

			return (p171 - v272 + 0) * 0.5 + p170
		end

		return outBounce(p169 * 2 - p172, 0, p171, p172) * 0.5 + p171 * 0.5 + p170
	end,
	outInBounce = function(p173, p174, p175, p176)
		if p173 < p176 / 2 then
			return (outBounce(p173 * 2, p174, p175 / 2, p176))
		end

		local n1 = p175 / 2
		local v278 = outBounce(p176 - (p173 * 2 - p176), 0, n1, p176)

		return n1 - v278 + (p174 + p175 / 2)
	end
}
