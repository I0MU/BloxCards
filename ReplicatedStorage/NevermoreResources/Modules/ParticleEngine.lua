



local mathSin = math.sin
local mathCos = math.cos
local mathTan = math.tan
local mathSqrt = math.sqrt
local tableInsert = table.insert
local tableRemove = table.remove
local mathAtan2 = math.atan2
local mathMax = math.max
local mathAbs = math.abs
local mathRandom = math.random
local vector3New = Vector3.new
local vector2New = Vector2.new
local uDim2New = UDim2.new
local v14 = tick
local rayNew = Ray.new
local workspaceFindPartOnRay = workspace.FindPartOnRay
local dot = vector3New().Dot
local replicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")
local nevermoreEngine = require(replicatedStorage:WaitForChild("NevermoreEngine"))

local function RealMakeEngine(p4)
	print("[ParticleEngine] - Creating new Particle Engine!!!!")
	assert(p4, "Need screen")

	local u23 = v14()
	local LocalPlayer = game.Players.LocalPlayer
	local particleEventDistributor = nevermoreEngine.GetRemoteEvent("ParticleEventDistributor")
	local t1: {[any]: any} = {}
	local u27 = nil
	local u28 = nil
	local u29 = nil
	local u30 = nil

	local function NewParticle(name)
		local frame: Frame = Instance.new("Frame")

		frame.BorderSizePixel = 0
		frame.Name = name
		frame.Archivable = false

		return frame
	end

	for i = 1, 400 do
		local _Particle: Frame = Instance.new("Frame")

		_Particle.BorderSizePixel = 0
		_Particle.Name = "_Particle"
		_Particle.Archivable = false
		t1[i] = _Particle
	end

	local function ParticleUpdateScreenInformation(p6)
		u27 = p4.AbsoluteSize.x
		u28 = p4.AbsoluteSize.y
		u29 = mathTan(p6.FieldOfView * 0.0087266462599716) * 2
		u30 = u29 * u27 / u28
	end

	u27 = p4.AbsoluteSize.x
	u28 = p4.AbsoluteSize.y
	u29 = mathTan(workspace.CurrentCamera.FieldOfView * 0.0087266462599716) * 2
	u30 = u29 * u27 / u28

	local t2: {[any]: any} = {
		Active = true,
		SetScreen = function(p7)
			assert(p7, "Must be a screen!")
			p4 = p7

			local v55 = p4:GetFullName()

			print("[ParticleEngine] - NewScreen: " .. v55)
		end
	}

	local function ParticleWind(p8)
		local n1 = p8.x + p8.y
		local n2 = p8.y + p8.z
		local n3 = p8.z + p8.x
		local v60 = mathSin(n2 + u23 * 2)
		local v61 = mathSin(n2 + u23)
		local v62 = mathSin((n2 + u23) / 10)
		local v63 = mathSin(n3 + u23 * 2)
		local v64 = mathSin(n3 + u23)
		local v65 = mathSin((n3 + u23) / 10)
		local v66 = mathSin(n1 + u23 * 2)
		local v67 = mathSin(n1 + u23)
		local v68 = mathSin((n1 + u23) / 10)

		return vector3New((v60 + v61) / 2 + v62, (v63 + v64) / 2 + v65, (v66 + v67) / 2 + v68) / 2
	end
	local function ParticleUpdateProperties(_, p10, p11)
		p10.Position = p10.Position + p10.Velocity * p11

		local n1 = p10.WindResistance and (ParticleWind(p10.Position) * 10 - p10.Velocity) * p10.WindResistance or vector3New()

		p10.Velocity = p10.Velocity + (p10.Gravity + n1) * p11
	end
	local function ParticleRender(p12, p13, p14, p15)
		local n1 = p15 * p14.Position
		local lastScreenPosition = p14.LastScreenPosition

		if n1.z < -1 and lastScreenPosition then
			local n2 = n1 / n1.z
			local bloom = p14.Bloom
			local transparency = p14.Transparency
			local n3 = (0.5 - n2.x / u30) * u27
			local n4 = (0.5 + n2.y / u29) * u28

			n2 = -p14.Size.y / n1.z * u28 / u29

			local n5 = -p14.Size.x / n1.z * u28 / u29 + bloom.x
			local n6 = n3 - lastScreenPosition.x
			local n7 = n4 - lastScreenPosition.y
			local v87 = mathSqrt(n6 * n6 + n7 * n7)
			local n8 = n2 + v87 + bloom.y

			p14.LastScreenPosition = vector2New(n3, n4)

			local u89: boolean = true

			if p14.Occlusion then
				local p = p12.CoordinateFrame.p
				local n9 = p14.Position - p
				local magnitude = n9.magnitude

				if magnitude > 999 then
					n9 *= 999 / magnitude
				end

				local v93 = rayNew(p, n9)

				if workspaceFindPartOnRay(workspace, v93, LocalPlayer.Character, true) then
					u89 = false
				end
			end

			if u89 then
				p13.Parent = p4
				p13.Position = uDim2New(0, (n3 + lastScreenPosition.x - n5) / 2, 0, (n4 + lastScreenPosition.y - n8) / 2)
				p13.Size = uDim2New(0, n5, 0, n8)
				p13.Rotation = mathAtan2(n7, n6) * 57.295779513082 + 90
				p13.BackgroundColor3 = p14.Color
				p13.BackgroundTransparency = transparency + (1 - transparency) * (1 - n2 / n8)

				return
			end

			p13.Parent = nil

			return
		end

		p13.Parent = nil

		if n1.z > 0 then
			p14.LastScreenPosition = nil

			return
		end

		local n10 = n1 / n1.z

		p14.LastScreenPosition = Vector2.new((0.5 - n10.x / u30) * u27, (0.5 + n10.y / u29) * u28)
	end

	local t3: {[any]: any} = {}
	local t4: {[any]: any} = {}
	local t5: {[any]: any} = {}
	local t6: {[any]: any} = {}

	local function AddNewParticles()
		local v95: {[any]: any} = t3
		local v96: {[any]: any} = t4
		t4 = {}
		t3 = {}
		local n1: number = #t5
		local n2: number = #t6

		for i = 1, #v96 do
			local v100 = v96[i]

			if v100.TablePosition then
				if v100.Priority then
					local v101 = v100.TablePosition

					while n1 > v101 do
						t5[v101] = t5[v101 + 1]
						t5[v101].TablePosition = v101
						v101 += 1
					end

					t5[n1] = nil
					n1 -= 1
					v100.Frame:Destroy()
					v100.Frame = nil
				else
					local v102 = v100.TablePosition

					while n2 > v102 do
						t6[v102] = t6[v102 + 1]
						t6[v102].TablePosition = v102
						v102 += 1
					end

					t6[n2] = nil
					n2 -= 1
				end

				v100.TablePosition = nil
			end
		end

		for i = 1, #v95 do
			local v104 = v95[i]

			if v104.Priority then
				local _PriorityParticle: Frame = Instance.new("Frame")

				_PriorityParticle.BorderSizePixel = 0
				_PriorityParticle.Name = "_PriorityParticle"
				_PriorityParticle.Archivable = false
				v104.Frame = _PriorityParticle
				t5[#t5 + 1] = v104
			else
				tableInsert(t6, 1, v104)
				t6[400] = nil
			end
		end
	end
	function t2.ParticleRemove(p16)
		t4[#t4 + 1] = p16
	end

	local workspaceTerrain: Terrain = workspace.Terrain
	local v45 = workspace

	local function HandleParticleUpdate(p17, p18, p19, p20, p21, p22)
		if p20.LifeTime - p21 <= 0 then
			t4[#t4 + 1] = p20

			return
		end

		if p20.Function then
			p20.Function(p20, p22, p21)
		end

		local v113 = p20.Position

		p20.Position = p20.Position + p20.Velocity * p22

		local n1 = p20.WindResistance and (ParticleWind(p20.Position) * 10 - p20.Velocity) * p20.WindResistance or vector3New()

		p20.Velocity = p20.Velocity + (p20.Gravity + n1) * p22

		if p20.RemoveOnCollision then
			local n2 = p20.Position - v113
			local magnitude = n2.magnitude

			if magnitude > 999 then
				n2 *= 999 / magnitude
			end

			local v117 = rayNew(v113, n2)
			local v118, v119 = workspaceFindPartOnRay(v45, v117, LocalPlayer.Character, true)

			if v118 then
				if type(p20.RemoveOnCollision) ~= "function" or not p20.RemoveOnCollision(p20, v118, v119) then
					t4[#t4 + 1] = p20
				end
			end
		end

		ParticleRender(p17, p19, p20, p18)
	end
	function t2.ParticleUpdate()
		local CurrentCamera = v45.CurrentCamera

		AddNewParticles()
		u27 = p4.AbsoluteSize.x
		u28 = p4.AbsoluteSize.y
		u29 = mathTan(CurrentCamera.FieldOfView * 0.0087266462599716) * 2
		u30 = u29 * u27 / u28

		local v121 = v14()
		local n1 = v121 - u23

		u23 = v121

		local v123 = CurrentCamera.CoordinateFrame:inverse()

		for i = 1, 400 do
			local v125 = t6[i]
			local v126 = t1[i]

			if v125 then
				v125.TablePosition = i
				HandleParticleUpdate(CurrentCamera, v123, v126, v125, v121, n1)
			else
				v126.Parent = nil
			end
		end

		for i = 1, #t5 do
			local v128 = t5[i]
			local frame = v128.Frame

			v128.TablePosition = i
			HandleParticleUpdate(CurrentCamera, v123, frame, v128, v121, n1)
		end
	end
	local function particleNew(p23)
		p23.Position = p23.Position or vector3New()
		p23.Velocity = p23.Velocity or vector3New()
		p23.Size = p23.Size or vector2New(0.2, 0.2)
		p23.Bloom = p23.Bloom or vector2New()
		p23.TablePosition = 1
		p23.Gravity = p23.Gravity or vector3New()
		p23.Color = p23.Color or Color3.new(1, 1, 1)
		p23.Transparency = p23.Transparency or 0.5

		if p23.Global then
			p23.Global = nil

			local v131 = p23.Function
			local removeOnCollision = p23.RemoveOnCollision
			local u133 = if p23.RemoveOnCollision then true else nil

			p23.Function = nil
			p23.RemoveOnCollision = u133
			particleEventDistributor:FireServer(p23)
			p23.Function = v131
			p23.RemoveOnCollision = removeOnCollision
		end

		local v134 = p23.LifeTime

		if v134 then
			local lifeTime = p23.LifeTime
			local v136 = v14()

			v134 = lifeTime + v136
		end

		p23.LifeTime = v134
		t3[#t3 + 1] = p23
	end

	particleEventDistributor.OnClientEvent:connect(particleNew)
	t2.ParticleNew = particleNew

	local renderStepped = game:GetService("RunService").RenderStepped

	return t2
end

local u21 = nil

return {
	MakeParticleEngineServer = function()
		local particleEventDistributor = nevermoreEngine.GetRemoteEvent("ParticleEventDistributor")

		particleEventDistributor.OnServerEvent:connect(function(p2, p3)
			p3.Global = nil

			for _, v in pairs(game.Players:GetPlayers()) do
				if v ~= p2 then
					particleEventDistributor:FireClient(v, p3)
				end
			end
		end)

		return {
			ParticleNew = function(p1)
				p1.Position = p1.Position or error("No Position Yo")
				p1.Velocity = p1.Velocity or vector3New()
				p1.Size = p1.Size or vector2New(0.2, 0.2)
				p1.Bloom = p1.Bloom or vector2New(0, 0)
				p1.Gravity = p1.Gravity or vector3New()
				p1.LifeTime = p1.LifeTime
				p1.Color = p1.Color or Color3.new(1, 1, 1)
				p1.Transparency = p1.Transparency or 0.5
				particleEventDistributor:FireAllClients(p1)

				return p1
			end
		}
	end,
	GetParticleEngine = function(p24)
		assert(p24, "Need screen!")

		if not u21 then
			u21 = RealMakeEngine(p24)
		else
			u21.SetScreen(p24)
		end

		return u21
	end
}
