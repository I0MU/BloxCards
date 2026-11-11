



local n1: number = 8
local n2: number = 0
local userInputService: UserInputService = game:GetService("UserInputService")

if userInputService.TouchEnabled then
	n1 = 5
	n2 = 1
end

local scriptAutocomplete = script.Autocomplete
local scriptTemplate = script.Template

local function ClearAllGuiObjectChildren(p1)
	for _, v in pairs(p1:GetChildren()) do
		if v:IsA("GuiObject") then
			v:Destroy()
		end
	end
end
local function splitString(p2)
	local v14, v15 = p2:match("(%S+)%s(.+)")

	if v14 and v15 then
		return { v14, v15 }
	end

	return { p2 }
end
local function replaceLastWord(p3, p4)
	local v18 = splitString(p3)

	v18[#v18] = p4

	return table.concat(v18, " ")
end

local module: {[any]: any} = {}

function module.Init(p5, parent, p7, p8)
	local u23 = nil
	local u24: boolean = false
	local t2: {[any]: any} = {}
	local t3: {[any]: any} = {}
	local t4: {[any]: any} = {}
	local u28 = nil
	local connection = nil
	local clone = scriptAutocomplete:Clone()

	clone.Parent = parent
	clone.ZIndex = parent.ZIndex + 1

	local function Highlight(p9)
		local text: string = tostring(p9)

		if not clone:FindFirstChild(text) then
			return
		end

		u23 = p9

		for _, v in pairs(clone:GetChildren()) do
			if v:IsA("GuiObject") then
				local vName = v.Name
				local text2: string = tostring(p9)

				if vName == text2 then
					v.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
				else
					v.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				end
			end
		end
	end
	local function Select(p10)
		if u28 then
			p5.Text = ""

			local v41 = splitString(p10)

			module.FireDebugFunc(unpack(v41))

			return
		end

		p5.Text = p10 .. " "
		task.wait()
		p5:CaptureFocus()
	end
	local function newPhysSug(layoutOrder, p12, p13)
		local clone2 = scriptTemplate:Clone()

		clone2.Parent = clone
		clone2.Title.Text = p12

		if p13 then
			clone2.Subtitle.Text = p13
		end

		clone2.LayoutOrder = layoutOrder
		clone2.Name = tostring(layoutOrder)
		clone2.Visible = true
		clone2.MouseEnter:Connect(function()
			Highlight(layoutOrder)
		end)
		clone2.ZIndex = 200
		clone2.MouseButton1Down:Connect(function()
			local text: string = tostring(u23)
			local text3 = clone:FindFirstChild(text)

			if not text3 then
				local v78 = p5.Text

				if u28 then
					p5.Text = ""

					local v79 = splitString(v78)

					module.FireDebugFunc(unpack(v79))

					return
				end

				p5.Text = v78 .. " "
				task.wait()
				p5:CaptureFocus()

				return
			end

			local TitleText = text3.Title.Text
			local v81 = splitString(p5.Text)

			v81[#v81] = TitleText

			local v82 = table.concat(v81, " ")

			if u28 and u28[1] == "cardname" then
				local SubtitleText = text3.Subtitle.Text
				local v84 = splitString(p5.Text)

				v84[#v84] = SubtitleText
				v82 = table.concat(v84, " ")
			end

			if u28 then
				p5.Text = ""

				local v85 = splitString(v82)

				module.FireDebugFunc(unpack(v85))

				return
			end

			p5.Text = v82 .. " "
			task.wait()
			p5:CaptureFocus()
		end)

		return clone2
	end

	p5:GetPropertyChangedSignal("Text"):Connect(function()
		if not p5:IsFocused() then
			return
		end

		local v46 = p5.Text

		v46 = splitString(p5.Text:lower())
		t3 = {}
		t4 = {}
		local v47 = v46[#v46]

		if string.len(v47) < 2 and #v46 <= 1 then
			ClearAllGuiObjectChildren(clone)
			t2 = {}

			return
		end

		if #v46 > 1 then
			local v48 = nil

			u28 = p7[v46[1]]

			if u28 then
				v48 = u28[#v46 - 1]
			end

			if v48 and p8[v48] then
				for k, v in pairs(p8[v48]) do
					local lowerText = v:lower()
					local v52 = string.sub(lowerText, 1, #v47)

					if v47 == v52 then
						table.insert(t3, k)
						t4[k] = v
					end

					if #t3 == n1 then
						break
					end
				end
			end
		else
			u28 = nil

			for k, v in pairs(p7) do
				local lowerText = k:lower()
				local v56 = string.sub(lowerText, 1, #v47)

				if v47 == v56 then
					table.insert(t3, k)
					t4[k] = k

					for _, iterValue in pairs(v) do
						t4[k] = t4[k] .. " " .. iterValue
					end
				end

				if #t3 == n1 then
					break
				end
			end
		end

		table.sort(t3, function(p14, p15)
			local v88 = string.len(p14)
			local v89 = string.len(p15)

			return v88 < v89
		end)

		if #t3 > 0 then
			if #t3 == #t2 and u24 then
				local u59: boolean = true

				for i, v in ipairs(t3) do
					if v ~= t2[i] then
						u59 = false

						break
					end
				end

				if u59 then
					return
				end
			end

			t2 = t3
			u24 = true
		else
			t2 = {}
		end

		ClearAllGuiObjectChildren(clone)

		for i, v in ipairs(t3) do
			if u28 and u28[1] == "cardname" then
				newPhysSug(i, t4[v], v)
			else
				newPhysSug(i, v, t4[v])
			end
		end

		Highlight(1)

		if not connection then
			connection = userInputService.InputBegan:Connect(function(input: InputObject)
				if u23 == n2 or input.KeyCode ~= Enum.KeyCode.Up then
					if u23 ~= #t3 and input.KeyCode == Enum.KeyCode.Down then
						Highlight(u23 + 1)
					end

					return
				end

				Highlight(u23 - 1)
			end)
		end
	end)
	p5.FocusLost:Connect(function(p17, input)
		if p17 then
			local text: string = tostring(u23)
			local text4 = clone:FindFirstChild(text)

			if not text4 then
				local v68 = p5.Text

				if u28 then
					p5.Text = ""

					local v69 = splitString(v68)

					module.FireDebugFunc(unpack(v69))
				else
					p5.Text = v68 .. " "
					task.wait()
					p5:CaptureFocus()
				end
			else
				local v70 = text4.Title.Text
				local v71 = splitString(p5.Text)

				v71[#v71] = v70

				local v72 = table.concat(v71, " ")

				if u28 and u28[1] == "cardname" then
					local v73 = text4.Subtitle.Text
					local v74 = splitString(p5.Text)

					v74[#v74] = v73
					v72 = table.concat(v74, " ")
				end

				if u28 then
					p5.Text = ""

					local v75 = splitString(v72)

					module.FireDebugFunc(unpack(v75))
				else
					p5.Text = v72 .. " "
					task.wait()
					p5:CaptureFocus()
				end
			end
		elseif input and input.UserInputType == Enum.UserInputType.MouseButton1 then
			task.wait()
		end

		t2 = {}
		t3 = {}

		if connection then
			connection:Disconnect()
			connection = nil
		end

		ClearAllGuiObjectChildren(clone)
		u24 = false
	end)
end

return module
