



local function IsA(p1, p2)
	local typeName: string = type(p2)

	assert(typeName == "string", "ClassName must be a string")

	local v5 = getmetatable(p1)

	while v5 do
		if p2 == v5.ClassName then
			return true
		end

		v5 = getmetatable(v5)
	end

	return false
end

return {
	AddTo = function(p3)
		assert(not p3.IsA, "Class already has an IsA method")
		assert(p3.ClassName, "Class needs a ClassName")
		p3.IsA = IsA
	end
}
