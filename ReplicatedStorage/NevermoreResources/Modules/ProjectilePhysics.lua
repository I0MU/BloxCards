



local v1 = tick
local vector3New = Vector3.new
local module: {[any]: any} = {
	Projectile = {},
	NumberProjectile = {},
	VectorProjectile = {}
}

function module.Projectile.New(p1)
	local u5 = v1()
	local u6 = p1 or 0
	local n1 = p1 and 0 * p1 or 0
	local n2 = n1

	local function PositionVelocity(p2)
		local n3 = p2 - u5

		return u6 + n1 * n3 + 0.5 * n3 * n3 * n2, n1 + n2 * n3
	end

	local object = nil

	object = setmetatable({
		Impulse = function(_, p4)
			object.Velocity = object.Velocity + p4
		end,
		TimeSkip = function(_, p6)
			local v21 = v1()
			local n3 = v21 + p6 - u5
			local n4 = u6 + n1 * n3 + 0.5 * n3 * n3 * n2

			u5 = v21
			n1 += n2 * n3
			u6 = n4
		end
	}, {
		__index = function(_, p8)
			if p8 == "Value" or p8 == "Position" or p8 == "p" then
				local n5 = v1() - u5
				local n6 = n1 + n2 * n5

				return u6 + n1 * n5 + 0.5 * n5 * n5 * n2
			end

			if p8 == "Velocity" or p8 == "v" then
				local n3 = v1() - u5
				local n4 = u6 + n1 * n3 + 0.5 * n3 * n3 * n2

				return n1 + n2 * n3
			end

			if p8 == "Acceleration" or p8 == "a" or p8 == "Gravity" then
				return n2
			end

			error(p8 .. " is not a valid member of Projectile")
		end,
		__newindex = function(_, p10, p11)
			local v33 = v1()

			if p10 == "Value" or p10 == "Position" or p10 == "p" then
				local n8 = v33 - u5
				local n9 = u6 + n1 * n8 + 0.5 * n8 * n8 * n2

				u6 = p11
				n1 += n2 * n8
				u5 = v33

				return
			end

			if p10 == "Velocity" or p10 == "v" then
				local n3 = v33 - u5
				local n4 = n1 + n2 * n3

				u6 = u6 + n1 * n3 + 0.5 * n3 * n3 * n2
				n1 = p11
				u5 = v33

				return
			end

			if p10 == "Acceleration" or p10 == "a" or p10 == "Gravity" then
				local n5 = v33 - u5
				local n6 = u6 + n1 * n5 + 0.5 * n5 * n5 * n2
				local n7 = n1 + n2 * n5

				n2 = p11
				u6 = n6
				n1 = n7
				u5 = v33

				return
			end

			error(p10 .. " is not a valid member of Projectile")
		end
	})

	return object
end
function module.NumberProjectile.New(p12)
	return module.Projectile.New(p12)
end
function module.VectorProjectile.New(p13)
	local new = module.Projectile.New
	local v14 = p13 or vector3New()

	return new(v14)
end

return module
