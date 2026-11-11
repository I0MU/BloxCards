



local function ClampNumber(p6, p7, p8)
	if p6 > p8 then
		return p8, true
	end

	if p6 < p7 then
		return p7, true
	end

	return p6, false
end
local function RoundUp(p9, p10)
	return math.ceil(p9 / p10) * p10
end
local function RoundDown(p11, p12)
	return math.floor(p11 / p12) * p12
end
local function RoundNumber(p13, p14)
	local v19 = p14 or 1

	return math.floor(p13 / v19 + 0.5) * v19
end
local function Sign(p15)
	if p15 == 0 then
		return 0
	end

	local absoluteValue = math.abs(p15)

	return p15 / absoluteValue
end
local function Vector2ToCartisian(p16, p17)
	return p16 - p17
end
local function Cartisian2ToVector(p18, p19)
	return p18 + p19
end
local function InvertCartisian2(p20)
	return -p20
end
local function LerpNumber(p21, p22, p23)
	return p21 + (p22 - p21) * p23
end

return {
	MapNumber = function(p1, p2, p3, p4, p5)
		return (p1 - p2) * (p5 - p4) / (p3 - p2) + p4
	end,
	ClampNumber = ClampNumber,
	clampNumber = ClampNumber,
	RoundUp = RoundUp,
	roundUp = RoundUp,
	RoundDown = RoundDown,
	roundDown = RoundDown,
	roundNumber = RoundNumber,
	RoundNumber = RoundNumber,
	round_number = RoundNumber,
	Sign = Sign,
	sign = Sign,
	Vector2ToCartisian = Vector2ToCartisian,
	vector2ToCartisian = Vector2ToCartisian,
	Cartisian2ToVector = Cartisian2ToVector,
	cartisian2ToVector = Cartisian2ToVector,
	InvertCartisian2 = InvertCartisian2,
	invertCartisian2 = InvertCartisian2,
	LerpNumber = LerpNumber,
	lerpNumber = LerpNumber
}
