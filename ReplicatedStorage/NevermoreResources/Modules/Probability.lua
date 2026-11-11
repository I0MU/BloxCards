



local module: {[any]: any} = {
	BoxMuller = function()
		local v2 = math.log(math.random())
		local squareRoot = math.sqrt(v2 * -2)
		local randomNumber = math.random()
		local cosine = math.cos(6.283185307179586 * randomNumber)

		return squareRoot * cosine / 2
	end
}

function module.UnboundedNormalDistribution(p1, p2)
	local v8 = module.BoxMuller()

	return p1 + v8 * p2
end
function module.NormalDistribution(p3, p4, p5, p6)
	local v13 = module.BoxMuller()
	local v14 = math.max(p5, p3 + v13 * p4)

	return (math.min(p6, v14))
end

return module
