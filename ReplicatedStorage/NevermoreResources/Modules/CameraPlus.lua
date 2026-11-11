



local v1
local replicatedStorage = game:GetService("ReplicatedStorage")

replicatedStorage = require(replicatedStorage:WaitForChild("NevermoreEngine")).LoadLibrary

local v3 = replicatedStorage("Easing")
local v4 = replicatedStorage("qCFrame")
local cFrameNew = CFrame.new
local scriptable = Enum.CameraType.Scriptable
local custom = Enum.CameraType.Custom
local t1: {[any]: any} = {}

CameraPlus = t1

local function ReadOnly(p1)
	local t6: {[any]: any} = {}

	setmetatable(t6, {
		__metatable = true,
		__index = p1,
		__newindex = function()
			error("Cannot add to read-only table", 0)
		end
	})

	return t6
end
local function CFrameToPosAndFocus(p2, p3)
	local p = p2.p
	local lookVector = p2.lookVector
	local typeName: string = type(p3)

	return p, p + lookVector * (typeName == "number" and p3 or 10)
end

local u11 = nil
local renderStepped = game:GetService("RunService").RenderStepped

u11 = function()
	renderStepped:wait()
end

local t2: {[any]: any} = {}

local function genericTween(p4, p5, p6, p7)
	if p7 then
		local n1 = t2[p7] and t2[p7] + 1 or 0

		t2[p7] = n1

		local v41 = tick
		local v42 = v41()
		local n2 = 0
		local v44 = u11

		while p5 > n2 and n1 == t2[p7] do
			local v45 = p4(n2, 0, 1, p5)

			n2 = v41() - v42
			p6(v45)
			v44()
		end

		if n1 == t2[p7] then
			p6(1)

			return
		end
	else
		local v46 = tick
		local v47 = v46()
		local n3 = 0
		local v49 = u11

		while p5 > n3 do
			local v50 = p4(n3, 0, 1, p5)

			n3 = v46() - v47
			p6(v50)
			v49()
		end

		p6(1)
	end
end

t1.GenericTween = genericTween

function t1.StopTween(p8)
	t2[p8] = t2[p8] and t2[p8] + 1 or 0
end

local u15 = nil
local t3: {[any]: any} = {}
local t4: {[any]: any} = {}
local t5: {[any]: any} = {}

for k, v in pairs(v3) do
	if k == "linear" then
		t3.Linear = v
		t4.Linear = v
		t5.Linear = v
	else
		local v21, v22 = k:match("^(inOut)(.+)")

		if not v21 or not v22 then
			local v23, v1 = k:match("^(in)(.+)")

			v21 = v23
			v22 = v1
		end

		if not v21 or not v22 then
			local v24, v1 = k:match("^(out)(.+)")

			v21 = v24
			v22 = v1
		end

		if v22 then
			local v25 = v22:sub(1, 1):upper()

			v1 = v22:sub(2):lower()
			v22 = v25 .. v1
		end

		if v21 == "inOut" then
			t5[v22] = v
		elseif v21 == "in" then
			t3[v22] = v
		elseif v21 == "out" then
			t4[v22] = v
		end
	end
end

local v26 = ReadOnly(t3)
local v27 = ReadOnly(t4)
local v28 = ReadOnly(t5)

t1.Ease = ReadOnly({ In = v26, Out = v27, InOut = v28 })

function t1.SetPosition(_, p10)
	if workspace.CurrentCamera.CameraType == scriptable then
		if not u15 then
			u15 = workspace.CurrentCamera.CoordinateFrame.p + workspace.CurrentCamera.CoordinateFrame.lookVector * 5
		end

		workspace.CurrentCamera.CoordinateFrame = cFrameNew(p10, u15)

		return
	end

	if not u15 then
		u15 = workspace.CurrentCamera.Focus.p
	end

	workspace.CurrentCamera.CoordinateFrame = cFrameNew(p10)
	workspace.CurrentCamera.Focus = cFrameNew(u15)
end
function t1.GetPosition(_)
	return workspace.CurrentCamera.CoordinateFrame.p
end
function t1.SetFocus(p12, p13)
	u15 = p13
	p12:SetPosition(p12:GetPosition())
end
function t1.SetView(p14, p15, p16)
	u15 = p16
	p14:SetPosition(p15)
end
function t1.SetFOV(_, p18)
	workspace.CurrentCamera.FieldOfView = p18
end
function t1.GetFOV(_)
	return workspace.CurrentCamera.FieldOfView
end
function t1.IncrementFOV(_, p21)
	workspace.CurrentCamera.FieldOfView = workspace.CurrentCamera.FieldOfView + p21
end
function t1.Tween(_, p23, p24, p25, p26, p27)
	workspace.CurrentCamera.CameraType = scriptable

	if p23 ~= p24 then
		genericTween(p26, p25, if p27 then function(p28)
			workspace.CurrentCamera.CoordinateFrame = v4.SlerpCFrame(p23, p24, p28)
			p27(p28)
		end else function(p29)
			workspace.CurrentCamera.CoordinateFrame = v4.SlerpCFrame(p23, p24, p29)
		end, "CoordinateFrame")

		return
	end

	print("[CameraPlus] - Start is end")
end
function t1.TweenTo(p30, p31, p32, p33, p34)
	workspace.CurrentCamera.CameraType = scriptable
	p30:Tween(workspace.CurrentCamera.CoordinateFrame, p31, p32, p33, p34)
end
function t1.TweenToPlayer(p35, p36, p37, p38)
	local LocalPlayer = game.Players.LocalPlayer
	local v81, v82 = LocalPlayer.Character:FindFirstChild("Humanoid")

	if v81 then
		v82 = v81.WalkSpeed
		v81.WalkSpeed = 0
	end

	local Head = LocalPlayer.Character.Head
	local cFrame = CFrame.new(Head.Position - Head.CFrame.lookVector * 10, Head.Position)

	p35:TweenTo(cFrame, p36, p37, p38)
	workspace.CurrentCamera.CameraType = custom
	workspace.CurrentCamera.CameraSubject = LocalPlayer.Character

	if v81 then
		v81.WalkSpeed = v82
	end
end
function t1.TweenFOV(_, p40, p41, p42, p43, _)
	local u91 = p40
	local n1 = p41 - p40

	genericTween(p43, p42, function(p45)
		u91 = p40 + n1 * p45
		workspace.CurrentCamera.FieldOfView = u91
	end, "FOV")
end
function t1.TweenToFOV(p46, p47, p48, p49, p50)
	p46:TweenFOV(workspace.CurrentCamera.FieldOfView, p47, p48, p49, p50)
end
function t1.TweenRoll(_, p52, p53, p54, p55)
	workspace.CurrentCamera.CameraType = scriptable

	local u103 = p52
	local n1 = p53 - p52

	genericTween(p55, p54, function(p56)
		u103 = p52 + n1 * p56
		workspace.CurrentCamera:SetRoll(u103)
	end, "Roll")
end
function t1.TweenToRoll(p57, p58, p59, p60)
	local v109: number = workspace.CurrentCamera:GetRoll()

	p57:TweenRoll(v109, p58, p59, p60)
end
function t1.TweenAll(_, p62, p63, p64, p65, p66, p67, p68, p69)
	workspace.CurrentCamera.CameraType = scriptable

	local p = p62.p
	local v120 = p
	local n1 = p + p62.lookVector * 10
	local v122 = p63.p
	local v123 = v122
	local n2 = v122 + p63.lookVector * 10
	local u125 = v120
	local n3 = n1
	local u127 = p64
	local n4 = p65 - p64
	local u129 = p66
	local n5 = p67 - p66

	genericTween(p69, p68, function(p70)
		u125 = v120:lerp(v123, p70)
		n3 = n1:lerp(n2, p70)
		u127 = p64 + n4 * p70
		u129 = p66 + n5 * p70
		workspace.CurrentCamera.CoordinateFrame = cFrameNew(u125, n3)
		workspace.CurrentCamera.FieldOfView = u127
		workspace.CurrentCamera:SetRoll(u129)
	end)
end
function t1.TweenToAll(p71, p72, p73, p74, p75, p76)
	workspace.CurrentCamera.CameraType = scriptable

	local CoordinateFrame: CFrame = workspace.CurrentCamera.CoordinateFrame
	local fieldOfView: number = workspace.CurrentCamera.FieldOfView
	local v139: number = workspace.CurrentCamera:GetRoll()

	p71:TweenAll(CoordinateFrame, p72, fieldOfView, p73, v139, p74, p75, p76)
end

return CameraPlus
