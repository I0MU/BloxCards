



local n1: number = 7
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

return {
	Init = function(p2, parent, p4)
		local u13 = nil
		local u14: boolean = false
		local u15 = nil
		local t1: {[any]: any} = {}
		local t2: {[any]: any} = {}
		local t3: {[any]: any} = {}
		local connection = nil
		local clone = scriptAutocomplete:Clone()

		clone.Parent = parent
		clone.ZIndex = parent.ZIndex + 1

		local function Highlight(p5)
			local text: string = tostring(p5)

			if not clone:FindFirstChild(text) then
				return
			end

			u13 = p5

			for _, v in pairs(clone:GetChildren()) do
				if v:IsA("GuiObject") then
					local vName = v.Name
					local text2: string = tostring(p5)

					if vName == text2 then
						v.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
					else
						v.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					end
				end
			end
		end
		local function Select(p6)
			if #t3 > 0 then
				p2.Text = ""

				for i = 1, #t3 do
					if string.find(p6, t3[i]) then
						p6 = string.gsub(p6, t3[i], "")
					end

					p2.Text = p2.Text .. t3[i] .. " "
				end

				p2.Text = p2.Text .. p6

				return
			end

			p2.Text = p6 .. " "
		end
		local function newPhysSug(layoutOrder, p8, p9)
			local clone2 = scriptTemplate:Clone()

			clone2.Parent = clone
			clone2.Title.Text = p8

			if not p9 then
				clone2.Subtitle.Text = p4[p8]
			end

			clone2.LayoutOrder = layoutOrder
			clone2.Name = tostring(layoutOrder)
			clone2.Visible = true
			clone2.MouseEnter:Connect(function()
				Highlight(layoutOrder)
			end)
			clone2.ZIndex = 200
			clone2.MouseButton1Down:Connect(function()
				Select(p8)
			end)

			return clone2
		end

		p2:GetPropertyChangedSignal("Text"):Connect(function()
			if not p2:IsFocused() then
				return
			end

			local text = p2.Text
			local lowerText = p2.Text:lower()
			local u38: boolean = false

			if string.len(lowerText) < 3 then
				u38 = true
			end

			t2 = {}
			t3 = {}
			local u39: boolean = true

			if string.sub(lowerText, 1, 1) ~= ">" then
				u39 = string.sub(lowerText, 1, 1) == "<"
			end

			for k, _ in pairs(p4) do
				if string.sub(lowerText, 1, 1) == " " then
					lowerText = string.gsub(lowerText, " ", "", 1)
				end

				if (string.sub(k, 1, 1) == ">" or string.sub(k, 1, 1) == "<") and string.find(text, k) then
					if string.sub(k, #k, #k) == ":" then
						print(text .. " Matches " .. k)

						if not table.find(t3, k) then
							local stringFind = string.find
							local lowerText2 = k:lower()
							local v44, v45 = stringFind(lowerText, lowerText2 .. "[%w]+")
							local v46, v47 = string.find(lowerText, k:lower())
							local v48: {[any]: any} = t3
							local v49 = string.sub(lowerText, v47 + 1, v45):upper()

							table.insert(v48, k .. v49)

							local v50 = string.sub(lowerText, v47 + 1, v45)

							print(k .. v50)
						end

						local stringGsub = string.gsub
						local lowerText3 = k:lower()

						lowerText = stringGsub(lowerText, lowerText3 .. "[%w]+", "")
					else
						print(text .. " Matches " .. k)

						local v53 = string.gsub
						local lowerText4 = k:lower()

						lowerText = v53(lowerText, lowerText4, "")

						if not table.find(t3, k) then
							table.insert(t3, k)
						end
					end
				end
			end

			for k, _ in pairs(p4) do
				if #t3 == 0 then
					local lowerText5 = k:lower()

					if not u39 then
						local v58 = string.gsub(lowerText5, ">", "", 1)

						lowerText5 = string.gsub(v58, "<", "", 1)
					end

					local v59 = string.sub(lowerText5, 1, #lowerText)

					if lowerText == v59 and (u38 ~= true or string.sub(k, 1, 1) == ">" or string.sub(k, 1, 1) == "<") then
						table.insert(t2, k)
					end

					if #t2 == n1 then
						break
					end

					continue
				end

				if string.sub(k, 1, 1) == ">" or string.sub(k, 1, 1) == "<" then
					local lowerText6 = k:lower()
					local v61 = string.gsub(lowerText6, ">", "", 1)

					v61 = string.gsub(v61, "<", "", 1)
					v61 = string.sub(v61, 1, #lowerText)

					if lowerText == v61 and (u38 ~= true or string.sub(k, 1, 1) == ">" or string.sub(k, 1, 1) == "<") then
						table.insert(t2, k)
					end

					if #t2 == n1 then
						break
					end
				end
			end

			table.sort(t2, function(p10, p11)
				local v73 = string.len(p10)
				local v74 = string.len(p11)

				return v73 < v74
			end)

			if #t2 > 0 then
				if #t2 == #t1 and u14 then
					local u62: boolean = true

					for i, v in ipairs(t2) do
						if v ~= t1[i] then
							u62 = false

							break
						end
					end

					if u62 then
						if u15 then
							u15.Title.Text = text
						end

						return
					end
				end

				t1 = t2
				u14 = true
			else
				t1 = {}
			end

			ClearAllGuiObjectChildren(clone)

			for i, v in ipairs(t2) do
				newPhysSug(i, v)
			end

			if not userInputService.TouchEnabled then
				u15 = newPhysSug(0, text, true)
				Highlight(0)
			else
				Highlight(1)
			end

			if not connection then
				connection = userInputService.InputBegan:Connect(function(input: InputObject)
					if u13 == n2 or input.KeyCode ~= Enum.KeyCode.Up then
						if u13 ~= #t2 and input.KeyCode == Enum.KeyCode.Down then
							Highlight(u13 + 1)
						end

						return
					end

					Highlight(u13 - 1)
				end)
			end
		end)
		p2.FocusLost:Connect(function(p13, input)
			if p13 then
				local text: string = tostring(u13)
				local text3 = clone:FindFirstChild(text)

				if not text3 then
					return
				end

				Select(text3.Title.Text)
			elseif input and input.UserInputType == Enum.UserInputType.MouseButton1 then
				task.wait()
			end

			t1 = {}
			t2 = {}

			if connection then
				connection:Disconnect()
				connection = nil
			end

			ClearAllGuiObjectChildren(clone)
			u14 = false
		end)
	end
}
