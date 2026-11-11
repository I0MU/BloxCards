



local gamepadService: GamepadService = game:GetService("GamepadService")
local userInputService: UserInputService = game:GetService("UserInputService")
local guiService: GuiService = game:GetService("GuiService")
local u4 = nil
local module: {[any]: any} = {}

function module.start(p1)
	u4 = p1
	u4.highlightKey = Enum.KeyCode.DPadUp
	u4.highlightIcon = false
	task.delay(1, function()
		local iconsDictionary = u4.iconsDictionary

		local function getIconFromSelectedObject()
			local guiServiceSelectedObject: GuiObject = guiService.SelectedObject
			local v25 = guiServiceSelectedObject and guiServiceSelectedObject:GetAttribute("CorrespondingIconUID")

			return v25 and iconsDictionary[v25]
		end

		local u16 = nil
		local u17: boolean = false
		local u18: boolean = false

		require(script.Parent.Parent.Utility)

		local selection = require(script.Parent.Parent.Elements.Selection)

		local function updateSelectedObject()
			local guiServiceSelectedObject: GuiObject = guiService.SelectedObject
			local v27 = guiServiceSelectedObject and guiServiceSelectedObject:GetAttribute("CorrespondingIconUID")
			local v28 = v27 and iconsDictionary[v27]
			local userInputServiceGamepadEnabled: boolean = userInputService.GamepadEnabled

			if v28 then
				if userInputServiceGamepadEnabled then
					local v30 = v28:getInstance("ClickRegion")
					local v31 = v28.selection

					if not v31 then
						v31 = v28.janitor:add(selection(u4))
						v31:SetAttribute("IgnoreVisibilityUpdater", true)
						v31.Parent = v28.widget
						v28.selection = v31
						v28:refreshAppearance(v31)
					end

					v30.SelectionImageObject = v31.Selection
				end

				if u16 and v28 ~= u16 then
					u16:setIndicator()
				end

				local v32 = if userInputServiceGamepadEnabled and not u18 and not v28.parentIconUID then Enum.KeyCode.ButtonB else nil

				u16 = v28
				u4.lastHighlightedIcon = v28
				v28:setIndicator(v32)

				return
			end

			v27 = if userInputServiceGamepadEnabled and not u17 then u4.highlightKey else nil

			if not u16 then
				u16 = module.getIconToHighlight()
			end

			if v27 == u4.highlightKey then
				u17 = true
			end

			if u16 then
				u16:setIndicator(v27)
			end
		end

		guiService:GetPropertyChangedSignal("SelectedObject"):Connect(updateSelectedObject)
		userInputService:GetPropertyChangedSignal("GamepadEnabled"):Connect(function()
			if not userInputService.GamepadEnabled then
				u17 = false
				u18 = false
			end

			updateSelectedObject()
		end)

		if not userInputService.GamepadEnabled then
			u17 = false
			u18 = false
		end

		updateSelectedObject()
		userInputService.InputBegan:Connect(function(input: InputObject, gameProcessedEvent: boolean)
			if input.UserInputType == Enum.UserInputType.MouseButton1 then
				local guiServiceSelectedObject: GuiObject = guiService.SelectedObject
				local v36 = guiServiceSelectedObject and guiServiceSelectedObject:GetAttribute("CorrespondingIconUID")

				if v36 and iconsDictionary[v36] then
					guiService.SelectedObject = nil
				end

				return
			end

			if input.KeyCode ~= u4.highlightKey then
				return
			end

			local v37 = module.getIconToHighlight()

			if v37 then
				if gamepadService.GamepadCursorEnabled then
					task.wait(0.2)
					gamepadService:DisableGamepadCursor()
				end

				guiService.SelectedObject = v37:getInstance("ClickRegion")
			end
		end)
	end)
end
function module.getIconToHighlight()
	local v7 = u4.highlightIcon or u4.lastHighlightedIcon

	if not v7 then
		local v8 = nil

		for _, v in pairs(u4.iconsDictionary) do
			if not v.parentIconUID and (not v8 or v8 > v.widget.AbsolutePosition.X) then
				v7 = v
				v8 = v7.widget.AbsolutePosition.X
			end
		end
	end

	return v7
end
function module.registerButton(p4)
	local u12: boolean = false

	p4.InputBegan:Connect(function(_)
		u12 = true
		task.wait()
		task.wait()
		u12 = false
	end)

	local connection = userInputService.InputBegan:Connect(function(input: InputObject)
		task.wait()

		if input.KeyCode == Enum.KeyCode.ButtonA and u12 then
			task.wait(0.2)
			gamepadService:DisableGamepadCursor()
			guiService.SelectedObject = p4

			return
		end

		local KeyCodeName = input.KeyCode.Name

		if table.find({ "ButtonB", "ButtonSelect" }, KeyCodeName) and guiService.SelectedObject == p4 and (KeyCodeName ~= "ButtonSelect" or not not gamepadService.GamepadCursorEnabled) then
			guiService.SelectedObject = nil
		end
	end)

	p4.Destroying:Once(function()
		connection:Disconnect()
	end)
end

return module
