



local replicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")
local runService: RunService = game:GetService("RunService")
local loadLibrary = require(replicatedStorage:WaitForChild("NevermoreEngine")).LoadLibrary
local v4 = loadLibrary("qSystems")
local v5 = loadLibrary("EnumInterpreter")
local v6 = loadLibrary("qMath")
local make = v4.Make
local round = v4.Round
local modify = v4.Modify

v4 = function(p1)
	local v18 = make("Frame", {
		BackgroundTransparency = 1,
		Visible = false,
		Name = "ScreenCover",
		ZIndex = 10,
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 1, 38),
		Position = UDim2.new(0, 0, 0, -36),
		BackgroundColor3 = Color3.new(0, 0, 0)
	})

	return modify(v18, p1 or {})
end

local module: {[any]: any} = {
	STYLES = {},
	TYPES = { "TransitionOut", "TransitionIn" },
	MakeCover = v4,
	makeCover = v4
}

v4 = function(p2, p3)
	if p2 < 0.5 then
		return (p2 * 2) ^ p3 / 2
	end

	return -((-(p2 * 2) + 2) ^ p3) / 2 + 1
end
v4 = function(p4, p5)
	return p4 ^ p5
end
v4 = function(p6, p7)
	return p6 ^ (1 / p7)
end

local function CenterCircleGui(p8, p9, p10, p11, p12, p13)
	p13.Position = UDim2.new(0.5, -p13.Size.X.Offset / 2, 0.5, -p13.Size.Y.Offset / 2)
	p9.Size = UDim2.new(1, 10, 0, (p8.AbsoluteSize.Y - p13.Size.Y.Offset) / 2 + 5)
	p9.Position = UDim2.new(0, -5, 0.5, -(p13.Size.Y.Offset / 2 + p9.Size.Y.Offset))
	p10.Size = p9.Size
	p10.Position = UDim2.new(0, -5, 0.5, p13.Size.Y.Offset / 2)
	p11.Size = UDim2.new(0, (p8.AbsoluteSize.X - p13.Size.X.Offset) / 2 + 5, 1, 10)
	p11.Position = UDim2.new(0.5, -(p13.Size.X.Offset / 2 + p11.Size.X.Offset), 0, -5)
	p12.Size = p11.Size
	p12.Position = UDim2.new(0.5, p13.Size.X.Offset / 2, 0, -5)
end
local function GenerateCircleGui(parent, p15, p16)
	local v34 = p16 or 1
	local uDim2 = UDim2.new(0, p15, 0, p15)
	local v36 = make("ImageLabel", {
		Archivable = false,
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		Image = "rbxassetid://148523274",
		Size = uDim2,
		Parent = parent,
		ZIndex = v34
	})
	local v37 = make("Frame", {
		Archivable = false,
		BorderSizePixel = 0,
		Name = "TopFrame",
		BackgroundColor3 = Color3.new(0, 0, 0),
		Parent = parent,
		ZIndex = v34
	})
	local v38 = make("Frame", {
		Archivable = false,
		BorderSizePixel = 0,
		Name = "BottomFrame",
		BackgroundColor3 = Color3.new(0, 0, 0),
		Parent = parent,
		ZIndex = v34
	})
	local v39 = make("Frame", {
		Archivable = false,
		BorderSizePixel = 0,
		Name = "LeftFrame",
		BackgroundColor3 = Color3.new(0, 0, 0),
		Parent = parent,
		ZIndex = v34
	})
	local v40 = make("Frame", {
		Archivable = false,
		BorderSizePixel = 0,
		Name = "RightFrame",
		BackgroundColor3 = Color3.new(0, 0, 0),
		Parent = parent,
		ZIndex = v34
	})

	return v36, v37, v38, v39, v40
end

local t2: {[any]: any} = {
	Fade = {
		TransitionOut = function(p17, p18)
			local v43 = time()

			while true do
				local v44 = time()

				if not (p17 + v43 > v44) then
					break
				end

				p18.BackgroundTransparency = (time() - v43) / p17
				wait(0.03)
			end

			p18.BackgroundTransparency = 1

			return true
		end,
		TransitionIn = function(p19, p20)
			local v47 = time()

			while true do
				local v48 = time()

				if not (p19 + v47 > v48) then
					break
				end

				p20.BackgroundTransparency = 1 - (time() - v47) / p19
				wait(0.03)
			end

			p20.BackgroundTransparency = 0

			return true
		end
	},
	SlideDown = {
		TransitionIn = function(p21, parent, p23)
			local clone = parent:Clone()

			clone.Parent = parent
			clone.Size = UDim2.new(1, 0, 1, 0)
			clone.Position = UDim2.new(0, 0, -1, 0)
			clone.BackgroundTransparency = 0
			clone:TweenPosition(UDim2.new(0, 0, 0, 0), "In", p23.EasingStyle or "Quad", p21, true)
			parent.BackgroundTransparency = 1
			wait(p21)
			clone:Destroy()
			parent.BackgroundTransparency = 0

			return true
		end,
		TransitionOut = function(p24, parent, p26)
			local clone = parent:Clone()

			clone.Parent = parent
			clone.Size = UDim2.new(1, 0, 1, 0)
			clone.Position = UDim2.new(0, 0, 0, 0)
			clone:TweenPosition(UDim2.new(0, 0, 1, 0), "Out", p26.EasingStyle or "Quad", p24, true)
			parent.BackgroundTransparency = 1
			wait(p24)
			clone:Destroy()

			return true
		end
	},
	SlideUp = {
		TransitionIn = function(p27, parent, p29)
			local clone = parent:Clone()

			clone.Parent = parent
			clone.Size = UDim2.new(1, 0, 1, 0)
			clone.Position = UDim2.new(0, 0, 1, 0)
			clone.BackgroundTransparency = 0
			clone:TweenPosition(UDim2.new(0, 0, 0, 0), "In", p29.EasingStyle or "Quad", p27, true)
			parent.BackgroundTransparency = 1
			wait(p27)
			clone:Destroy()
			parent.BackgroundTransparency = 0

			return true
		end,
		TransitionOut = function(p30, parent, p32)
			local clone = parent:Clone()

			clone.Parent = parent
			clone.Size = UDim2.new(1, 0, 1, 0)
			clone.Position = UDim2.new(0, 0, 0, 0)
			clone:TweenPosition(UDim2.new(0, 0, -1, 0), "Out", p32.EasingStyle or "Quad", p30, true)
			parent.BackgroundTransparency = 1
			wait(p30)
			clone:Destroy()

			return true
		end
	},
	DiagonalSquares = {
		TransitionIn = function(p33, parent, p35)
			SquareSize = v6.roundUp(p35.SquareSize or 76, 2)

			local clone = parent:Clone()

			clone.Name = "Square"
			clone.Size = UDim2.new(0, 0, 0, 0)
			clone.BackgroundTransparency = 0
			parent.BackgroundTransparency = 1

			local roundUp = v6.roundUp
			local v70 = math.max(parent.AbsoluteSize.X, parent.AbsoluteSize.Y)
			local n1 = roundUp(v70 * 1.6, SquareSize) + SquareSize
			local t3: {[any]: any} = {}

			v70 = 0

			while n1 >= v70 do
				local n2 = 0

				while n2 <= v70 do
					local clone2 = clone:Clone()

					clone2.Archivable = false
					clone2.Position = UDim2.new(0, n2 + SquareSize / 2, 0, v70 - n2 + SquareSize / 2)
					clone2.Parent = parent

					local clone2Position = clone2.Position
					local uDim2 = UDim2.new(0, SquareSize / 2, 0, SquareSize / 2)
					local n3 = clone2Position - uDim2

					table.insert(t3, clone2)
					delay(p33 / 2 / (n1 / SquareSize) * (v70 / SquareSize), function()
						local uDim22 = UDim2.new(0, SquareSize, 0, SquareSize)

						clone2:TweenSizeAndPosition(uDim22, n3, "In", "Quad", p33 / 2, true)
					end)
					n2 += SquareSize
				end

				v70 += SquareSize
			end

			wait(p33)
			parent.BackgroundTransparency = 0

			for _, v in pairs(t3) do
				v:Destroy()
			end

			return true
		end,
		TransitionOut = function(p36, parent, p38)
			SquareSize = v6.roundUp(p38.SquareSize or 76, 2)

			local clone = parent:Clone()

			clone.Name = "Square"
			clone.Size = UDim2.new(0, SquareSize, 0, SquareSize)

			local roundUp = v6.roundUp
			local v85 = math.max(parent.AbsoluteSize.X, parent.AbsoluteSize.Y)
			local n1 = roundUp(v85 * 1.6, SquareSize) + SquareSize
			local t4: {[any]: any} = {}

			v85 = n1

			while v85 >= 0 do
				local n2 = 0

				while n2 <= v85 do
					local clone3 = clone:Clone()

					clone3.Archivable = false
					clone3.Parent = parent
					clone3.Position = UDim2.new(0, n2, 0, v85 - n2)

					local clone3Position = clone3.Position
					local uDim2 = UDim2.new(0, SquareSize / 2, 0, SquareSize / 2)
					local n3 = clone3Position + uDim2

					table.insert(t4, clone3)
					delay(p36 / 2 / (n1 / SquareSize) * (v85 / SquareSize), function()
						clone3:TweenSizeAndPosition(UDim2.new(0, 0, 0, 0), n3, "Out", "Quad", p36 / 2, true)
					end)
					n2 += SquareSize
				end

				v85 -= SquareSize
			end

			parent.BackgroundTransparency = 1
			wait(p36)

			for _, v in pairs(t4) do
				v:Destroy()
			end

			return true
		end
	},
	StraightSquare = {
		TransitionIn = function(p39, parent, p41)
			SquareSize = v6.roundUp(p41.SquareSize or 76, 2)

			local clone = parent:Clone()

			clone.Name = "Square"
			clone.Size = UDim2.new(0, 0, 0, 0)
			clone.BackgroundTransparency = 0
			parent.BackgroundTransparency = 1

			local roundUp = v6.roundUp
			local v100 = math.max(parent.AbsoluteSize.X, parent.AbsoluteSize.Y)
			local n1 = roundUp(v100 * 1.6, SquareSize) + SquareSize
			local t5: {[any]: any} = {}

			v100 = 0

			while n1 >= v100 do
				local n2 = 0

				while n1 >= n2 do
					local clone4 = clone:Clone()

					clone4.Archivable = false
					clone4.Position = UDim2.new(0, n2, 0, v100)
					clone4.Parent = parent

					local clone4Position = clone4.Position
					local uDim2 = UDim2.new(0, SquareSize / 2, 0, SquareSize / 2)
					local n3 = clone4Position - uDim2

					table.insert(t5, clone4)
					delay(p39 / 2 / (n1 / SquareSize) * (n2 / SquareSize), function()
						local uDim23 = UDim2.new(0, SquareSize, 0, SquareSize)

						clone4:TweenSizeAndPosition(uDim23, n3, "In", "Quad", p39 / 2, true)
					end)
					n2 += SquareSize
				end

				v100 += SquareSize
			end

			wait(p39)
			parent.BackgroundTransparency = 0

			for _, v in pairs(t5) do
				v:Destroy()
			end

			return true
		end,
		TransitionOut = function(_, _, _)
			print("No out")
		end
	},
	Circle = {
		TransitionIn = function(p45, p46, _)
			local n1 = math.max(p46.AbsoluteSize.X, p46.AbsoluteSize.Y) * 1.4142135623730951

			p46.BackgroundTransparency = 1

			local v117, v118, v119, v120, v121 = GenerateCircleGui(p46, n1, p46.ZIndex)

			local function ResizeCircle(p48)
				local v151 = round(p48, 2)

				v117.Size = UDim2.new(0, v151, 0, v151)
				CenterCircleGui(p46, v118, v119, v120, v121, v117)
			end

			local v123 = time()

			while true do
				local v124 = time()

				if not (p45 + v123 > v124) then
					break
				end

				local v125 = time()
				local v126 = round((1 - (v125 - v123) / p45) * n1, 2)

				v117.Size = UDim2.new(0, v126, 0, v126)
				CenterCircleGui(p46, v118, v119, v120, v121, v117)
				runService.RenderStepped:wait(0)
			end

			local v127 = round(0, 2)

			v117.Size = UDim2.new(0, v127, 0, v127)
			CenterCircleGui(p46, v118, v119, v120, v121, v117)
			p46.BackgroundTransparency = 0
			v117:Destroy()
			v118:Destroy()
			v119:Destroy()
			v120:Destroy()
			v121:Destroy()

			return true
		end,
		TransitionOut = function(p49, p50, _)
			local n1 = math.max(p50.AbsoluteSize.X, p50.AbsoluteSize.Y) * 1.4142135623730951

			p50.BackgroundTransparency = 1

			local v132, v133, v134, v135, v136 = GenerateCircleGui(p50, 0, p50.ZIndex)

			local function ResizeCircle(p52)
				local v153 = round(p52, 2)

				v132.Size = UDim2.new(0, v153, 0, v153)
				CenterCircleGui(p50, v133, v134, v135, v136, v132)
			end

			local v138 = time()

			while true do
				local v139 = time()

				if not (p49 + v138 > v139) then
					break
				end

				local v140 = time()
				local v141 = round((v140 - v138) / p49 * n1, 2)

				v132.Size = UDim2.new(0, v141, 0, v141)
				CenterCircleGui(p50, v133, v134, v135, v136, v132)
				runService.RenderStepped:wait(0)
			end

			local v142 = round(n1, 2)

			v132.Size = UDim2.new(0, v142, 0, v142)
			CenterCircleGui(p50, v133, v134, v135, v136, v132)
			v132:Destroy()
			v133:Destroy()
			v134:Destroy()
			v135:Destroy()
			v136:Destroy()

			return true
		end
	}
}

for k, v in pairs(t2) do
	module.STYLES[#module.STYLES + 1] = k
	v.EnumID = #module.STYLES
end

local function makeScreenCover(p53, p54)
	local v145 = p54.AnimationTime or 1
	local v146 = v5.GetEnumName(module.STYLES, p54.AnimationStyle or "Fade")
	local v147 = v5.GetEnumName(module.TYPES, p54.Type or "TransitionOut")

	p53.Visible = true
	p53.Transparency = if v147 == "TransitionOut" then 0 else 1
	t2[v146][v147](v145, p53, p54)

	return p53
end

module.MakeScreenCover = makeScreenCover
module.makeScreenCover = makeScreenCover

return module
