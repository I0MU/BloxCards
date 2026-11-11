



local ropeConstraint = require(script.Parent:WaitForChild("RopeConstraint"))

local function CreateBone(p1, p2, p3)
	return { Position = p1, FreeLength = p2, ParentIndex = p3 }
end

return function()
	local t1: {[any]: any} = {
		Bones = {
			{ Position = Vector3.new(0, 0, 0), FreeLength = 3, ParentIndex = 0 },
			{ Position = Vector3.new(0, 10, 0), FreeLength = 3, ParentIndex = 1 }
		}
	}

	describe("Rope Constraint", function()
		local v7 = t1.Bones[2]
		local n1: number = 0
		local u9 = nil

		local function LimitCallback()
			local v12 = ropeConstraint(v7, v7.Position, t1)

			expect(v12.Magnitude).to.equal(v7.FreeLength)
			v7.FreeLength = math.random(1, 20)
			u9()
		end
		local function SameCallback()
			local v13 = ropeConstraint(v7, v7.Position, t1)

			expect(v13.Magnitude).to.equal(v7.Position.Magnitude)
			v7.FreeLength = math.random(1, 20)
			u9()
		end

		u9 = function()
			if n1 >= 10 then
				return
			end

			n1 += 1

			if v7.Position.Magnitude < v7.FreeLength then
				local v14 = ("Should stay the same #%*"):format(n1)

				it(v14, SameCallback)

				return
			end

			local v15 = ("Should limit to %* studs #%*"):format(v7.FreeLength, n1)

			it(v15, LimitCallback)
		end
		u9()
	end)
end
