



local t1: {[any]: any} = {
	Jan = 1,
	Feb = 2,
	Mar = 3,
	Apr = 4,
	May = 5,
	Jun = 6,
	Jul = 7,
	Aug = 8,
	Sep = 9,
	Oct = 10,
	Nov = 11,
	Dec = 12
}
local httpService: HttpService = game:GetService("HttpService")

local function RFC2616DateStringToUnixTimestamp(p1)
	local v10, v11, v12, v13, v14, v15 = p1:match(".*, (.*) (.*) (.*) (.*):(.*):(.*) .*")

	return os.time({
		day = v10,
		month = t1[v11],
		year = v12,
		hour = v13,
		min = v14,
		sec = v15
	})
end

local u4: boolean = false
local timestamp = nil
local timestamp2 = nil
local u7 = nil

local function init()
	if not u4 then
		if not pcall(function()
			local timestamp3 = tick()
			local v19 = httpService:RequestAsync({ Url = "http://google.com" })

			timestamp = RFC2616DateStringToUnixTimestamp(v19.Headers.date)
			timestamp2 = tick()
			u7 = (timestamp2 - timestamp3) / 2
		end) then
			warn("Cannot get time from google.com. Make sure that http requests are enabled!")
			timestamp = os.time()
			timestamp2 = tick()
			u7 = 0
		end

		u4 = true
	end
end

return {
	inited = function()
		return u4
	end,
	init = init,
	time = function()
		if not u4 then
			init()
		end

		local v16 = timestamp
		local timestamp3 = tick()

		return v16 + timestamp3 - timestamp2 - u7
	end
}
