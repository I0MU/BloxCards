



local t1: {[any]: any} = {}

t1.__index = t1

local function finish(p1, p2)
	local v10 = p2 or 4

	for _, v in ipairs(p1.queue) do
		if v10 == 3 then
			v:resolve(p1.value)
		else
			v:reject(p1.value)
		end
	end

	p1.state = v10
end
local function isfunction(p3)
	if type(p3) == "table" then
		local v14 = getmetatable(p3)

		return v14 ~= nil and type(v14.__call) == "function"
	end

	return type(p3) == "function"
end
local function promise(p4, p5, p6, p7, p8)
	local typeName: string = type(p4)
	local u21

	if typeName == "table" and type(p4.value) == "table" then
		local u22

		if type(p5) == "table" then
			local v23 = getmetatable(p5)

			u22 = v23 ~= nil and type(v23.__call) == "function"
		else
			u22 = type(p5) == "function"
		end

		if u22 then
			u21 = false

			local ok, result = pcall(p5, p4.value, function(p9)
				if u21 then
					return
				end

				u21 = true
				p4.value = p9
				p6()
			end, function(p10)
				if u21 then
					return
				end

				u21 = true
				p4.value = p10
				p7()
			end)

			if not ok and not u21 then
				p4.value = result
				p7()
			end

			return
		end

		u21 = p8
		u21()

		return
	end

	u21 = p8
	u21()
end
local function fire(p11)
	local next = nil

	if type(p11.value) == "table" then
		next = p11.value.next
	end

	promise(p11, next, function()
		p11.state = 1
		fire(p11)
	end, function()
		p11.state = 2
		fire(p11)
	end, function()
		local v61
		local v62
		local v63
		local typeName
		local v65
		local u66
		local typeName2
		local typeName3
		local v69
		local v70
		local v71
		local typeName4
		local v73
		local u74
		local typeName5
		local typeName6
		local v77
		local v78
		local v79
		local v80
		local v81
		local v82
		local v83

		v61 = nil
		v62 = nil

		if p11.state == 1 then
			v63 = p11.success
			typeName = type(v63)

			if typeName == "table" then
				v65 = getmetatable(v63)
				u66 = false

				if v65 == nil then
				else
					typeName2 = type(v65.__call)
					u66 = typeName2 == "function"
				end
			else
				typeName3 = type(v63)
				u66 = typeName3 == "function"
			end

			if u66 then
				v69, v70 = pcall(p11.success, p11.value)
				v61 = v69
				v62 = v70
			else
				if p11.state == 2 then
					v71 = p11.failure
					typeName4 = type(v71)

					if typeName4 == "table" then
						v73 = getmetatable(v71)
						u74 = false

						if v73 == nil then
						else
							typeName5 = type(v73.__call)
							u74 = typeName5 == "function"
						end
					else
						typeName6 = type(v71)
						u74 = typeName6 == "function"
					end

					if u74 then
						v77, v78 = pcall(p11.failure, p11.value)
						v61 = v77
						v62 = v78

						if v61 then
							p11.state = 1
						end
					end
				end
			end
		else
			if p11.state == 2 then
				v71 = p11.failure
				typeName4 = type(v71)

				if typeName4 == "table" then
					v73 = getmetatable(v71)
					u74 = false

					if v73 == nil then
					else
						typeName5 = type(v73.__call)
						u74 = typeName5 == "function"
					end
				else
					typeName6 = type(v71)
					u74 = typeName6 == "function"
				end

				if u74 then
					v77, v78 = pcall(p11.failure, p11.value)
					v61 = v77
					v62 = v78

					if v61 then
						p11.state = 1
					end
				end
			end
		end

		if v61 == nil then
			if p11.value == p11 then
				v79 = p11
				v80 = pcall(error, "resolving promise with itself")
				v79.value = v80

				return finish(p11)
			else
				v81 = function()
					finish(p11, 3)
				end
				v82 = function(p12)
					finish(p11, p12)
				end
				v83 = function()
					local u96 = false

					if p11.state == 1 then
						u96 = 3
					end

					finish(p11, u96)
				end
				promise(p11, next, v81, v82, v83)

				return
			end
		else
			if v61 then
				p11.value = v62

				if p11.value == p11 then
					v79 = p11
					v80 = pcall(error, "resolving promise with itself")
					v79.value = v80

					return finish(p11)
				else
					v81 = function()
						finish(p11, 3)
					end
					v82 = function(p12)
						finish(p11, p12)
					end
					v83 = function()
						local u96 = false

						if p11.state == 1 then
							u96 = 3
						end

						finish(p11, u96)
					end
					promise(p11, next, v81, v82, v83)

					return
				end
			else
				p11.value = v62

				return finish(p11)
			end
		end
	end)
end
local function resolve(p13, p14, p15)
	if p13.state == 0 then
		p13.value = p15
		p13.state = p14
		fire(p13)
	end

	return p13
end
function t1.resolve(p16, p17)
	if p16.state == 0 then
		p16.value = p17
		p16.state = 1
		fire(p16)
	end

	return p16
end
function t1.reject(p18, p19)
	if p18.state == 0 then
		p18.value = p19
		p18.state = 2
		fire(p18)
	end

	return p18
end

local module: {[any]: any} = {}

function module.new(p20)
	local t3 = p20 or {}
	local object = nil
	object = {
		state = 0,
		next = function(_, p22, p23)
			local v87 = module.new({ success = p22, failure = p23, extend = t3.extend })

			if object.state == 3 then
				v87:resolve(object.value)

				return v87
			end

			if object.state == 4 then
				v87:reject(object.value)

				return v87
			end

			table.insert(object.queue, v87)

			return v87
		end,
		queue = {},
		success = t3.success,
		failure = t3.failure
	}
	object = setmetatable(object, t1)

	local extend = t3.extend
	local u39

	if type(extend) == "table" then
		local v40 = getmetatable(extend)

		u39 = v40 ~= nil and type(v40.__call) == "function"
	else
		u39 = type(extend) == "function"
	end

	if u39 then
		t3.extend(object)
	end

	return object
end
function module.all(p24)
	local v42 = module.new()

	if #p24 == 0 then
		return v42:resolve({})
	end

	local s1: string = "resolve"
	local n1: number = #p24
	local t4: {[any]: any} = {}

	local function synchronizer(p25, p26)
		return function(p27)
			t4[p25] = p27

			if not p26 then
				s1 = "reject"
			end

			n1 -= 1

			if n1 == 0 then
				v42[s1](v42, t4)
			end

			return p27
		end
	end

	for i = 1, n1 do
		local u48: boolean = true
		local u49: boolean = false

		p24[i]:next(function(p28)
			t4[i] = p28

			if not u48 then
				s1 = "reject"
			end

			n1 -= 1

			if n1 == 0 then
				v42[s1](v42, t4)
			end

			return p28
		end, function(p29)
			t4[i] = p29

			if not u49 then
				s1 = "reject"
			end

			n1 -= 1

			if n1 == 0 then
				v42[s1](v42, t4)
			end

			return p29
		end)
	end

	return v42
end
function module.map(p30, p31)
	local v52 = module.new()
	local t5: {[any]: any} = {}

	local function donext(p32)
		if p32 > #p30 then
			v52:resolve(t5)

			return
		end

		p31(p30[p32]):next(function(p33)
			table.insert(t5, p33)
			donext(p32 + 1)
		end, function(p34)
			v52:reject(p34)
		end)
	end

	donext(1)

	return v52
end
function module.first(p35)
	local v56 = module.new()

	for _, v in ipairs(p35) do
		v:next(function(p36)
			v56:resolve(p36)
		end, function(p37)
			v56:reject(p37)
		end)
	end

	return v56
end

return module
