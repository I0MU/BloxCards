



local module: {[any]: any} = {}

module.__index = module

local debugProfilebegin = debug.profilebegin
local debugProfileend = debug.profileend
local cFrameNew = CFrame.new
local cFrameAngles = CFrame.Angles
local mathRad = math.rad
local vector3 = Vector3.new()
local cameraShakeInstance = require(script.CameraShakeInstance)
local cameraShakeInstanceCameraShakeState = cameraShakeInstance.CameraShakeState

module.CameraShakeInstance = cameraShakeInstance
module.Presets = require(script.CameraShakePresets)

function module.new(p1, p2)
	local typeName: string = type(p1)

	assert(typeName == "number", "RenderPriority must be a number (e.g.: Enum.RenderPriority.Camera.Value)")

	local typeName2: string = type(p2)

	assert(typeName2 == "function", "Callback must be a function")

	return (setmetatable({
		_running = false,
		_renderName = "CameraShaker",
		_renderPriority = p1,
		_posAddShake = vector3,
		_rotAddShake = vector3,
		_camShakeInstances = {},
		_removeInstances = {},
		_callback = p2
	}, module))
end
function module.Start(p3)
	if p3._running then
		return
	end

	p3._running = true

	local _callback = p3._callback

	game:GetService("RunService"):BindToRenderStep(p3._renderName, p3._renderPriority, function(p4)
		debugProfilebegin("CameraShakerUpdate")

		local v58 = p3:Update(p4)

		debugProfileend()
		_callback(v58)
	end)
end
function module.Stop(p5)
	if not p5._running then
		return
	end

	game:GetService("RunService"):UnbindFromRenderStep(p5._renderName)
	p5._running = false
end
function module.StopSustained(p6, p7)
	for _, v in pairs(p6._camShakeInstances) do
		if v.fadeOutDuration == 0 then
			v:StartFadeOut(p7 or v.fadeInDuration)
		end
	end
end
function module.Update(p8, p9)
	local v23 = vector3
	local v24 = vector3
	local _camShakeInstances = p8._camShakeInstances

	for i = 1, #_camShakeInstances do
		local v27 = _camShakeInstances[i]
		local v28 = v27:GetState()

		if v28 == cameraShakeInstanceCameraShakeState.Inactive and v27.DeleteOnInactive then
			p8._removeInstances[#p8._removeInstances + 1] = i
		elseif v28 ~= cameraShakeInstanceCameraShakeState.Inactive then
			local v29 = v27:UpdateShake(p9)

			v23 += v29 * v27.PositionInfluence
			v24 += v29 * v27.RotationInfluence
		end
	end

	for i = #p8._removeInstances, 1, -1 do
		table.remove(_camShakeInstances, p8._removeInstances[i])
		p8._removeInstances[i] = nil
	end

	local v31 = cFrameNew(v23)
	local v32 = mathRad(v24.Y)
	local v33 = cFrameAngles(0, v32, 0)
	local v34 = mathRad(v24.X)

	v32 = mathRad(v24.Z)

	local v35 = cFrameAngles(v34, 0, v32)

	return v31 * v33 * v35
end
function module.Shake(p10, p11)
	local u38 = false

	if type(p11) == "table" then
		u38 = p11._camShakeInstance
	end

	assert(u38, "ShakeInstance must be of type CameraShakeInstance")
	p10._camShakeInstances[#p10._camShakeInstances + 1] = p11

	return p11
end
function module.ShakeSustain(p12, p13)
	local u41 = false

	if type(p13) == "table" then
		u41 = p13._camShakeInstance
	end

	assert(u41, "ShakeInstance must be of type CameraShakeInstance")
	p12._camShakeInstances[#p12._camShakeInstances + 1] = p13
	p13:StartFadeIn(p13.fadeInDuration)

	return p13
end
function module.ShakeOnce(p14, p15, p16, p17, p18, p19, p20)
	local v49 = cameraShakeInstance.new(p15, p16, p17, p18)

	v49.PositionInfluence = typeof(p19) == "Vector3" and p19 or Vector3.new(0.15, 0.15, 0.15)
	v49.RotationInfluence = typeof(p20) == "Vector3" and p20 or Vector3.new(1, 1, 1)
	p14._camShakeInstances[#p14._camShakeInstances + 1] = v49

	return v49
end
function module.StartShake(p21, p22, p23, p24, p25, p26)
	local v56 = cameraShakeInstance.new(p22, p23, p24)

	v56.PositionInfluence = typeof(p25) == "Vector3" and p25 or Vector3.new(0.15, 0.15, 0.15)
	v56.RotationInfluence = typeof(p26) == "Vector3" and p26 or Vector3.new(1, 1, 1)
	v56:StartFadeIn(p24)
	p21._camShakeInstances[#p21._camShakeInstances + 1] = v56

	return v56
end

return module
