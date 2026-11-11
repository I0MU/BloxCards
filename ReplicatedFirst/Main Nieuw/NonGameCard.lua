





local inspection = require(script.Parent.Inspection)
local cardLibrary = (function()
	local real = require(game.ReplicatedStorage.CardLibrary)
	return setmetatable({}, {
		__index = function(_, name)
			local c = real[name]
			if c == nil and type(name) == "string" then return { Id = 0, Name = name } end
			return c
		end,
		__pairs = function() return pairs(real) end,
	})
end)()
local t1: {[any]: any} = {}
local u4: boolean = false

local module: {[any]: any} = {
	SetInspectDisabled = function(p1)
		u4 = if p1 then true else false
	end,
	new = function(p2)
		if t1[p2] then
			return t1[p2]
		end

		if not cardLibrary[p2] then
			return
		end

		local t3: {[any]: any} = { LibraryIndex = p2 }

		setmetatable(t3, { __index = cardLibrary[p2] })
		t1[p2] = t3

		return t3
	end
}

local function inspect(p3, p4, p5)
	if u4 then
		return
	end

	if p5 and p5() then
		return
	end

	local v13 = nil
	local v14

	if type(p4) == "function" then
		local v15, v16 = p4()

		v14 = v15
		v13 = v16

		if type(v14) == "string" then
			v14 = module.new(v14)
		end

		if not v14 then
			return
		end
	else
		if not p4 then
			return
		end

		v14 = p4
	end

	v14.Physical = v14.Physical or p3
	inspection.Inspect(v14, v13)
end

module.Inspect = inspect

function module.BindInspect(p6, p7, p8)
	local function ShowInfo()
		if not u4 then
			inspect(p6, p7, p8)
		end
	end
	local function MoveInfo()
		if not u4 then
			inspection.Move()
			inspect(p6, p7, p8)
		end
	end

	local connection = p6.MouseEnter:Connect(ShowInfo)
	local connection2 = p6.MouseMoved:Connect(MoveInfo)
	local connection3 = p6.MouseLeave:Connect(inspection.Hide)
	local connection4 = p6.SelectionGained:Connect(ShowInfo)
	local connection5 = p6.SelectionLost:Connect(inspection.Hide)
	local connection6 = nil

	connection6 = p6.Changed:Connect(function(p9)
		if p9 == "Parent" then
			connection:Disconnect()
			connection2:Disconnect()
			connection3:Disconnect()
			connection4:Disconnect()
			connection5:Disconnect()
			connection6:Disconnect()
			connection = nil
			connection2 = nil
			connection3 = nil
			connection4 = nil
			connection5 = nil
			connection6 = nil
			ShowInfo = nil
			MoveInfo = nil
			p6 = nil
			p7 = nil
			p8 = nil
		end
	end)
end

print("Finished loading " .. script.Name)

return module
