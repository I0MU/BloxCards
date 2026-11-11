



local t1: {[any]: any} = {
	"January",
	"February",
	"March",
	"April",
	"May",
	"June",
	"July",
	"August",
	"September",
	"October",
	"November",
	"December"
}
local t2: {[any]: any} = {
	"Jan",
	"Feb",
	"Mar",
	"Apr",
	"May",
	"Jun",
	"Jul",
	"Aug",
	"Sep",
	"Oct",
	"Nov",
	"Dec"
}
local t3: {[any]: any} = {
	31,
	28,
	31,
	30,
	31,
	30,
	31,
	31,
	30,
	31,
	30,
	31
}
local t4: {[any]: any} = {
	"Sunday",
	"Monday",
	"Tuesday",
	"Wednesday",
	"Thursday",
	"Friday",
	"Saturday"
}
local t5: {[any]: any} = {
	"Sun",
	"Mon",
	"Tues",
	"Weds",
	"Thurs",
	"Fri",
	"Sat"
}

local function FixLeapYear(p1)
	if p1 % 4 == 0 and (p1 % 100 ~= 0 or p1 % 400 == 0) then
		t3[2] = 29

		return
	end

	t3[2] = 28
end

local module: {[any]: any} = {
	GetSecond = function(p2)
		return (math.floor(p2 % 60))
	end,
	GetMinute = function(p3)
		return (math.floor(p3 / 60 % 60))
	end,
	GetHour = function(p4)
		return (math.floor(p4 / 3600 % 24))
	end,
	GetDay = function(p5)
		return (math.ceil(p5 / 60 / 60 / 24 % 365.25))
	end,
	GetYear = function(p6)
		return (math.floor(p6 / 60 / 60 / 24 / 365.25 + 1970))
	end
}

function module.GetYearShort(p7)
	return module.GetYear(p7) % 100
end
function module.GetYearShortFormatted(p8)
	local v26 = module.GetYearShort(p8)

	if v26 < 10 then
		v26 = "0" .. v26
	end

	return v26
end
function module.GetMonth(p9)
	local v28 = module.GetYear(p9)
	local v29 = module.GetDay(p9)

	if v28 % 4 == 0 and (v28 % 100 ~= 0 or v28 % 400 == 0) then
		t3[2] = 29
	else
		t3[2] = 28
	end

	for i = 1, #t3 do
		if not (v29 > t3[i]) then
			return i
		end

		v29 -= t3[i]
	end
end
function module.GetFormattedMonth(p10)
	local v32 = module.GetMonth(p10)

	if v32 < 10 then
		v32 = "0" .. v32
	end

	return v32
end
function module.GetDayOfTheMonth(p11)
	local v34 = module.GetYear(p11)
	local v35 = module.GetDay(p11)

	if v34 % 4 == 0 and (v34 % 100 ~= 0 or v34 % 400 == 0) then
		t3[2] = 29
	else
		t3[2] = 28
	end

	for i = 1, #t3 do
		if not (v35 > t3[i]) then
			return v35
		end

		v35 -= t3[i]
	end
end
function module.GetFormattedDayOfTheMonth(p12)
	local v38 = module.GetDayOfTheMonth(p12)

	if v38 < 10 then
		v38 = "0" .. v38
	end

	return v38
end
function module.GetMonthName(p13)
	local v40 = module.GetMonth(p13)

	return t1[v40]
end
function module.GetMonthNameShort(p14)
	local v42 = module.GetMonth(p14)

	return t2[v42]
end
function module.GetJulianDate(p15)
	local v44 = module.GetMonth(p15)
	local n1 = (14 - v44) / 12
	local n2 = module.GetYear(p15) + 4800 - n1

	return module.GetDay(p15) + (153 * (v44 + 12 * n1 - 3) + 2) / 5 + 365 * n2 + n2 / 4 - n2 / 100 + n2 / 400 - 32045
end
function module.GetDayOfTheWeek(p16)
	local v48 = module.GetJulianDate(p16)

	return math.floor(v48) % 7
end
function module.GetDayOfTheWeekName(p17)
	local v50 = module.GetDayOfTheWeek(p17)

	return t4[v50]
end
function module.GetDayOfTheWeekNameShort(p18)
	local v52 = module.GetDayOfTheWeek(p18)

	return t5[v52]
end
function module.GetOrdinalOfNumber(p19)
	local n1 = p19 % 10
	local n2 = p19 % 100

	if n2 >= 10 and n2 <= 20 then
		return "th"
	end

	if n1 == 1 then
		return "st"
	end

	if n1 == 2 then
		return "nd"
	end

	if n1 == 3 then
		return "rd"
	end

	return "th"
end
function module.GetDayOfTheMonthOrdinal(p20)
	local v57 = module.GetDayOfTheMonth(p20)

	return module.GetOrdinalOfNumber(v57)
end
function module.GetFormattedSecond(p21)
	local v59 = module.GetSecond(p21)

	if v59 < 10 then
		v59 = "0" .. v59
	end

	return v59
end
function module.GetFormattedMinute(p22)
	local v61 = module.GetMinute(p22)

	if v61 < 10 then
		v61 = "0" .. v61
	end

	return v61
end
function module.GetRegularHour(p23)
	local v63 = module.GetHour(p23)

	if v63 > 12 then
		v63 -= 12
	end

	return v63
end
function module.GetHourFormatted(p24)
	local v65 = module.GetHour(p24)

	if v65 < 10 then
		v65 = "0" .. v65
	end

	return v65
end
function module.GetRegularHourFormatted(p25)
	local v67 = module.GetRegularHour(p25)

	if v67 < 10 then
		v67 = "0" .. v67
	end

	return v67
end
function module.GetamOrpm(p26)
	if module.GetHour(p26) > 12 then
		return "pm"
	end

	return "am"
end
function module.GetAMorPM(p27)
	if module.GetHour(p27) > 12 then
		return "PM"
	end

	return "AM"
end
function module.GetMilitaryHour(p28)
	local v71 = module.GetHour(p28)

	if v71 < 10 then
		local s1: string = "0" .. v71
	end
end
function module.LeapYear(p29)
	local v74 = module.GetYear(p29)

	if v74 % 4 == 0 and (v74 % 100 ~= 0 or v74 % 400 == 0) then
		return 1
	end

	return 0
end
function module.GetDaysInMonth(p30)
	local v76 = module.GetMonth(p30)
	local v77 = module.GetYear(p30)

	if v77 % 4 == 0 and (v77 % 100 ~= 0 or v77 % 400 == 0) then
		t3[2] = 29
	else
		t3[2] = 28
	end

	return t3[v76]
end

local s1: string = "["
local t7: {[any]: any} = {
	d = module.GetFormattedDayOfTheMonth,
	D = module.GetDayOfTheWeekNameShort,
	j = module.GetDayOfTheMonth,
	l = module.GetDayOfTheWeekName,
	N = module.GetDayOfTheWeek,
	S = module.GetDayOfTheMonthOrdinal,
	W = module.GetDayOfTheWeek,
	Z = module.GetDay,
	F = module.GetMonthName,
	m = module.GetFormattedMonth,
	M = module.GetMonthNameShort,
	n = module.GetMonth,
	t = module.GetDaysInMonth,
	L = module.LeapYear,
	o = module.GetYear,
	Y = module.GetYear,
	y = module.GetYearShortFormatted,
	a = module.GetamOrpm,
	A = module.GetAMorPM,
	g = module.GetRegularHour,
	G = module.GetHour,
	h = module.GetRegularHourFormatted,
	H = module.GetHourFormatted,
	i = module.GetFormattedMinute,
	s = module.GetFormattedSecond,
	X = module.GetJulianDate,
	U = time
}

for k, _ in pairs(t7) do
	s1 ..= k
end

local s2: string = s1 .. "]"

function module.GetFormattedTime(p31, p32)
	local v80 = p32 or tick()
	local v81 = p31
	local t8: {[any]: any} = {}

	for iterValue in string.gmatch(p31, s2) do
		t8[#t8 + 1] = iterValue
	end

	for _, v in pairs(t8) do
		v81 = v81:gsub(v, v:rep(3))
	end

	for _, v in pairs(t8) do
		local v88 = t7[v](v80)
		local v89 = v:rep(3)

		v81 = v81:gsub(v89, v88)
	end

	return v81
end

local DistributedGameTime = nil
local u14 = nil
local timestamp = os.time()
local timestamp2 = tick()
local n1 = timestamp - timestamp2

function module.UTCTimeExact()
	return tick() + n1
end
function module.UTCTime()
	if game.Workspace.DistributedGameTime ~= DistributedGameTime then
		u14 = tick() + n1
		DistributedGameTime = game.Workspace.DistributedGameTime
	end

	return u14
end

return module
