

-- Original SourceAssetId: https://assetdelivery.roblox.com/v1/asset/?id=7145661386

-- ! Source from the asset above; the game may have edited it since.

--[[
local GuiCollisionService = {}
GuiCollisionService.__index = GuiCollisionService

local function intersects (p, edge)
	local x1, y1 = edge.a.x, edge.a.y
	local x2, y2 = edge.b.x, edge.b.y

	local x3, y3 = p.x, p.y
	local x4, y4 = p.x + 2147483647, p.y
	
	local den = (x1 - x2) * (y3 - y4) - (y1 - y2) * (x3 - x4)

	if den == 0 then return false end

	local t = ((x1 - x3) * (y3 - y4) - (y1 - y3) * (x3 - x4)) / den
	local u = -((x1 - x2) * (y1 - y3) - (y1 - y2) * (x1 - x3)) / den
	
	if t and u and t > 0 and t < 1 and u > 0 then
		return true
	end
	
	return false
end

local function solidCollision(gui1,gui2) -- special thanks to RuizuKun_Dev
	local pos1, size1 = gui1.AbsolutePosition, gui1.AbsoluteSize;
	local pos2, size2 = gui2.AbsolutePosition, gui2.AbsoluteSize;

	local IsColliding, MTV = GuiCollisionService.isColliding(gui1, gui2)
	if IsColliding then
		local EdgeDifferences_Array = {
			Vector2.new(pos1.x - (pos2.x + size2.x), 0);
			Vector2.new((pos1.x + size1.x) - pos2.x, 0);
			Vector2.new(0, pos1.y - (pos2.y + size2.y));
			Vector2.new(0, (pos1.y + size1.y) - pos2.y);
		};
		table.sort(EdgeDifferences_Array, function(A, B) return A.magnitude < B.magnitude; end);
		MTV = EdgeDifferences_Array[1];
	end;
	return IsColliding, MTV or Vector2.new();
end;

local function getCorners(guiObject0)
	local pos = guiObject0.AbsolutePosition
	local size = guiObject0.AbsoluteSize
	local rotation = guiObject0.Rotation

	local a = pos + size/2 - math.sqrt((size.X/2)^2 + (size.Y/2)^2) * Vector2.new(math.cos(math.rad(rotation) + math.atan2(size.Y, size.X)), math.sin(math.rad(rotation) + math.atan2(size.Y, size.X)))
	local b = pos + size/2-math.sqrt((size.X/2)^2 + (size.Y/2)^2) * Vector2.new(math.cos(math.rad(rotation) - math.atan2(size.Y, size.X)), math.sin(math.rad(rotation) - math.atan2(size.Y, size.X)))
	local c = pos + size/2+math.sqrt((size.X/2)^2 + (size.Y/2)^2) * Vector2.new(math.cos(math.rad(rotation) + math.atan2(size.Y, size.X)), math.sin(math.rad(rotation) + math.atan2(size.Y, size.X)))
	local d = pos + size/2+math.sqrt((size.X/2)^2 + (size.Y/2)^2) * Vector2.new(math.cos(math.rad(rotation) - math.atan2(size.Y, size.X)), math.sin(math.rad(rotation) - math.atan2(size.Y, size.X)))

	return { 
		topleft = a, 
		bottomleft = b, 
		topright = d, 
		bottomright = c 
	}
end


local function checkCollisions(collider, hitter)	
	if collider.solid then
		local IsColliding, MTV = solidCollision(hitter.i, collider.i);
		if IsColliding then
			if hitter.t then
				for i, tween in ipairs(hitter.t) do
					if tween.PlaybackState == Enum.PlaybackState.Playing then
						tween:Pause()
						table.remove(hitter.t, i)
					end
				end 					
			end
			hitter.i.Position = hitter.i.Position - UDim2.new(0, MTV.x, 0, MTV.y); 
		end;
	end

	if GuiCollisionService.isColliding(hitter.i, collider.i) then
		return true
	end	
	
	return false
end

local function check (hitter, colliders, h)
	local collidingWith = {}

	for _, collider in ipairs(colliders) do
		if h then
			if hitter.i.ZIndex == collider.i.ZIndex then
				if checkCollisions(collider, hitter) then
					table.insert(collidingWith, collider.i)
				end
			end
		else
			if checkCollisions(collider, hitter) then
				table.insert(collidingWith, collider.i)
			end
		end 
	end

	if #collidingWith > 0 then
		return collidingWith
	end

	return nil
end

local function inRange(num, range)
	return num > range.Min and num < range.Max
end

function GuiCollisionService.isInCore(gui0, gui1)
	assert(typeof(gui0) == "Instance" and typeof(gui1) == "Instance", "argument must be an instance")
	if gui0.AbsoluteSize.x > gui1.AbsoluteSize.x or gui0.AbsoluteSize.y > gui1.AbsoluteSize.y then return false end
	
	local corners0, corners1 = getCorners(gui0), getCorners(gui1)
	
	local x = NumberRange.new(corners1[1].x, corners1[4].x)
	local y = NumberRange.new(corners1[1].y, corners1[2].y)
	
	local cornersInside = 0
	
	for _, corner in ipairs(corners0) do
		if inRange(corner.x, x) and inRange(corner.y, y) then
			cornersInside += 1
		end
	end
	
	if cornersInside == 4 then
		return true
	end
	
	return false
end

function GuiCollisionService.isColliding(guiObject0, guiObject1)		
	if not typeof(guiObject0) == "Instance" or not typeof(guiObject1) == "Instance" then error("argument must be an instance") return end

	local ap1 = guiObject0.AbsolutePosition
	local as1 = guiObject0.AbsoluteSize
	local sum = ap1 + as1

	local ap2 = guiObject1.AbsolutePosition
	local as2 = guiObject1.AbsoluteSize
	local sum2 = ap2 + as2
	
	local corners0 = getCorners(guiObject0)
	local corners1 = getCorners(guiObject1)
	
	local edges = {
		{
			a = corners1.topleft,
			b = corners1.bottomleft
		},
		{
			a = corners1.topleft,
			b = corners1.topright
		},
		{
			a = corners1.bottomleft,
			b = corners1.bottomright
		},
		{
			a = corners1.topright,
			b = corners1.bottomright
		}
	}
	
	local collisions = 0
	
	for _, corner in pairs(corners0) do
		for _, edge in pairs(edges) do			
			if intersects(corner, edge) then
				collisions += 1
			end			
		end
	end
	
	if collisions%2 ~= 0 then
		return true
	end
	
	if (ap1.x < sum2.x and sum.x > ap2.x) and (ap1.y < sum2.y and sum.y > ap2.y) then
		return true
	end
	
	return false
end

function GuiCollisionService.createCollisionGroup()
	local collisionDetected = Instance.new("BindableEvent")

	local self = setmetatable({
		ColliderTouched = collisionDetected.Event
	}, GuiCollisionService)

	self.colliders = {}
	self.hitters = {}
	self.hierarchy = false 

	game:GetService("RunService").RenderStepped:Connect(function(dt)
		for _, hitter in ipairs(self.hitters) do
			local res = check(hitter, self.colliders, self.hierarchy)
			
			if res then
				local bin = {}

				for i, v in ipairs(res) do
					if table.find(bin, v) then
						table.remove(res, i)
					else
						table.insert(bin, v)
					end
				end

				hitter.i.CollidersTouched:Fire(res)
				hitter.i.Colliding.Value = true
				return
			else
				hitter.i.Colliding.Value = false
			end

			hitter.i.Colliding:GetPropertyChangedSignal("Value"):Connect(function()
				if not hitter.i.Colliding.Value then
					hitter.i.OnCollisionEnded:Fire()
					return
				end
			end)
		end		
	end)

	return self
end

function GuiCollisionService:setZIndexHierarchy(bool: boolean)
	assert(typeof(bool) == "boolean", "argument must be a boolean")
	
	self.hierarchy = true
end

function GuiCollisionService:addHitter(instance, tweens: table)
	assert(typeof(instance) == "Instance", "argument must be an instance")
	assert(typeof(tweens) == "table", "argument must be a table")

	local be = Instance.new("BindableEvent")
	be.Name = "CollidersTouched"
	be.Parent = instance

	local be2 = be:Clone()
	be2.Name = "OnCollisionEnded"
	be2.Parent = instance

	local is = Instance.new("BoolValue")
	is.Name = "Colliding"
	is.Value = false
	is.Parent = instance

	table.insert(self.hitters, { i = instance, t = tweens })
	
	return { index = #self.hitters, ["instance"] = instance }
end

function GuiCollisionService:updateHitter(i: number, instance, tweens: table)
	assert(typeof(i) == "number", "argument must be a table")
	assert(typeof(instance) == "Instance", "argument must be an instance")
	assert(typeof(tweens) == "table", "argument must be a table")
	
	self.hitters[i] = { i = instance, t = tweens or {} }
	
	return { index = i, instance = self.hitters[i].i } 
end

function GuiCollisionService:getHitter(index)
	return self.hitters[index].i
end

function GuiCollisionService:getHitterTweens(index)
	return self.hitters[index].t
end

function GuiCollisionService:getHitters()
	local res = {}

	for _, v in ipairs(self.hitters) do
		table.insert(res, v.i)
	end

	return res
end

function GuiCollisionService:removeHitter(index)
	table.remove(self.hitters, index)
end

function GuiCollisionService:addCollider(instance, t: boolean)
	assert(typeof(instance) == "Instance", "argument must be an instance")
	assert(typeof(t) == "boolean", "argument must be a boolean")

	if not self.colliders then
		self.colliders = {}
	end
	
	if t then
		table.insert(self.colliders, { i = instance, solid = true })
	else
		table.insert(self.colliders, { i = instance })
	end
	
	return { index = #self.colliders, ["instance"] = instance, solid = t }
end

function GuiCollisionService:updateCollider(i: number, instance, t: boolean)
	assert(typeof(i) == "number", "argument must be a table")
	assert(typeof(instance) == "Instance", "argument must be an instance")
	assert(typeof(t) == "boolean", "argument must be a boolean")

	self.colliders[i] = { ["i"] = instance, solid = t }

	return { index = i, instance = self.colliders[i].i, self.colliders[i].solid } 
end

function GuiCollisionService:getColliders()
	local res = {}

	for _, v in ipairs(self.colliders) do
		table.insert(res, v.i)
	end

	return res
end

function GuiCollisionService:removeCollider(index)
	table.remove(self.colliders, index)
end

return GuiCollisionService
]]



local module: {[any]: any} = {}

module.__index = module

local function intersects(p1, p2)
	local x = p2.a.x
	local y = p2.a.y
	local v12 = p2.b.x
	local v13 = p2.b.y
	local v14 = p1.x
	local v15 = p1.y
	local n1 = p1.x + 2147483647
	local v17 = p1.y
	local n2 = (x - v12) * (v15 - v17) - (y - v13) * (v14 - n1)

	if n2 == 0 then
	elseif ((x - v14) * (v15 - v17) - (y - v15) * (v14 - n1)) / n2 and -((x - v12) * (y - v15) - (y - v13) * (x - v14)) / n2 and ((x - v14) * (v15 - v17) - (y - v15) * (v14 - n1)) / n2 > 0 and ((x - v14) * (v15 - v17) - (y - v15) * (v14 - n1)) / n2 < 1 and -((x - v12) * (y - v15) - (y - v13) * (x - v14)) / n2 > 0 then
		return true
	end

	return false
end
local function solidCollision(p3, p4)
	local absolutePosition = p3.AbsolutePosition
	local absoluteSize = p3.AbsoluteSize
	local v23 = p4.AbsolutePosition
	local v24 = p4.AbsoluteSize
	local v25, v26 = module.isColliding(p3, p4)

	if v25 then
		local vector2 = Vector2.new(absolutePosition.x - (v23.x + v24.x), 0)
		local vector22 = Vector2.new(absolutePosition.x + absoluteSize.x - v23.x, 0)
		local vector23 = Vector2.new(0, absolutePosition.y - (v23.y + v24.y))
		local t2: {[any]: any} = {
			vector2,
			vector22,
			vector23,
			Vector2.new(0, absolutePosition.y + absoluteSize.y - v23.y)
		}

		table.sort(t2, function(p5, p6)
			return p5.magnitude < p6.magnitude
		end)
		v26 = t2[1]
	end

	local v31 = v26 or Vector2.new()

	return v25, v31
end
local function getCorners(p7)
	local absolutePosition = p7.AbsolutePosition
	local absoluteSize = p7.AbsoluteSize
	local rotation = p7.Rotation
	local squareRoot = math.sqrt((absoluteSize.X / 2) ^ 2 + (absoluteSize.Y / 2) ^ 2)
	local vector2New = Vector2.new
	local v38 = math.rad(rotation)
	local v39 = math.atan2(absoluteSize.Y, absoluteSize.X)
	local cosine = math.cos(v38 + v39)

	v39 = math.rad(rotation)

	local v41 = math.atan2(absoluteSize.Y, absoluteSize.X)
	local sine = math.sin(v39 + v41)
	local vector2 = vector2New(cosine, sine)
	local squareRoot2 = math.sqrt((absoluteSize.X / 2) ^ 2 + (absoluteSize.Y / 2) ^ 2)
	local v45 = Vector2.new

	v39 = math.rad(rotation)
	v41 = math.atan2(absoluteSize.Y, absoluteSize.X)

	local cosine2 = math.cos(v39 - v41)

	v41 = math.rad(rotation)

	local v47 = math.atan2(absoluteSize.Y, absoluteSize.X)
	local sine2 = math.sin(v41 - v47)
	local v49 = v45(cosine2, sine2)
	local squareRoot3 = math.sqrt((absoluteSize.X / 2) ^ 2 + (absoluteSize.Y / 2) ^ 2)
	local v51 = Vector2.new

	v41 = math.rad(rotation)
	v47 = math.atan2(absoluteSize.Y, absoluteSize.X)

	local cosine3 = math.cos(v41 + v47)

	v47 = math.rad(rotation)

	local v53 = math.atan2(absoluteSize.Y, absoluteSize.X)
	local sine3 = math.sin(v47 + v53)
	local v55 = v51(cosine3, sine3)
	local squareRoot4 = math.sqrt((absoluteSize.X / 2) ^ 2 + (absoluteSize.Y / 2) ^ 2)
	local v57 = Vector2.new

	v47 = math.rad(rotation)
	v53 = math.atan2(absoluteSize.Y, absoluteSize.X)

	local cosine4 = math.cos(v47 - v53)

	v53 = math.rad(rotation)

	local v59 = math.atan2(absoluteSize.Y, absoluteSize.X)
	local sine4 = math.sin(v53 - v59)

	v38 = v57(cosine4, sine4)

	return {
		topleft = absolutePosition + absoluteSize / 2 - squareRoot * vector2,
		bottomleft = absolutePosition + absoluteSize / 2 - squareRoot2 * v49,
		topright = absolutePosition + absoluteSize / 2 + squareRoot4 * v38,
		bottomright = absolutePosition + absoluteSize / 2 + squareRoot3 * v55
	}
end
local function checkCollisions(p8, p9)
	if p8.solid then
		local v63, v64 = solidCollision(p9.i, p8.i)

		if v63 then
			if p9.t then
				for i, v in ipairs(p9.t) do
					if v.PlaybackState == Enum.PlaybackState.Playing then
						v:Pause()
						table.remove(p9.t, i)
					end
				end
			end

			local i = p9.i
			local v68 = p9.i.Position
			local uDim2 = UDim2.new(0, v64.x, 0, v64.y)

			i.Position = v68 - uDim2
		end
	end

	if module.isColliding(p9.i, p8.i) then
		return true
	end

	return false
end
local function check(p10, p11, p12)
	local t3: {[any]: any} = {}

	for _, v in ipairs(p11) do
		if not p12 then
			if checkCollisions(v, p10) then
				table.insert(t3, v.i)
			end
		elseif p10.i.ZIndex == v.i.ZIndex and checkCollisions(v, p10) then
			table.insert(t3, v.i)
		end
	end

	if #t3 > 0 then
		return t3
	end

	return nil
end
local function inRange(p13, p14)
	return p13 > p14.Min and p13 < p14.Max
end
function module.isInCore(p15, p16)
	local u80 = false

	if typeof(p15) == "Instance" then
		u80 = typeof(p16) == "Instance"
	end

	assert(u80, "argument must be an instance")

	if p15.AbsoluteSize.x > p16.AbsoluteSize.x or p15.AbsoluteSize.y > p16.AbsoluteSize.y then
		return false
	end

	local v81 = getCorners(p15)

	u80 = getCorners(p16)

	local numberRange = NumberRange.new(u80[1].x, u80[4].x)
	local numberRange2 = NumberRange.new(u80[1].y, u80[2].y)

	u80 = 0

	for _, v in ipairs(v81) do
		local vX = v.x

		if vX > numberRange.Min and vX < numberRange.Max then
			local vY = v.y

			if vY > numberRange2.Min and vY < numberRange2.Max then
				u80 += 1
			end
		end
	end

	if u80 == 4 then
		return true
	end

	return false
end
function module.isColliding(p17, p18)
	if not typeof(p17) == "Instance" or not typeof(p18) == "Instance" then
		error("argument must be an instance")

		return
	end

	local absolutePosition = p17.AbsolutePosition
	local n1 = absolutePosition + p17.AbsoluteSize
	local v92 = p18.AbsolutePosition
	local n2 = v92 + p18.AbsoluteSize
	local v94 = getCorners(p17)
	local v95 = getCorners(p18)
	local t4: {[any]: any} = {
		{ a = v95.topleft, b = v95.bottomleft },
		{ a = v95.topleft, b = v95.topright },
		{ a = v95.bottomleft, b = v95.bottomright },
		{ a = v95.topright, b = v95.bottomright }
	}

	v95 = 0

	for _, v in pairs(v94) do
		for _, iterValue in pairs(t4) do
			if intersects(v, iterValue) then
				v95 += 1
			end
		end
	end

	if v95 % 2 ~= 0 then
		return true
	end

	if absolutePosition.x < n2.x and n1.x > v92.x and absolutePosition.y < n2.y and n1.y > v92.y then
		return true
	end

	return false
end
function module.createCollisionGroup()
	local bindableEvent: BindableEvent = Instance.new("BindableEvent")
	local object = setmetatable({ ColliderTouched = bindableEvent.Event }, module)

	object.colliders = {}
	object.hitters = {}
	object.hierarchy = false

	local n1 = 0

	game:GetService("RunService").PreRender:Connect(function(deltaTimeRender: number)
		if tick() - n1 >= 0.05 then
			for _, v in ipairs(object.hitters) do
				local v156 = check(v, object.colliders, object.hierarchy)

				if v156 then
					local t7: {[any]: any} = {}

					for i, iterValue in ipairs(v156) do
						if table.find(t7, iterValue) then
							table.remove(v156, i)
						else
							table.insert(t7, iterValue)
						end
					end

					v.i.CollidersTouched:Fire(v156)
					v.i.Colliding.Value = true

					return
				end

				v.i.Colliding.Value = false
				v.i.Colliding:GetPropertyChangedSignal("Value"):Connect(function()
					if not v.i.Colliding.Value then
						v.i.OnCollisionEnded:Fire()

						return
					end
				end)
			end

			n1 = tick()

			return
		end
	end)

	return object
end
function module.setZIndexHierarchy(p20, p21)
	local typeName: string = typeof(p21)

	assert(typeName == "boolean", "argument must be a boolean")
	p20.hierarchy = true
end
function module.addHitter(p22, parent, p24)
	local typeName: string = typeof(parent)

	assert(typeName == "Instance", "argument must be an instance")

	local typeName2: string = typeof(p24)

	assert(typeName2 == "table", "argument must be a table")

	local collidersTouched: BindableEvent = Instance.new("BindableEvent")

	collidersTouched.Name = "CollidersTouched"
	collidersTouched.Parent = parent

	local clone: Instance = collidersTouched:Clone()

	clone.Name = "OnCollisionEnded"
	clone.Parent = parent

	local colliding: BoolValue = Instance.new("BoolValue")

	colliding.Name = "Colliding"
	colliding.Value = false
	colliding.Parent = parent
	table.insert(p22.hitters, { i = parent, t = p24 })

	return { index = #p22.hitters, instance = parent }
end
function module.updateHitter(p25, p26, p27, p28)
	local typeName: string = typeof(p26)

	assert(typeName == "number", "argument must be a table")

	local typeName3: string = typeof(p27)

	assert(typeName3 == "Instance", "argument must be an instance")

	local typeName4: string = typeof(p28)

	assert(typeName4 == "table", "argument must be a table")
	p25.hitters[p26] = {
		i = p27,
		t = p28 or {}
	}

	return { index = p26, instance = p25.hitters[p26].i }
end
function module.getHitter(p29, p30)
	return p29.hitters[p30].i
end
function module.getHitterTweens(p31, p32)
	return p31.hitters[p32].t
end
function module.getHitters(p33)
	local t5: {[any]: any} = {}

	for _, v in ipairs(p33.hitters) do
		table.insert(t5, v.i)
	end

	return t5
end
function module.removeHitter(p34, p35)
	table.remove(p34.hitters, p35)
end
function module.addCollider(p36, p37, p38)
	local typeName: string = typeof(p37)

	assert(typeName == "Instance", "argument must be an instance")

	local typeName5: string = typeof(p38)

	assert(typeName5 == "boolean", "argument must be a boolean")

	if not p36.colliders then
		p36.colliders = {}
	end

	if p38 then
		table.insert(p36.colliders, { solid = true, i = p37 })
	else
		table.insert(p36.colliders, { i = p37 })
	end

	return { index = #p36.colliders, instance = p37, solid = p38 }
end
function module.updateCollider(p39, p40, p41, p42)
	local typeName: string = typeof(p40)

	assert(typeName == "number", "argument must be a table")

	local typeName6: string = typeof(p41)

	assert(typeName6 == "Instance", "argument must be an instance")

	local typeName7: string = typeof(p42)

	assert(typeName7 == "boolean", "argument must be a boolean")
	p39.colliders[p40] = { i = p41, solid = p42 }

	return {
		index = p40,
		instance = p39.colliders[p40].i,
		p39.colliders[p40].solid
	}
end
function module.getColliders(p43)
	local t6: {[any]: any} = {}

	for _, v in ipairs(p43.colliders) do
		table.insert(t6, v.i)
	end

	return t6
end
function module.removeCollider(p44, p45)
	for i = 1, #p44.colliders do
		if p44.colliders[i] and p45 == p44.colliders[i].i then
			table.remove(p44.colliders, i)
		end
	end
end

return module
