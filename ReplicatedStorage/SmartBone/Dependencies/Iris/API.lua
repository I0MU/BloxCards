



require(script.Parent.Types)

return function(p1)
	local function wrapper(p2)
		return function(p3, p4)
			return p1.Internal._Insert(p2, p3, p4)
		end
	end

	local s1: string = "Window"

	function p1.Window(p5, p6)
		return p1.Internal._Insert(s1, p5, p6)
	end

	p1.SetFocusedWindow = p1.Internal.SetFocusedWindow

	local s2: string = "Tooltip"

	function p1.Tooltip(p7, p8)
		return p1.Internal._Insert(s2, p7, p8)
	end

	local s3: string = "MenuBar"

	function p1.MenuBar(p9, p10)
		return p1.Internal._Insert(s3, p9, p10)
	end

	local s4: string = "Menu"

	function p1.Menu(p11, p12)
		return p1.Internal._Insert(s4, p11, p12)
	end

	local s5: string = "MenuItem"

	function p1.MenuItem(p13, p14)
		return p1.Internal._Insert(s5, p13, p14)
	end

	local s6: string = "MenuToggle"

	function p1.MenuToggle(p15, p16)
		return p1.Internal._Insert(s6, p15, p16)
	end

	local s7: string = "Separator"

	function p1.Separator(p17, p18)
		return p1.Internal._Insert(s7, p17, p18)
	end

	local s8: string = "Indent"

	function p1.Indent(p19, p20)
		return p1.Internal._Insert(s8, p19, p20)
	end

	local s9: string = "SameLine"

	function p1.SameLine(p21, p22)
		return p1.Internal._Insert(s9, p21, p22)
	end

	local s10: string = "Group"

	function p1.Group(p23, p24)
		return p1.Internal._Insert(s10, p23, p24)
	end

	local s11: string = "Text"

	function p1.Text(p25, p26)
		return p1.Internal._Insert(s11, p25, p26)
	end
	function p1.TextWrapped(p27)
		p27[2] = true

		return p1.Internal._Insert("Text", p27)
	end
	function p1.TextColored(p28)
		p28[3] = p28[2]
		p28[2] = nil

		return p1.Internal._Insert("Text", p28)
	end

	local s12: string = "SeparatorText"

	function p1.SeparatorText(p29, p30)
		return p1.Internal._Insert(s12, p29, p30)
	end

	local s13: string = "InputText"

	function p1.InputText(p31, p32)
		return p1.Internal._Insert(s13, p31, p32)
	end

	local s14: string = "Button"

	function p1.Button(p33, p34)
		return p1.Internal._Insert(s14, p33, p34)
	end

	local s15: string = "SmallButton"

	function p1.SmallButton(p35, p36)
		return p1.Internal._Insert(s15, p35, p36)
	end

	local s16: string = "Checkbox"

	function p1.Checkbox(p37, p38)
		return p1.Internal._Insert(s16, p37, p38)
	end

	local s17: string = "RadioButton"

	function p1.RadioButton(p39, p40)
		return p1.Internal._Insert(s17, p39, p40)
	end

	local s18: string = "Tree"

	function p1.Tree(p41, p42)
		return p1.Internal._Insert(s18, p41, p42)
	end

	local s19: string = "CollapsingHeader"

	function p1.CollapsingHeader(p43, p44)
		return p1.Internal._Insert(s19, p43, p44)
	end

	local s20: string = "InputNum"

	function p1.InputNum(p45, p46)
		return p1.Internal._Insert(s20, p45, p46)
	end

	local s21: string = "InputVector2"

	function p1.InputVector2(p47, p48)
		return p1.Internal._Insert(s21, p47, p48)
	end

	local s22: string = "InputVector3"

	function p1.InputVector3(p49, p50)
		return p1.Internal._Insert(s22, p49, p50)
	end

	local s23: string = "InputUDim"

	function p1.InputUDim(p51, p52)
		return p1.Internal._Insert(s23, p51, p52)
	end

	local s24: string = "InputUDim2"

	function p1.InputUDim2(p53, p54)
		return p1.Internal._Insert(s24, p53, p54)
	end

	local s25: string = "InputRect"

	function p1.InputRect(p55, p56)
		return p1.Internal._Insert(s25, p55, p56)
	end

	local s26: string = "DragNum"

	function p1.DragNum(p57, p58)
		return p1.Internal._Insert(s26, p57, p58)
	end

	local s27: string = "DragVector2"

	function p1.DragVector2(p59, p60)
		return p1.Internal._Insert(s27, p59, p60)
	end

	local s28: string = "DragVector3"

	function p1.DragVector3(p61, p62)
		return p1.Internal._Insert(s28, p61, p62)
	end

	local s29: string = "DragUDim"

	function p1.DragUDim(p63, p64)
		return p1.Internal._Insert(s29, p63, p64)
	end

	local s30: string = "DragUDim2"

	function p1.DragUDim2(p65, p66)
		return p1.Internal._Insert(s30, p65, p66)
	end

	local s31: string = "DragRect"

	function p1.DragRect(p67, p68)
		return p1.Internal._Insert(s31, p67, p68)
	end

	local s32: string = "InputColor3"

	function p1.InputColor3(p69, p70)
		return p1.Internal._Insert(s32, p69, p70)
	end

	local s33: string = "InputColor4"

	function p1.InputColor4(p71, p72)
		return p1.Internal._Insert(s33, p71, p72)
	end

	local s34: string = "SliderNum"

	function p1.SliderNum(p73, p74)
		return p1.Internal._Insert(s34, p73, p74)
	end

	local s35: string = "SliderVector2"

	function p1.SliderVector2(p75, p76)
		return p1.Internal._Insert(s35, p75, p76)
	end

	local s36: string = "SliderVector3"

	function p1.SliderVector3(p77, p78)
		return p1.Internal._Insert(s36, p77, p78)
	end

	local s37: string = "SliderUDim"

	function p1.SliderUDim(p79, p80)
		return p1.Internal._Insert(s37, p79, p80)
	end

	local s38: string = "SliderUDim2"

	function p1.SliderUDim2(p81, p82)
		return p1.Internal._Insert(s38, p81, p82)
	end

	local s39: string = "SliderRect"

	function p1.SliderRect(p83, p84)
		return p1.Internal._Insert(s39, p83, p84)
	end

	local s40: string = "Selectable"

	function p1.Selectable(p85, p86)
		return p1.Internal._Insert(s40, p85, p86)
	end

	local s41: string = "Combo"

	function p1.Combo(p87, p88)
		return p1.Internal._Insert(s41, p87, p88)
	end
	function p1.ComboArray(p89, p90, p91)
		local v133

		if p90 == nil then
			v133 = p1.State(p91[1])
		else
			v133 = p90
		end

		local v134 = p1.Internal._Insert("Combo", p89, v133)
		local index = v134.state.index

		for iterFirst, iterSecond in p91 do
			p1.Internal._Insert("Selectable", { iterSecond, iterSecond }, { index = index })
		end

		p1.End()

		return v134
	end
	function p1.ComboEnum(p92, p93, p94)
		local v141

		if p93 == nil then
			v141 = p1.State(p94[1])
		else
			v141 = p93
		end

		local v142 = p1.Internal._Insert("Combo", p92, v141)
		local index = v142.state.index

		for iterFirst, iterSecond in p94:GetEnumItems() do
			p1.Internal._Insert("Selectable", { iterSecond.Name, iterSecond }, { index = index })
		end

		p1.End()

		return v142
	end

	p1.InputEnum = p1.ComboEnum

	local s42: string = "Table"

	function p1.Table(p95, p96)
		return p1.Internal._Insert(s42, p95, p96)
	end
	function p1.NextColumn()
		local v148 = p1.Internal._GetParentWidget()

		v148.RowColumnIndex = v148.RowColumnIndex + 1
	end
	function p1.SetColumnIndex(p97)
		local v150 = p1.Internal._GetParentWidget()

		assert(p97 >= v150.InitialNumColumns, "Iris.SetColumnIndex Argument must be in column range")
		v150.RowColumnIndex = math.floor(v150.RowColumnIndex / v150.InitialNumColumns) + (p97 - 1)
	end
	function p1.NextRow()
		local v151 = p1.Internal._GetParentWidget()
		local initialNumColumns = v151.InitialNumColumns

		v151.RowColumnIndex = math.floor((v151.RowColumnIndex + 1) / initialNumColumns) * initialNumColumns
	end
end
