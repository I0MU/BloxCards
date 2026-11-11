



local userInputService: UserInputService = game:GetService("UserInputService")
local replicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")
local runService: RunService = game:GetService("RunService")
local loadLibrary = require(replicatedStorage:WaitForChild("NevermoreEngine")).LoadLibrary
local v5 = loadLibrary("Ripple")
local v6 = loadLibrary("qSystems")
local makeMaid = loadLibrary("Maid").MakeMaid
local getIndexByValue = v6.GetIndexByValue
local module: {[any]: any} = {}

module.__index = module
module.ClassName = "PaperRipple"
module.InkColor = Color3.new(1, 1, 1)
module.Recenter = false
module.Enabled = true

function module.new(container)
	assert(container, "Needs Container")
	assert(container.ClipsDescendants, "Container must clip descendants")

	local object = setmetatable({}, module)

	object.InputMaid = makeMaid()
	object.Container = container
	object.Ripples = {}
	object.Animating = false
	object:BindInput()

	return object
end
function module.FromParent(parent)
	assert(parent, "Must send parent")

	local typeName: string = type(parent)
	local typeName2: string = type(parent)

	assert(typeName == "userdata", "Parent must be a ROBLOX object, type = " .. typeName2)

	local paperRipple: Frame = Instance.new("Frame")

	paperRipple.ClipsDescendants = true
	paperRipple.Archivable = false
	paperRipple.BorderSizePixel = 0
	paperRipple.BackgroundTransparency = 1
	paperRipple.BackgroundColor3 = module.InkColor
	paperRipple.Name = "PaperRipple"
	paperRipple.Size = UDim2.new(1, 0, 1, 0)
	paperRipple.ZIndex = math.min(parent.ZIndex + 1, 10)
	paperRipple.Parent = parent

	return module.new(paperRipple)
end
function module.SetEnabled(p3, enabled)
	local typeName: string = type(enabled)

	assert(typeName == "boolean", "Enabled must be a boolean. (kids these days).")
	p3.Enabled = enabled
end
function module.SetInkColor(p5, inkColor)
	p5.InkColor = inkColor

	for _, v in pairs(p5.Ripples) do
		v:SetInkColor(p5.InkColor)
	end

	p5.Container.BackgroundColor3 = p5.InkColor
end
function module.SetRecenter(p7, recenter)
	local typeName: string = type(recenter)

	assert(typeName == "boolean", "DoRecenter must be a boolean. (kids these days).")
	p7.Recenter = recenter
end
function module.FurthestCornerDistanceFrom(p9, p10)
	local container = p9.Container
	local containerAbsolutePosition = container.AbsolutePosition
	local containerAbsoluteSize = container.AbsoluteSize
	local magnitude = (containerAbsolutePosition - p10).magnitude
	local vector2 = Vector2.new(0, containerAbsoluteSize.X)
	local v33 = (containerAbsolutePosition + vector2 - p10).magnitude
	local vector22 = Vector2.new(containerAbsoluteSize.Y, 0)

	return (math.max(magnitude, v33, (containerAbsolutePosition + vector22 - p10).magnitude, (containerAbsolutePosition + containerAbsoluteSize - p10).magnitude))
end
function module.ReleaseRipples(p11)
	for _, v in pairs(p11.Ripples) do
		v:Up()
	end
end
function module.AddRipple(p12, p13)
	p12.Ripples[#p12.Ripples + 1] = p13 or error("No ripple sent")
	p13:Down()
	p12:BeginAnimating()
end
function module.RemoveRipple(p14, p15)
	assert(p15, "Must send ripple")

	local v42 = getIndexByValue(p14.Ripples, p15) or error("Ripple does not exist")

	p15:Destroy()
	table.remove(p14.Ripples, v42)
end
function module.Draw(p16)
	local n1: number = 1

	while n1 <= #p16.Ripples do
		local v45 = p16.Ripples[n1]

		if v45:IsAnimationComplete() then
			p16:RemoveRipple(v45)
		else
			v45:Draw()
			p16.Container.BackgroundTransparency = v45:GetOuterTransparency()
			n1 += 1
		end
	end
end
function module.GetBindName(p17)
	return "PaperRipple" .. tostring(p17)
end
function module.StopAnimating(p18)
	assert(#p18.Ripples == 0, "There are still ripples to process.")

	if p18.Animating then
		runService:UnbindFromRenderStep(p18:GetBindName())
		p18.Animating = false
	end

	p18.Container.BackgroundTransparency = 1
end
function module.BeginAnimating(p19)
	if not p19.Animating then
		p19.Animating = true

		local v49 = p19:GetBindName()

		runService:BindToRenderStep(v49, 2000, function()
			p19:Draw()

			if #p19.Ripples <= 0 or not p19.Animating then
				p19:StopAnimating()
			end
		end)
	end
end
function module.ConstructNewRipple(p20, p21)
	local n1 = p21 or p20.Container.AbsolutePosition + p20.Container.AbsoluteSize / 2
	local v53 = p20:FurthestCornerDistanceFrom(n1)
	local v54 = v5.FromPosition(p20.Container, n1)

	v54:SetInkColor(p20.InkColor)
	v54:SetTargetRadius(v53)

	if p20.Recenter then
		v54:TargetCenter()
	end

	return v54
end
function module.Down(p22, p23)
	p22:ReleaseRipples()

	local v57 = p22:ConstructNewRipple(p23)

	p22:AddRipple(v57)

	return v57
end
function module.Up(p24)
	p24:ReleaseRipples()
	p24.InputMaid.InputEnded = nil
end
function module.BindInput(p25)
	local t2: {[any]: any} = {}

	for _, v in pairs({ "Touch", "MouseButton1", "MouseButton2", "MouseButton3" }) do
		t2[Enum.UserInputType[v]] = true
	end

	local t3: {[any]: any} = {}

	local function OnUp(input)
		if t3[input.UserInputType] then
			p25:Up()
			t3 = {}
		end
	end

	p25.InputMaid.InputBegan = p25.Container.InputBegan:connect(function(input)
		if not p25.Enabled then
			return
		end

		if t2[input.UserInputType] then
			local vector2 = Vector2.new(input.Position.X, input.Position.Y)

			p25:Down(vector2)
			t3[input.UserInputType] = true
			p25.InputMaid.InputEnded = userInputService.InputEnded:connect(OnUp)
		end
	end)
end
function module.Destroy(p28)
	while #p28.Ripples > 0 do
		local v66 = p28.Ripples[1] or error("No ripple?")

		p28:RemoveRipple(v66)
	end

	p28:StopAnimating()
	p28.Container:Destroy()
	p28.Container = nil
	p28.InputMaid:DoCleaning()
	p28.InputMaid = nil
	setmetatable(p28, nil)
end

return module
