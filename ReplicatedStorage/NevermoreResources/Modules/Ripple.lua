



local module: {[any]: any} = {}

module.__index = module
module.ClassName = "Ripple"
module.MaxRadius = 150
module.TransparencyDecayVelocity = 0.8

function module.new(gui)
	local v3 = gui and (gui:IsA("ImageLabel") or gui:IsA("ImageButton"))

	assert(v3, "GUI must be an ImageLabel or ImageButton")

	local object = setmetatable({}, module)

	object.Gui = gui
	object.Container = object.Gui.Parent or error("No container")
	object.InitialPosition = object.Container.AbsoluteSize / 2
	object.TargetPosition = object.InitialPosition
	object.InitialTransparency = gui.ImageTransparency
	object.TargetRadius = object.Container.AbsoluteSize.magnitude
	object:Draw()

	return object
end
function module.NewDefault(p2)
	assert(p2, "Must send parent")

	local circle: ImageLabel = Instance.new("ImageLabel")

	circle.Image = "rbxassetid://511406127"
	circle.Name = "Circle"
	circle.ImageTransparency = 0.75
	circle.BackgroundTransparency = 1
	circle.BorderSizePixel = 0
	circle.Archivable = false
	circle.ZIndex = math.min(p2.ZIndex + 1, 10)
	circle.ImageColor3 = Color3.new(1, 1, 1)
	circle.Parent = p2 or error("Must send parent")

	return (module.new(circle))
end
function module.FromPosition(p3, p4)
	assert(p3, "Must send parent")
	assert(p4, "Must send Position")

	local v9 = module.NewDefault(p3)
	local v10 = v9:GetContainer()
	local n1 = p4 - v10.AbsolutePosition

	v9:SetInitialPosition(n1)
	v9:SetTargetPosition(n1)

	return v9
end
function module.SetInitialPosition(p5, p6)
	p5.InitialPosition = p6 or error("InitialPosition")
end
function module.SetTargetPosition(p7, p8)
	p7.TargetPosition = p8 or error("InitialPosition")
end
function module.TargetCenter(p9)
	p9:SetTargetPosition(p9.Container.AbsoluteSize / 2)
end
function module.GetContainer(p10)
	return p10.Container
end
function module.SetInkColor(p11, p12)
	p11.Gui.ImageColor3 = p12 or error("No InkColor. This is the deepest betrayal. How dare you.")
end
function module.SetTargetRadius(p13, targetRadius)
	local typeName: string = type(targetRadius)

	assert(typeName == "number", "Radius must be a number")
	assert(targetRadius > 5, "Radius failed sanity check")
	p13.TargetRadius = targetRadius
end
function module.GetMouseUpElapsed(p15)
	return p15.MouseUpStart and tick() - p15.MouseUpStart or 0
end
function module.GetMouseDownElapsed(p16)
	if not p16.MouseDownStart then
		return 0
	end

	local n1 = tick() - p16.MouseDownStart

	if p16.MouseUpStart then
		local v26 = p16:GetMouseUpElapsed()

		n1 -= v26
	end

	return n1
end
function module.GetMouseInteractionElapsed(p17)
	local v28 = p17:GetMouseDownElapsed()
	local v29 = p17:GetMouseUpElapsed()

	return v28 + v29
end
function module.GetOuterTransparency(p18)
	local v31 = p18:GetMouseUpElapsed()
	local v32 = p18:GetTransparency()

	return (math.min(1, 1 - v31 * 0.3, v32))
end
function module.GetTransparency(p19)
	if not p19.MouseUpStart then
		return p19.InitialTransparency
	end

	local initialTransparency = p19.InitialTransparency
	local v35 = p19:GetMouseUpElapsed()

	return (math.min(1, initialTransparency + v35 * p19.TransparencyDecayVelocity))
end
function module.GetRadius(p20)
	local n1 = math.min(p20.TargetRadius, p20.MaxRadius) * 1.1 + 3
	local n2 = 1.1 - 0.2 * (n1 / module.MaxRadius)
	local v39 = p20:GetMouseInteractionElapsed()

	return (math.abs(n1 * (1 - 80 ^ -(v39 / n2))))
end
function module.IsTransparencyDecayed(p21)
	local u41: boolean = false

	if p21:GetTransparency() >= 1 then
		local v42 = p21:GetRadius()
		local v43 = math.min(p21.MaxRadius, p21.TargetRadius)

		u41 = v42 >= v43
	end

	return u41
end
function module.GetTranslationFraction(p22)
	local v45 = p22:GetRadius()
	local v46 = p22:GetLargestContainerSize()

	return (math.min(1, v45 / v46 * 2 / 1.4142135623730951))
end
function module.IsAnimationComplete(p23)
	return p23.MouseUpStart and p23:IsTransparencyDecayed()
end
function module.Down(p24)
	p24.MouseDownStart = tick()
end
function module.GetLargestContainerSize(p25)
	local container = p25.Container

	return (math.max(container.AbsoluteSize.X, container.AbsoluteSize.Y))
end
function module.Draw(p26)
	local gui = p26.Gui
	local container = p26.Container

	gui.ImageTransparency = p26:GetTransparency()

	local v54 = p26:GetRadius()
	local floored = math.floor(v54)

	gui.Size = UDim2.new(0, floored * 2, 0, floored * 2)
	v54 = p26.TargetPosition - p26.InitialPosition

	local initialPosition = p26.InitialPosition
	local v57 = p26:GetTranslationFraction()
	local vector2 = Vector2.new(floored, floored)
	local n1 = initialPosition + v54 * v57 - vector2

	gui.Position = UDim2.new(0, n1.X, 0, n1.Y)
end
function module.Up(p27)
	if not p27.MouseUpStart then
		p27.MouseUpStart = tick()
	end
end
function module.Destroy(p28)
	setmetatable(p28, nil)
	p28.Gui:Destroy()
	p28.Gui = nil
end

return module
