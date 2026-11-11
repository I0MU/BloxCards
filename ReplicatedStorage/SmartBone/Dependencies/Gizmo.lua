



local runService: RunService = game:GetService("RunService")
local tweenService: TweenService = game:GetService("TweenService")
local terrain: Instance = workspace:WaitForChild("Terrain")

assert(terrain, "No terrain object found under workspace...")

local aotGizmoAdornment = terrain:FindFirstChild("AOTGizmoAdornment")
local gizmoAdornment = terrain:FindFirstChild("GizmoAdornment")

if not aotGizmoAdornment then
	aotGizmoAdornment = Instance.new("WireframeHandleAdornment")
	aotGizmoAdornment.Adornee = terrain
	aotGizmoAdornment.ZIndex = 1
	aotGizmoAdornment.AlwaysOnTop = true
	aotGizmoAdornment.Name = "AOTGizmoAdornment"
	aotGizmoAdornment.Parent = terrain
end

if not gizmoAdornment then
	gizmoAdornment = Instance.new("WireframeHandleAdornment")
	gizmoAdornment.Adornee = terrain
	gizmoAdornment.ZIndex = 1
	gizmoAdornment.AlwaysOnTop = false
	gizmoAdornment.Name = "GizmoAdornment"
	gizmoAdornment.Parent = terrain
end

local gizmos: Instance = script:WaitForChild("Gizmos")
local t1: {[any]: any} = {}
local t2: {[any]: any} = {}
local t3: {[any]: any} = {}
local t4: {[any]: any} = {}
local t5: {[any]: any} = { AlwaysOnTop = true }
local t6: {[any]: any} = {}
local u13: boolean = false

local function Retain(p1, p2)
	table.insert(t2, { p1, p2 })
end
local function Register(p3)
	table.insert(t1, p3)
end
local function Release(p4)
	local className = p4.ClassName

	if not t6[className] then
		t6[className] = {}
	end

	p4:Remove()
	table.insert(t6[className], p4)
end
local function Request(className)
	if not t6[className] then
		return Instance.new(className)
	end

	if not t6[className][1] then
		return Instance.new(className)
	end

	local v29 = t6[className][1]

	table.remove(t6[className], 1)

	return v29
end
local function Lerp(p6, p7, p8)
	return p6 + (p7 - p6) * p8
end
local function deepCopy(p9)
	local t8: {[any]: any} = {}

	for k, v in pairs(p9) do
		if type(v) == "table" then
			v = deepCopy(v)
		end

		t8[k] = v
	end

	return t8
end

local module: {[any]: any} = {
	Enabled = true,
	ActiveRays = 0,
	ActiveInstances = 0,
	Styles = {
		Color = "Color3",
		Transparency = "Transparency",
		AlwaysOnTop = "AlwaysOnTop"
	},
	AOTWireframeHandle = aotGizmoAdornment,
	WireframeHandle = gizmoAdornment,
	GetPoolSize = function()
		local n1: number = 0

		for key, value in t6 do
			n1 += #value
		end

		return n1
	end,
	PushProperty = function(p10, p11)
		t5[p10] = p11

		if p10 == "AlwaysOnTop" then
			return
		end

		pcall(function()
			aotGizmoAdornment[p10] = p11
			gizmoAdornment[p10] = p11
		end)
	end,
	PopProperty = function(p12)
		if t5[p12] then
			return t5[p12]
		end

		return aotGizmoAdornment[p12]
	end
}

function module.SetStyle(p13, p14, p15)
	if p13 and typeof(p13) == "Color3" then
		module.PushProperty("Color3", p13)
	end

	if p14 and typeof(p14) == "number" then
		module.PushProperty("Transparency", p14)
	end

	if p15 and typeof(p15) == "boolean" then
		module.PushProperty("AlwaysOnTop", p15)
	end
end
function module.DoCleaning()
	aotGizmoAdornment:Clear()
	gizmoAdornment:Clear()

	for key, value in t1 do
		local className = value.ClassName

		if not t6[className] then
			t6[className] = {}
		end

		value:Remove()
		table.insert(t6[className], value)
	end

	t1 = {}
	module.ActiveRays = 0
	module.ActiveInstances = 0
end
function module.ScheduleCleaning()
	if u13 then
		return
	end

	u13 = true
	task.delay(0, function()
		module.DoCleaning()
		u13 = false
	end)
end
function module.AddDebrisInSeconds(p16, p17)
	local v51 = os.clock()

	table.insert(t3, { "Seconds", p16, v51, p17 })
end
function module.AddDebrisInFrames(p18, p19)
	table.insert(t3, { "Frames", p18, 0, p19 })
end
function module.TweenProperties(p20, p21, p22)
	local v57 = deepCopy(p20)

	table.insert(t4, {
		Time = 0,
		p_Properties = p20,
		Properties = v57,
		Goal = p21,
		TweenInfo = p22
	})

	local n1: number = #t4

	return function()
		table.remove(t4, n1)
	end
end
function module.Init()
	runService.RenderStepped:Connect(function(deltaTime: number)
		for key, value in t4 do
			value.Time = value.Time + deltaTime

			local n1 = value.Time / value.TweenInfo.Time

			if n1 > 1 then
				n1 = 1
			end

			local function LerpProperty(p24, p25, p26)
				if type(p24) == "number" then
					return p24 + (p25 - p24) * p26
				end

				return p24:Lerp(p25, p26)
			end

			for iterFirst, iterSecond in value.Properties, nil, nil do
				if value.Goal[iterFirst] then
					local v67: number = tweenService:GetValue(n1, value.TweenInfo.EasingStyle, value.TweenInfo.EasingDirection)
					local v68 = value.Goal[iterFirst]
					local n2

					if type(iterSecond) == "number" then
						n2 = iterSecond + (v68 - iterSecond) * v67
					else
						n2 = iterSecond:Lerp(v68, v67)
					end

					value.p_Properties[iterFirst] = n2
				end
			end

			if n1 == 1 then
				table.remove(t4, key)
			end
		end

		for key2, value2 in t3 do
			local v72 = value2[2]
			local v73 = value2[3]
			local v74 = value2[4]

			if value2[1] == "Seconds" then
				local v75 = os.clock()

				if v72 < v75 - v73 then
					table.remove(t3, key2)
				else
					v74()
				end
			elseif v72 < v73 then
				table.remove(t3, key2)
			else
				value2[2] = value2[2] + 1
				v74()
			end
		end

		for key3, value3 in t2 do
			local v78 = value3[2]

			if v78.Enabled then
				if v78.Destroy then
					table.remove(t2, key3)
				end

				value3[1]:Update(v78)
			end
		end
	end)
end
function module.SetEnabled(enabled)
	module.Enabled = enabled

	if enabled == false then
		module.DoCleaning()
	end
end

for iterFirst, iterSecond in gizmos:GetChildren() do
	module[iterSecond.Name] = require(iterSecond).Init(module, t5, Request, Release, Retain, Register)
end

return module
