



return {
	GetRelativeCFrameValues = function(p1, p2)
		local t1: {[any]: any} = {}

		for _, v in pairs(p2) do
			t1[v] = p1.CFrame:toObjectSpace(v.CFrame)
		end

		return t1
	end
}
