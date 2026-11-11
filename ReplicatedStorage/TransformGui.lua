



local userInputService: UserInputService = game:GetService("UserInputService")
local module: {[any]: any} = {}

module.__index = module

function module.new(p1, p2)
	local object = setmetatable({}, module)

	object.guiObject = p1
	object.ignoreGuiInsetEnabled = p2
	object.resizing = false
	object.dragging = false
	object._onResizeBeginEvent = Instance.new("BindableEvent")
	object._onResizeChangedEvent = Instance.new("BindableEvent")
	object._onResizeEndedEvent = Instance.new("BindableEvent")
	object._onDragBeginEvent = Instance.new("BindableEvent")
	object._onDragChangedEvent = Instance.new("BindableEvent")
	object._onDragEndedEvent = Instance.new("BindableEvent")
	object.onResizeBegin = object._onResizeBeginEvent.Event
	object.onResizeChanged = object._onResizeChangedEvent.Event
	object.onResizeEnded = object._onResizeEndedEvent.Event
	object.onDragBegin = object._onDragBeginEvent.Event
	object.onDragChanged = object._onDragChangedEvent.Event
	object.onDragEnded = object._onDragEndedEvent.Event

	return object
end
function module.makeDraggable(p3)
	local u7: boolean = false
	local u8 = nil

	p3.guiObject.InputBegan:Connect(function(input)
		if p3.resizing then
		elseif input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			u7 = true

			local v17: Vector2 = userInputService:GetMouseLocation()
			local v18 = p3.guiObject.Position
			local uDim2 = UDim2.new(0, v17.X, 0, v17.Y)

			u8 = v18 - uDim2
			p3.dragging = true
			p3._onDragBeginEvent:Fire()
		end
	end)
	userInputService.InputChanged:Connect(function(input: InputObject, gameProcessedEvent: boolean)
		if gameProcessedEvent then
		elseif u7 and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
			local v22: Vector2 = userInputService:GetMouseLocation()

			p3.guiObject.Position = UDim2.new(0, v22.X, 0, v22.Y) + u8
			p3._onDragChangedEvent:Fire()
		end
	end)
	p3.guiObject.InputEnded:Connect(function(input)
		if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and p3.dragging then
			u7 = false
			u8 = nil
			p3.dragging = false
			p3._onDragEndedEvent:Fire()
		end
	end)
end
function module.makeResizeable(p8)
	local u10: boolean = false
	local vector2 = Vector2.new(0, 0)
	local u12: boolean = false
	local u13: boolean = false
	local u14: boolean = false
	local u15: boolean = false

	p8.guiObject.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			local v25 = userInputService:GetMouseLocation()

			if not p8.ignoreGuiInsetEnabled then
				v25 -= Vector2.new(0, 36)
			end

			if v25.X < p8.guiObject.AbsolutePosition.X + p8.guiObject.AbsoluteSize.X + 5 and v25.X > p8.guiObject.AbsolutePosition.X + p8.guiObject.AbsoluteSize.X - 5 then
				u10 = true
				p8.resizing = true
				vector2 = v25
				u13 = true
			elseif v25.X < p8.guiObject.AbsolutePosition.X + 5 and v25.X > p8.guiObject.AbsolutePosition.X - 5 then
				u10 = true
				p8.resizing = true
				vector2 = v25
				u12 = true
			elseif v25.Y < p8.guiObject.AbsolutePosition.Y + p8.guiObject.AbsoluteSize.Y + 5 and v25.Y > p8.guiObject.AbsolutePosition.Y + p8.guiObject.AbsoluteSize.Y - 5 then
				u10 = true
				p8.resizing = true
				vector2 = v25
				u15 = true
			elseif v25.Y < p8.guiObject.AbsolutePosition.Y + 5 and v25.Y > p8.guiObject.AbsolutePosition.Y - 5 then
				u10 = true
				p8.resizing = true
				vector2 = v25
				u14 = true
			end

			if u15 or u14 or u13 or u12 then
				p8._onResizeBeginEvent:Fire()
			end
		end
	end)
	userInputService.InputChanged:Connect(function(input: InputObject, gameProcessedEvent: boolean)
		if gameProcessedEvent then
		elseif u10 and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
			local v28 = userInputService:GetMouseLocation()

			if not p8.ignoreGuiInsetEnabled then
				v28 -= Vector2.new(0, 36)
			end

			if u13 then
				local guiObject = p8.guiObject
				local guiObjectSize = guiObject.Size
				local uDim2 = UDim2.new(0, (v28 - vector2).X, 0, 0)

				guiObject.Size = guiObjectSize + uDim2
				vector2 = v28
			elseif u12 then
				local n1 = v28 - vector2
				local v33 = p8.guiObject
				local v34 = v33.Size
				local uDim2 = UDim2.new(0, n1.X, 0, 0)

				v33.Size = v34 - uDim2

				local v36 = p8.guiObject

				v34 = v36.Position

				local uDim22 = UDim2.new(0, n1.X, 0, 0)

				v36.Position = v34 + uDim22
				vector2 = v28
			elseif u14 then
				local n2 = v28 - vector2
				local v39 = p8.guiObject
				local v40 = v39.Size
				local uDim2 = UDim2.new(0, 0, 0, n2.Y)

				v39.Size = v40 - uDim2

				local v42 = p8.guiObject

				v40 = v42.Position

				local uDim23 = UDim2.new(0, 0, 0, n2.Y)

				v42.Position = v40 + uDim23
				vector2 = v28
			elseif u15 then
				local v44 = p8.guiObject
				local v45 = v44.Size
				local uDim2 = UDim2.new(0, 0, 0, (v28 - vector2).Y)

				v44.Size = v45 + uDim2
				vector2 = v28
			end

			p8._onResizeChangedEvent:Fire()
		end
	end)
	p8.guiObject.InputEnded:Connect(function(input)
		if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and p8.resizing then
			u10 = false
			u12 = false
			u13 = false
			u14 = false
			u15 = false
			p8.resizing = false
			p8._onResizeEndedEvent:Fire()
		end
	end)
end

return module
