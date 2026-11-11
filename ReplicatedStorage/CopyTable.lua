



print("CopyTable")

local function CopyTable(p1)
	if type(p1) == "table" then
		local t1: {[any]: any} = {}

		for k, v in pairs(p1) do
			if type(v) == "table" then
				t1[k] = CopyTable(v)
			else
				t1[k] = v
			end
		end

		return t1
	end

	return p1
end

return CopyTable
