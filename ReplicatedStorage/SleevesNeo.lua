



require(script._types)

local function SleevesEqual(p1, p2)
	return p1.Id == p2.Id
end

local module: {[any]: any} = {
	_onIngestCallbacks = {},
	Sleeves = {},
	Ingest = function(p3, p4, _)
		for _, v in ipairs(p4) do
			v.Index = #p3.Sleeves
			v.__eq = SleevesEqual
			table.insert(p3.Sleeves, v)
		end

		for _, v in ipairs(p3._onIngestCallbacks) do
			if not pcall(function()
				v.Callback(p4)
			end) then
				warn("[SLEEVES] Unhandled error in ingest callback from " .. v.TraceName)
			end
		end

		return p4
	end,
	AddIngestCallback = function(p6, callback, p8, p9)
		if typeof(callback) == "function" then
			if p8 then
				for _, v in ipairs(p6._onIngestCallbacks) do
					if p8 == v.TraceName then
						warn("[SLEEVES] Duplicate ingest callback '" .. p8 .. "' registered, ignoring...")

						return
					end
				end
			end

			local t2: {[any]: any} = { Callback = callback, TraceName = p8 or "(unknown source)" }

			table.insert(p6._onIngestCallbacks, t2)

			if p9 == true and not pcall(function()
				callback(p6.Sleeves)
			end) then
				warn("[SLEEVES] Unhandled error in ingest callback from " .. t2.TraceName)
			end

			return
		end

		local typeName: string = typeof(callback)

		error("[SLEEVES] Expected function for ingest callback, got " .. typeName .. " instead.")
	end
}

for _, v in pairs(script:GetChildren()) do
	if v.Name:sub(1, 1) ~= "_" then
		if not v:IsA("ModuleScript") then
			warn("[SLEEVES] Submodule " .. v.Name .. " is not a ModuleScript! Prefix children you want to skip with '_'")
		else
			local v5 = require(v)

			if typeof(v5) == "table" then
				module:Ingest(v5, v.Name)
			else
				warn("[SLEEVES] Submodule " .. v.Name .. " does not export a table! Prefix children you want to skip with '_'")
			end
		end
	end
end

return module
