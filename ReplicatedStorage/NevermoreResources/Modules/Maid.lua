



local t1: {[any]: any} = {
	GiveTask = function(p1, p2)
		local n1: number = #p1.Tasks + 1

		p1.Tasks[n1] = p2

		return n1
	end,
	DoCleaning = function(p3)
		local tasks = p3.Tasks

		for k, v in pairs(tasks) do
			if type(v) == "function" then
				v()
			else
				v:disconnect()
			end

			tasks[k] = nil
		end
	end
}

t1.disconnect = t1.DoCleaning

local t2: {[any]: any} = {
	__index = function(p4, p5)
		if t1[p5] then
			return t1[p5]
		end

		return p4.Tasks[p5]
	end,
	__newindex = function(p6, p7, p8)
		local tasks = p6.Tasks

		if p8 == nil then
			if type(tasks[p7]) ~= "function" and tasks[p7] then
				tasks[p7]:disconnect()
			end
		elseif tasks[p7] then
			p6[p7] = nil
		end

		tasks[p7] = p8
	end
}

local function MakeMaid()
	return (setmetatable({
		Tasks = {},
		Instances = {}
	}, t2))
end

return { MakeMaid = MakeMaid, new = MakeMaid }
