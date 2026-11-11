



local frustum = require(script.Parent:WaitForChild("Frustum"))

return function()
	local t1 = {}
	local t2: {[any]: any} = {
		FieldOfView = 70,
		CFrame = CFrame.identity,
		ViewportSize = Vector2.new(1920, 1080)
	}

	describe("Generates CFrames", function()
		local v4 = os.clock()

		t1 = table.pack(frustum.GetCFrames(t2, 500))

		local v5 = os.clock()

		t1.n = nil

		local v6 = ("Solved view frustum in %*μs"):format((string.format("%.2f", (v5 - v4) * 1000000)))

		print(v6)
	end)
	describe("Point In View", function()
		it("Close In View Point", function()
			expect(frustum.InViewFrustum(Vector3.new(0, 0, -5), table.unpack(t1))).to.equal(true)
		end)
		it("Past FarPlane Point", function()
			expect(frustum.InViewFrustum(Vector3.new(0, 0, -550), table.unpack(t1))).to.equal(false)
		end)
		it("Out Of View Point", function()
			expect(frustum.InViewFrustum(Vector3.new(0, 0, 5), table.unpack(t1))).to.equal(false)
		end)
	end)
	describe("Object In View", function()
		local t3: {[any]: any} = { Size = Vector3.new(1, 1, 3), CFrame = CFrame.new(0, 0, -5) }

		it("Close In View Object", function()
			expect(frustum.ObjectInFrustum(t3, table.unpack(t1))).to.equal(true)
		end)

		local t4: {[any]: any} = { Size = Vector3.new(1, 1, 3), CFrame = CFrame.new(0, 0, -550) }

		it("Past FarPlane Object", function()
			expect(frustum.ObjectInFrustum(t4, table.unpack(t1))).to.equal(false)
		end)

		local t5: {[any]: any} = { Size = Vector3.new(1, 1, 3), CFrame = CFrame.new(0, 0, 5) }

		it("Out Of View Object", function()
			expect(frustum.ObjectInFrustum(t5, table.unpack(t1))).to.equal(false)
		end)
	end)
end
