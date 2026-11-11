





local client = require(script.Parent.Network).client
local contentProvider: ContentProvider = game:GetService("ContentProvider")

local function normalizeId(p1)
	if type(p1) == "number" then
		return "rbxassetid://" .. p1
	end

	local typeName

	if type(p1) == "string" then
		if p1:match("^rbxassetid://") then
			return p1
		end

		local numberValue: number? = tonumber(p1)

		if numberValue then
			return "rbxassetid://" .. numberValue
		end

		typeName = typeof(p1)
		warn("[PreloadService] Invalid asset ID (skipped):", p1, "type:", typeName)

		return nil
	end

	typeName = typeof(p1)
	warn("[PreloadService] Invalid asset ID (skipped):", p1, "type:", typeName)

	return nil
end
function client.Preload(p2)
	for _, v in pairs(p2) do
		if type(v) == "table" then
			for _, iterValue in pairs(v) do
				local v14 = normalizeId(iterValue)

				if v14 then
					contentProvider:Preload(v14)
				end
			end
		else
			local v15 = normalizeId(v)

			if v15 then
				contentProvider:Preload(v15)
			end
		end
	end
end

local clientPreload = client.Preload

function client.PreloadAsync(p3)
	task.spawn(function()
		local t1: {[any]: any} = {}

		for _, v in pairs(p3) do
			if type(v) == "table" then
				for _, iterValue in pairs(v) do
					local v22 = normalizeId(iterValue)

					if v22 then
						table.insert(t1, v22)
					end
				end
			else
				local v23 = normalizeId(v)

				if v23 then
					table.insert(t1, v23)
				end
			end
		end

		if #t1 > 0 then
			contentProvider:PreloadAsync(t1)
			print("Preload finished for", #t1, "assets")
		end
	end)
end

local clientPreloadAsync = client.PreloadAsync

print("Finished loading " .. script.Name)

return { Preload = clientPreload, PreloadAsync = clientPreloadAsync }
