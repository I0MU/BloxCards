



return {
	Get = function(p1, p2)
		if p1.Map[p2] == nil then
			local v3 = string.gsub(p2, "^%l", function(p3)
				return string.upper(p3)
			end)

			return (string.gsub(v3, "%s+%l", function(p4)
				return string.upper(p4)
			end))
		end

		return p1.Map[p2]
	end,
	Map = { ["mothers day"] = "Mother's Day" }
}
