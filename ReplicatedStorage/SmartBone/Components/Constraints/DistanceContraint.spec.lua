



local distanceConstraint = require(script.Parent:WaitForChild("DistanceConstraint"))

local function CreateBone(p1, p2, p3)
	return { Position = p1, FreeLength = p2, ParentIndex = p3 }
end

return function()
	local t1: {[any]: any} = {
		Bones = {
			{ Position = Vector3.new(0, 0, 0), FreeLength = 3, ParentIndex = 0 },
			{ Position = Vector3.new(0, 1, 0), FreeLength = 3, ParentIndex = 1 }
		}
	}

	describe("Distance Constraint", function()
		local v7 = t1.Bones[2]

		local function Callback()
			local v11 = distanceConstraint(v7, v7.Position, t1)

			expect(v11.Magnitude).to.equal(v7.FreeLength)
			v7.Position = v11
		end

		for i = 1, 10 do
			local v10 = ("Should limit to %* studs #%*"):format(v7.FreeLength, i)

			it(v10, Callback)
			v7.FreeLength = math.random(1, 20)
		end
	end)
end
