



local timestamp = os.time()

return {
	help = function(...)
		return "Note: Padding for Months, Days, and Hours have been turned off because I don't think it looks as good\n\n\tos.date(\"*t\") returns a table with the following indices:\n\n\thour\t14\n\tmin\t36\n\twday\t1\n\tyear\t2003\n\tyday\t124\n\tmonth\t5\n\tsec\t33\n\tday\t4\n\n\tString reference:\n\t%a\tabbreviated weekday name (e.g., Wed)\n\t%A\tfull weekday name (e.g., Wednesday)\n\t%b\tabbreviated month name (e.g., Sep)\n\t%B\tfull month name (e.g., September)\n\t%c\tdate and time (e.g., 09/16/98 23:48:10)\n\t%d\tday of the month (16) [01-31]\n\t%H\thour, using a 24-hour clock (23) [00-23]\n\t%I\thour, using a 12-hour clock (11) [01-12]\n\t%n\tNew-line character ('\\n')\n\t%M\tminute (48) [00-59]\n\t%m\tmonth (09) [01-12]\n\t%p\teither \"am\" or \"pm\" (pm)\n\t%r\t12-hour clock time *\t02:55:02 pm\n\t%R\t24-hour HH:MM time, equivalent to %H:%M\t14:55\n\t%S\tsecond (10) [00-61]\n\t%t\tHorizontal-tab character ('\\t')\n\t%T\tBasically %r but without seconds (HH:MM AM), equivalent to %I:%M %p\t2:55 pm\n\t%u\tISO 8601 weekday as number with Monday as 1 (1-7)\t4\n\t%w\tweekday (3) [0-6 = Sunday-Saturday]\n\t%x\tdate (e.g., 09/16/98)\n\t%X\ttime (e.g., 23:48:10)\n\t%Y\tfull year (1998)\n\t%y\ttwo-digit year (98) [00-99]\n\t%%\tthe character `%´"
	end,
	date = function(p1, p2)
		local u4: boolean = false
		local u5: boolean = false

		if type(p1) == "string" then
			if p1:match("%d+-%d+-%d+T%d+:%d+:[%d%.]+.+") then
				local v6, v7, v8, v9, v10, v11 = p1:match("(%d+)-(%d+)-(%d+)T(%d+):(%d+):([%d%.]+).+")

				return {
					year = v6,
					month = v7,
					day = v8,
					hour = v9,
					minute = v10,
					second = v11
				}
			end

			if p1:match("/Date%((%d+)") then
				p1 = p1:match("/Date%((%d+)") / 1000
				u4 = true
			elseif p1:find("*t") then
				p1 = p1:find("^!") and os.time() or p2 or nil
			else
				local v12 = p1:find("%%")

				assert(v12, "Invalid string passed to os.date")
				v12 = p1:find("^!") and p1:sub(2) or p1
				p1 = p1:find("^!") and os.time() or p2
				p2 = v12
				u5 = true
			end
		end

		local v13 = type(p1) == "number" and p1 or tick()

		local function v14(p3)
			if p3 % 4 == 0 and (p3 % 100 ~= 0 or p3 % 400 == 0) then
				return 366
			end

			return 365
		end

		local n1: number = 1970
		local roundedUp = math.ceil(v13 / 86400)
		local floored = math.floor((roundedUp + 3) % 7)
		local t1: {[any]: any} = {
			"Sunday",
			"Monday",
			"Tuesday",
			"Wednesday",
			"Thursday",
			"Friday",
			"Saturday"
		}
		local t2: {[any]: any} = {
			"Sun",
			"Mon",
			"Tue",
			"Wed",
			"Thu",
			"Fri",
			"Sat"
		}
		local t3: {[any]: any} = {
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
		local t4: {[any]: any} = {
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
		local v22 = nil
		local floored2 = math.floor(v13 / 3600 % 24)
		local floored3 = math.floor(v13 / 60 % 60)
		local floored4 = math.floor(v13 % 60)

		while roundedUp > (if n1 % 4 == 0 and (n1 % 100 ~= 0 or n1 % 400 == 0) then 366 else 365) do
			roundedUp -= if n1 % 4 == 0 and (n1 % 100 ~= 0 or n1 % 400 == 0) then 366 else 365
			n1 += 1
		end

		local n2 = roundedUp

		for i, v in ipairs({
			31,
			(if n1 % 4 == 0 and not (n1 % 100 == 0 and not (n1 % 400 == 0)) then 366 else 365) - 337,
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
		}) do
			if roundedUp - v <= 0 then
				v22 = i

				break
			end

			roundedUp -= v
		end

		if v13 == "*t" then
			return {
				year = n1,
				month = v22,
				day = roundedUp,
				yday = n2,
				wday = floored,
				hour = floored2,
				min = floored3,
				sec = floored4
			}
		end

		if u4 then
			return string.format("%d/%d/%04d", v22, roundedUp, n1)
		end

		if u5 then
			return (p2:gsub("%%c", "%%x %%X"):gsub("%%x", "%%m/%%d/%%y"):gsub("%%T", "%%I:%%M %%p"):gsub("%%X", "%%H:%%M:%%S"):gsub("%%r", "%%I:%%M:%%S %%p"):gsub("%%R", "%%H:%%M"):gsub("%%a", t2[floored + 1]):gsub("%%A", t1[floored + 1]):gsub("%%b", t3[v22]):gsub("%%B", t4[v22]):gsub("%%d", roundedUp):gsub("%%H", string.format("%02d", floored2)):gsub("%%I", floored2 > 12 and floored2 - 12 or (if floored2 == 0 then 12 else floored2)):gsub("%%M", string.format("%02d", floored3)):gsub("%%m", v22):gsub("%%p", if floored2 > 12 then "pm" else "am"):gsub("%%S", string.format("%02d", floored4)):gsub("%%w", floored):gsub("%%Y", n1):gsub("%%y", n1 % 100):gsub("%%j", n2):gsub("%%u", if floored == 0 then 7 else floored):gsub("%%n", "\n"):gsub("%%t", "\t"):gsub("%%%%", "%%"))
		end

		return {
			year = n1,
			month = v22,
			day = roundedUp,
			yday = n2,
			wday = floored,
			hour = floored2,
			min = floored3,
			sec = floored4
		}
	end,
	time = function(...)
		return os.time(...)
	end,
	difftime = function(...)
		return os.difftime(...)
	end,
	clock = function(...)
		local osDifftime = os.difftime
		local timestamp2 = os.time()

		return osDifftime(timestamp2, timestamp)
	end
}
