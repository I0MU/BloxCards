



local replicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")
local runService: RunService = game:GetService("RunService")
local loadLibrary = require(replicatedStorage:WaitForChild("NevermoreEngine")).LoadLibrary
local v4 = loadLibrary("qMath")
local v5 = loadLibrary("qSystems")
local v6 = loadLibrary("SpringPhysics")
local make = v5.Make
local modify = v5.Modify
local mapNumber = v4.MapNumber
local clampNumber = v4.ClampNumber
local t1: {[any]: any} = { ClassName = "RotatingCharacter", _Transparency = 0, SpaceCode = 96 }

function t1.new(gui)
	local object = setmetatable({}, t1)

	object.Gui = gui
	object.Label = object.Gui.Label
	object.LabelTwo = object.Label.SecondLabel
	object.Spring = v6.NumberSpring.New()
	object.TargetCharacter = " "
	object.Character = object.TargetCharacter
	object.TransparencyList = setmetatable({}, {
		__newindex = function(p2, p3, p4)
			rawset(p2, p3, {
				Gui = p4,
				Default = {
					TextTransparency = p4.TextTransparency,
					TextStrokeTransparency = p4.TextStrokeTransparency
				}
			})
		end
	})
	object.TransparencyList[1] = object.Label
	object.TransparencyList[2] = object.LabelTwo
	object.Transparency = object.Transparency

	return object
end
function t1.__index(p5, p6)
	if p6 == "Character" then
		return p5:IntToChar(p5.Value)
	end

	if p6 == "IsDoneAnimating" then
		local u19: boolean = false

		if math.abs(p5.Velocity) < 0.05 then
			u19 = math.abs(p5.Target - p5.Value) < 0.05
		end

		return u19
	end

	if p6 == "NextCharacter" then
		return p5:IntToChar(p5.Value + 1)
	end

	if p6 == "Target" or p6 == "Velocity" or p6 == "Speed" or p6 == "Position" or p6 == "Value" or p6 == "Damper" then
		return p5.Spring[p6]
	end

	if p6 == "TargetCharacter" then
		return p5:IntToChar(p5.Target)
	end

	if p6 == "Transparency" then
		return p5._Transparency
	end

	if p6 == "TransparencyMap" then
		local absoluteValue = math.abs(p5.Velocity * 2 / p5.Speed)
		local v21 = clampNumber(absoluteValue, 0, 0.25)
		local v22 = mapNumber(p5.Position % 1, 0, 1, v21, 1)
		local n1 = 1 - p5.Transparency

		return { [p5.Label] = v22 * n1, [p5.LabelTwo] = (1 - v22) * n1 }
	end

	return t1[p6]
end
function t1.__newindex(p7, p8, p9)
	if p8 == "Character" then
		assert(#p9 == 1, "Character must be length 1 (at) " .. #p9)
		p7.Value = p7:CharToInt(p9)

		return
	end

	if p8 == "TargetCharacter" then
		assert(#p9 == 1, "Character must be length 1 (at) " .. #p9)
		p7.Target = p7:CharToInt(p9)

		return
	end

	if p8 == "Target" or p8 == "Velocity" or p8 == "Speed" or p8 == "Position" or p8 == "Value" or p8 == "Damper" then
		p7.Spring[p8] = p9

		return
	end

	if p8 == "Transparency" then
		p7._Transparency = p9
		p7:UpdatePositionRender()

		local transparencyMap = p7.TransparencyMap

		for _, v in pairs(p7.TransparencyList) do
			local v30 = transparencyMap[v.Gui] or error("Gui not in transparency map")

			for k, iterValue in pairs(v.Default) do
				v.Gui[k] = mapNumber(v30, 0, 1, iterValue, 1)
			end
		end

		return
	end

	rawset(p7, p8, p9)
end
function t1.UpdatePositionRender(player)
	player.Label.Text = player.Character
	player.LabelTwo.Text = player.NextCharacter
	player.Label.Position = UDim2.new(0, 0, -(player.Position % 1), 0)
end
function t1.UpdateRender(p11)
	p11.Transparency = p11.Transparency

	return p11.IsDoneAnimating
end
function t1.IntToChar(p12, p13)
	local floored = math.floor(p13)

	if floored == p12.SpaceCode then
		return " "
	end

	return (string.char(floored))
end
function t1.CharToInt(p14, p15)
	return p15 == " " and p14.SpaceCode or string.byte(p15)
end
function t1.Destroy(p16)
	p16.Gui:Destroy()
	p16.Gui = nil
	setmetatable(p16, nil)
end

local t2: {[any]: any} = {}

t2.__index = t2
t2.ClassName = "RotatingCharacterBuilder"

function t2.new()
	return (setmetatable({}, t2))
end
function t2.WithTemplate(p17, textLabelTemplate)
	p17.TextLabelTemplate = textLabelTemplate

	return p17
end
function t2.Generate(p19, p20)
	local v45 = p19.TextLabelTemplate or error("Must set TextLabelTemplate")
	local v46 = make("Frame", {
		Name = "RotatingCharacterContainer",
		Parent = p20 or error("No parent"),
		ClipsDescendants = true,
		SizeConstraint = "RelativeYY",
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = v45.BackgroundTransparency,
		ZIndex = v45.ZIndex,
		BorderSizePixel = v45.BorderSizePixel,
		BackgroundColor3 = v45.BackgroundColor3,
		make("TextLabel", {
			Name = "Label",
			BackgroundTransparency = 1,
			TextXAlignment = "Center",
			TextYAlignment = "Center",
			Text = "",
			Size = UDim2.new(1, 0, 1, 0),
			ZIndex = v45.ZIndex,
			Font = v45.Font,
			TextScaled = v45.TextScaled,
			TextColor3 = v45.TextColor3,
			TextTransparency = v45.TextTransparency,
			TextStrokeTransparency = v45.TextStrokeTransparency
		})
	})
	local clone = v46.Label:Clone()

	modify(clone, {
		Name = "SecondLabel",
		SizeConstraint = "RelativeXY",
		Parent = v46.Label,
		Position = UDim2.new(0, 0, 1, 0)
	})

	return p19:WithGui(v46)
end
function t2.WithGui(p21, p22)
	p21.Gui = p22 or error("No GUI")
	p21.Char = t1.new(p21.Gui)

	return p21
end
function t2.WithCharacter(p23, p24)
	p23.Char.TargetCharacter = p24
	p23.Char.Character = p23.Char.TargetCharacter

	return p23
end
function t2.Create(p25)
	p25.Char:UpdateRender()

	return p25.Char or error("No character spawned")
end

local t3: {[any]: any} = {
	ClassName = "RotatingLabel",
	_Text = "",
	_Speed = 15,
	_Damper = 0.85,
	_Transparency = 0,
	_Width = 0.5,
	_TextXAlignment = "Left"
}

function t3.new()
	local object = setmetatable({}, t3)

	object.Labels = setmetatable({}, {
		__index = function(p26, p27)
			if p27 == "Remove" then
				return function(_, p29)
					local v109 = rawget(p26, p29)

					assert(v109, "There is no label at index" .. p29)
					rawget(p26, p29):Destroy()
					rawset(p26, p29, nil)
				end
			end

			if p27 == "Get" then
				return function(_, p31)
					if rawget(p26, p31) then
						return (rawget(p26, p31))
					end

					local v112 = t2.new():WithTemplate(object.Template):Generate(object.Container):WithCharacter(" "):Create()

					v112.Gui.Position = object:GetLabelPosition(p31)

					for _, v in pairs({ "Transparency", "Damper", "Speed" }) do
						if v112[v] ~= object[v] then
							v112[v] = object[v]
						end
					end

					rawset(p26, p31, v112)

					return v112
				end
			end

			return (rawget(p26, p27))
		end
	})
	object.BindKey = "RotatingLabel" .. tostring(object)

	return object
end
function t3.GetLabelPosition(p32, p33)
	if p32.TextXAlignment == "Left" then
		return UDim2.new((p33 - 1) * p32.Width, 0, 0, 0)
	end

	return UDim2.new(-p32.TotalWidth + (p33 - 1) * p32.Width, 0, 0, 0)
end
function t3.SetGui(p34, p35)
	p34.Gui = p35 or error("No GUI")
	p34.Container = p34.Gui.Container
end
function t3.SetTemplate(p36, p37)
	p36.Template = p37 or error("No GUI")
end
function t3.__index(p38, p39)
	if p39 == "Text" then
		return p38._Text
	end

	if p39 == "TotalWidth" then
		return #p38.Text * p38.Width
	end

	if p39 == "Width" then
		return p38._Width
	end

	if p39 == "Transparency" or p39 == "Damper" or p39 == "Speed" then
		return p38["_" .. p39]
	end

	if p39 == "TextXAlignment" then
		return p38._TextXAlignment
	end

	return t3[p39]
end
function t3.__newindex(p40, p41, p42: string)
	if p41 == "Text" then
		if type(p42) == "number" then
			p42 = tostring(p42)
		end

		local typeName: string = type(p42)
		local typeName2: string = type(p42)

		assert(typeName == "string", "Text must be a string, got " .. typeName2)

		if p40.TextXAlignment == "Right" then
			local n1: number = #p42 - #p40.Text
			local t5: {[any]: any} = {}

			for k, v in pairs(p40.Labels) do
				local n2 = k + n1

				t5[n2] = v

				if n2 < 1 or n2 > #p42 then
					v.TargetCharacter = " "
				end

				p40.Labels[k] = nil
			end

			for k, v in pairs(t5) do
				p40.Labels[k] = v
			end
		else
			for i = #p42 + 1, #p40.Text do
				if p40.Labels[i] then
					p40.Labels[i].TargetCharacter = " "
				end
			end
		end

		p40._Text = p42

		for i = 1, #p40.Text do
			local v76 = p40.Labels:Get(i)

			v76.TargetCharacter = p40.Text:sub(i, i)
		end

		for k, v in pairs(p40.Labels) do
			v.Gui.Position = p40:GetLabelPosition(k)
		end

		p40:BeginUpdate()

		return
	end

	if p41 == "Width" then
		p40._Width = p42

		for k, v in pairs(p40.Labels) do
			v.Gui.Position = p40:GetLabelPosition(k)
		end

		return
	end

	if p41 == "Transparency" or p41 == "Damper" or p41 == "Speed" then
		p40["_" .. p41] = p42

		for _, v in pairs(p40.Labels) do
			v[p41] = p40[p41]
		end

		return
	end

	if p41 == "TextXAlignment" then
		local u83: boolean = true

		if p42 ~= "Left" then
			u83 = p42 == "Right"
		end

		assert(u83, "Value must be \"Left\" or \"Right\"")

		if p42 == "Left" then
			p40.Container.Position = UDim2.new(0, 0, 0, 0)
		else
			p40.Container.Position = UDim2.new(1, 0, 0, 0)
		end

		p40._TextXAlignment = p42

		for k, v in pairs(p40.Labels) do
			v.Gui.Position = p40:GetLabelPosition(k)
		end

		return
	end

	rawset(p40, p41, p42)
end
function t3.UpdateRender(p43)
	local u87: boolean = true

	for k, v in pairs(p43.Labels) do
		if not v:UpdateRender() then
			u87 = false
		elseif v.TargetCharacter == " " then
			p43.Labels:Remove(k)
		else
			v.Value = v.Target
		end
	end

	return u87
end
function t3.StopUpdate(p44)
	runService:UnbindFromRenderStep(p44.BindKey)
	p44.Bound = false
end
function t3.BeginUpdate(p45)
	if not p45.Bound then
		p45.Bound = true
		runService:BindToRenderStep(p45.BindKey, 2000, function()
			if p45:UpdateRender() then
				p45:StopUpdate()
			end
		end)
	end
end
function t3.Destroy(p46)
	p46:StopUpdate()
	p46.BindKey = nil

	for k, _ in pairs(p46.Labels) do
		p46.Labels:Remove(k)
	end

	p46.Labels = nil
	p46.Gui:Destroy()
	p46.Template:Destroy()
	setmetatable(p46, nil)
end

local module: {[any]: any} = { ClassName = "RotatingLabelBuilder" }

module.__index = module

function module.new(p47)
	local object = setmetatable({}, module)

	if p47 then
		object:WithTemplate(p47)
	end

	return object
end
function module.WithTemplate(p48, template)
	p48.Template = template
	p48.Label = t3.new()
	p48.Label:SetTemplate(template)

	return p48:WithGui(make("Frame", {
		Name = template.Name .. "_RotatingLabel",
		Size = template.Size,
		Position = template.Position,
		Parent = template.Parent,
		SizeConstraint = template.SizeConstraint,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		make("Frame", {
			Name = "Container",
			SizeConstraint = "RelativeYY",
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, 0)
		})
	}))
end
function module.WithGui(p50, p51)
	p50.Label:SetGui(p51)
	p50.Label.TextXAlignment = p50.Template.TextXAlignment.Name
	p50.Label.Text = p50.Template.Text
	p50.Template.Parent = nil

	return p50
end
function module.Create(p52)
	p52.Label:UpdateRender()

	return p52.Label
end

return module
