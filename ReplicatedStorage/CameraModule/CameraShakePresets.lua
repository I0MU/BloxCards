



local cameraShakeInstance = require(script.Parent.CameraShakeInstance)

local t1: {[any]: any} = {
	Punch = function()
		local v3 = cameraShakeInstance.new(5, 18, 0, 1)

		v3.PositionInfluence = Vector3.new(0.5, 0.5, 0.5)
		v3.RotationInfluence = Vector3.new(4, 1, 1)

		return v3
	end
}

return (setmetatable({}, {
	__index = function(_, p2)
		local v6 = t1[p2]

		if type(v6) == "function" then
			return v6()
		end

		error("No preset found with index \"" .. p2 .. "\"")
	end
}))
