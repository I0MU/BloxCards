



local function Count(p1)
	local n1: number = 0

	for _, _ in pairs(p1) do
		n1 += 1
	end

	return n1
end
local function CopyAndAppendTable(p2, p3)
	local t1: {[any]: any} = {}

	for k, v in pairs(p2) do
		t1[k] = v
	end

	for k, v in pairs(p3) do
		t1[k] = v
	end

	return t1
end

local u3 = nil

u3 = function(p4, p5, p6)
	local v23 = p6 or tostring(p4)

	for k, v in pairs(p4) do
		local v26 = string.rep("  ", p5 or 0)
		local text: string = tostring(k)
		local s1: string = "\n" .. v26 .. text .. ": "

		v23 = if type(v) == "table" then u3(v, k + 1, v23 .. s1) else v23 .. s1 .. tostring(v)
	end

	return v23
end

local function Append(p7, p8, p9)
	if p9 then
		for _, v in pairs(p8) do
			if p9(v) then
				table.insert(p7, v)
			end
		end

		return p7
	end

	for _, v in pairs(p8) do
		table.insert(p7, v)
	end

	return p7
end
local function DirectAppend(p10, p11, p12)
	if p12 then
		for k, v in pairs(p11) do
			if p12(v) then
				p10[k] = v
			end
		end

		return p10
	end

	for k, v in pairs(p11) do
		p10[k] = v
	end

	return p10
end
local function CopyTable(p13)
	if type(p13) == "table" then
		local t2: {[any]: any} = {}

		for k, v in pairs(p13) do
			t2[k] = v
		end

		return t2
	end

	return p13
end
function DeepCopyTable(p14)
	if type(p14) == "table" then
		local t3: {[any]: any} = {}

		for k, v in pairs(p14) do
			local v51 = (nil)(k)

			t3[v51] = (nil)(v)
		end

		local v52 = getmetatable(p14)

		setmetatable(t3, (nil)(v52))

		return t3
	end

	return p14
end
local function Swap(p15, p16, p17)
	local v56 = p15[p16]

	p15[p16] = p15[p17]
	p15[p17] = v56
end
local function ShellSort(p18, p19)
	local n1 = #p18

	repeat
		repeat
			local u60: boolean = false
			local n2: number = 1

			while #p18 >= n2 + n1 do
				local v62 = p19(p18[n2])
				local v63 = p19(p18[n2 + n1])

				if v62 > v63 then
					local n3: number = n2 + n1
					local v65 = p18[n2]

					p18[n2] = p18[n3]
					p18[n3] = v65
					u60 = true
				end

				n2 += 1
			end
		until not u60

		n1 = math.floor(n1 / 2)
	until n1 == 0
end

return {
	Count = Count,
	count = Count,
	CopyAndAppend = CopyAndAppendTable,
	copyAndAppend = CopyAndAppendTable,
	copy_and_append = CopyAndAppendTable,
	GetStringTable = u3,
	getStringTable = u3,
	get_string_table = u3,
	Append = Append,
	append = Append,
	DirectAppend = DirectAppend,
	directAppend = DirectAppend,
	Copy = CopyTable,
	copy = CopyTable,
	DeepCopy = DeepCopyTable,
	deepCopy = DeepCopyTable,
	deep_copy = DeepCopyTable,
	ShellSort = ShellSort,
	shellSort = ShellSort,
	shell_sort = ShellSort
}
