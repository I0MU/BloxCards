



local runService: RunService = game:GetService("RunService")
local module: {[any]: any} = {}

module.__index = module
module.ClassName = "HeldRateInput"
module.Rate = 0.25
module.Acceleration = 1.1

function module.new(p1)
	local t2: {[any]: any} = {}

	setmetatable(t2, module)
	t2.RepeatFunction = p1 or error("No repeating function")
	t2.PressId = 0

	return t2
end
function module.HandleNewState(p2, p3)
	if p3.Name == "Begin" then
		p2.PressId = p2.PressId + 1

		local pressId = p2.PressId
		local timestamp = tick()
		local u9 = timestamp

		p2.RepeatFunction(1, Enum.UserInputState.Begin)

		local s1: string = tostring(p2) .. "_HeldKey" .. pressId

		runService:BindToRenderStep(s1, 101, function()
			local timestamp2 = tick()
			local n1 = timestamp2 - u9

			u9 = timestamp2

			local n2 = p2.Acceleration ^ (timestamp2 - timestamp) * p2.Acceleration ^ n1 - 1
			local v15 = math.log(p2.Acceleration)
			local n3 = n2 / v15 * p2.Rate

			if pressId == p2.PressId then
				p2.RepeatFunction(n3, Enum.UserInputState.Change)

				return
			end

			p2.RepeatFunction(n3, Enum.UserInputState.End)
			runService:UnbindFromRenderStep(s1)
		end)
	elseif p3.Name == "End" then
		p2:Stop()
	end
end
function module.Stop(p4)
	p4.PressId = p4.PressId + 1
end

return module
