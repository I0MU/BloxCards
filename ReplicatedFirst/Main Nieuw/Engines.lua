





local t1: {[any]: any} = {}
local t2: {[any]: any} = {}

function RemoveEngine(p1)
	t2[#t2 + 1] = p1
end

spawn(function()
	local runService: RunService = game:GetService("RunService")
	local v5 = tick

	runService.Stepped:connect(function(_, _)
		local v8, v9 = runService.Stepped:wait()
		local v10 = v5()

		for _, v in pairs(t1) do
			v(v9, v10)
		end

		for i = 1, #t2 do
			t1[t2[i]] = nil
			t2[i] = nil
		end
	end)
end)
print("Finished loading " .. script.Name)

return { engines = t1, RemoveEngine = RemoveEngine }
