



local t1: {[any]: any} = { __mode = "k" }

local function isCallable(p1)
	if type(p1) == "function" then
		return true
	end

	local v17 = type(p1) == "table" and getmetatable(p1)

	if v17 and type((rawget(v17, "__call"))) == "function" then
		return true
	end

	return false
end
local function makeEnum(p2, p3)
	local t4: {[any]: any} = {}

	for _, v in ipairs(p3) do
		t4[v] = v
	end

	return (setmetatable(t4, {
		__index = function(_, p5)
			local formattedText = string.format("%s is not in %s!", p5, p2)

			error(formattedText, 2)
		end,
		__newindex = function()
			local formattedText = string.format("Creating new members in %s is not allowed!", p2)

			error(formattedText, 2)
		end
	}))
end

local t2: {[any]: any} = {
	Kind = makeEnum("Promise.Error.Kind", {
		"ExecutionError",
		"AlreadyCancelled",
		"NotResolvedInTime",
		"TimedOut"
	})
}

t2.__index = t2

function t2.new(p6, p7)
	local t5 = p6 or {}
	local text: string = tostring(t5.error)
	local trace = t5.trace
	local context = t5.context
	local kind = t5.kind
	local v30 = os.clock()
	local v31 = debug.traceback()

	return (setmetatable({
		error = text or "[This error has no error text.]",
		trace = trace,
		context = context,
		kind = kind,
		parent = p7,
		createdTick = v30,
		createdTrace = v31
	}, t2))
end
function t2.is(p8)
	if type(p8) == "table" then
		local v33 = getmetatable(p8)

		if type(v33) == "table" then
			local u34: boolean = false

			if rawget(p8, "error") ~= nil then
				local v35 = rawget(v33, "extend")

				u34 = type(v35) == "function"
			end

			return u34
		end

		return false
	end

	return false
end
function t2.isKind(p9, p10)
	assert(p10 ~= nil, "Argument #2 to Promise.Error.isKind must not be nil")

	return t2.is(p9) and p10 == p9.kind
end
function t2.extend(p11, p12)
	local t6 = p12 or {}

	t6.kind = t6.kind or p11.kind

	return t2.new(t6, p11)
end
function t2.getErrorChain(p13)
	local t7: {[any]: any} = { p13 }

	while t7[#t7].parent do
		table.insert(t7, t7[#t7].parent)
	end

	return t7
end
function t2.__tostring(p14)
	local t8: {[any]: any} = { string.format("-- Promise.Error(%s) --", p14.kind or "?") }

	for _, v in ipairs(p14:getErrorChain()) do
		table.insert(t8, table.concat({ v.trace or v.error, v.context }, "\n"))
	end

	return table.concat(t8, "\n")
end
local function pack(...)
	return select("#", ...), { ... }
end
local function packResult(p15, ...)
	local v48 = select("#", ...)

	return p15, v48, { ... }
end
local function makeErrorHandler(p16)
	assert(p16 ~= nil, "traceback is nil")

	return function(p17)
		if type(p17) == "table" then
			return p17
		end

		local new = t2.new
		local executionError = t2.Kind.ExecutionError
		local debugTraceback = debug.traceback
		local text: string = tostring(p17)
		local v275 = debugTraceback(text, 2)

		return new({
			error = p17,
			kind = executionError,
			trace = v275,
			context = "Promise created at:\n\n" .. p16
		})
	end
end
local function runExecutor(p18, p19, ...)
	assert(p18 ~= nil, "traceback is nil")

	return packResult(xpcall(p19, function(p20)
		if type(p20) == "table" then
			return p20
		end

		local new = t2.new
		local executionError = t2.Kind.ExecutionError
		local debugTraceback = debug.traceback
		local text: string = tostring(p20)
		local v281 = debugTraceback(text, 2)

		return new({
			error = p20,
			kind = executionError,
			trace = v281,
			context = "Promise created at:\n\n" .. p18
		})
	end, ...))
end
local function createAdvancer(p21, p22, p23, p24)
	return function(...)
		local v282, v283, v284 = runExecutor(p21, p22, ...)

		if v282 then
			p23(unpack(v284, 1, v283))

			return
		end

		p24(v284[1])
	end
end
local function isEmpty(p25)
	return next(p25) == nil
end

local module: {[any]: any} = {
	Error = t2,
	Status = makeEnum("Promise.Status", { "Started", "Resolved", "Rejected", "Cancelled" }),
	_getTime = os.clock,
	_timeEvent = game:GetService("RunService").Heartbeat,
	_unhandledRejectionCallbacks = {},
	prototype = {}
}

module.__index = module.prototype

function module._new(p26, p27, p28)
	if p28 ~= nil and not module.is(p28) then
		error("Argument #2 to Promise.new must be a promise or nil", 2)
	end

	local started = module.Status.Started
	local object = setmetatable({}, t1)
	local t9: {[any]: any} = {
		_thread = nil,
		_values = nil,
		_valuesLength = -1,
		_unhandledRejection = true,
		_cancellationHook = nil,
		_source = p26,
		_status = started,
		_queuedResolve = {},
		_queuedReject = {},
		_queuedFinally = {},
		_parent = p28,
		_consumers = object
	}

	if p28 and p28._status == module.Status.Started then
		p28._consumers[t9] = true
	end

	setmetatable(t9, module)

	local function resolve(...)
		t9:_resolve(...)
	end
	local function reject(...)
		t9:_reject(...)
	end
	local function onCancel(p29)
		if p29 then
			if t9._status == module.Status.Cancelled then
				p29()
			else
				t9._cancellationHook = p29
			end
		end

		return t9._status == module.Status.Cancelled
	end

	t9._thread = coroutine.create(function()
		local v286, v287, v288 = runExecutor(t9._source, p27, resolve, reject, onCancel)

		if not v286 then
			reject(v288[1])
		end
	end)
	task.spawn(t9._thread)

	return t9
end
function module.new(p30)
	local _new = module._new
	local v68 = debug.traceback(nil, 2)

	return _new(v68, p30)
end
function module.__tostring(p31)
	return string.format("Promise(%s)", p31._status)
end
function module.defer(p32)
	local v71 = debug.traceback(nil, 2)

	return (module._new(v71, function(p33, p34, p35)
		local connection = nil

		connection = module._timeEvent:Connect(function()
			connection:Disconnect()

			local v402, v403, v404 = runExecutor(v71, p32, p33, p34, p35)

			if not v402 then
				p34(v404[1])
			end
		end)
	end))
end

module.async = module.defer

function module.resolve(...)
	local v72, v73 = pack(...)
	local _new = module._new
	local v75 = debug.traceback(nil, 2)

	return _new(v75, function(p36)
		p36(unpack(v73, 1, v72))
	end)
end
function module.reject(...)
	local v76, v77 = pack(...)
	local _new = module._new
	local v79 = debug.traceback(nil, 2)

	return _new(v79, function(_, p38)
		p38(unpack(v77, 1, v76))
	end)
end
function module._try(p39, p40, ...)
	local v82, v83 = pack(...)

	return module._new(p39, function(p41)
		p41(p40(unpack(v83, 1, v82)))
	end)
end
function module.try(p42, ...)
	local _try = module._try
	local v86 = debug.traceback(nil, 2)

	return _try(v86, p42, ...)
end
function module._all(p43, p44, p45)
	if type(p44) ~= "table" then
		local formattedText = string.format("Please pass a list of promises to %s", "Promise.all")

		error(formattedText, 3)
	end

	for k, v in pairs(p44) do
		if not module.is(v) then
			local stringFormat = string.format
			local text: string = tostring(k)
			local v95 = stringFormat("Non-promise value passed into %s at index %s", "Promise.all", text)

			error(v95, 3)
		end
	end

	if #p44 == 0 or p45 == 0 then
		return module.resolve({})
	end

	return module._new(p43, function(p46, p47, p48)
		local t12: {[any]: any} = {}
		local t13: {[any]: any} = {}
		local n1: number = 0
		local n2: number = 0
		local u304: boolean = false

		local function resolveOne(p49, ...)
			if u304 then
				return
			end

			n1 += 1

			if p45 == nil then
				t12[p49] = ...
			else
				t12[n1] = ...
			end

			if n1 >= (p45 or #p44) then
				u304 = true
				p46(t12)

				for _, v in ipairs(t13) do
					v:cancel()
				end
			end
		end

		p48(function()
			for _, v in ipairs(t13) do
				v:cancel()
			end
		end)

		for i, v in ipairs(p44) do
			t13[i] = v:andThen(function(...)
				resolveOne(i, ...)
			end, function(...)
				n2 += 1

				if p45 == nil or #p44 - n2 < p45 then
					for _, iterValue in ipairs(t13) do
						iterValue:cancel()
					end

					u304 = true
					p47(...)
				end
			end)
		end

		if u304 then
			for _, v in ipairs(t13) do
				v:cancel()
			end
		end
	end)
end
function module.all(p50)
	local _all = module._all
	local v98 = debug.traceback(nil, 2)

	return _all(v98, p50)
end
function module.fold(p51, p52, p53)
	local typeName: string = type(p51)

	assert(typeName == "table", "Bad argument #1 to Promise.fold: must be a table")

	local u103

	if type(p52) == "function" then
		u103 = true
	else
		local v104 = type(p52) == "table" and getmetatable(p52)

		u103 = if v104 and type((rawget(v104, "__call"))) == "function" then true else false
	end

	assert(u103, "Bad argument #2 to Promise.fold: must be a function")

	local u105 = module.resolve(p53)

	return module.each(p51, function(p54, p55)
		u105 = u105:andThen(function(p56)
			return p52(p56, p54, p55)
		end)
	end):andThen(function()
		return u105
	end)
end
function module.some(p57, p58)
	local typeName: string = type(p58)

	assert(typeName == "number", "Bad argument #2 to Promise.some: must be a number")

	local _all = module._all
	local v110 = debug.traceback(nil, 2)

	return _all(v110, p57, p58)
end
function module.any(p59)
	local _all = module._all
	local v113 = debug.traceback(nil, 2)

	return _all(v113, p59, 1):andThen(function(p60)
		return p60[1]
	end)
end
function module.allSettled(p61)
	if type(p61) ~= "table" then
		local formattedText = string.format("Please pass a list of promises to %s", "Promise.allSettled")

		error(formattedText, 2)
	end

	for k, v in pairs(p61) do
		if not module.is(v) then
			local stringFormat = string.format
			local text: string = tostring(k)
			local v120 = stringFormat("Non-promise value passed into %s at index %s", "Promise.allSettled", text)

			error(v120, 2)
		end
	end

	if #p61 == 0 then
		return module.resolve({})
	end

	local _new = module._new
	local v122 = debug.traceback(nil, 2)

	return _new(v122, function(p62, _, p64)
		local t14: {[any]: any} = {}
		local t15: {[any]: any} = {}
		local n1: number = 0

		local function resolveOne(p65, ...)
			n1 += 1
			t14[p65] = ...

			if n1 >= #p61 then
				p62(t14)
			end
		end

		p64(function()
			for _, v in ipairs(t15) do
				v:cancel()
			end
		end)

		for i, v in ipairs(p61) do
			t15[i] = v:finally(function(...)
				resolveOne(i, ...)
			end)
		end
	end)
end
function module.race(p66)
	local typeName: string = type(p66)

	assert(typeName == "table", string.format("Please pass a list of promises to %s", "Promise.race"))

	for k, v in pairs(p66) do
		local v127 = module.is(v)
		local stringFormat = string.format
		local text: string = tostring(k)

		assert(v127, stringFormat("Non-promise value passed into %s at index %s", "Promise.race", text))
	end

	local _new = module._new
	local v131 = debug.traceback(nil, 2)

	return _new(v131, function(p67, p68, p69)
		local t16: {[any]: any} = {}
		local u326: boolean = false

		local function cancel()
			for _, v in ipairs(t16) do
				v:cancel()
			end
		end
		local function finalize(p70)
			return function(...)
				for _, v in ipairs(t16) do
					v:cancel()
				end

				u326 = true

				return p70(...)
			end
		end

		if p69(function(...)
			for _, v in ipairs(t16) do
				v:cancel()
			end

			u326 = true

			return p68(...)
		end) then
			return
		end

		for i, v in ipairs(p66) do
			t16[i] = v:andThen(function(...)
				for _, iterValue in ipairs(t16) do
					iterValue:cancel()
				end

				u326 = true

				return p67(...)
			end, function(...)
				for _, v in ipairs(t16) do
					v:cancel()
				end

				u326 = true

				return p68(...)
			end)
		end

		if u326 then
			for _, v in ipairs(t16) do
				v:cancel()
			end
		end
	end)
end
function module.each(p71, p72)
	local typeName: string = type(p71)

	assert(typeName == "table", string.format("Please pass a list of promises to %s", "Promise.each"))

	local u135

	if type(p72) == "function" then
		u135 = true
	else
		local v136 = type(p72) == "table" and getmetatable(p72)

		u135 = if v136 and type((rawget(v136, "__call"))) == "function" then true else false
	end

	assert(u135, string.format("Please pass a handler function to %s!", "Promise.each"))

	local _new = module._new
	local v138 = debug.traceback(nil, 2)

	return _new(v138, function(p73, p74, p75)
		local t17: {[any]: any} = {}
		local t18: {[any]: any} = {}
		local u338: boolean = false

		local function cancel()
			for _, v in ipairs(t18) do
				v:cancel()
			end
		end

		p75(function()
			u338 = true

			for _, v in ipairs(t18) do
				v:cancel()
			end
		end)

		local t19: {[any]: any} = {}

		for i, v in ipairs(p71) do
			if module.is(v) then
				if v:getStatus() == module.Status.Cancelled then
					for _, iterValue in ipairs(t18) do
						iterValue:cancel()
					end

					local new = t2.new
					local alreadyCancelled = t2.Kind.AlreadyCancelled
					local formattedText = string.format("The Promise that was part of the array at index %d passed into Promise.each was already cancelled when Promise.each began.\n\nThat Promise was created at:\n\n%s", i, v._source)

					return p74(new({
						error = "Promise is cancelled",
						kind = alreadyCancelled,
						context = formattedText
					}))
				end

				if v:getStatus() == module.Status.Rejected then
					for _, iterValue2 in ipairs(t18) do
						iterValue2:cancel()
					end

					return p74(select(2, v:await()))
				end

				local v350 = v:andThen(function(...)
					return ...
				end)

				table.insert(t18, v350)
				t19[i] = v350
			else
				t19[i] = v
			end
		end

		for i, v in ipairs(t19) do
			if module.is(v) then
				local v353, v354 = v:await()

				v = v354

				if not v353 then
					for _, iterValue3 in ipairs(t18) do
						iterValue3:cancel()
					end

					return p74(v)
				end
			end

			if u338 then
				return
			end

			local v357 = module.resolve(p72(v, i))

			table.insert(t18, v357)

			local v358, v359 = v357:await()

			if not v358 then
				for _, iterValue4 in ipairs(t18) do
					iterValue4:cancel()
				end

				return p74(v359)
			end

			t17[i] = v359
		end

		p73(t17)
	end)
end
function module.is(p76)
	if type(p76) == "table" then
		local v140 = getmetatable(p76)

		if v140 == module then
			return true
		end

		if v140 == nil then
			local andThen = p76.andThen

			if type(andThen) == "function" then
				return true
			end

			local v142 = type(andThen) == "table" and getmetatable(andThen)

			if v142 and type((rawget(v142, "__call"))) == "function" then
				return true
			end
		elseif type(v140) == "table" and type((rawget(v140, "__index"))) == "table" then
			local v143 = rawget(v140, "__index")
			local v144 = rawget(v143, "andThen")
			local u145

			if type(v144) == "function" then
				u145 = true
			else
				local v146 = type(v144) == "table" and getmetatable(v144)

				u145 = if v146 and type((rawget(v146, "__call"))) == "function" then true else false
			end

			if u145 then
				return true
			end

			return false
		end

		return false
	end

	return false
end
function module.promisify(p77)
	return function(...)
		local _try = module._try
		local v363 = debug.traceback(nil, 2)

		return _try(v363, p77, ...)
	end
end

local u12 = nil
local connection = nil

function module.delay(p78: number)
	local typeName: string = type(p78)

	assert(typeName == "number", "Bad argument #1 to Promise.delay, must be a number.")

	if not (p78 >= 0.016666666666666666) or p78 == math.huge then
		p78 = 0.016666666666666666
	end

	local _new = module._new
	local v151 = debug.traceback(nil, 2)

	return _new(v151, function(p79, _, p81)
		local v367 = module._getTime()
		local n1 = v367 + p78
		local t20: {[any]: any} = { resolve = p79, startTime = v367, endTime = n1 }

		if connection == nil then
			u12 = t20
			connection = module._timeEvent:Connect(function()
				local v427 = module._getTime()

				while u12 ~= nil and v427 > u12.endTime do
					local v428 = u12

					u12 = v428.next

					if u12 == nil then
						connection:Disconnect()
						connection = nil
					else
						u12.previous = nil
					end

					local resolve = v428.resolve
					local v430 = module._getTime()

					resolve(v430 - v428.startTime)
				end
			end)
		elseif n1 > u12.endTime then
			local v370 = u12
			local v371 = v370.next

			while v371 ~= nil and n1 > v371.endTime do
				v370 = v371
				v371 = v370.next
			end

			v370.next = t20
			t20.previous = v370

			if v371 ~= nil then
				t20.next = v371
				v371.previous = t20
			end
		else
			t20.next = u12
			u12.previous = t20
			u12 = t20
		end

		p81(function()
			local next = t20.next

			if u12 == t20 then
				if next == nil then
					connection:Disconnect()
					connection = nil
				else
					next.previous = nil
				end

				u12 = next

				return
			end

			local previous = t20.previous

			previous.next = next

			if next ~= nil then
				next.previous = previous
			end
		end)
	end)
end
function module.prototype.timeout(p82, p83, p84)
	local v155 = debug.traceback(nil, 2)
	local race = module.race

	local v157 = module.delay(p83):andThen(function()
		local reject = module.reject
		local v373 = p84 == nil and t2.new({
			error = "Timed out",
			kind = t2.Kind.TimedOut,
			context = string.format("Timeout of %d seconds exceeded.\n:timeout() called at:\n\n%s", p83, v155)
		}) or p84

		return reject(v373)
	end)

	return race({ v157, p82 })
end
function module.prototype.getStatus(p85)
	return p85._status
end
function module.prototype._andThen(p86, p87, p88, p89)
	p86._unhandledRejection = false

	if p86._status == module.Status.Cancelled then
		local v163 = module.new(function()
		end)

		v163:cancel()

		return v163
	end

	return module._new(p87, function(p90, p91, p92)
		local u377 = p90

		if p88 then
			local v378 = p87
			local v379 = p88

			u377 = function(...)
				local v433, v434, v435 = runExecutor(v378, v379, ...)

				if v433 then
					p90(unpack(v435, 1, v434))

					return
				end

				p91(v435[1])
			end
		end

		local u380 = p91

		if p89 then
			local v381 = p87
			local v382 = p89

			u380 = function(...)
				local v436, v437, v438 = runExecutor(v381, v382, ...)

				if v436 then
					p90(unpack(v438, 1, v437))

					return
				end

				p91(v438[1])
			end
		end

		if p86._status == module.Status.Started then
			table.insert(p86._queuedResolve, u377)
			table.insert(p86._queuedReject, u380)
			p92(function()
				if p86._status == module.Status.Started then
					table.remove(p86._queuedResolve, table.find(p86._queuedResolve, u377))
					table.remove(p86._queuedReject, table.find(p86._queuedReject, u380))
				end
			end)
		elseif p86._status == module.Status.Resolved then
			u377(unpack(p86._values, 1, p86._valuesLength))
		elseif p86._status == module.Status.Rejected then
			u380(unpack(p86._values, 1, p86._valuesLength))
		end
	end, p86)
end
function module.prototype.andThen(p93, p94, p95)
	local u167: boolean = true

	if p94 ~= nil then
		if type(p94) == "function" then
			u167 = true
		else
			local v168 = type(p94) == "table" and getmetatable(p94)

			u167 = if v168 and type((rawget(v168, "__call"))) == "function" then true else false
		end
	end

	assert(u167, string.format("Please pass a handler function to %s!", "Promise:andThen"))
	u167 = true

	if p95 ~= nil then
		if type(p95) == "function" then
			u167 = true
		else
			local v169 = type(p95) == "table" and getmetatable(p95)

			u167 = if v169 and type((rawget(v169, "__call"))) == "function" then true else false
		end
	end

	assert(u167, string.format("Please pass a handler function to %s!", "Promise:andThen"))

	local v170 = debug.traceback(nil, 2)

	return p93:_andThen(v170, p94, p95)
end
function module.prototype.catch(p96, p97)
	local u173: boolean = true

	if p97 ~= nil then
		if type(p97) == "function" then
			u173 = true
		else
			local v174 = type(p97) == "table" and getmetatable(p97)

			u173 = if v174 and type((rawget(v174, "__call"))) == "function" then true else false
		end
	end

	assert(u173, string.format("Please pass a handler function to %s!", "Promise:catch"))

	local v175 = debug.traceback(nil, 2)

	return p96:_andThen(v175, nil, p97)
end
function module.prototype.tap(p98, p99)
	local u178

	if type(p99) == "function" then
		u178 = true
	else
		local v179 = type(p99) == "table" and getmetatable(p99)

		u178 = if v179 and type((rawget(v179, "__call"))) == "function" then true else false
	end

	assert(u178, string.format("Please pass a handler function to %s!", "Promise:tap"))

	local v180 = debug.traceback(nil, 2)

	return p98:_andThen(v180, function(...)
		local v383 = p99(...)

		if module.is(v383) then
			local v384, v385 = pack(...)

			return v383:andThen(function()
				return unpack(v385, 1, v384)
			end)
		end

		return ...
	end)
end
function module.prototype.andThenCall(p100, p101, ...)
	local u183

	if type(p101) == "function" then
		u183 = true
	else
		local v184 = type(p101) == "table" and getmetatable(p101)

		u183 = if v184 and type((rawget(v184, "__call"))) == "function" then true else false
	end

	assert(u183, string.format("Please pass a handler function to %s!", "Promise:andThenCall"))

	local v185, v186 = pack(...)
	local v187 = debug.traceback(nil, 2)

	return p100:_andThen(v187, function()
		return p101(unpack(v186, 1, v185))
	end)
end
function module.prototype.andThenReturn(p102, ...)
	local v189, v190 = pack(...)
	local v191 = debug.traceback(nil, 2)

	return p102:_andThen(v191, function()
		return unpack(v190, 1, v189)
	end)
end
function module.prototype.cancel(p103)
	if p103._status ~= module.Status.Started then
		return
	end

	p103._status = module.Status.Cancelled

	if p103._cancellationHook then
		p103._cancellationHook()
	end

	coroutine.close(p103._thread)

	if p103._parent then
		p103._parent:_consumerCancelled(p103)
	end

	for iterKey in pairs(p103._consumers) do
		iterKey:cancel()
	end

	p103:_finalize()
end
function module.prototype._consumerCancelled(p104, p105)
	if p104._status ~= module.Status.Started then
		return
	end

	p104._consumers[p105] = nil

	if next(p104._consumers) == nil then
		p104:cancel()
	end
end
function module.prototype._finally(p106, p107, p108)
	p106._unhandledRejection = false

	return (module._new(p107, function(p109, p110, p111)
		local u389 = nil

		p111(function()
			p106:_consumerCancelled(p106)

			if u389 then
				u389:cancel()
			end
		end)

		local v390 = p109

		if p108 then
			v390 = function(...)
				local v439 = p108(...)

				if module.is(v439) then
					u389 = v439
					v439:finally(function(p112)
						if p112 ~= module.Status.Rejected then
							p109(p106)
						end
					end):catch(function(...)
						p110(...)
					end)

					return
				end

				p109(p106)
			end
		end

		if p106._status == module.Status.Started then
			table.insert(p106._queuedFinally, v390)
		else
			v390(p106._status)
		end
	end))
end
function module.prototype.finally(p113, p114)
	local u201: boolean = true

	if p114 ~= nil then
		if type(p114) == "function" then
			u201 = true
		else
			local v202 = type(p114) == "table" and getmetatable(p114)

			u201 = if v202 and type((rawget(v202, "__call"))) == "function" then true else false
		end
	end

	assert(u201, string.format("Please pass a handler function to %s!", "Promise:finally"))

	local v203 = debug.traceback(nil, 2)

	return p113:_finally(v203, p114)
end
function module.prototype.finallyCall(p115, p116, ...)
	local u206

	if type(p116) == "function" then
		u206 = true
	else
		local v207 = type(p116) == "table" and getmetatable(p116)

		u206 = if v207 and type((rawget(v207, "__call"))) == "function" then true else false
	end

	assert(u206, string.format("Please pass a handler function to %s!", "Promise:finallyCall"))

	local v208, v209 = pack(...)
	local v210 = debug.traceback(nil, 2)

	return p115:_finally(v210, function()
		return p116(unpack(v209, 1, v208))
	end)
end
function module.prototype.finallyReturn(p117, ...)
	local v212, v213 = pack(...)
	local v214 = debug.traceback(nil, 2)

	return p117:_finally(v214, function()
		return unpack(v213, 1, v212)
	end)
end
function module.prototype.awaitStatus(p118)
	p118._unhandledRejection = false

	if p118._status == module.Status.Started then
		local v216 = coroutine.running()

		p118:finally(function()
			task.spawn(v216)
		end):catch(function()
		end)
		coroutine.yield()
	end

	if p118._status == module.Status.Resolved then
		return p118._status, unpack(p118._values, 1, p118._valuesLength)
	end

	if p118._status == module.Status.Rejected then
		return p118._status, unpack(p118._values, 1, p118._valuesLength)
	end

	return p118._status
end
local function awaitHelper(p119, ...)
	return p119 == module.Status.Resolved, ...
end
function module.prototype.await(p120)
	return awaitHelper(p120:awaitStatus())
end
local function expectHelper(p121, ...)
	if p121 ~= module.Status.Resolved then
		error(if ... == nil then "Expected Promise rejected with no value." else ..., 3)
	end

	return ...
end
function module.prototype.expect(p122)
	return expectHelper(p122:awaitStatus())
end

module.prototype.awaitValue = module.prototype.expect

function module.prototype._unwrap(p123)
	if p123._status == module.Status.Started then
		error("Promise has not resolved or rejected.", 2)
	end

	return p123._status == module.Status.Resolved, unpack(p123._values, 1, p123._valuesLength)
end
function module.prototype._resolve(p124, ...)
	if p124._status ~= module.Status.Started then
		if module.is(...) then
			(...):_consumerCancelled(p124)
		end

		return
	end

	if module.is(...) then
		if select("#", ...) > 1 then
			local formattedText = string.format("When returning a Promise from andThen, extra arguments are discarded! See:\n\n%s", p124._source)

			warn(formattedText)
		end

		local v224 = ...

		local v225 = v224:andThen(function(...)
			p124:_resolve(...)
		end, function(...)
			local v391 = v224._values[1]

			if v224._error then
				v391 = t2.new({
					context = "[No stack trace available as this Promise originated from an older version of the Promise library (< v2)]",
					error = v224._error,
					kind = t2.Kind.ExecutionError
				})
			end

			if t2.isKind(v391, t2.Kind.ExecutionError) then
				local formattedText = string.format("The Promise at:\n\n%s\n...Rejected because it was chained to the following Promise, which encountered an error:\n", p124._source)

				return p124:_reject(v391:extend({
					error = "This Promise was chained to a Promise that errored.",
					trace = "",
					context = formattedText
				}))
			end

			p124:_reject(...)
		end)

		if v225._status == module.Status.Cancelled then
			p124:cancel()
		elseif v225._status == module.Status.Started then
			p124._parent = v225
			v225._consumers[p124] = true
		end

		return
	end

	p124._status = module.Status.Resolved

	local v226, v227 = pack(...)

	p124._valuesLength = v226
	p124._values = v227

	for _, v in ipairs(p124._queuedResolve) do
		coroutine.wrap(v)(...)
	end

	p124:_finalize()
end
function module.prototype._reject(p125, ...)
	if p125._status ~= module.Status.Started then
		return
	end

	p125._status = module.Status.Rejected

	local v231, v232 = pack(...)

	p125._valuesLength = v231
	p125._values = v232

	if next(p125._queuedReject) ~= nil then
		for _, v in ipairs(p125._queuedReject) do
			coroutine.wrap(v)(...)
		end
	else
		local text: string = tostring(...)

		coroutine.wrap(function()
			module._timeEvent:Wait()

			if not p125._unhandledRejection then
				return
			end

			local formattedText = string.format("Unhandled Promise rejection:\n\n%s\n\n%s", text, p125._source)

			for _, v in ipairs(module._unhandledRejectionCallbacks) do
				task.spawn(v, p125, unpack(p125._values, 1, p125._valuesLength))
			end

			if module.TEST then
				return
			end

			warn(formattedText)
		end)()
	end

	p125:_finalize()
end
function module.prototype._finalize(p126)
	for _, v in ipairs(p126._queuedFinally) do
		coroutine.wrap(v)(p126._status)
	end

	p126._queuedFinally = nil
	p126._queuedReject = nil
	p126._queuedResolve = nil

	if not module.TEST then
		p126._parent = nil
		p126._consumers = nil
	end

	task.defer(coroutine.close, p126._thread)
end
function module.prototype.now(p127, p128)
	local v241 = debug.traceback(nil, 2)

	if p127._status == module.Status.Resolved then
		return p127:_andThen(v241, function(...)
			return ...
		end)
	end

	local reject = module.reject
	local v243 = p128 == nil and t2.new({
		error = "This Promise was not resolved in time for :now()",
		kind = t2.Kind.NotResolvedInTime,
		context = ":now() was called at:\n\n" .. v241
	}) or p128

	return reject(v243)
end
function module.retry(p129, p130, ...)
	local u246

	if type(p129) == "function" then
		u246 = true
	else
		local v247 = type(p129) == "table" and getmetatable(p129)

		u246 = if v247 and type((rawget(v247, "__call"))) == "function" then true else false
	end

	assert(u246, "Parameter #1 to Promise.retry must be a function")

	local typeName: string = type(p130)

	assert(typeName == "number", "Parameter #2 to Promise.retry must be a number")

	local v249 = select("#", ...)
	local t10: {[any]: any} = { ... }

	return module.resolve(p129(...)):catch(function(...)
		if p130 > 0 then
			return module.retry(p129, p130 - 1, unpack(t10, 1, v249))
		end

		return module.reject(...)
	end)
end
function module.retryWithDelay(p131, p132, p133, ...)
	local u254

	if type(p131) == "function" then
		u254 = true
	else
		local v255 = type(p131) == "table" and getmetatable(p131)

		u254 = if v255 and type((rawget(v255, "__call"))) == "function" then true else false
	end

	assert(u254, "Parameter #1 to Promise.retry must be a function")

	local typeName: string = type(p132)

	assert(typeName == "number", "Parameter #2 (times) to Promise.retry must be a number")

	local typeName2: string = type(p133)

	assert(typeName2 == "number", "Parameter #3 (seconds) to Promise.retry must be a number")

	local v258 = select("#", ...)
	local t11: {[any]: any} = { ... }

	return module.resolve(p131(...)):catch(function(...)
		if p132 > 0 then
			module.delay(p133):await()

			return module.retryWithDelay(p131, p132 - 1, p133, unpack(t11, 1, v258))
		end

		return module.reject(...)
	end)
end
function module.fromEvent(p134, p135)
	local u262 = p135 or function()
		return true
	end

	local _new = module._new
	local v264 = debug.traceback(nil, 2)

	return _new(v264, function(p136, _, p138)
		local connection = nil
		local u400: boolean = false

		connection = p134:Connect(function(...)
			local v440 = u262(...)

			if v440 == true then
				p136(...)

				if connection then
					connection:Disconnect()
					connection = nil

					return
				end

				u400 = true

				return
			end

			if type(v440) ~= "boolean" then
				error("Promise.fromEvent predicate should always return a boolean")
			end
		end)
		p138(function()
			connection:Disconnect()
			connection = nil
		end)
	end)
end
function module.onUnhandledRejection(p139)
	table.insert(module._unhandledRejectionCallbacks, p139)

	return function()
		local v401 = table.find(module._unhandledRejectionCallbacks, p139)

		if v401 then
			table.remove(module._unhandledRejectionCallbacks, v401)
		end
	end
end

return module
