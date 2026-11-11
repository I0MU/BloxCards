



local axisConstraint = require(script.Parent:WaitForChild("AxisConstraint"))

return function()
	local t1: {[any]: any} = {
		Radius = 0,
		XAxisLimits = NumberRange.new(-math.huge, math.huge),
		YAxisLimits = NumberRange.new(-math.huge, math.huge),
		ZAxisLimits = NumberRange.new(-math.huge, math.huge),
		AxisLocked = { false, false, false },
		ClipVelocity = function()
		end
	}

	afterEach(function()
		t1.AxisLocked = { false, false, false }
	end)
	describe("Axis Lock", function()
		it("Should lock X Axis", function()
			t1.AxisLocked = { true, false, false }

			local v3 = axisConstraint(t1, Vector3.new(-10, 0, 0), Vector3.new(0, 0, 0), CFrame.identity)

			expect(v3.X).to.equal(0)
		end)
		it("Should lock Y Axis", function()
			t1.AxisLocked = { false, true, false }

			local v4 = axisConstraint(t1, Vector3.new(0, -10, 0), Vector3.new(0, 0, 0), CFrame.identity)

			expect(v4.Y).to.equal(0)
		end)
		it("Should lock Z Axis", function()
			t1.AxisLocked = { false, false, true }

			local v5 = axisConstraint(t1, Vector3.new(0, 0, -10), Vector3.new(0, 0, 0), CFrame.identity)

			expect(v5.Z).to.equal(0)
		end)
	end)
	describe("Axis Limit", function()
		describe("Should limit X Axis", function()
			it("Min Limit", function()
				t1.XAxisLimits = NumberRange.new(-5, math.huge)

				local v6 = axisConstraint(t1, Vector3.new(-10, 0, 0), Vector3.new(0, 0, 0), CFrame.identity)

				expect(v6.X).to.equal(-5)
			end)
			it("Max Limit", function()
				t1.XAxisLimits = NumberRange.new(-math.huge, 5)

				local v7 = axisConstraint(t1, Vector3.new(10, 0, 0), Vector3.new(0, 0, 0), CFrame.identity)

				expect(v7.X).to.equal(5)
			end)
		end)
		describe("Should limit Y Axis", function()
			it("Min Limit", function()
				t1.YAxisLimits = NumberRange.new(-5, math.huge)

				local v8 = axisConstraint(t1, Vector3.new(0, -10, 0), Vector3.new(0, 0, 0), CFrame.identity)

				expect(v8.Y).to.equal(-5)
			end)
			it("Max Limit", function()
				t1.YAxisLimits = NumberRange.new(-math.huge, 5)

				local v9 = axisConstraint(t1, Vector3.new(0, 10, 0), Vector3.new(0, 0, 0), CFrame.identity)

				expect(v9.Y).to.equal(5)
			end)
		end)
		describe("Should limit Z Axis", function()
			it("Min Limit", function()
				t1.ZAxisLimits = NumberRange.new(-5, math.huge)

				local v10 = axisConstraint(t1, Vector3.new(0, 0, -10), Vector3.new(0, 0, 0), CFrame.identity)

				expect(v10.Z).to.equal(-5)
			end)
			it("Max Limit", function()
				t1.ZAxisLimits = NumberRange.new(-math.huge, 5)

				local v11 = axisConstraint(t1, Vector3.new(0, 0, 10), Vector3.new(0, 0, 0), CFrame.identity)

				expect(v11.Z).to.equal(5)
			end)
		end)
	end)
end
