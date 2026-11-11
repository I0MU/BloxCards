



local replicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")
local makeMaid = require(replicatedStorage:WaitForChild("NevermoreEngine")).LoadLibrary("Maid").MakeMaid
local t1: {[any]: any} = {}

t1.__index = t1
t1.ClassName = "BindedIcon"

function t1.new(p1)
	local t3: {[any]: any} = {}

	setmetatable(t3, t1)
	t3.Maid = makeMaid()
	t3.Icon = p1 or error("No icon sent, need icon")

	return t3
end
function t1.SetBindableAction(p2, bindableAction)
	assert(bindableAction, "Need to send BindableAction")
	assert(not p2.BindableAction, "Already have BindableAction")
	p2.BindableAction = bindableAction
	p2.BindableAction:BindFunction("_UpdateIcon", function(_, p5, _)
		if p5.Name == "Begin" then
			p2.Icon:SetFillTransparency(0.5)
		elseif p5.Name == "End" then
			p2.Icon:SetFillTransparency(1)
		end
	end)
end
function t1.Destroy(p7)
	setmetatable(p7, nil)
	p7.BindableAction:UnbindFunction("_UpdateIcon")
	p7.Maid:DoCleaning()
	p7.Maid = nil
	p7.Icon:Destroy()
	p7.Icon = nil
end

local module: {[any]: any} = {}

module.__index = module
module.ClassName = "BindedBarIcon"
setmetatable(module, t1)

function module.new(p8)
	local v11 = t1.new(p8)

	setmetatable(v11, module)
	v11.OnBar = false

	return v11
end
function module.FromProviderAndAction(p9, p10, p11)
	local v15 = p11 or p9:GetIconBar()
	local v16 = p10:GetInputTypes()[1]
	local v17 = p10:GetName()
	local v18 = p9:GetLabeledKey(v16, v17, v15)
	local v19 = module.new(v18)

	v19:SetBindableAction(p10)
	v19:SetIconBar(v15)

	return v19
end
function module.PopOffBar(p12, p13)
	assert(p12.OnBar, "Icon must be on bar for this happen")
	p12.IconBar:RemoveIcon(p12.Icon, p13)
	p12.OnBar = false
end
function module.PushOnBar(p14, p15)
	p14.IconBar:AddIcon(p14.Icon, p15)
	p14.OnBar = true
end
function module.RemoveIconBar(p16)
	if p16.OnBar then
		p16:PopOffBar()
	end

	p16.IconBar = nil
end
function module.SetIconBar(p17, iconBar)
	assert(iconBar, "Must send IconBar")

	if p17.IconBar then
		p17:RemoveIconBar()
	end

	p17.IconBar = iconBar

	if p17.BindableAction:IsBound() then
		p17:PushOnBar()
	end
end
function module.SetBindableAction(p19, p20)
	assert(p20, "Need to send BindableAction")

	local v29 = getmetatable(module)

	p19.Maid.Bound = p20.Bound:connect(function()
		if not p19.OnBar and p19.IconBar then
			p19:PushOnBar()
		end
	end)
	p19.Maid.Unbound = p20.Unbound:connect(function()
		if p19.OnBar and p19.IconBar then
			p19:PopOffBar()
		end
	end)
	v29.SetBindableAction(p19, p20)
end
function module.Destroy(p21)
	local v31 = getmetatable(module)

	if p21.OnBar then
		p21:PopOffBar()
	end

	v31.Destroy(p21)
end

return module
