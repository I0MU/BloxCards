



local function ErrorOut()
	error("Cannot modify configuration!")
end
local function RecurseMakeOverridenConfiguration(p1, p2)
	setmetatable(p1, nil)

	for k, v in pairs(p2) do
		if v == p1[k] then
			p1[k] = nil
		elseif type(v) == "table" then
			if p1[k] == nil then
				p1[k] = {}
			elseif type(p1[k]) ~= "table" then
				error("User configuration had a non-table value in an index (" .. k .. ") that should be a table")
			end

			p1[k] = RecurseMakeOverridenConfiguration(p1[k], v)
		end
	end

	setmetatable(p1, { __index = p2, __newindex = ErrorOut })

	return p1
end
local function MakeOverridenConfiguration(p3, p4)
	local t1 = p3 or {}

	if t1 ~= p4 then
		return (RecurseMakeOverridenConfiguration(t1, p4))
	end

	error("User configuration is equal to default configuration")

	return t1
end
local function RecurseAppendDefaultData(p5, p6)
	setmetatable(p5, nil)

	for k, v in pairs(p6) do
		if v == p5[k] then
			p5[k] = nil
		elseif type(v) == "table" then
			if p5[k] == nil then
				p5[k] = {}
			elseif type(p5[k]) ~= "table" then
				error("User configuration had a non-table value in an index (" .. k .. ") that should be a table")
			end

			p5[k] = RecurseAppendDefaultData(p5[k], v)
		end
	end

	setmetatable(p5, { __index = p6 })

	return p5
end

return {
	MakeOverridenConfiguration = MakeOverridenConfiguration,
	makeOverridenConfiguration = MakeOverridenConfiguration,
	New = MakeOverridenConfiguration,
	new = MakeOverridenConfiguration,
	AppendDefaultData = function(p7, p8)
		local t2 = p7 or {}

		if t2 ~= p8 then
			return (RecurseAppendDefaultData(t2, p8))
		end

		error("User configuration is equal to default configuration")

		return t2
	end
}
