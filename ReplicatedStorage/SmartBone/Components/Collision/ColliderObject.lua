



local collider = require(script.Parent:WaitForChild("Collider"))
local dependencies: Instance = script.Parent.Parent.Parent:WaitForChild("Dependencies")
local sb_verbose_log = require(dependencies:WaitForChild("Utilities")).SB_VERBOSE_LOG
local module: {[any]: any} = {}

module.__index = module

function module.new(p1, p2)
	local object = setmetatable({
		m_Awake = true,
		m_LastSleepCycle = 0,
		Destroyed = false,
		m_Object = p2,
		Colliders = {}
	}, module)

	object:m_LoadColliderTable(p1)
	object.DestroyConnection = p2:GetPropertyChangedSignal("Parent"):Connect(function()
		if p2.Parent == nil then
			object.Destroyed = true
		end
	end)

	return object
end
function module.m_LoadCollider(p3, p4)
	local vector3 = Vector3.new(p4.ScaleX, p4.ScaleY, p4.ScaleZ)
	local vector32 = Vector3.new(p4.OffsetX, p4.OffsetY, p4.OffsetZ)
	local vector33 = Vector3.new(p4.RotationX, p4.RotationY, p4.RotationZ)
	local v13 = collider.new()

	v13.Scale = vector3
	v13.Offset = vector32
	v13.Rotation = vector33
	v13.Type = p4.Type
	v13:SetObject(p3.m_Object)
	table.insert(p3.Colliders, v13)
end
function module.m_LoadColliderTable(p5, p6)
	for iterFirst, iterSecond in p6 do
		p5:m_LoadCollider(iterSecond)
	end
end
function module.GetObject(p7)
	return p7.m_Object
end
function module.GetCollisions(p8, p9, p10)
	debug.profilebegin("ColliderObject::GetCollisions")

	if not p8.m_Object then
		debug.profileend()

		return {}
	end

	if #p8.Colliders == 0 then
		debug.profileend()

		return {}
	end

	debug.profilebegin("Sleep Cycle")

	if os.clock() - p8.m_LastSleepCycle >= 0.2 then
		p8.m_LastSleepCycle = os.clock()

		if p8.m_Object:IsDescendantOf(workspace) then
			p8.m_Awake = true
		else
			p8.m_Awake = false
		end
	end

	debug.profileend()

	if not p8.m_Awake then
		debug.profileend()

		return {}
	end

	local t2: {[any]: any} = {}

	debug.profilebegin("Determine Collisions")

	for iterFirst, iterSecond in p8.Colliders, nil, nil do
		debug.profilebegin("Determine collision")

		local v25, v26, v27 = iterSecond:GetClosestPoint(p9, p10)

		debug.profileend()

		if v25 then
			table.insert(t2, { ClosestPoint = v26, Normal = v27 })
		end
	end

	debug.profileend()
	debug.profileend()

	return t2
end
function module.Step(p11)
	debug.profilebegin("ColliderObject::Step")

	for iterFirst, iterSecond in p11.Colliders, nil, nil do
		iterSecond:Step()
	end

	debug.profileend()
end
function module.DrawDebug(p12, p13, p14, p15, p16)
	for iterFirst, iterSecond in p12.Colliders, nil, nil do
		iterSecond:DrawDebug(p12, p13, p14, p15, p16)
		iterSecond.InNarrowphase = false
	end
end
function module.Destroy(p17)
	task.synchronize()

	local v39 = ("Collider object destroying, object: %*"):format(p17.m_Object)

	sb_verbose_log(v39)
	p17.DestroyConnection:Disconnect()

	if #p17.Colliders ~= 0 then
		for iterFirst, iterSecond in p17.Colliders, nil, nil do
			iterSecond:Destroy()
		end
	end

	setmetatable(p17, nil)
	task.desynchronize()
end

return module
