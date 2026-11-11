



local function MakeCircularBuffer(p1, p2)
	local t1 = p2 or {}
	local n1 = p1 + 1

	return {
		BufferSize = n1,
		Add = function(_, p4)
			table.insert(t1, 1, p4)

			local v8 = t1[n1]

			t1[n1] = nil

			return v8
		end,
		GetData = function(_)
			return t1
		end,
		Replace = function(_, p7, p8)
			local v13 = t1[p7]

			if v13 == nil then
				error("[CircularBuffer] - Data[" .. p7 .. "] does not exist. Cannot replace")

				return v13
			end

			t1[p7] = p8

			return v13
		end,
		Insert = function(_, p10, p11)
			table.insert(t1, p10, p11)

			local v17 = t1[n1]

			t1[n1] = nil

			return v17
		end
	}
end

return {
	MakeCircularBuffer = MakeCircularBuffer,
	makeCircularBuffer = MakeCircularBuffer,
	make_circular_buffer = MakeCircularBuffer,
	New = MakeCircularBuffer,
	new = MakeCircularBuffer
}
