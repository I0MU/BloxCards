



local replicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")
local make = require(replicatedStorage:WaitForChild("NevermoreEngine")).LoadLibrary("qSystems").Make
local className: {[any]: any} = {}

className.__index = className
className.ClassName = className
className.Types = {
	TopLeft = Vector2.new(0, 0),
	TopRight = Vector2.new(1, 0),
	BottomLeft = Vector2.new(0, 1),
	BottomRight = Vector2.new(1, 1),
	Middle = Vector2.new(0.5, 0.5),
	MiddleLeft = Vector2.new(0, 0.5),
	MiddleRight = Vector2.new(1, 0.5),
	MiddleTop = Vector2.new(0.5, 0),
	MiddleBottom = Vector2.new(0.5, 1)
}

function className.new(p1)
	local object = setmetatable({}, className)

	object.RelativePosition = object.Types.Middle
	object.SizeConstraint = "RelativeXY"
	object.Name = "RelativeFrame"

	if p1 then
		className:WithParent(p1)
	end

	return object
end
function className.WithType(p2, p3)
	p2.Name = p3 or error("Sent invalid name")

	local v8 = p2.Types[p3] or error("Not a default type")

	return p2:WithPosition(v8)
end
function className.WithPosition(p4, p5)
	p4.RelativePosition = p5 or error()

	return p4
end
function className.WithSizeConstraint(p6, p7)
	p6.SizeConstraint = p7 or error()

	return p6
end
function className.WithParent(p8, parent)
	p8.Parent = parent

	return p8
end
function className.Create(p10)
	local parent = p10.Parent
	local uDim2 = UDim2.new(p10.RelativePosition.X, 0, p10.RelativePosition.Y, 0)

	return make("Frame", {
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		Parent = parent,
		Size = UDim2.new(1, 0, 1, 0),
		Position = uDim2,
		Name = p10.Name,
		SizeConstraint = p10.SizeConstraint
	})
end

return className
