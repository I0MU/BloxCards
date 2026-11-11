





local replicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")
local t1: {[any]: any} = {}
local t2: {[any]: any} = { UpdateMousePosition = true, UpdateTimer = true }
local port: Instance = replicatedStorage:WaitForChild("Port")
local remote: Instance = replicatedStorage:WaitForChild("Remote")

-- FASTER LOAD: startup prefetch. Dozens of modules each did their own InvokeServer while being required, one after another, so the Play button
-- waited for the sum of all those round trips. Main Nieuw now fires the ones it knows about ALL AT ONCE up front (Network.Prefetch); the first
-- real InvokeServer of the same name + arguments then takes the already-arrived (or in-flight) answer instead of making a new round trip.
-- A prefetched answer is consumed once and only used within PREFETCH_TTL seconds, so later calls always see fresh data. If a prefetch failed,
-- the call just falls back to a normal InvokeServer.
local PREFETCH_TTL = 30
local prefetched: {[any]: any} = {}

local function sameArgs(a, b)
	if a.n ~= b.n then
		return false
	end

	for i = 1, a.n do
		if a[i] ~= b[i] then
			return false
		end
	end

	return true
end

local function Prefetch(name, ...)
	if prefetched[name] then
		return
	end

	local entry: {[any]: any} = { args = table.pack(...), done = false, waiting = {}, started = os.clock() }

	prefetched[name] = entry
	task.spawn(function()
		local ok, results = pcall(function()
			return table.pack(remote:InvokeServer(name, table.unpack(entry.args, 1, entry.args.n)))
		end)

		entry.ok = ok
		entry.results = results
		entry.done = true

		for _, thread in ipairs(entry.waiting) do
			task.spawn(thread)
		end

		entry.waiting = {}
	end)
end

function InvokeServer(p1, ...)
	local entry = prefetched[p1]

	if entry then
		prefetched[p1] = nil -- consumed: only the first matching call may use it

		if os.clock() - entry.started < PREFETCH_TTL and sameArgs(entry.args, table.pack(...)) then
			if not entry.done then
				table.insert(entry.waiting, coroutine.running())
				coroutine.yield()
			end

			if entry.ok then
				return table.unpack(entry.results, 1, 1)
			end
		end
	end

	return (remote:InvokeServer(p1, ...))
end
function FireServer(p3, ...)
	port:FireServer(p3, ...)
end
function remote.OnClientInvoke(p4, ...)
	local v20 = t1[p4]

	if v20 then
		return (v20(...))
	end

	local text: string = tostring(p4)

	print("Don't have " .. text)
end

local v6 = pairs
local v7 = tostring
local stringSub = string.sub
local v9 = type
local tableConcat = table.concat

function TableToString(p5)
	if p5 == nil then
		return "nil"
	end

	local t4: {[any]: any} = { "{" }

	for iterFirst, iterSecond in v6(p5) do
		if v9(iterFirst) ~= "number" then
			local v26 = v7(iterFirst)

			t4[#t4 + 1] = stringSub(v26, 1, 1)
			t4[#t4 + 1] = ":"
		end

		if v9(iterSecond) == "table" then
			t4[#t4 + 1] = TableToString(iterSecond)
		else
			t4[#t4 + 1] = v7(iterSecond)
		end

		t4[#t4 + 1] = "; "
	end

	if t4[#t4] == "; " then
		t4[#t4] = ";"
	end

	t4[#t4 + 1] = "}"

	return tableConcat(t4)
end

local t3: {[any]: any} = {}
local n1: number = 1
local n2: number = 0
local bindableEvent: BindableEvent = Instance.new("BindableEvent")
local u15: boolean = false

local function ProcessingQueue()
	if u15 then
		return
	end

	if n1 > n2 then
		return
	end

	u15 = true

	while n1 <= n2 do
		local v27 = t3[n1]

		t3[n1] = nil
		n1 += 1

		local ok, result = pcall(function()
			t1[v27[1]](table.unpack(v27[2]))
		end)

		if not ok then
			warn(result)
		end
	end

	n1 = 1
	n2 = 0
	u15 = false

	if n1 <= n2 then
		ProcessingQueue()
	end
end

bindableEvent.Event:Connect(function()
	ProcessingQueue()
end)
port.OnClientEvent:Connect(function(p6, ...)
	local v31 = t1[p6]

	if not v31 then
		if p6 == "UpdateProducts" then
			return
		end

		if p6 == "UpdateClientCardLibrary" then
			return
		end

		print("Don't have " .. p6, TableToString({ ... }))

		return
	end

	if t2[p6] then
		v31(...)

		return
	end

	n2 += 1
	t3[n2] = {
		p6,
		{ ... }
	}
	bindableEvent:Fire()
end)
print("Finished loading " .. script.Name)

return {
	client = t1,
	async = t2,
	InvokeServer = InvokeServer,
	Prefetch = Prefetch,
	SafeInvokeServer = function(p2, ...)
		local n1: number = 0

		while true do
			n1 += 1

			local ok, result = pcall(InvokeServer, p2, ...)

			if ok then
				break
			end

			warn(p2, "failed (" .. n1 .. ") because", result)

			local v36 = math.min(2 ^ (n1 - 1), 30)

			task.wait(v36)
		end

		return result
	end,
	FireServer = FireServer
}
