



require(script.Parent.Parent.Types)

return function(p1, p2)
	local n1: number = 0

	p1.WidgetConstructor("Root", {
		hasState = false,
		hasChildren = true,
		Args = {},
		Events = {},
		Generate = function(_)
			local iris_Root: Folder = Instance.new("Folder")

			iris_Root.Name = "Iris_Root"

			local screenGui

			if p1._config.UseScreenGUIs then
				screenGui = Instance.new("ScreenGui")
				screenGui.ResetOnSpawn = false
				screenGui.DisplayOrder = p1._config.DisplayOrderOffset
				screenGui.IgnoreGuiInset = p1._config.IgnoreGuiInset
			else
				screenGui = Instance.new("Folder")
			end

			screenGui.Name = "PseudoWindowScreenGui"
			screenGui.Parent = iris_Root

			local screenGui2

			if p1._config.UseScreenGUIs then
				screenGui2 = Instance.new("ScreenGui")
				screenGui2.ResetOnSpawn = false
				screenGui2.DisplayOrder = p1._config.DisplayOrderOffset + 1024
				screenGui2.IgnoreGuiInset = p1._config.IgnoreGuiInset

				local tooltipContainer: Frame = Instance.new("Frame")

				tooltipContainer.Name = "TooltipContainer"
				tooltipContainer.AutomaticSize = Enum.AutomaticSize.XY
				tooltipContainer.Size = UDim2.fromOffset(0, 0)
				tooltipContainer.BackgroundTransparency = 1
				tooltipContainer.BorderSizePixel = 0
				p2.UIListLayout(tooltipContainer, Enum.FillDirection.Vertical, UDim.new(0, p1._config.PopupBorderSize))
				tooltipContainer.Parent = screenGui2

				local menuBarContainer: Frame = Instance.new("Frame")

				menuBarContainer.Name = "MenuBarContainer"
				menuBarContainer.AutomaticSize = Enum.AutomaticSize.Y
				menuBarContainer.Size = UDim2.fromScale(1, 0)
				menuBarContainer.BackgroundTransparency = 1
				menuBarContainer.BorderSizePixel = 0
				menuBarContainer.Parent = screenGui2
			else
				screenGui2 = Instance.new("Folder")
			end

			screenGui2.Name = "PopupScreenGui"
			screenGui2.Parent = iris_Root

			local pseudoWindow: Frame = Instance.new("Frame")

			pseudoWindow.Name = "PseudoWindow"
			pseudoWindow.Size = UDim2.new(0, 0, 0, 0)
			pseudoWindow.Position = UDim2.fromOffset(0, 22)
			pseudoWindow.AutomaticSize = Enum.AutomaticSize.XY
			pseudoWindow.BackgroundTransparency = p1._config.WindowBgTransparency
			pseudoWindow.BackgroundColor3 = p1._config.WindowBgColor
			pseudoWindow.BorderSizePixel = p1._config.WindowBorderSize
			pseudoWindow.BorderColor3 = p1._config.BorderColor
			pseudoWindow.Selectable = false
			pseudoWindow.SelectionGroup = true
			pseudoWindow.SelectionBehaviorUp = Enum.SelectionBehavior.Stop
			pseudoWindow.SelectionBehaviorDown = Enum.SelectionBehavior.Stop
			pseudoWindow.SelectionBehaviorLeft = Enum.SelectionBehavior.Stop
			pseudoWindow.SelectionBehaviorRight = Enum.SelectionBehavior.Stop
			pseudoWindow.Visible = false
			p2.UIPadding(pseudoWindow, p1._config.WindowPadding)
			p2.UIListLayout(pseudoWindow, Enum.FillDirection.Vertical, UDim.new(0, p1._config.ItemSpacing.Y))
			pseudoWindow.Parent = screenGui

			return iris_Root
		end,
		Update = function(p4)
			if n1 > 0 then
				p4.Instance.PseudoWindowScreenGui.PseudoWindow.Visible = true
			end
		end,
		Discard = function(p5)
			n1 = 0
			p5.Instance:Destroy()
		end,
		ChildAdded = function(p6, p7)
			local instance = p6.Instance

			if p7.type == "Window" then
				return p6.Instance
			end

			if p7.type == "Tooltip" then
				return instance.PopupScreenGui.TooltipContainer
			end

			if p7.type == "MenuBar" then
				return instance.PopupScreenGui.MenuBarContainer
			end

			local pseudoWindow = instance.PseudoWindowScreenGui.PseudoWindow

			n1 += 1
			pseudoWindow.Visible = true

			return pseudoWindow
		end,
		ChildDiscarded = function(p8, p9)
			if p9.type ~= "Window" and p9.type ~= "Tooltip" and p9.type ~= "MenuBar" then
				n1 -= 1

				if n1 == 0 then
					p8.Instance.PseudoWindowScreenGui.PseudoWindow.Visible = false
				end
			end
		end
	})
end
