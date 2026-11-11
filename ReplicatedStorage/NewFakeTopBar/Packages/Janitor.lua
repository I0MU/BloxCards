



local runService: RunService = game:GetService("RunService")
local runServiceHeartbeat = runService.Heartbeat

local function getPromiseReference()
	if runService:IsRunning() then
		local replicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")

		return require(replicatedStorage.Framework).modules.Promise
	end
end

local v4 = newproxy(true)

getmetatable(v4).__tostring = function()
	return "IndicesReference"
end

local v5 = newproxy(true)

getmetatable(v5).__tostring = function()
	return "LinkToInstanceIndex"
end

local module: {[any]: any} = {
	IGNORE_MEMORY_DEBUG = true,
	ClassName = "Janitor",
	__index = { CurrentlyCleaning = true, [v4] = nil }
}

function module.new()
	return (setmetatable({ CurrentlyCleaning = false, [v4] = nil }, module))
end
function module.Is(p1)
	local u16: boolean = false

	if type(p1) == "table" then
		u16 = getmetatable(p1) == module
	end

	return u16
end

module.is = module.Is

local t2: {[any]: any} = {
	["function"] = true,
	Promise = "cancel",
	RBXScriptConnection = "Disconnect"
}

function module.__index.Add(p2, p3, p4, p5)
	if p5 then
		p2:Remove(p5)

		local t4 = p2[v4]

		if not t4 then
			t4 = {}
			p2[v4] = t4
		end

		t4[p5] = p3
	end

	local typeName: string = typeof(p3)

	if typeName == "table" and string.match(tostring(p3), "Promise") then
		typeName = "Promise"
	end

	local s1 = p4 or t2[typeName] or "Destroy"

	if type(p3) ~= "function" and not p3[s1] then
		local stringFormat = string.format
		local text: string = tostring(p3)
		local text2: string = tostring(s1)

		warn(stringFormat("Object %s doesn't have method %s, are you sure you want to add it? Traceback: %s", text, text2, debug.traceback(nil, 2)))
	end

	local v27 = debug.traceback("")

	p2[p3] = { s1, v27 }

	return p3
end

module.__index.Give = module.__index.Add

function module.__index.AddPromise(p6, p7)
	local v30 = if runService:IsRunning() then require(game:GetService("ReplicatedStorage").Framework).modules.Promise else nil

	if v30 then
		if not v30.is(p7) then
			local stringFormat = string.format
			local typeName: string = typeof(p7)
			local text: string = tostring(p7)

			error(stringFormat("Invalid argument #1 to 'Janitor:AddPromise' (Promise expected, got %s (%s))", typeName, text))
		end

		if p7:getStatus() == v30.Status.Started then
			local v34 = newproxy(false)

			local v35 = v30.new(function(p8, _, p10)
				if p10(function()
					p7:cancel()
				end) then
					return
				end

				p8(p7)
			end)

			local v36 = p6:Add(v35, "cancel", v34)

			v36:finallyCall(p6.Remove, p6, v34)

			return v36
		end

		return p7
	end

	return p7
end

module.__index.GivePromise = module.__index.AddPromise

function module.__index.AddObject(p11, p12)
	local v39 = newproxy(false)
	local v40 = if runService:IsRunning() then require(game:GetService("ReplicatedStorage").Framework).modules.Promise else nil

	if v40 and v40.is(p12) then
		if p12:getStatus() == v40.Status.Started then
			local v41 = v40.resolve(p12)
			local v42 = p11:Add(v41, "cancel", v39)

			v42:finallyCall(p11.Remove, p11, v39)

			return v42, v39
		end

		return p12
	end

	return p11:Add(p12, false, v39), v39
end

module.__index.GiveObject = module.__index.AddObject

function module.__index.Remove(p13, p14)
	local v45 = p13[v4]
	local v46 = v45 and v45[p14]

	if v46 then
		local v47 = p13[v46]
		local v48 = v47 and v47[1]

		if v48 then
			if v48 == true then
				v46()
			else
				local v49 = v46[v48]

				if v49 then
					v49(v46)
				end
			end

			p13[v46] = nil
		end

		v45[p14] = nil
	end

	return p13
end
function module.__index.Get(p15, p16)
	local v52 = p15[v4]

	if v52 then
		return v52[p16]
	end
end
function module.__index.Cleanup(p17)
	if not p17.CurrentlyCleaning then
		p17.CurrentlyCleaning = nil

		for k, v in pairs(p17) do
			if k ~= v4 then
				local typeName: string = type(k)

				if typeName == "string" or typeName == "number" then
				else
					local v57 = v[1]
					local v58 = v[2]

					local function warnUser(p18)
						local v91 = debug.traceback("", 3)
						local v92 = v58
						local text: string = tostring(p18)

						warn("-------- Janitor Error --------" .. "\n" .. text .. "\n" .. v91 .. "" .. v92)
					end

					if v57 == true then
						local ok, result = pcall(k)

						if not ok then
							local v62 = debug.traceback("", 3)
							local text: string = tostring(result)

							warn("-------- Janitor Error --------" .. "\n" .. text .. "\n" .. v62 .. "" .. v58)
						end
					else
						local v64 = k[v57]

						if v64 then
							local ok, result = pcall(v64, k)
							local u67: boolean = false

							if typeof(k) == "Instance" then
								u67 = v64 == "Destroy"
							end

							if not ok and not u67 then
								local v68 = debug.traceback("", 3)
								local text: string = tostring(result)

								warn("-------- Janitor Error --------" .. "\n" .. text .. "\n" .. v68 .. "" .. v58)
							end
						end
					end
				end

				p17[k] = nil
			end
		end

		local v70 = p17[v4]

		if v70 then
			for iterKey in pairs(v70) do
				v70[iterKey] = nil
			end

			p17[v4] = {}
		end

		p17.CurrentlyCleaning = false
	end
end

module.__index.Clean = module.__index.Cleanup

function module.__index.Destroy(p19)
	p19:Cleanup()
end

module.__call = module.__index.Cleanup

local t3: {[any]: any} = { Connected = true }

t3.__index = t3

function t3.Disconnect(p20)
	if p20.Connected then
		p20.Connected = false
		p20.Connection:Disconnect()
	end
end
function t3.__tostring(p21)
	return "Disconnect<" .. tostring(p21.Connected) .. ">"
end
function module.__index.LinkToInstance(p22, p23, p24)
	local connection = nil
	local v79 = p24 and newproxy(false) or v5
	local u80: boolean = p23.Parent == nil
	local object = setmetatable({}, t3)

	connection = p23.AncestryChanged:Connect(function(_, p26)
		if object.Connected then
			u80 = p26 == nil

			if u80 then
				coroutine.wrap(function()
					runServiceHeartbeat:Wait()

					if not object.Connected then
						return
					end

					if not connection.Connected then
						p22:Cleanup()

						return
					end

					while u80 and connection.Connected and object.Connected do
						runServiceHeartbeat:Wait()
					end

					if object.Connected and u80 then
						p22:Cleanup()
					end
				end)()
			end
		end
	end)
	object.Connection = connection

	if u80 and object.Connected then
		u80 = p23.Parent == nil

		if u80 then
			coroutine.wrap(function()
				runServiceHeartbeat:Wait()

				if not object.Connected then
					return
				end

				if not connection.Connected then
					p22:Cleanup()

					return
				end

				while u80 and connection.Connected and object.Connected do
					runServiceHeartbeat:Wait()
				end

				if object.Connected and u80 then
					p22:Cleanup()
				end
			end)()
		end
	end

	return p22:Add(object, "Disconnect", v79)
end
function module.__index.LinkToInstances(p27, ...)
	local v83 = module.new()

	for _, v in ipairs({ ... }) do
		local v86 = p27:LinkToInstance(v, true)

		v83:Add(v86, "Disconnect")
	end

	return v83
end

for k, v in pairs(module.__index) do
	local lowerText = string.lower(k)
	local v12 = string.sub(lowerText, 1, 1)
	local v13 = string.sub(k, 2)

	module.__index[v12 .. v13] = v
end

return module
