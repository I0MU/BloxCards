



require(script.Parent.Parent.Types)

return function(p1, p2)
	local t1: {[any]: any} = {}

	table.insert(p1._postCycleCallbacks, function()
		for key, value in t1 do
			value.RowColumnIndex = 0
		end
	end)

	local widgetConstructor = p1.WidgetConstructor

	local v5 = p2.EVENTS.hover(function(p3)
		return p3.Instance
	end)

	widgetConstructor("Table", {
		hasState = false,
		hasChildren = true,
		Args = { NumColumns = 1, RowBg = 2, BordersOuter = 3, BordersInner = 4 },
		Events = { hovered = v5 },
		Generate = function(p4)
			t1[p4.ID] = p4
			p4.InitialNumColumns = -1
			p4.RowColumnIndex = 0
			p4.ColumnInstances = {}
			p4.CellInstances = {}

			local iris_Table: Frame = Instance.new("Frame")

			iris_Table.Name = "Iris_Table"
			iris_Table.Size = UDim2.new(p1._config.ItemWidth, UDim.new(0, 0))
			iris_Table.AutomaticSize = Enum.AutomaticSize.Y
			iris_Table.BackgroundTransparency = 1
			iris_Table.BorderSizePixel = 0
			iris_Table.ZIndex = p4.ZIndex + 1024
			iris_Table.LayoutOrder = p4.ZIndex
			iris_Table.ClipsDescendants = true
			p2.UIListLayout(iris_Table, Enum.FillDirection.Horizontal, UDim.new(0, 0))
			p2.UIStroke(iris_Table, 1, p1._config.TableBorderStrongColor, p1._config.TableBorderStrongTransparency)

			return iris_Table
		end,
		Update = function(p5)
			local parent = p5.Instance

			if p5.arguments.BordersOuter == false then
				parent.UIStroke.Thickness = 0
			else
				parent.UIStroke.Thickness = 1
			end

			if p5.InitialNumColumns == -1 then
				if p5.arguments.NumColumns == nil then
					error("Iris.Table NumColumns argument is required", 5)
				end

				p5.InitialNumColumns = p5.arguments.NumColumns

				for i = 1, p5.InitialNumColumns do
					local n1 = p5.ZIndex + 1 + i
					local frame: Frame = Instance.new("Frame")

					frame.Name = ("Column_%*"):format(i)
					frame.Size = UDim2.new(1 / p5.InitialNumColumns, 0, 0, 0)
					frame.AutomaticSize = Enum.AutomaticSize.Y
					frame.BackgroundTransparency = 1
					frame.BorderSizePixel = 0
					frame.ZIndex = n1
					frame.LayoutOrder = n1
					frame.ClipsDescendants = true
					p2.UIListLayout(frame, Enum.FillDirection.Vertical, UDim.new(0, 0))
					p5.ColumnInstances[i] = frame
					frame.Parent = parent
				end
			elseif p5.arguments.NumColumns ~= p5.InitialNumColumns then
				error("Iris.Table NumColumns Argument must be static")
			end

			if p5.arguments.RowBg == false then
				for iterFirst, iterSecond in p5.CellInstances, nil, nil do
					iterSecond.BackgroundTransparency = 1
				end
			else
				for iterFirst2, iterSecond2 in p5.CellInstances, nil, nil do
					iterSecond2.BackgroundTransparency = if math.ceil(iterFirst2 / p5.InitialNumColumns) % 2 == 0 then p1._config.TableRowBgAltTransparency else p1._config.TableRowBgTransparency
				end
			end

			if p5.arguments.BordersInner == false then
				for iterFirst3, iterSecond3 in p5.CellInstances, nil, nil do
					iterSecond3.UIStroke.Thickness = 0
				end

				return
			end

			for iterFirst4, iterSecond4 in p5.CellInstances, nil, nil do
				iterSecond4.UIStroke.Thickness = 0.5
			end
		end,
		Discard = function(p6)
			t1[p6.ID] = nil
			p6.Instance:Destroy()
		end,
		ChildAdded = function(p7)
			if p7.RowColumnIndex == 0 then
				p7.RowColumnIndex = 1
			end

			local v26 = p7.CellInstances[p7.RowColumnIndex]

			if v26 then
				return v26
			end

			v26 = p7.ColumnInstances[(p7.RowColumnIndex - 1) % p7.InitialNumColumns + 1]

			local n1 = v26.ZIndex + p7.RowColumnIndex
			local frame: Frame = Instance.new("Frame")

			frame.Name = ("Cell_%*"):format(p7.RowColumnIndex)
			frame.Size = UDim2.new(1, 0, 0, 0)
			frame.AutomaticSize = Enum.AutomaticSize.Y
			frame.BackgroundTransparency = 1
			frame.BorderSizePixel = 0
			frame.ZIndex = n1
			frame.LayoutOrder = n1
			frame.ClipsDescendants = true
			p2.UIPadding(frame, p1._config.CellPadding)
			p2.UIListLayout(frame, Enum.FillDirection.Vertical, UDim.new(0, p1._config.ItemSpacing.Y))

			if p7.arguments.BordersInner == false then
				p2.UIStroke(frame, 0, p1._config.TableBorderLightColor, p1._config.TableBorderLightTransparency)
			else
				p2.UIStroke(frame, 0.5, p1._config.TableBorderLightColor, p1._config.TableBorderLightTransparency)
			end

			if p7.arguments.RowBg ~= false then
				local roundedUp = math.ceil(p7.RowColumnIndex / p7.InitialNumColumns)
				local backgroundTransparency = if roundedUp % 2 == 0 then p1._config.TableRowBgAltTransparency else p1._config.TableRowBgTransparency

				frame.BackgroundColor3 = if roundedUp % 2 == 0 then p1._config.TableRowBgAltColor else p1._config.TableRowBgColor
				frame.BackgroundTransparency = backgroundTransparency
			end

			p7.CellInstances[p7.RowColumnIndex] = frame
			frame.Parent = v26

			return frame
		end
	})
end
