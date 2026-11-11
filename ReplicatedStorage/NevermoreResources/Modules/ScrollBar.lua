



local players: Players = game:GetService("Players")
local replicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")
local runService: RunService = game:GetService("RunService")
local loadLibrary = require(replicatedStorage:WaitForChild("NevermoreEngine")).LoadLibrary
local v5 = loadLibrary("qSystems")
local v6 = loadLibrary("qGUI")
local v7 = loadLibrary("Maid")
local v8 = loadLibrary("Signal")
local make = v5.Make
local class = v5.Class

warn("Scroll bar class is depcricated, used ScrollingFrame")

local function CreateFlatBacking(parent, p2)
	local v16 = p2 or 2
	local uDim2 = UDim2.new(1, -v16 * 2, 1, -v16 * 2)
	local uDim22 = UDim2.new(0, v16, 0, v16)

	return (make("Frame", {
		BackgroundTransparency = 0,
		BorderSizePixel = 0,
		Name = "Backing",
		Parent = parent,
		BackgroundColor3 = Color3.new(0.5803921568627451, 0.6313725490196078, 0.6823529411764706),
		Size = uDim2,
		Position = uDim22
	}))
end

local v12 = class(function(p3, _, _, _)
	p3.Duration = 0.6
	p3.BounceBackDuration = 0.3
	p3.Position = 0
	p3.UpdateInterval = 0.03333333333333333
	p3.Velocity = 0
	p3.Minimum = 0
	p3.Maximum = 1000
	p3.MaxBounce = 50
	p3.DisplayPosition = p3.Position

	function p3.OnPositionChange()
	end
	function p3.OnScrollStart()
	end
	function p3.OnScrollStop()
	end

	p3.LastPosition = 0
	p3.TimeStamp = tick()
	p3.UpdatingId = 0

	function p3.Clamp(p7, p8, p9)
		if not p9 then
			if p8 > p7.Maximum then
				return p7.Maximum
			end

			if p8 < p7.Minimum then
				return p7.Minimum
			end

			return p8
		end

		if p8 > p7.Maximum + p7.MaxBounce then
			return p7.Maximum + p7.MaxBounce
		end

		if p8 < p7.Minimum - p7.MaxBounce then
			return p7.Minimum - p7.MaxBounce
		end

		return p8
	end
	function p3.SetRange(p10, minimum, maximum)
		p10.Minimum = minimum
		p10.Maximum = maximum
	end
	function p3.GetRange(p13)
		return p13.Minimum, p13.Maximum
	end
	function p3.SetPosition(p14, p15, p16)
		local timestamp = tick()
		local n1 = timestamp - p14.TimeStamp

		if p15 > p14.Maximum then
			local absoluteValue = math.abs(p15 - p14.Maximum)

			absoluteValue = p14.MaxBounce / 2 * (1 - 0.5 ^ (absoluteValue / p14.MaxBounce)) / 0.5
			p14.Position = p15
			p14.DisplayPosition = absoluteValue
			p14.OnPositionChange(absoluteValue)
		elseif p15 < p14.Minimum then
			local absoluteValue = math.abs(p15 - p14.Minimum)

			absoluteValue = p14.Minimum - p14.MaxBounce / 2 * (1 - 0.5 ^ (absoluteValue / p14.MaxBounce)) / 0.5
			p14.Position = p15
			p14.DisplayPosition = absoluteValue
			p14.OnPositionChange(absoluteValue)
		else
			p14.Position = p15
			p14.DisplayPosition = p14.Position
			p14.OnPositionChange(p14.Position)
		end

		local n2 = (p14.Position - p14.LastPosition) / n1 / (p16 or 1)

		p14.TimeStamp = timestamp
		p14:SetVelocity(0.2 * p14.Velocity + 0.8 * n2)
		p14.LastPosition = p14.Position
	end
	function p3.SetVelocity(p17, velocity)
		p17.Velocity = velocity
	end
	function p3.AddVelocity(p19, p20)
		p19.Velocity = p19.Velocity + p20
	end
	function p3.ResetSpeed(p21)
		p21.Velocity = 0
		p21.LastPosition = p21.Position
		p21.UpdatingId = p21.UpdatingId + 1
		p21.TimeStamp = tick()
	end
	function p3.ScrollTo(p22, displayPosition, p24)
		if not p24 then
			p22:ResetSpeed()
			p22:SetVelocity(displayPosition - p22.Position)
			p22:Release()

			return
		end

		p22:ResetSpeed()

		if displayPosition > p22.Maximum then
			local absoluteValue = math.abs(displayPosition - p22.Maximum)

			absoluteValue = p22.MaxBounce / 2 * (1 - 0.5 ^ (absoluteValue / p22.MaxBounce)) / 0.5
			p22.Position = displayPosition
			p22.DisplayPosition = absoluteValue
			p22.OnPositionChange(absoluteValue)
			p22:Release()

			return
		end

		if displayPosition < p22.Minimum then
			local absoluteValue = math.abs(displayPosition - p22.Minimum)

			absoluteValue = p22.Minimum - p22.MaxBounce / 2 * (1 - 0.5 ^ (absoluteValue / p22.MaxBounce)) / 0.5
			p22.Position = displayPosition
			p22.DisplayPosition = absoluteValue
			p22.OnPositionChange(absoluteValue)
			p22:Release()

			return
		end

		p22.Position = displayPosition
		p22.DisplayPosition = displayPosition
		p22.OnPositionChange(p22.Position)
	end
	function p3.Release(p25)
		local velocity = p25.Velocity
		local u69 = p25.Position

		p25.TimeStamp = tick()
		p25.UpdatingId = p25.UpdatingId + 1

		local updatingId = p25.UpdatingId

		spawn(function()
			while updatingId == p25.UpdatingId do
				local n1 = tick() - p25.TimeStamp
				local n2 = u69 + velocity * (n1 / p25.Duration) ^ 0.5

				if n1 > p25.Duration or p25.Position > p25.Maximum or p25.Position < p25.Minimum then
					local v117 = nil

					if p25.Position > p25.Maximum then
						local absoluteValue = math.abs(p25.Position - p25.Minimum)

						absoluteValue = p25.MaxBounce / 2 * (1 - 0.5 ^ (absoluteValue / p25.MaxBounce)) / 0.5
						p25.Position = absoluteValue
						v117 = -absoluteValue
					elseif p25.Position < p25.Minimum then
						local absoluteValue = math.abs(p25.Position - p25.Minimum)

						absoluteValue = p25.MaxBounce / 2 * (1 - 0.5 ^ (absoluteValue / p25.MaxBounce)) / 0.5
						p25.Position = p25.Minimum - absoluteValue
						v117 = absoluteValue
					else
						p25:ResetSpeed()
						p25.OnScrollStop(p25.Position)
					end

					if v117 then
						p25.Velocity = v117
						p25.TimeStamp = tick()
						u69 = p25.Position

						while updatingId == p25.UpdatingId do
							local n3 = tick() - p25.TimeStamp

							p25.Position = u69 + v117 * (n3 / p25.BounceBackDuration) ^ 0.5
							p25.DisplayPosition = p25.Position
							p25.OnPositionChange(p25.Position)

							if n3 > p25.BounceBackDuration then
								p25:ResetSpeed()
								p25.OnScrollStop(p25.Position)
							end

							runService.Heartbeat:wait(p25.UpdateInterval)
						end

						p25.DisplayPosition = u69 + v117
						p25.OnPositionChange(u69 + v117)
					else
						p25.DisplayPosition = u69 + velocity
						p25.OnPositionChange(u69 + velocity)
					end
				elseif n2 > p25.Maximum then
					local absoluteValue = math.abs(n2 - p25.Maximum)

					absoluteValue = p25.MaxBounce / 2 * (1 - 0.5 ^ (absoluteValue / p25.MaxBounce)) / 0.5
					p25.Position = n2
					p25.DisplayPosition = absoluteValue
					p25.OnPositionChange(absoluteValue)
				elseif n2 < p25.Minimum then
					local absoluteValue = math.abs(n2 - p25.Minimum)

					absoluteValue = p25.Minimum - p25.MaxBounce / 2 * (1 - 0.5 ^ (absoluteValue / p25.MaxBounce)) / 0.5
					p25.Position = n2
					p25.DisplayPosition = absoluteValue
					p25.OnPositionChange(absoluteValue)
				else
					p25.Velocity = n2 - p25.Position
					p25.Position = n2
					p25.DisplayPosition = p25.Position
					p25.OnPositionChange(p25.Position)
				end

				runService.Heartbeat:wait(p25.UpdateInterval)
			end
		end)
	end
end)

local v13 = class(function(p26, container, content, p29, p30)
	local u28 = p30 or "Y"
	local u29 = v7.MakeMaid()
	local u30 = v12()
	local u31: boolean = false
	local u32 = nil
	local n1 = 0
	local mouseDrag = v6.GenerateMouseDrag()
	local mouse: Mouse = players.LocalPlayer:GetMouse()
	local t1: {[any]: any} = {}
	local u37 = nil

	p26.PixelsPerWheelTurn = 80
	p26.KineticModel = u30
	p26.Content = content
	p26.Container = container
	p26.Axis = u28
	p26.MouseDrag = mouseDrag
	p26.CanDrag = true
	p26.ScrollFinished = v8.new()
	p26.InputFinished = v8.new()
	p26.ScrollStarted = v8.new()

	local color3 = Color3.new(0, 0, 0)
	local color32 = Color3.new(0.1, 0.1, 0.1)

	local function StopStepEvent()
		if u37 then
			u37:disconnect()
			u37 = nil
		end
	end
	function p26.AdjustRange(_)
		local n1 = -content.AbsoluteSize[u28] + container.AbsoluteSize[u28]

		for _, v in pairs(t1) do
			v.ResizeBar()
		end

		u30:SetRange(n1, 0)
	end
	function p26.CanScroll()
		local u75 = false

		if content.AbsoluteSize[u28] >= container.AbsoluteSize[u28] then
			u75 = p26.CanDrag
		end

		return u75
	end
	function p26.StartDrag(p32, p33)
		if u32 then
			print("[Scroller] - Scrollbar is already pressed")

			return false
		end

		if not p26.CanScroll() then
			return false
		end

		n1 = Vector2.new(p32, p33)[u28]
		p26.ScrollStarted:fire(u30.DisplayPosition)

		if u37 then
			u37:disconnect()
			u37 = nil
		end

		u37 = runService.Heartbeat:connect(function()
			p26.Drag(mouse.X, mouse.Y)
		end)
		u31 = true
		mouseDrag.Parent = p29
		u30:ResetSpeed()
	end
	function p26.Drag(p34, p35)
		if not p26.CanScroll() then
			print("[Scroller] - Cannot scroll")

			return false
		end

		local vector2 = Vector2.new(p34, p35)
		local n4 = vector2[u28] - n1

		if u31 then
			u30:SetPosition(u30.Position + n4)
			n1 = vector2[u28]

			return
		end

		if u32 then
			local n2 = u32.ScrollBarContainer.AbsoluteSize[u28] - u32.Bar.AbsoluteSize[u28]

			if n2 == 0 then
				u30:SetPosition(0)

				return
			end

			local v83, v84 = u30:GetRange()
			local n3 = v84 - v83

			u30:SetPosition(u30.Position - n4 / n2 * n3, n3 / n2)
			n1 = vector2[u28]

			return
		end

		u30:SetPosition(u30.Position)
	end
	function p26.StopDrag()
		p26.InputFinished:fire()

		if u37 then
			u37:disconnect()
			u37 = nil
		end

		u31 = false
		u32 = nil
		u30:Release()
		mouseDrag.Parent = nil
	end
	function p26.ScrollDown()
		if p26.CanScroll() then
			if u37 then
				u37:disconnect()
				u37 = nil
			end

			u30:AddVelocity(-p26.PixelsPerWheelTurn)
			u30:Release()
		end
	end
	function p26.ScrollUp()
		if p26.CanScroll() then
			if u37 then
				u37:disconnect()
				u37 = nil
			end

			u30:AddVelocity(p26.PixelsPerWheelTurn)
			u30:Release()
		end
	end
	function p26.ScrollTo(p36, p37)
		if u37 then
			u37:disconnect()
			u37 = nil
		end

		u30:ScrollTo(p36, p37)
	end
	function p26.AddScrollBar(_, parent, p40)
		local kineticModel = p26.KineticModel
		local u92 = nil
		local v93 = math.min(10, parent.ZIndex + 1)
		local v94 = math.max(v93, 0)
		local v95 = make("ImageButton", {
			Name = "ScrollBar",
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Active = true,
			Parent = parent,
			ZIndex = v94,
			BackgroundColor3 = Color3.new(0, 0, 0)
		})
		local n2: number = 0

		local t2: {[any]: any} = {
			ScrollBarContainer = parent,
			Bar = v95,
			ResizeBar = function()
				if p26.Axis == "Y" then
					v95.Size = UDim2.new(1, 0, p26.Container.AbsoluteSize.Y / p26.Content.AbsoluteSize.Y, 0)

					return
				end

				v95.Size = UDim2.new(p26.Container.AbsoluteSize.X / p26.Content.AbsoluteSize.X, 0, 1, 0)
			end,
			Render = function(p41)
				local n1 = parent.AbsoluteSize[u28] - v95.AbsoluteSize[u28]
				local v125, v126 = kineticModel:GetRange()
				local v127 = kineticModel:Clamp(p41)
				local absoluteValue = math.abs(v127 / (v126 - v125))

				if p26.Axis == "Y" then
					v95.Position = UDim2.new(0, 0, 0, n1 * absoluteValue)

					return
				end

				v95.Position = UDim2.new(0, n1 * absoluteValue, 0, 0)
			end,
			OnEnterDisplay = function()
				if u92 then
					u92.BackgroundColor3 = color32
				end
			end,
			OnLeaveDisplay = function()
				if u92 then
					u92.BackgroundColor3 = color3
				end
			end,
			StopScrollFromWhitespace = function()
				n2 += 1
			end
		}

		function t2.MouseDownOnWhitespace(p42, p43)
			local vector2 = Vector2.new(p42, p43)

			n2 += 1

			while n2 == n2 do
				kineticModel:ResetSpeed()

				if math.abs(v95.AbsolutePosition[p26.Axis] - vector2[p26.Axis] + v95.AbsoluteSize[p26.Axis] / 2) < v95.AbsoluteSize[p26.Axis] / 2 then
					t2.StopScrollFromWhitespace()
				elseif v95.AbsolutePosition[p26.Axis] < vector2[p26.Axis] then
					kineticModel:SetVelocity(-p26.Container.AbsoluteSize[p26.Axis])
				else
					kineticModel:SetVelocity(p26.Container.AbsoluteSize[p26.Axis])
				end

				kineticModel:Release()
				wait(0.2)
			end
		end
		function t2.StartDrag(p44, p45)
			if u32 then
				print("[Scroller] - Scroller is already pressed")

				return false
			end

			p26.ScrollStarted:fire(kineticModel.DisplayPosition)

			if u37 then
				u37:disconnect()
				u37 = nil
			end

			kineticModel:ResetSpeed()
			u37 = runService.Heartbeat:connect(function()
				p26.Drag(mouse.X, mouse.Y)
			end)
			u32 = t2
			n1 = Vector2.new(p44, p45)[u28]
			mouseDrag.Parent = p29
			kineticModel:ResetSpeed()
		end

		if not p40 then
			u92 = CreateFlatBacking(v95, 1)
			u92.BackgroundColor3 = color3
			u92.BackgroundTransparency = 0.5
		end

		local v98 = u29
		local text: string = tostring(t2)

		v98[text .. "BarMouseButton1Down"] = v95.MouseButton1Down:connect(t2.StartDrag)
		v98 = u29

		local text2: string = tostring(t2)

		v98[text2 .. "BarMouseButton1Up"] = v95.MouseButton1Up:connect(t2.StopScrollFromWhitespace)
		parent.Active = true

		if parent:IsA("GuiButton") then
			local v101 = u29
			local text3: string = tostring(t2)

			v101[text3 .. "ScrollBarContainerMouseButton1Down"] = parent.MouseButton1Down:connect(t2.MouseDownOnWhitespace)
			v101 = u29

			local text4: string = tostring(t2)

			v101[text4 .. "ScrollBarContainerMouseButton1Up"] = parent.MouseButton1Up:connect(t2.StopScrollFromWhitespace)
			v101 = u29

			local text5: string = tostring(t2)

			v101[text5 .. "ScrollBarContainerMouseEnter"] = parent.MouseEnter:connect(t2.OnEnterDisplay)
			v101 = u29

			local text6: string = tostring(t2)

			v101[text6 .. "ScrollBarContainerMouseLeave"] = parent.MouseLeave:connect(t2.OnLeaveDisplay)
		else
			local v106 = u29
			local text7: string = tostring(t2)

			v106[text7 .. "BarMouseEnter"] = v95.MouseEnter:connect(t2.OnEnterDisplay)
			v106 = u29

			local text8: string = tostring(t2)

			v106[text8 .. "BarMouseLeave"] = v95.MouseLeave:connect(t2.OnLeaveDisplay)
		end

		t2.ResizeBar()
		t1[#t1 + 1] = t2
	end
	local function OnAbsoluteSizeAdjust(p46)
		if p46 == "AbsoluteSize" then
			p26:AdjustRange()
		end
	end
	function u30.OnPositionChange(p47)
		if u28 == "Y" then
			content.Position = UDim2.new(content.Position.X.Scale, content.Position.X.Offset, 0, p47)
		else
			content.Position = UDim2.new(0, p47, content.Position.Y.Scale, content.Position.Y.Offset)
		end

		for _, v in pairs(t1) do
			v.Render(p47)
		end
	end

	content.Active = true

	if content:IsA("GuiButton") then
		u29.DatContentMouseButton1Down = content.MouseButton1Down:connect(p26.StartDrag)
	end

	u29.ContentMouseWheelForward = content.MouseWheelForward:connect(function()
		p26.ScrollUp()
	end)
	u29.ContentMouseWheelBackward = content.MouseWheelBackward:connect(function()
		p26.ScrollDown()
	end)
	u29.MouseDragButton1Up = mouseDrag.MouseButton1Up:connect(function()
		p26.StopDrag()
	end)
	u29.ConainerChangedEvent = container.Changed:connect(OnAbsoluteSizeAdjust)
	u29.ContentChangedEvent = content.Changed:connect(OnAbsoluteSizeAdjust)
	p26:AdjustRange()

	function u30.OnScrollStop(_)
		p26.ScrollFinished:fire(u30.DisplayPosition)
	end
	function p26.Destroy(_)
		u30:ResetSpeed()
		u30 = nil

		if u37 then
			u37:disconnect()
			u37 = nil
		end

		mouseDrag:Destroy()
		u29:DoCleaning()
		u29 = nil
		p26.Destroy = nil
		p26 = nil
	end
end)

return { MakeKineticModel = v12, MakeScroller = v13 }
