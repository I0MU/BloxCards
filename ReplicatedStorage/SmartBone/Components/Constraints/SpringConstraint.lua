



--!native
return function(p1, p2, p3, p4, p5)
	debug.profilebegin("Spring Constraint")

	local settings = p4.Settings
	local settingsStiffness = settings.Stiffness
	local settingsElasticity = settings.Elasticity
	local v9 = p4.Bones[p1.ParentIndex]

	if v9 then
		local freeLength = p1.FreeLength

		if settingsStiffness > 0 or settingsElasticity > 0 then
			local n1 = CFrame.new(v9.Position) * v9.TransformOffset.Rotation
			local v12 = p3

			if not v12 then
				local cFrame = CFrame.new(p1.LocalTransformOffset.Position)

				v12 = (n1 * cFrame).Position
			end

			local v14 = v12

			p2 += (v14 - p2) * (settingsElasticity * p5)

			if settingsStiffness > 0 then
				local n2 = v14 - p2
				local magnitude = n2.Magnitude
				local n3 = freeLength * (1 - settingsStiffness) * 2

				if magnitude > n3 then
					p2 += n2 * ((magnitude - n3) / magnitude)
				end
			end
		end

		local n4 = v9.Position - p2
		local v19 = n4.Magnitude

		if v19 > 0 then
			p2 += n4 * ((v19 - freeLength) / v19)
		end
	end

	debug.profileend()

	return p2
end
