



local replicatedStorage = game:GetService("ReplicatedStorage")

replicatedStorage = require(replicatedStorage:WaitForChild("NevermoreEngine")).LoadLibrary
replicatedStorage("Type")

local v2 = replicatedStorage("qSystems")
local callOnChildren = v2.CallOnChildren
local make = v2.Make
local modify = v2.Modify
local checkCharacter = v2.CheckCharacter
local t1: {[any]: any} = {
	worriedFace = "rbxassetid://83906109",
	scaredFace = "rbxassetid://22823614",
	mommyFace = "rbxassetid://24669458"
}

local function Kill(p1)
	p1.Humanoid.Health = 0
end
local function Heal(p2)
	p2.Humanoid.Health = p2.Humanoid.MaxHealth
end
local function MaxHealth(p3, p4)
	p3.Humanoid.MaxHealth = p4
	p3.Humanoid.Health = p3.Humanoid.MaxHealth
end
local function Explode(p5)
	local explosion: Explosion = Instance.new("Explosion", p5.Torso)

	explosion.Position = p5.Torso.Position
	p5.Humanoid.Health = 0
end
local function GetFace(p6)
	if p6.Head:FindFirstChild("face") and p6.Head.face:IsA("Decal") then
		return p6.Head.face
	end

	return nil
end
local function GetOrCreateFace(p7)
	local v36 = if p7.Head:FindFirstChild("face") and p7.Head.face:IsA("Decal") then p7.Head.face else nil

	if not v36 then
		v36 = make("decal", { Name = "face", Texture = "rbxassetid://20418518", Parent = p7.Head })
	end

	return v36
end
local function SetFace(p8, texture)
	local v39 = if p8.Head:FindFirstChild("face") and p8.Head.face:IsA("Decal") then p8.Head.face else nil

	if not v39 then
		v39 = make("decal", { Name = "face", Texture = "rbxassetid://20418518", Parent = p8.Head })
	end

	v39.Texture = texture
end
local function PlayFaceAnimation(p10, p11, p12)
	local v43 = if p10.Head:FindFirstChild("face") and p10.Head.face:IsA("Decal") then p10.Head.face else nil

	if not v43 then
		v43 = make("decal", { Name = "face", Texture = "rbxassetid://20418518", Parent = p10.Head })
	end

	for k, v in pairs(p11) do
		delay(k / (#p11 + 1) * p12, function()
			if v43 then
				v43.Texture = v
			end
		end)
	end
end

PlayFaceAnimation = function(p13)
	p13.Humanoid.Jump = true
	p13.Humanoid.Jump = false
end

local function RemoveVelocity(p14)
	callOnChildren(p14, function(p15)
		if p15:IsA("BasePart") then
			p15.Velocity = Vector3.new(0, 0, 0)
			p15.RotVelocity = Vector3.new(0, 0, 0)
		end
	end)
end
local function Unstick(p16)
	if p16.Humanoid.Sit then
		p16.Humanoid.Sit = false
	end
end
local function Dehat(p17)
	callOnChildren(p17, function(p18)
		if p18:IsA("Hat") then
			p18:Destroy()
		end
	end)
end
local function Damage(p19, p20)
	p19.Humanoid.Health = math.max(0, p19.Humanoid.Health - p20)
end
local function v20(p21, texture)
	local v54 = if p21.Head:FindFirstChild("face") and p21.Head.face:IsA("Decal") then p21.Head.face else nil

	if not v54 then
		v54 = make("decal", { Name = "face", Texture = "rbxassetid://20418518", Parent = p21.Head })
	end

	v54.Texture = texture
end
local function GetFaceTexture(p23)
	local v56 = if p23.Head:FindFirstChild("face") and p23.Head.face:IsA("Decal") then p23.Head.face else nil

	if not v56 then
		v56 = make("decal", { Name = "face", Texture = "rbxassetid://20418518", Parent = p23.Head })
	end

	return v56.Texture
end
local function GiveForceField(p24)
	Instance.new("ForceField", p24)
end
local function RemoveForceField(p25)
	for _, v in pairs(p25:GetChildren()) do
		if v:IsA("ForceField") then
			v:Destroy()
		end
	end
end
local function Cape(player, p27)
	local function Flex(p28, p29)
		local u83: boolean = true
		local children = p28:GetChildren()

		for k, _ in pairs(p29) do
			if k ~= 1 and children[k] and children[k]:FindFirstChild("Weld") and children[k].Weld:IsA("Weld") then
				local weld = children[k].Weld
				local cFrameAngles = CFrame.Angles
				local v89 = math.rad(p29[k - 1])
				local cFrame = cFrameAngles(v89, 0, 0)

				weld.C1 = CFrame.new(0, 0, -0.45) * cFrame
			elseif k ~= 1 then
				print("CapeChildren[" .. k .. "] did not qualify in cape...")
				u83 = false
			end
		end

		return u83
	end

	local v64 = (function()
		local Character = player.Character

		p27 = p27 or Character.Torso.BrickColor

		local quentyCapeModel: Model = Instance.new("Model", Character)

		quentyCapeModel.Name = "QuentyCapeModel"

		local v93 = make("Part", {
			FormFactor = "Custom",
			Name = "NeckPiece",
			CanCollide = false,
			TopSurface = "Smooth",
			BottomSurface = "Smooth",
			Parent = quentyCapeModel,
			BrickColor = p27
		})

		v93.Size = Vector3.new(2, 0.2, 1)
		make("Weld", {
			Parent = v93,
			Part0 = Character.Head,
			Part1 = v93,
			C0 = CFrame.new(0, -0.45, 0)
		})

		local clone = v93:Clone()
		local parent = modify(clone, {
			Size = Vector3.new(3, 0.2, 1),
			Name = "Segment1",
			Parent = quentyCapeModel
		})
		local v96 = CFrame.Angles(-1.3962634015954636, 0, 0)

		make("Weld", {
			Parent = parent,
			Part0 = v93,
			Part1 = parent,
			C0 = CFrame.new(0, 0, 0.45),
			C1 = CFrame.new(0, 0, -0.45) * v96
		})

		local clone2 = parent:Clone()

		v93 = modify(clone2, { Name = "Segment2", Parent = quentyCapeModel })
		v96 = CFrame.Angles(-0.08726646259971647, 0, 0)
		make("Weld", {
			Parent = v93,
			Part0 = parent,
			Part1 = v93,
			C0 = CFrame.new(0, 0, 0.45),
			C1 = CFrame.new(0, 0, -0.45) * v96
		})

		local clone3 = parent:Clone()
		local v99 = modify(clone3, { Name = "Segment3", Parent = quentyCapeModel })

		v96 = CFrame.Angles(-0.03490658503988659, 0, 0)
		make("Weld", {
			Parent = v99,
			Part0 = v93,
			Part1 = v99,
			C0 = CFrame.new(0, 0, 0.45),
			C1 = CFrame.new(0, 0, -0.45) * v96
		})

		local clone4 = parent:Clone()
		local v101 = modify(clone4, { Name = "Segment4", Parent = quentyCapeModel })

		make("Weld", {
			Parent = v101,
			Part0 = v99,
			Part1 = v101,
			C0 = CFrame.new(0, 0, 0.45),
			C1 = CFrame.new(0, 0, -0.45)
		})

		return quentyCapeModel
	end)()

	v64.Parent = player.Character

	local n1 = -60
	local u66 = nil
	local playerName = player.Name

	local function StartUpdate()
		local n9: number = 0
		local u103 = true

		while u103 do
			if not checkCharacter(player) or not player.Character or not player.Character.Parent or not v64 or not v64.Parent then
				print("[RawCharacter] - Cape update break for '" .. playerName .. "'")
			end

			local n2 = 5 * player.Character.Torso.Velocity.magnitude / 16
			local randomNumber = math.random()

			u66 = n2 + 1 * (randomNumber + 0.5)

			if u66 > 10 then
				u66 = math.random(90, 100) / 10
			end

			local n3 = -60 + player.Character.Torso.Velocity.magnitude
			local sine = math.sin(n9)
			local n4 = n3 + sine * 3 * u66

			if n4 > 65 then
				n4 = 65
			elseif player.Character.Torso.Velocity.magnitude < 5 then
				n4 = -80
			end

			local n5 = (n4 + n1) / 2

			n1 = n5

			local n6 = math.sin(n9 + 20) * -1 * u66
			local n7 = math.sin(n9 + 20) * 2 * u66
			local n8 = math.sin(n9 + 20) * u66
			local sine2 = math.sin(n9 + 20)

			u103 = Flex(v64, { n5, n6, n7, n8, sine2 * -1 * u66 })
			wait(0.05)
			n9 += 1
		end
	end

	spawn(function()
		StartUpdate()
	end)
end
local function Decape(player)
	for _, v in pairs(player.Character:GetChildren()) do
		if v.Name == "QuentyCapeModel" and v:IsA("Model") then
			v:Destroy()
		end
	end
end
local function TagHumanoid(parent, value)
	for _, v in pairs(parent:GetChildren()) do
		if v.Name == "creator" then
			v:Destroy()
		end
	end

	return make("ObjectValue", { Name = "creator", Value = value, Parent = parent })
end
local function GetKiller(p33)
	local humanoid = p33:FindFirstChild("Humanoid")
	local creator = humanoid and humanoid:FindFirstChild("creator")

	if creator and creator:IsA("ObjectValue") and creator.Value and creator.Value:IsA("Player") and creator.Value.Parent then
		return creator.Value
	end
end

return {
	faceIndex = t1,
	faceAnimation = {
		mommy = { t1.worriedFace, t1.scaredFace, t1.mommyFace }
	},
	kill = Kill,
	Kill = Kill,
	Heal = Heal,
	heal = Heal,
	MaxHealth = MaxHealth,
	maxHealth = MaxHealth,
	explode = Explode,
	Explode = Explode,
	GetFace = GetFace,
	getFace = GetFace,
	get_face = GetFace,
	getOrCreateFace = GetOrCreateFace,
	GetOrCreateFace = GetOrCreateFace,
	get_or_create_face = GetOrCreateFace,
	setFace = SetFace,
	SetFace = SetFace,
	set_face = SetFace,
	jump = PlayFaceAnimation,
	Jump = PlayFaceAnimation,
	RemoveVelocity = RemoveVelocity,
	removeVelocity = RemoveVelocity,
	remove_velocity = RemoveVelocity,
	Unstick = Unstick,
	unstick = Unstick,
	Dehat = Dehat,
	dehat = Dehat,
	damage = Damage,
	Damage = Damage,
	setFace = v20,
	SetFace = v20,
	set_face = v20,
	getFaceTexture = GetFaceTexture,
	GetFaceTexture = GetFaceTexture,
	get_face_texture = GetFaceTexture,
	GiveForceField = GiveForceField,
	giveForceField = GiveForceField,
	give_force_field = GiveForceField,
	RemoveForceField = RemoveForceField,
	removeForceField = RemoveForceField,
	remove_force_field = RemoveForceField,
	cape = Cape,
	Cape = Cape,
	Decape = Decape,
	decape = Decape,
	TagHumanoid = TagHumanoid,
	tagHumanoid = TagHumanoid,
	GetKiller = GetKiller,
	getKiller = GetKiller
}
