





local uDim2New = UDim2.new
local clamp = require(game.ReplicatedStorage.Utils).Clamp
local audioService = require(game.ReplicatedStorage.AudioService)

local function v4(p1)
	if game:GetService("RunService"):IsStudio() then
		print(p1)
	end
end

local module: {[any]: any} = {
	SelectPackFromName = function(p2, p3)
		for i = 1, #p2.packs do
			if p3 == p2.packs[i].Name then
				p2:SelectPack(i)

				return
			end
		end

		p2:SelectPack(1)
	end,
	SelectPack = function(p4, p5)
		if p4.Locked then
			return
		end

		local currentpacknumber = p4.currentpacknumber

		p4.currentpacknumber = clamp(1, #p4.packs, p5)

		local text: string = tostring(p5)
		local text2: string = tostring(currentpacknumber)

		if game:GetService("RunService"):IsStudio() then
			print("SelectPack called with " .. text .. " | previous: " .. text2)
		end

		p4:Redraw()

		if p4.ExternalUpdate then
			p4.ExternalUpdate(p4.packs[p4.currentpacknumber])
		end

		return p4.packs[p4.currentpacknumber]
	end
}

function module.new(physical, p7, p8, p9, p10)
	local t2: {[any]: any} = {
		currentpacknumber = 1,
		overlap = p7,
		cardsize = p8,
		packs = p9 or {},
		scale = p10 or 0.5
	}

	setmetatable(t2, { __index = module })
	t2.Physical = physical
	physical.TouchSwipe:connect(function(p11)
		audioService.PlaySound("Draw")

		if p11 == Enum.SwipeDirection.Left then
			t2:SelectPack(t2.currentpacknumber - 1)
		elseif p11 == Enum.SwipeDirection.Right then
			t2:SelectPack(t2.currentpacknumber + 1)
		end
	end)
	physical.MouseWheelBackward:connect(function()
		audioService.PlaySound("Draw")
		t2:SelectPack(t2.currentpacknumber + 1)
	end)
	physical.MouseWheelForward:connect(function()
		audioService.PlaySound("Draw")
		t2:SelectPack(t2.currentpacknumber - 1)
	end)

	return t2
end
function module.Redraw(p12)
	local physical = p12.Physical
	local cardsize = p12.cardsize
	local packs = p12.packs
	local currentpacknumber = p12.currentpacknumber
	local scale = p12.scale
	local physicalAbsolutePosition = physical.AbsolutePosition
	local y = physical.AbsoluteSize.Y
	local n1 = y / cardsize.y * cardsize.x
	local n2 = n1 / (1 + p12.overlap)
	local v31 = uDim2New(0, n1, 0, y)
	local v32 = packs[currentpacknumber]

	if v32 then
		local v33 = uDim2New(0.5, -n1 / 2, 0.5, -y / 2)

		if v32.Physical then v32.Physical:TweenSizeAndPosition(v31, v33, "Out", "Quad", 0.25, true) end
	end

	for k, v in pairs(packs) do
		if k ~= currentpacknumber then
			local n3 = k - currentpacknumber
			local n4 = if n3 < 0 then -1 else 1

			if n4 == 1 then
				n3 -= 1
			end

			local absoluteValue = math.abs(n3)
			local n5 = (n1 / 2 + n2 * scale * absoluteValue) * n4

			if n4 == 1 then
				n5 += (n2 - n1) / 2
			end

			n4 = uDim2New(0, n1 * scale, 0, y * scale)

			local uDim2 = UDim2.new(0.5, n5, 0.5, -n4.Y.Offset / 2)

			if v.Physical then v.Physical:TweenSizeAndPosition(n4, uDim2, "Out", "Quad", 0.25, true) end
		end
	end
end
function module.Add(p13, p14)
	table.insert(p13.packs, p14)
end
function module.Remove(p15, p16)
	table.remove(p15.packs, p16)
end

print("Finished loading " .. script.Name)

return module
