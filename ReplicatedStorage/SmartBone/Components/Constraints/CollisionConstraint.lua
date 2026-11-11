



return function(p1, p2, p3)
	debug.profilebegin("Collision Constraint")

	local collisionsData: {[any]: any} = {}
	local collisionHits: {[any]: any} = {}

	for iterFirst, iterSecond in p3 do
		local v8 = iterSecond:GetCollisions(p2, p1.Radius)

		if #v8 > 0 then
			table.insert(collisionHits, iterSecond:GetObject())
		end

		for iterFirst2, iterSecond2 in v8 do
			table.insert(collisionsData, iterSecond2)
		end
	end

	for key, value in collisionsData do
		p2 = value.ClosestPoint + value.Normal * p1.Radius
	end

	p1.CollisionsData = collisionsData
	p1.CollisionHits = collisionHits
	debug.profileend()

	return p2
end
