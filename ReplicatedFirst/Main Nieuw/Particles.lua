



local t1: {[any]: any} = {}



local function UpdateBatch(_, _)
end

game:GetService("RunService").Stepped:connect(function(_, _)
	for _, _ in pairs(t1) do
	end
end)
print("Finished loading " .. script.Name)

return function(p5, p6)
	local t2: {[any]: any} = {
		Particles = {},
		Holder = p5
	}

	for k, v in pairs(p6) do
		t2[k] = v
	end
end
