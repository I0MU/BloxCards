



local replicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")
local contextActionService: ContextActionService = game:GetService("ContextActionService")
local loadLibrary = require(replicatedStorage:WaitForChild("NevermoreEngine")).LoadLibrary
local v4 = loadLibrary("Signal")
local makeMaid = loadLibrary("Maid").MakeMaid
local module: {[any]: any} = { ClassName = "BindableAction" }

module.__index = module

function module.new(buttonTitle, p2)
	local t2: {[any]: any} = {}

	setmetatable(t2, module)
	t2.ActionName = buttonTitle or error("[BindableAction] - Need ActionName")
	t2.InputTypes = p2 or error("[BindableAction] - Need InputTypes")
	t2.ButtonTitle = buttonTitle
	t2.CreateTouchButton = false
	t2.IsBoundState = false
	t2.BoundFunctionMaid = makeMaid()
	t2.ActionFired = v4.new()
	t2.Bound = v4.new()
	t2.Unbound = v4.new()

	return t2
end
function module.FromUsualInput(p3, p4, p5, ...)
	local new = module.new
	local v14 = p3 or error("No ActionName")
	local v15 = new(v14, { ... })

	if p5 ~= nil then
		v15:SetCreateTouchButton(p5)
	end

	if type(p4) == "function" then
		v15:BindFunction("Primary", p4)

		return v15
	end

	error("Function must be a function")

	return v15
end
function module.FromData(p6)
	local new = module.new
	local v18 = p6.ActionName or error("No ActionName")
	local v19 = p6.InputTypes or error("NO InputTypes")
	local v20 = new(v18, v19)

	if p6.CreateTouchButton ~= nil then
		v20:SetCreateTouchButton(p6.CreateTouchButton)
	end

	if p6.ButtonTitle then
		v20:SetButtonTitle(p6.ButtonTitle)
	end

	if p6.ButtonImage then
		v20:SetButtonImage(p6.ButtonImage)
	end

	if p6.InternalDescription then
		v20:SetInternalDescription(p6.InternalDescription)
	end

	if type(p6.FunctionToBind) == "function" then
		v20:BindFunction("Primary", p6.FunctionToBind)

		return v20
	end

	if type(p6.FunctionToBind) == "table" then
		for k, v in pairs(p6.FunctionToBind) do
			v20:BindFunction(k, v)
		end
	end

	return v20
end
function module.SetCreateTouchButton(p7, createTouchButton)
	local typeName: string = type(createTouchButton)

	assert(typeName == "boolean", "DoCreateTouchButton must be a boolean")
	p7.CreateTouchButton = createTouchButton
end
function module.GetInputTypes(p9)
	return p9.InputTypes
end
function module.IsBound(p10)
	return p10.IsBoundState
end
function module.GetName(p11)
	return p11.ActionName
end
function module.SetButtonTitle(p12, buttonTitle)
	local typeName: string = type(buttonTitle)

	assert(typeName == "string", "ButtonTitle must be a string")
	p12.ButtonTitle = buttonTitle

	if p12:IsBound() then
		contextActionService:SetTitle(p12.ActionName, p12.ButtonTitle)
	end
end
function module.SetButtonImage(p14, buttonImage)
	local typeName: string = type(buttonImage)

	assert(typeName == "string", "ButtonImage must be a string")
	p14.ButtonImage = buttonImage

	if p14:IsBound() then
		contextActionService:SetImage(p14.ActionName, p14.ButtonImage)
	end
end
function module.SetInternalDescription(p16, internalDescription)
	p16.InternalDescription = internalDescription

	if p16:IsBound() then
		contextActionService:SetDescription(p16.ActionName, p16.InternalDescription)
	end
end
function module.BindFunction(p18, p19, p20)
	local typeName: string = type(p19)

	assert(typeName == "string", "Name must be a string")

	local typeName2: string = type(p20)

	assert(typeName2 == "function", "Function must be a function")
	p18.BoundFunctionMaid[p19] = p18.ActionFired:connect(p20)
end
function module.UnbindFunction(p21, p22)
	assert(p21.BoundFunctionMaid[p22], "Bound function does not exist")
	p21.BoundFunctionMaid[p22] = nil
end
function module.FireBound(p23, p24, p25, p26)
	p23.ActionFired:fire(p24, p25, p26)
end
function module.Bind(p27)
	local v49 = p27:IsBound()

	assert(not v49, "Already bound")
	p27.IsBoundState = true
	v49 = p27.ActionName or error("No action name")
	contextActionService:BindActionToInputTypes(v49, function(...)
		p27.ActionFired:fire(...)
	end, p27.CreateTouchButton, unpack(p27.InputTypes))

	if p27.CreateTouchButton then
		if p27.ButtonTitle then
			contextActionService:SetTitle(p27.ActionName, p27.ButtonTitle)
		end

		if p27.ButtonImage then
			contextActionService:SetImage(p27.ActionName, p27.ButtonImage)
		end
	end

	if p27.InternalDescription then
		contextActionService:SetDescription(p27.ActionName, p27.InternalDescription)
	end

	p27.Bound:fire()
end
function module.Unbind(p28)
	local v51 = p28:IsBound()

	assert(v51, "Already unbound")
	p28.IsBoundState = false
	contextActionService:UnbindAction(p28.ActionName)
	p28.Unbound:fire()
end

return module
