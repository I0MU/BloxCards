

-- Original SourceAssetId: https://assetdelivery.roblox.com/v1/asset/?id=2780820589

-- ! Source from the asset above; the game may have edited it since.

--[=[
--[[
	@Author: Spynaz
	@Description: Enables dragging on GuiObjects. Supports both mouse and touch.
	
	For instructions on how to use this module, go to this link:
	https://devforum.roblox.com/t/simple-module-for-creating-draggable-gui-elements/230678
--]]

local UDim2_new = UDim2.new

local UserInputService = game:GetService("UserInputService")

local DraggableObject 		= {}
DraggableObject.__index 	= DraggableObject

-- Sets up a new draggable object
function DraggableObject.new(Object)
	local self 			= {}
	self.Object			= Object
	self.DragStarted	= nil
	self.DragEnded		= nil
	self.Dragged		= nil
	self.Dragging		= false
	
	setmetatable(self, DraggableObject)
	
	return self
end

-- Enables dragging
function DraggableObject:Enable()
	local object			= self.Object
	local dragInput			= nil
	local dragStart			= nil
	local startPos			= nil
	local preparingToDrag	= false
	
	-- Updates the element
	local function update(input)
		local delta 		= input.Position - dragStart
		local newPosition	= UDim2_new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		object.Position 	= newPosition
	
		return newPosition
	end
	
	self.InputBegan = object.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			preparingToDrag = true
			--[[if self.DragStarted then
				self.DragStarted()
			end
			
			dragging	 	= true
			dragStart 		= input.Position
			startPos 		= Element.Position
			--]]
			
			local connection 
			connection = input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End and (self.Dragging or preparingToDrag) then
					self.Dragging = false
					connection:Disconnect()
					
					if self.DragEnded and not preparingToDrag then
						self.DragEnded()
					end
					
					preparingToDrag = false
				end
			end)
		end
	end)
	
	self.InputChanged = object.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)
	
	self.InputChanged2 = UserInputService.InputChanged:Connect(function(input)
		if object.Parent == nil then
			self:Disable()
			return
		end
		
		if preparingToDrag then
			preparingToDrag = false
			
			if self.DragStarted then
				self.DragStarted()
			end
			
			self.Dragging	= true
			dragStart 		= input.Position
			startPos 		= object.Position
		end
		
		if input == dragInput and self.Dragging then
			local newPosition = update(input)
			
			if self.Dragged then
				self.Dragged(newPosition)
			end
		end
	end)
end

-- Disables dragging
function DraggableObject:Disable()
	self.InputBegan:Disconnect()
	self.InputChanged:Disconnect()
	self.InputChanged2:Disconnect()
	
	if self.Dragging then
		self.Dragging = false
		
		if self.DragEnded then
			self.DragEnded()
		end
	end
end

return DraggableObject

]=]



local uDim2New = UDim2.new
local u2 = nil
local userInputService: UserInputService = game:GetService("UserInputService")
local visGui = game.Players.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("VisGui")
local module: {[any]: any} = {}

module.__index = module

function module.new(p1)
	local t2: {[any]: any} = {
		Object = p1,
		DragStarted = nil,
		DragEnded = nil,
		Dragged = nil,
		Dragging = false
	}

	setmetatable(t2, module)

	return t2
end
local function CheckGlobalDragStatus()
	return visGui:FindFirstChild("DragDisabled")
end
function module.Enable(p2)
	local v10 = p2.Object

	p2.Enabled = true

	local u11 = nil
	local u12 = nil
	local u13 = nil
	local u14: boolean = false

	local function update(p3)
		if not u12 then
			u12 = p3.Position
		end

		if not u13 then
			u13 = v10.Position
		end

		local n1 = p3.Position - u12
		local v19 = uDim2New(u13.X.Scale, u13.X.Offset + n1.X, u13.Y.Scale, u13.Y.Offset + n1.Y)

		v10.Position = v19

		return v19
	end

	p2.InputBegan = userInputService.InputBegan:Connect(function(input: InputObject)
		if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and input.Position.X > v10.AbsolutePosition.X and input.Position.X < v10.AbsolutePosition.X + v10.AbsoluteSize.X and input.Position.Y > v10.AbsolutePosition.Y and input.Position.Y < v10.AbsolutePosition.Y + v10.AbsoluteSize.Y and not u2 and not visGui:FindFirstChild("DragDisabled") and not v10:FindFirstChild("AntiDrag") then
			u14 = true
			u2 = p2
			u12 = input.Position

			local connection = nil

			connection = input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End and (not not p2.Dragging or not not u14) then
					p2.Dragging = false
					connection:Disconnect()
					u2 = nil

					if p2.DragEnded and not u14 then
						p2.DragEnded()
					end

					u14 = false
				end
			end)
		end
	end)
	p2.InputChanged = v10.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			u11 = input
		end
	end)
	p2.InputChanged2 = userInputService.InputChanged:Connect(function(input: InputObject)
		if v10.Parent == nil then
			p2:Disable()
			u2 = nil

			return
		end

		if u14 then
			u14 = false

			if p2.DragStarted then
				p2.DragStarted()
			end

			p2.Dragging = true
			u12 = input.Position
			u13 = v10.Position
		end

		if input == u11 and p2.Dragging then
			if not u12 then
				u12 = input.Position
			end

			if not u13 then
				u13 = v10.Position
			end

			local n1 = input.Position - u12
			local v25 = uDim2New(u13.X.Scale, u13.X.Offset + n1.X, u13.Y.Scale, u13.Y.Offset + n1.Y)

			v10.Position = v25

			if p2.Dragged then
				p2.Dragged(v25)
			end
		end
	end)
end
function module.Disable(p7)
	if not p7.Enabled then
		return
	end

	p7.Enabled = false
	p7.InputBegan:Disconnect()
	p7.InputChanged:Disconnect()
	p7.InputChanged2:Disconnect()

	if p7.Dragging then
		p7.Dragging = false

		if p7.DragEnded then
			p7.DragEnded()
		end

		u2 = nil
	end
end

return module
