



local replicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")
local lerpNumber = require(replicatedStorage:WaitForChild("NevermoreEngine")).LoadLibrary("qMath").LerpNumber

return {
	LerpUDim2 = function(p1, p2, p3)
		local uDim2New = UDim2.new
		local v7 = lerpNumber(p1.X.Scale, p2.X.Scale, p3)
		local v8 = lerpNumber(p1.X.Offset, p2.X.Offset, p3)
		local v9 = lerpNumber(p1.Y.Scale, p2.Y.Scale, p3)

		return uDim2New(v7, v8, v9, lerpNumber(p1.Y.Offset, p2.Y.Offset, p3))
	end,
	Mult = function(p4, p5)
		return UDim2.new(p4.X.Scale * p5.X.Scale, p4.X.Offset * p5.X.Offset, p4.Y.Scale * p5.Y.Scale, p4.Y.Offset * p5.Y.Offset)
	end,
	Divide = function(p6, p7)
		return UDim2.new(p6.X.Scale / p7.X.Scale, p6.X.Offset / p7.X.Offset, p6.Y.Scale / p7.Y.Scale, p6.Y.Offset / p7.Y.Offset)
	end
}
