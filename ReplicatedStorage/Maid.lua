



local module: {[any]: any} = { ClassName = "Maid" }

function module.new()
	return (setmetatable({
		_tasks = {}
	}, module))
end
function module.isMaid(p1)
	local u3: boolean = false

	if type(p1) == "table" then
		u3 = p1.ClassName == "Maid"
	end

	return u3
end
function module.__index(p2, p3)
	return module[p3] or p2._tasks[p3]
end
function module.__newindex(p4, p5, p6)
	if module[p5] ~= nil then
		local v9 = ("'%s' is reserved"):format((tostring(p5)))

		error(v9, 2)
	end

	local _tasks = p4._tasks
	local v11 = _tasks[p5]

	if p6 == v11 then
		return
	end

	if v11 then
		if type(v11) == "function" then
			v11()
		elseif typeof(v11) == "RBXScriptConnection" then
			v11:Disconnect()
		elseif v11.Destroy then
			v11:Destroy()
		end
	end

	_tasks[p5] = p6
end
function module.GiveTask(p7, p8)
	if not p8 then
		error("Task cannot be false or nil", 2)
	end

	local n1: number = #p7._tasks + 1

	p7[n1] = p8

	if type(p8) == "table" and not p8.Destroy then
		local v15 = debug.traceback()

		warn("[Maid.GiveTask] - Gave table task without .Destroy\n\n" .. v15)
	end

	return n1
end
function module.GivePromise(p9, p10)
	if not p10:IsPending() then
		return p10
	end

	local v18 = p10.resolved(p10)
	local v19 = p9:GiveTask(v18)

	v18:Finally(function()
		p9[v19] = nil
	end)

	return v18
end
function module.DoCleaning(p11)
	local _tasks = p11._tasks

	for k, v in pairs(_tasks) do
		if typeof(v) == "RBXScriptConnection" then
			_tasks[k] = nil
			v:Disconnect()
		end
	end

	for k, v in pairs(_tasks) do
		_tasks[k] = nil

		if type(v) == "function" then
			v()
		elseif typeof(v) == "RBXScriptConnection" then
			v:Disconnect()
		elseif v.Destroy then
			v:Destroy()
		end
	end
end

module.Destroy = module.DoCleaning

return module
