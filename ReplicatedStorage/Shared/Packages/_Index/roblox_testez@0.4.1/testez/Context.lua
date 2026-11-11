



return {
	new = function(p1)
		local t1: {[any]: any} = {}
		local t2: {[any]: any} = { __index = t1 }

		if p1 then
			local v4 = getmetatable(p1)

			for k, v in pairs(v4.__index) do
				t1[k] = v
			end
		end

		function t2.__newindex(_, p3, p4)
			local u10: boolean = t1[p3] == nil
			local stringFormat = string.format
			local text: string = tostring(p3)

			assert(u10, stringFormat("Cannot reassign %s in context", text))
			t1[p3] = p4
		end

		return (setmetatable({}, t2))
	end
}
