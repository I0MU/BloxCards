



local replicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")
local screenSpace = require(replicatedStorage:WaitForChild("NevermoreEngine")).LoadLibrary("ScreenSpace")
local module: {[any]: any} = {}

module.__index = module

function module.new()
	local object = setmetatable({}, module)

	object.RelativeRotation = CFrame.new()
	object.Scale = 1

	return object
end
function module.SetGui(p1, gui)
	p1.Gui = gui
end
function module.SetModel(p3, model)
	p3.Model = model

	if model then
		assert(model.PrimaryPart, "Model needs primary part")
		p3.PrimaryPart = model.PrimaryPart

		return
	end

	p3.PrimaryPart = nil
end
function module.GetModel(p5)
	return p5.Model
end
function module.SetRelativeRotation(p6, p7)
	p6.RelativeRotation = p7 or error("No CFrame rotation")
end
function module.GetModelWidth(p8)
	local n1 = p8.Model:GetExtentsSize() * p8.Scale

	return (math.max(n1.X, n1.Y, n1.Z))
end
function module.UseScale(p9, scale)
	p9.Scale = scale
end
function module.GetPrimaryCFrame(p11)
	if p11.Gui and p11.Model then
		local gui = p11.Gui
		local n1 = p11.PrimaryPart.Size * p11.Scale
		local guiAbsoluteSize = gui.AbsoluteSize
		local n2 = gui.AbsolutePosition + guiAbsoluteSize / 2
		local getDepthForWidth = screenSpace.GetDepthForWidth
		local guiAbsoluteSizeX = guiAbsoluteSize.X
		local v23 = math.max(n1.X, n1.Y, n1.Z)
		local v24 = getDepthForWidth(guiAbsoluteSizeX, v23)

		v24 = screenSpace.ScreenToWorld(n2.X, n2.Y, v24)

		local CoordinateFrame: CFrame = workspace.CurrentCamera.CoordinateFrame
		local cFrame = CFrame.new(v24)

		return CoordinateFrame * cFrame * p11.RelativeRotation
	end

	warn("ModelRender3D cannot update model render, GUI or model aren't there.")
end

return module
