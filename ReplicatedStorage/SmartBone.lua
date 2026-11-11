



local collectionService: CollectionService = game:GetService("CollectionService")
local httpService: HttpService = game:GetService("HttpService")
local players: Players = game:GetService("Players")
local runService: RunService = game:GetService("RunService")
local components: Instance = script:WaitForChild("Components")
local dependencies: Instance = script:WaitForChild("Dependencies")
local ceiveImOverlay = require(dependencies:WaitForChild("CeiveImOverlay"))
local config = require(dependencies:WaitForChild("Config"))
local frustum = require(dependencies:WaitForChild("Frustum"))
local utilities = require(dependencies:WaitForChild("Utilities"))
local u11 = nil
local bone = require(components:WaitForChild("Bone"))
local boneTree = require(components:WaitForChild("BoneTree"))
local collision: Instance = components:WaitForChild("Collision")
local colliderObject = require(collision:WaitForChild("ColliderObject"))
local runtime: Instance = dependencies:WaitForChild("Runtime")

local function CopyPasteAttributes(p1, p2)
	for iterFirst, iterSecond in p1:GetAttributes() do
		p2:SetAttribute(iterFirst, iterSecond)
	end
end

local utilitiesSb_indent_log = utilities.SB_INDENT_LOG
local utilitiesSb_unindent_log = utilities.SB_UNINDENT_LOG
local utilitiesSb_verbose_log = utilities.SB_VERBOSE_LOG
local utilitiesSb_verbose_warn = utilities.SB_VERBOSE_WARN
local module: {[any]: any} = {}

module.__index = module

function module.new()
	local guid: string = httpService:GenerateGUID(false)

	return (setmetatable({
		ShouldDestroy = false,
		ID = guid,
		BoneTrees = {},
		ColliderObjects = {}
	}, module))
end
function module.m_AppendBone(_, p4, p5, parentIndex, heirarchyLength)
	local v33 = utilities.GatherBoneSettings(p5)
	local v34 = bone.new(p5, p4.Root, p4.RootPart)

	for iterFirst, iterSecond in v33 do
		v34[iterFirst] = iterSecond ~= "¬" and iterSecond or nil
	end

	v33 = p4.Bones[parentIndex]

	if parentIndex > 0 then
		local magnitude = (v33.Position - v34.Position).Magnitude

		v34.FreeLength = magnitude
		v34.Weight = magnitude * 0.7
		v34.HeirarchyLength = heirarchyLength
		v33.HasChild = true
	end

	if heirarchyLength <= p4.Settings.AnchorDepth then
		utilitiesSb_verbose_log("Anchoring bone")
		v34.Anchored = true
	end

	v34.ParentIndex = parentIndex
	table.insert(p4.Bones, v34)
end
function module.m_CreateBoneTree(p8, p9, p10)
	local settings = utilities.GatherObjectSettings(p9)
	local v42 = boneTree.new(p10, p9)

	v42.Settings = settings

	local v43 = ("Creating bone tree %*; %*"):format(p9.Name, p10.Name)

	utilitiesSb_verbose_log(v43)
	utilitiesSb_indent_log()

	local function AddChildren(parent, p12, p13)
		local v151 = ("Adding bone: %*; %*; %*"):format(parent.Name, p12, p13)

		utilitiesSb_verbose_log(v151)
		utilitiesSb_indent_log()

		local children = parent:GetChildren()

		for iterFirst, iterSecond in children do
			if iterSecond:IsA("Bone") then
				p8:m_AppendBone(v42, iterSecond, p12, p13)
				AddChildren(iterSecond, #v42.Bones, p13 + 1)
			end
		end

		if #children == 0 then
			utilitiesSb_verbose_log("Adding tail bone")

			local parentParent = parent.Parent
			local v156 = parentParent:IsA("Bone")
			local worldCFrame = parent.WorldCFrame + parent.WorldCFrame.UpVector.Unit * (parent.WorldPosition - (v156 and parentParent.WorldPosition or parentParent.Position)).Magnitude
			local bone2: Bone = Instance.new("Bone")

			bone2.Parent = parent
			bone2.Name = parent.Name .. "_Tail"
			bone2.WorldCFrame = worldCFrame

			for iterFirst2, iterSecond2 in parent:GetAttributes() do
				bone2:SetAttribute(iterFirst2, iterSecond2)
			end

			p8:m_AppendBone(v42, bone2, #v42.Bones, p13)
		end

		utilitiesSb_unindent_log()
	end

	p8:m_AppendBone(v42, p10, 0, 0)
	AddChildren(p10, 1, 1)
	table.insert(p8.BoneTrees, v42)
	utilitiesSb_unindent_log()
end
function module.m_UpdateViewFrustum(p14)
	debug.profilebegin("SmartBone2::m_UpdateViewFrustum")

	local v46, v47, v48, v49, v50, v51, v52, v53, v54 = frustum.GetCFrames(workspace.CurrentCamera, config.FAR_PLANE)

	for iterFirst, iterSecond in p14.BoneTrees, nil, nil do
		debug.profilebegin("BoneTree::m_UpdateViewFrustum")
		iterSecond.InView = frustum.ObjectInFrustum({
			CFrame = iterSecond.BoundingBoxCFrame,
			Size = iterSecond.BoundingBoxSize
		}, v46, v47, v48, v49, v50, v51, v52, v53, v54)
		debug.profileend()
	end

	debug.profileend()
end
function module.m_CleanColliders(p15)
	debug.profilebegin("Clean Colliders")

	if #p15.ColliderObjects ~= 0 then
		for iterFirst, iterSecond in p15.ColliderObjects, nil, nil do
			if #iterSecond.Colliders == 0 or iterSecond.Destroyed == true then
				utilitiesSb_verbose_warn("Deleting Collider Object")
				utilitiesSb_indent_log()
				iterSecond:Destroy()
				utilitiesSb_unindent_log()
				table.remove(p15.ColliderObjects, iterFirst)
			end
		end
	end

	debug.profileend()
end
function module.m_ConstrainBoneTree(p16, p17, p18)
	debug.profilebegin("SmartBone2::m_ConstrainBoneTree")
	p17:Constrain(p16.ColliderObjects, p18)
	debug.profileend()
end
function module.m_UpdateBoneTree(p19, p20, p21, p22)
	debug.profilebegin("SmartBone2::m_UpdateBoneTree")

	if p20.Destroyed then
		p20:Destroy()
		table.remove(p19.BoneTrees, p21)

		return
	end

	p20:PreUpdate(p22)

	if p20.InView and math.floor(p20.UpdateRate) ~= 0 then
		debug.profilebegin("Step Colliders")

		for iterFirst, iterSecond in p19.ColliderObjects, nil, nil do
			iterSecond:Step()
		end

		debug.profileend()

		local n1 = 1 / p20.UpdateRate
		local u70: boolean = false

		p20.AccumulatedDelta = p20.AccumulatedDelta + p22

		while n1 < p20.AccumulatedDelta do
			p20.AccumulatedDelta = p20.AccumulatedDelta - n1
			u70 = true
			p20:StepPhysics(n1)
			p19:m_ConstrainBoneTree(p20, p22)
			p20:SolveTransform(n1)
		end

		debug.profileend()

		if u70 then
			task.synchronize()
			p20:ApplyTransform()
		end

		return
	end

	local firstSkipUpdate = p20.FirstSkipUpdate

	p20:SkipUpdate()

	if not firstSkipUpdate then
		debug.profileend()
		task.synchronize()
		p20:ApplyTransform()

		local inView = p20.InView
		local floored = math.floor(p20.UpdateRate)
		local v74 = ("Skipping BoneTree, InView: %*, Update Rate == 0: %*"):format(inView, floored == 0)

		utilitiesSb_verbose_log(v74)
	end
end
function module.m_CheckDestroy(p23)
	p23.ShouldDestroy = false

	if #p23.BoneTrees == 0 then
		p23.ShouldDestroy = true

		return true
	end

	return false
end
function module.LoadObject(p24, p25)
	local roots = p25:GetAttribute("Roots")

	if not roots then
		local v79 = ("[SmartBone2::LoadObject] Cannot load an object with no roots defined %*"):format(p25.Name)

		warn(v79)

		return
	end

	local v80 = roots:split(",")
	local t2: {[any]: any} = {}

	for iterFirst, iterSecond in p25:GetDescendants() do
		if iterSecond:IsA("Bone") then
			if t2[iterSecond.Name] then
				local v84 = ("[SmartBone2::LoadObject] Duplicate bones of name: %* in RootPart: %*"):format(iterSecond.Name, p25.Name)

				warn(v84)
			else
				t2[iterSecond.Name] = iterSecond
			end
		end
	end

	for iterFirst2, iterSecond2 in v80 do
		local v87 = t2[iterSecond2]

		if not v87 then
			local v88 = ("[SmartBone2::LoadObject] Couldn't find Root Bone of name: %* in RootPart: %*"):format(iterSecond2, p25.Name)

			warn(v88)
		else
			p24:m_CreateBoneTree(p25, v87)
		end
	end
end
function module.LoadColliderModule(p26, p27, p28)
	assert(p27, "[SmartBone2::LoadColliderModule] No collider module passed in")

	local v92 = require(p27)
	local decodedJson: any = httpService:JSONDecode(v92)
	local v94 = colliderObject.new(decodedJson, p28)

	table.insert(p26.ColliderObjects, v94)
end
function module.LoadRawCollider(p29, p30, p31)
	local v98 = colliderObject.new(p30, p31)

	table.insert(p29.ColliderObjects, v98)
end
function module.SkipUpdate(p32)
	debug.profilebegin("SmartBone2::SkipUpdate")

	for iterFirst, iterSecond in p32.BoneTrees, nil, nil do
		iterSecond:SkipUpdate()
	end

	debug.profileend()
end
function module.StepBoneTrees(p33, p34)
	if p33:m_CheckDestroy() then
		return
	end

	if p34 <= 0 then
		utilitiesSb_verbose_warn("DeltaTime is zero or sub zero, not updating.")

		return
	end

	p33:m_CleanColliders()
	p33:m_UpdateViewFrustum()

	for iterFirst, iterSecond in p33.BoneTrees, nil, nil do
		p33:m_UpdateBoneTree(iterSecond, iterFirst, p34)
	end
end
function module.DrawDebug(p35, p36, p37, p38, p39, p40, p41, p42, p43, p44, p45, p46, p47, p48)
	for iterFirst, iterSecond in p35.BoneTrees, nil, nil do
		iterSecond:DrawDebug(p37, p38, p39, p40, p41, p46, p47, p48)
	end

	if p36 then
		for iterFirst2, iterSecond2 in p35.ColliderObjects, nil, nil do
			iterSecond2:DrawDebug(p42, p43, p44, p45)
		end
	end
end
function module.DrawOverlay(p49, p50)
	if not config.DEBUG_OVERLAY_ENABLED then
		return
	end

	local begin = p50.Begin
	local v127 = ("SmartBone Instance ID: %*"):format(p49.ID)

	begin(v127, Color3.new(1, 0.431373, 0.713725), (Color3.new(1, 1, 1)))

	local text = p50.Text

	v127 = ("Frame Counter: %*"):format(shared.FrameCounter)
	text(v127)

	if config.DEBUG_OVERLAY_TREE then
		for iterFirst, iterSecond in p49.BoneTrees, nil, nil do
			if config.DEBUG_OVERLAY_MAX_TREES > 0 and iterFirst >= config.DEBUG_OVERLAY_TREE_OFFSET + config.DEBUG_OVERLAY_MAX_TREES then
				break
			end

			if not (iterFirst < config.DEBUG_OVERLAY_TREE_OFFSET) then
				local v131 = p50.Begin
				local v132 = ("Bone Tree %*"):format(iterFirst)

				v131(v132, Color3.new(0.486275, 0.431373, 1), (Color3.new(1, 1, 1)))
				iterSecond:DrawOverlay(p50)
				p50.End()
			end
		end
	end

	p50.End()
end
function module.Destroy(p51)
	utilitiesSb_verbose_log("Deleting SmartBone Object")

	for iterFirst, iterSecond in p51.BoneTrees, nil, nil do
		iterSecond:Destroy()
	end

	for iterFirst2, iterSecond2 in p51.ColliderObjects, nil, nil do
		iterSecond2:Destroy()
	end

	setmetatable(p51, nil)
end
function module.Start()
	if not runService:IsClient() then
		warn("Smartbone.Start() can only be called in client context.")

		return
	end

	if module.Running then
		warn("Cannot call Smartbone.Start() multiple times")

		return
	end

	if config.STARTUP_PRINT_ENABLED or config.LOG_VERBOSE then
		local v138 = ("SmartBone2 v%* Starting"):format(config.VERSION)

		print(v138)
	end

	module.Running = true

	local playerScripts: Instance = players.LocalPlayer:WaitForChild("PlayerScripts")
	local folder: Folder = Instance.new("Folder")

	folder.Name = "SmartBone-Actors"
	folder.Parent = playerScripts

	local overlayEvent: BindableEvent = Instance.new("BindableEvent")

	overlayEvent.Name = "OverlayEvent"
	overlayEvent.Parent = script
	overlayEvent.Event:Connect(function(arguments, ...)
		if not config.DEBUG_OVERLAY_ENABLED then
		elseif arguments == "Text" then
			u11:Text(...)
		elseif arguments == "Begin" then
			u11:Begin(...)
		elseif arguments == "End" then
			u11:End()
		end
	end)

	local function GatherColliders()
		local t3: {[any]: any} = {
			Key = {},
			Raw = {}
		}

		for iterFirst, iterSecond in collectionService:GetTagged("SmartCollider") do
			if iterSecond:IsA("BasePart") then
				local colliderKey = iterSecond:GetAttribute("ColliderKey")

				if colliderKey then
					colliderKey = tostring(colliderKey)

					if not t3.Key[colliderKey] then
						t3.Key[colliderKey] = {}
					end

					table.insert(t3.Key[colliderKey], iterSecond)
				end

				local v166 = ("Adding collider: %*, Collider Key: %*"):format(iterSecond.Name, colliderKey)

				utilitiesSb_verbose_log(v166)
				table.insert(t3.Raw, iterSecond)

				if config.YIELD_ON_COLLIDER_GATHER then
					task.wait()
				end
			end
		end

		return t3
	end
	local function SetupObject(p53)
		if not p53:IsA("BasePart") then
			return
		end

		local v168 = ("Setup Object: %*"):format(p53.Name)

		utilitiesSb_verbose_log(v168)
		utilitiesSb_indent_log()

		local v169 = GatherColliders()
		local colliderKey = p53:GetAttribute("ColliderKey")
		local t4

		if colliderKey then
			local v173 = v169.Key
			local text: string = tostring(colliderKey)

			t4 = v173[text] or {}
		else
			t4 = v169.Raw or {}
		end

		v168 = {}

		for key, value in t4 do
			local v177 = utilities.GetCollider(value)

			table.insert(v168, { v177, value })
		end

		local actor: Actor = Instance.new("Actor")
		local clone: Instance = runtime:Clone()

		clone.Parent = actor
		clone.Enabled = true
		actor.Parent = folder
		task.wait()
		actor:SendMessage("Setup", p53, v168, script)
		utilitiesSb_verbose_log("Runtime Started")
		utilitiesSb_unindent_log()
	end

	collectionService:GetInstanceAddedSignal("SmartBone"):Connect(SetupObject)

	for iterFirst, iterSecond in collectionService:GetTagged("SmartBone") do
		SetupObject(iterSecond)
	end

	if config.DEBUG_OVERLAY_ENABLED then
		u11 = ceiveImOverlay.new()

		local PlayerGui = players.LocalPlayer.PlayerGui
		local smartBoneDebugOverlay: ScreenGui = Instance.new("ScreenGui")

		smartBoneDebugOverlay.Name = "SmartBoneDebugOverlay"
		smartBoneDebugOverlay.IgnoreGuiInset = true
		smartBoneDebugOverlay.ResetOnSpawn = false
		smartBoneDebugOverlay.Parent = PlayerGui
		u11.BackFrame.Parent = smartBoneDebugOverlay
		runService.RenderStepped:Connect(function()
			u11:Render()
		end)
	end

	return {
		Stop = function()
			if not config.RESET_BONE_ON_DESTROY then
				folder:Destroy()

				return
			end

			for iterFirst, iterSecond in folder:GetChildren() do
				iterSecond:SendMessage("Destroy")
			end
		end
	}
end

return module
