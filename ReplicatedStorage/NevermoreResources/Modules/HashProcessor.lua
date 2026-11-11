



local renderStepped = game:GetService("RunService").RenderStepped
local module: {[any]: any} = {}

module.__index = module

function module.new(onProcess, onAddition, onRemoval)
	local t2: {[any]: any} = {}

	setmetatable(t2, module)
	t2.Processing = false
	t2.ProcessHash = {}
	t2.OnProcess = onProcess
	t2.OnAddition = onAddition
	t2.OnRemoval = onRemoval
	t2.ProcessCoroutine = coroutine.create(function()
		local v24

		while true do
			renderStepped:wait()
			v24 = t2:Process()

			if v24 <= 0 then
				t2.Processing = false
				coroutine.yield()
			end

			continue
		end
	end)

	return t2
end
function module.Process(p4)
	local n1: number = 0
	local processHash = p4.ProcessHash

	for k, v in pairs(p4.ProcessHash) do
		p4:OnProcess(k, v)

		if processHash[k] ~= nil then
			n1 += 1
		end
	end

	return n1
end
function module.Resume(p5)
	if not p5.Processing then
		p5.Processing = true
		assert(coroutine.resume(p5.ProcessCoroutine))
	end
end
function module.Add(p6, p7, p8, ...)
	assert(p6.OnProcess, "The processor has no OnProcess function")
	p6:Remove(p7)
	p6:OnAddition(p7, p8, ...)
	p6.ProcessHash[p7] = p8
	p6:Resume()
end
function module.Get(p9, p10)
	return p9.ProcessHash[p10]
end
function module.SwitchIndex(p11, p12, p13)
	assert(p11.ProcessHash[p13] == nil, "The new index must be empty")
	assert(p13 ~= p12, "The old index cannot equal the new index")
	p11.ProcessHash[p13] = p11.ProcessHash[p12]
	p11.ProcessHash[p12] = nil
end
function module.Remove(p14, p15)
	local v23 = p14.ProcessHash[p15]

	if v23 ~= nil then
		p14:OnRemoval(p15, v23)
		p14.ProcessHash[p15] = nil
	end
end

return module
