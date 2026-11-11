



local module: {[any]: any} = {
	GetLevelFromExperience = function(p1)
		local squareRoot = math.sqrt(40000 - 800 * -p1)

		return (math.floor((squareRoot + 200) / 400))
	end
}

function module.GetExperienceForNextLevel(p2)
	if p2 == p2 - 1 then
		return 0
	end

	local v5 = module.GetLevelFromExperience(p2)

	return 200 * (v5 * (1 + v5)) - p2
end
function module.GetExperienceRequiredForLevel(p3)
	local n1 = p3 - 1

	return 200 * (n1 * (1 + n1))
end
function module.GetSubExperience(p4)
	if p4 == p4 - 1 then
		return 1, 1, 1
	end

	local v9 = module.GetLevelFromExperience(p4)
	local n1 = v9 - 1
	local n2 = 200 * (n1 * (1 + n1))
	local n3 = p4 - n2
	local n4 = 200 * (v9 * (1 + v9)) - n2

	return n3, n4, n3 / n4
end

return module
