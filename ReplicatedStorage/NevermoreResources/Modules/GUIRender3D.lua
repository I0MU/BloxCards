



local replicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")
local screenSpace = require(replicatedStorage:WaitForChild("NevermoreEngine")).LoadLibrary("ScreenSpace")
local module: {[any]: any} = {}

module.__index = module
module.ClassName = "GUIRender3D"

function module.new(_)
	local object = setmetatable({}, module)

	object.Depth = -10
	object.RenderParent = workspace.CurrentCamera

	return object
end
function module.SetDepth(p2, depth)
	if depth > 0 then
		local v8 = debug.traceback()

		warn("Depth > 0, will not render on screen @ " .. v8)
	end

	p2.Depth = depth
end
function module.GetDepth(p4)
	return p4.Depth
end
function module.GetFrame(p5)
	return p5.Frame
end
function module.WithRenderParent(p6, p7)
	p6.RenderParent = p7 or error()

	return p6
end
function module.SetFrame(p8, p9)
	p8.Frame = p9 or error()

	local part: Part = Instance.new("Part", p8.RenderParent)

	part.Archivable = false
	part.FormFactor = "Custom"
	part.CanCollide = false
	part.Anchored = true
	part.Name = p9.Name .. "_3DRender"
	part.Transparency = 1
	p8.Part = part

	local surfaceGui: SurfaceGui = Instance.new("SurfaceGui", part)

	surfaceGui.Adornee = part
	surfaceGui.Face = "Back"
	p8.SurfaceGui = surfaceGui

	local frame: Frame = Instance.new("Frame")

	frame.Parent = p9.Parent
	frame.Name = "FakeFrame_" .. p9.Name
	frame.BackgroundTransparency = 1
	frame.Size = p9.Size
	frame.Position = p9.Position
	frame.SizeConstraint = p9.SizeConstraint
	frame.Visible = true
	frame.Active = p9.Active
	p8.FakeFrame = frame
	p9.Parent = p8.SurfaceGui
	p9.Position = UDim2.new(0, 0, 0, 0)
	p9.Size = UDim2.new(1, 0, 1, 0)
	p9.SizeConstraint = "RelativeXY"
	p8:UpdatePartSize()
end
function module.GetFakeFrame(p10)
	return p10.FakeFrame
end
function module.UpdatePartSize(p11)
	local absoluteSize = p11.FakeFrame.AbsoluteSize
	local v21 = screenSpace.ScreenWidthToWorldWidth(absoluteSize.X, p11.Depth)
	local v22 = screenSpace.ScreenHeightToWorldHeight(absoluteSize.Y, p11.Depth)

	p11.Part.Size = Vector3.new(v21, v22, 0.2)
	p11.SurfaceGui.CanvasSize = absoluteSize
end
function module.Hide(p12)
	p12.Part.Parent = nil
end
function module.Show(p13)
	p13.Part.Parent = p13.RenderParent
end
function module.GetPrimaryCFrame(p14)
	local absoluteSize = p14.FakeFrame.AbsoluteSize
	local n1 = p14.FakeFrame.AbsolutePosition + absoluteSize / 2
	local v28 = screenSpace.ScreenToWorldByWidthDepth(n1.X, n1.Y, absoluteSize.X, p14.Depth)
	local CoordinateFrame: CFrame = workspace.CurrentCamera.CoordinateFrame
	local cFrame = CFrame.new(v28)
	local cFrame2 = CFrame.new(0, 0, -p14.Part.Size.Z / 2)

	return CoordinateFrame * cFrame * cFrame2
end
function module.Update(p15, p16)
	local v34 = p16 or CFrame.new()

	p15:UpdatePartSize()
	p15.Part.CFrame = p15:GetPrimaryCFrame() * v34
end
function module.Destroy(p17)
	p17.Part:Destroy()
	p17.FakeFrame:Destroy()
	p17.Frame:Destroy()
	p17.Part = nil
	p17.FakeFrame = nil
	p17.Frame = nil
	setmetatable(p17, nil)
end

return module
