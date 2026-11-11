



local module: {[any]: any} = {}

module.__index = module
module.ClassName = "HeldInput"
module.DelayTime = 0.2
module.InitialDelayTime = 0.2

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

		p2.RepeatFunction()
		delay(p2.InitialDelayTime, function()
			while pressId == p2.PressId do
				p2.RepeatFunction(p3)
				wait(p2.DelayTime)
			end
		end)
	elseif p3.Name == "End" then
		p2:Stop()
	end
end
function module.Stop(p4)
	p4.PressId = p4.PressId + 1
end
function module.WithDelayTime(p5, delayTime)
	p5.DelayTime = delayTime

	return p5
end
function module.WithInitialDelayTime(p7, initialDelayTime)
	p7.InitialDelayTime = initialDelayTime

	return p7
end

return module
