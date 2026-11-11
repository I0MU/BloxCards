



local function Map(p1, p2, p3, p4, p5)
	return (p1 - p2) / (p3 - p2) * (p5 - p4) + p4
end

local module: {[any]: any} = {}

module.__index = module

function module.Init(ceive, propertys, request, release, retain)
	local object = setmetatable({}, module)

	object.Ceive = ceive
	object.Propertys = propertys
	object.Request = request
	object.Release = release
	object.Retain = retain

	return object
end
function module.Draw(p11, p12, p13, p14, p15)
	local ceive = p11.Ceive

	if not ceive.Enabled then
		return
	end

	local n1 = -math.huge
	local n2 = -math.huge
	local n3 = -math.huge
	local n4 = math.huge
	local n5 = math.huge
	local n6 = math.huge

	for iterFirst, iterSecond in p14 do
		n1 = math.max(n1, iterSecond.x)
		n2 = math.max(n2, iterSecond.y)
		n3 = math.max(n3, iterSecond.z)
		n4 = math.min(n4, iterSecond.x)
		n5 = math.min(n5, iterSecond.y)
		n6 = math.min(n6, iterSecond.z)
	end

	for iterFirst2, iterSecond2 in p14 do
		local cFrameNew = CFrame.new
		local vector3 = Vector3.new((iterSecond2.x - n4) / (n1 - n4) * 1 + -0.5, (iterSecond2.y - n5) / (n2 - n5) * 1 + -0.5, (iterSecond2.z - n6) / (n3 - n6) * 1 + -0.5)
		local cFrame = cFrameNew(vector3 * p13)

		p14[iterFirst2] = p12 * cFrame
	end

	for iterFirst3, iterSecond3 in p15 do
		if #iterSecond3 == 3 then
			local v35 = p14[iterSecond3[1].v]
			local v36 = p14[iterSecond3[2].v]
			local v37 = p14[iterSecond3[3].v]

			ceive.Ray:Draw(v35.Position, v36.Position)
			ceive.Ray:Draw(v36.Position, v37.Position)
			ceive.Ray:Draw(v37.Position, v35.Position)
		else
			local v38 = p14[iterSecond3[1].v]
			local v39 = p14[iterSecond3[2].v]
			local v40 = p14[iterSecond3[3].v]
			local v41 = p14[iterSecond3[4].v]

			ceive.Ray:Draw(v38.Position, v39.Position)
			ceive.Ray:Draw(v38.Position, v41.Position)
			ceive.Ray:Draw(v41.Position, v39.Position)
			ceive.Ray:Draw(v40.Position, v41.Position)
			ceive.Ray:Draw(v39.Position, v40.Position)
		end
	end
end
function module.Create(p16, p17, p18, p19, p20)
	local t2: {[any]: any} = {
		Enabled = true,
		Destroy = false,
		Transform = p17,
		Size = p18,
		Vertices = p19,
		Faces = p20,
		AlwaysOnTop = p16.Propertys.AlwaysOnTop,
		Transparency = p16.Propertys.Transparency,
		Color3 = p16.Propertys.Color3
	}

	p16.Retain(p16, t2)

	return t2
end
function module.Update(p21, p22)
	local ceive = p21.Ceive

	ceive.PushProperty("AlwaysOnTop", p22.AlwaysOnTop)
	ceive.PushProperty("Transparency", p22.Transparency)
	ceive.PushProperty("Color3", p22.Color3)
	p21:Draw(p22.Transform, p22.Size, p22.Vertices, p22.Faces)
end

return module
