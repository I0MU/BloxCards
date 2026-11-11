



local replicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")
local runService: RunService = game:GetService("RunService")
local loadLibrary = require(replicatedStorage:WaitForChild("NevermoreEngine")).LoadLibrary
local v4 = loadLibrary("CameraState")
local v5 = loadLibrary("SummedCamera")
local module: {[any]: any} = { ClassName = "DefaultCamera" }

function module.new()
	local object = setmetatable({}, module)

	object.CameraState = v4.new(workspace.CurrentCamera)

	return object
end
function module.BindToRenderStep(p1)
	runService:BindToRenderStep("DefaultCamera_Preupdate", Enum.RenderPriority.Camera.Value - 1, function()
		p1.CameraState:Set()
	end)
	runService:BindToRenderStep("DefaultCamera_PostUpdate", Enum.RenderPriority.Camera.Value + 1, function()
		p1.CameraState = v4.new(workspace.CurrentCamera)
	end)
end
function module.UnbindFromRenderStep(_)
	runService:UnbindFromRenderStep("DefaultCamera_Preupdate")
	runService:UnbindFromRenderStep("DefaultCamera_PostUpdate")
end
function module.__add(p3, p4)
	return v5.new(p3, p4)
end
function module.__index(p5, p6)
	if p6 == "State" or p6 == "CameraState" or p6 == "Camera" then
		return (rawget(p5, "CameraState"))
	end

	return module[p6]
end

return module
