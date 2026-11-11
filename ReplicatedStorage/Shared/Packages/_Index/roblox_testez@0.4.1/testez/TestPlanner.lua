



local testPlan = require(script.Parent.TestPlan)

return {
	createPlan = function(p1, p2, p3)
		local v5 = testPlan.new(p2, p3)

		table.sort(p1, function(p4, p5)
			return p4.pathStringForSorting < p5.pathStringForSorting
		end)

		for _, v in ipairs(p1) do
			v5:addRoot(v.path, v.method)
		end

		return v5
	end
}
