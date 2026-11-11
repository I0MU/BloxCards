



local replicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")
local audioService = require(replicatedStorage.AudioService)

local function getClosingTag(p1)
	return "</" .. p1:match("<%s*(%w+)") .. ">"
end
local function buildClosingTags(p2)
	local t1: {[any]: any} = {}

	for i = #p2, 1, -1 do
		t1[#t1 + 1] = "</" .. p2[i]:match("<%s*(%w+)") .. ">"
	end

	return table.concat(t1)
end

return {
	Play = function(p3, p4, p5)
		local n1 = 1
		local s1: string = ""
		local s2: string = ""
		local t2: {[any]: any} = {}
		local n2: number = 0

		while n1 <= #p4 do
			local substring = p4:sub(n1, n1)

			if substring == "<" then
				local v18 = p4:find(">", n1)
				local substring2 = p4:sub(n1, v18)

				if #s2 > 0 then
					local v20 = table.concat(t2)
					local v21 = buildClosingTags(t2)

					s1 = s1 .. v20 .. s2 .. v21
					s2 = ""
				end

				if substring2:sub(2, 2) == "/" then
					table.remove(t2)
				else
					table.insert(t2, substring2)
				end

				n1 = v18 + 1
			else
				s2 ..= substring

				local v22 = table.concat(t2)
				local v23 = buildClosingTags(t2)

				p3.Text = s1 .. v22 .. s2 .. v23
				n2 += 1

				if n2 % 2 == 0 then
					pcall(function()
						audioService.PlaySound("textblip")
					end)
				end

				task.wait(p5)
				n1 += 1
			end
		end

		if #s2 > 0 then
			local v24 = table.concat(t2)
			local v25 = buildClosingTags(t2)

			s1 = s1 .. v24 .. s2 .. v25
		end

		p3.Text = s1
	end
}
