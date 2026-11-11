



local t1: {[any]: any} = {
	AddValue = function(p1, className, p3)
		local foundChild = p1.Container:FindFirstChild(p3.Name)

		if not foundChild then
			local v7 = Instance.new(className)

			for k, v in pairs(p3) do
				v7[k] = v
			end

			v7.Parent = p1.Container

			return
		end

		if not foundChild:IsA(className) then
			local text: string = tostring(p3.Name)

			error("Value '" .. text .. "' already exists in the configuration, but is the wrong class type")
		end
	end,
	GetValue = function(p4, p5)
		local foundChild = p4.Container:FindFirstChild(p5)

		if not foundChild then
			local text: string = tostring(p5)

			foundChild = error("Value '" .. text .. "' does not exist in EasyConfiguration")
		end

		return foundChild
	end
}

t1.Get = t1.GetValue
t1.Add = t1.AddValue

local t2: {[any]: any} = {
	__index = function(p6, p7)
		if t1[p7] then
			return t1[p7]
		end

		local v17 = p6:GetValue(p7)

		return v17 and v17.Value
	end,
	__newindex = function(p8, p9, value)
		local v21 = p8:GetValue(p9)

		v21.Value = value
	end
}

return {
	MakeEasyConfiguration = function(p11)
		return (setmetatable({ Container = p11 }, t2))
	end,
	AddSubDataLayer = function(name, p13)
		if p13:FindFirstChild(name) then
			return p13[name]
		end

		local folder: Folder = Instance.new("Folder", p13)

		folder.Name = name

		return folder
	end
}
