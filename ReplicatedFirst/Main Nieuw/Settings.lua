



local replicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")
local userInputService: UserInputService = game:GetService("UserInputService")
local soundService: SoundService = game:GetService("SoundService")
local LocalPlayer = game.Players.LocalPlayer
local settings = LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("Settings")
local mouse = LocalPlayer:GetMouse()
local replicatedStorageDefaultColor = replicatedStorage.DefaultColor
local newFakeTopBar = require(replicatedStorage.NewFakeTopBar)
local transition = require(script.Parent.Transition)
local network = require(script.Parent.Network)
local audioService = require(replicatedStorage.AudioService)
local networkFireServer = network.FireServer
local networkClient = network.client
local inspection = require(script.Parent.Inspection)
local data = require(script.Parent.Data)

newFakeTopBar.new():setImage(1203479768):bindEvent("deselected", function()
	settings.Enabled = not settings.Enabled
end):oneClick()

local u16: boolean = false

local function isMouseHeldDown()
	return u16
end

userInputService.InputBegan:Connect(function(input: InputObject)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		u16 = true
	end
end)
userInputService.InputEnded:Connect(function(input: InputObject)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		u16 = false
	end
end)

local function MouseOutOfRange(p19)
	return math.abs(mouse.Y + p19.AbsoluteSize.Y * 0.5 - p19.AbsolutePosition.Y) > p19.AbsoluteSize.Y * 1.5
end

local t1: {[any]: any} = {
	Slider = function(p20, p21, p22)
		local u30: boolean = false

		local function StopHoldingZoomStick()
			u30 = false
		end

		StopHoldingZoomStick = function(p23, p24)
			p21(p23, p24)
		end
		p20.Bar.MouseButton1Down:Connect(function()
			u30 = true

			local rounded

			repeat
				local v60 = math.clamp((mouse.X - p20.Bar.AbsolutePosition.X) / p20.Bar.AbsoluteSize.X, 0, 1)

				p20.Bar.Visual.Position = UDim2.fromScale(v60, 0.5)
				rounded = math.round(v60 * 100)
				p20.Bar.Visual.Number.Text = rounded
				mouse.Move:wait()
			until not settings.Enabled or not u30 or not u16

			p21(rounded, true)
		end)

		if p22 then
			p20.Bar.Visual.Position = UDim2.fromScale(p22 / 100, 0.5)
			p20.Bar.Visual.Number.Text = p22
			p21(p22, nil)
		end
	end,
	Switch = function(p25, p26, p27)
		local u35: boolean = false

		local function flipSwitch(p28)
			if not u35 then
				u35 = true
				p25.Switch.BackgroundColor3 = Color3.fromRGB(0, 200, 255)
				p25.Switch.ImageLabel.Position = UDim2.fromScale(0.5, 0.5)
				p26(true, p28)

				return
			end

			u35 = false
			p25.Switch.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
			p25.Switch.ImageLabel.Position = UDim2.fromScale(0.1, 0.5)
			p26(false, p28)
		end

		p25.Switch.MouseButton1Click:Connect(function()
			flipSwitch(true)
		end)

		if p27 then
			u35 = not p27
			flipSwitch()
		end
	end
}

local module: {[any]: any} = {
	{
		Name = "SFX Volume",
		Type = "Slider",
		Func = function(p1, p2)
			soundService.VolumeGroup.Volume = p1 / 100

			if p2 then
				audioService.PlaySound("body_impact")
				networkFireServer("SetSettingsData", "SFX Volume", p1)
			end
		end
	},
	{
		Name = "Music Volume",
		Type = "Slider",
		Func = function(p3, p4)
			soundService.MusicGroup.Volume = p3 / 200

			if p4 then
				networkFireServer("SetSettingsData", "Music Volume", p3)
			end
		end
	},
	{
		Name = "Dark Mode",
		Type = "Switch",
		Func = function(p5, p6)
			if not p5 then
				replicatedStorageDefaultColor.Value = Color3.fromRGB(207, 220, 245)
				transition.ApplyBattleBackColorTween(replicatedStorageDefaultColor.Value, false)
				networkFireServer("SetSettingsData", "Dark Mode", false)
			else
				replicatedStorageDefaultColor.Value = Color3.fromRGB(35, 36, 45)
				transition.ApplyBattleBackColorTween(replicatedStorageDefaultColor.Value, true)
				networkFireServer("SetSettingsData", "Dark Mode", true)
			end

			if p6 then
				audioService.PlaySound("button.wav")
			end
		end
	},
	{
		Name = "Colorblind Mode",
		Type = "Switch",
		Func = function(p7, p8)
			inspection.SetCBMode(p7)
			networkFireServer("SetSettingsData", "Colorblind Mode", p7)

			if p8 then
				audioService.PlaySound("button.wav")
			end
		end
	},
	{
		Name = "Emoji Studs",
		Type = "Switch",
		Func = function(p9, p10)
			inspection.SetEmojiMode(p9)
			networkFireServer("SetSettingsData", "Emoji Studs", p9)

			if p10 then
				audioService.PlaySound("button.wav")
			end
		end
	},
	{
		Name = "Disable Battle Reminders",
		Type = "Switch",
		Func = function(p11, p12)
			if p12 then
				audioService.PlaySound("button.wav")
			end

			networkClient.SetReminderVisibility(p11)
			networkFireServer("SetSettingsData", "Disable Battle Reminders", p11)
		end
	},
	{
		Name = "Disable Battle Animations",
		Type = "Switch",
		Func = function(p13, p14)
			if p14 then
				audioService.PlaySound("button.wav")
			end

			networkClient.SetEffectAnimationsOff(p13)
			networkFireServer("SetSettingsData", "Disable Battle Animations", p13)
		end
	},
	{
		Name = "Quicker Effect Pop-ups",
		Type = "Switch",
		Func = function(p15, p16)
			if p16 then
				audioService.PlaySound("button.wav")
			end

			networkClient.SetAutoEffectPopUpHide(p15)
			networkFireServer("SetSettingsData", "Quicker Effect Pop-ups", p15)
		end
	}
}

for _, v in pairs(module) do
	local clone = settings.Templates[v.Type .. "Template"]:Clone()

	clone.Name = v.Name
	clone.TextLabel.Text = v.Name
	clone.Parent = settings.SettingsFrame.ScrollingFrame
	task.spawn(function()
		local clientReady: Instance = script.Parent:WaitForChild("ClientReady")

		repeat
			task.wait(0.1)
		until clientReady.Value == true

		if t1[v.Type] then
			local v54 = t1[v.Type]

			local v55 = v.Func or function(p29)
				print(p29)
			end

			local v56 = data.Settings()

			v54(clone, v55, v56[v.Name])
		end
	end)
	clone.Visible = true
end

return module
