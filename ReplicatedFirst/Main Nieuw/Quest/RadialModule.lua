

-- Original SourceAssetId: https://assetdelivery.roblox.com/v1/asset/?id=6553499032

-- ! Source from the asset above; the game may have edited it since.

--[[
local module = {}

local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local progressUI = playerGui:WaitForChild("CircularProgress")
local main = progressUI:WaitForChild("Progress")

local runService = game:GetService("RunService")
local ts = game:GetService("TweenService")

local enabled = false

local config = script.Configuration

local percentValue = config.Percentage
local flipProgress = percentValue.FlipProgress
local image1 = main:WaitForChild("Frame1")
local image2 = main:WaitForChild("Frame2")

local colorSequenceColor = ColorSequence.new({ColorSequenceKeypoint.new(0,percentValue.ColorOfPercentPart.Value),ColorSequenceKeypoint.new(0.5,percentValue.ColorOfPercentPart.Value),ColorSequenceKeypoint.new(0.501,percentValue.ColorOfMissingPart.Value),ColorSequenceKeypoint.new(1,percentValue.ColorOfMissingPart.Value)})
local numberSequenceTrans = NumberSequence.new({NumberSequenceKeypoint.new(0,percentValue.TransOfPercentPart.Value),NumberSequenceKeypoint.new(0.5,percentValue.TransOfPercentPart.Value),NumberSequenceKeypoint.new(0.501,percentValue.TransOfMissingPart.Value),NumberSequenceKeypoint.new(1,percentValue.TransOfMissingPart.Value)})

local function update()
	if enabled then
		local PercentNumber = math.clamp(percentValue.Value * 3.6,0,360)
		local F1 = image1.ImageLabel
		local F2 = image2.ImageLabel
		
		F1.UIGradient.Rotation = flipProgress.Value == false and math.clamp(PercentNumber,180,360) or 180 - math.clamp(PercentNumber,0,180)
		F2.UIGradient.Rotation = flipProgress.Value == false and math.clamp(PercentNumber,0,180) or 180 - math.clamp(PercentNumber,180,360)
		F1.ImageColor3 = percentValue.ImageColor.Value
		F2.ImageColor3 = percentValue.ImageColor.Value
		F1.ImageTransparency = percentValue.ImageTrans.Value
		F2.ImageTransparency = percentValue.ImageTrans.Value
		F1.Image = "rbxassetid://" .. percentValue.ImageId.Value
		F2.Image = "rbxassetid://" .. percentValue.ImageId.Value
		
		if percentValue.MissingPartType.Value == "Color" then
			F1.UIGradient.Color = colorSequenceColor
			F2.UIGradient.Color = colorSequenceColor
			F1.UIGradient.Transparency = NumberSequence.new(0)
			F2.UIGradient.Transparency = NumberSequence.new(0)
		elseif percentValue.MissingPartType.Value == "Trans" then
			F1.UIGradient.Transparency = numberSequenceTrans
			F2.UIGradient.Transparency = numberSequenceTrans
			F1.UIGradient.Color = ColorSequence.new(Color3.new(1,1,1))
			F2.UIGradient.Color = ColorSequence.new(Color3.new(1,1,1))
		elseif percentValue.MissingPartType.Value == "TransAndColor" then
			F1.UIGradient.Transparency = numberSequenceTrans
			F2.UIGradient.Transparency = numberSequenceTrans
			F1.UIGradient.Color = colorSequenceColor
			F2.UIGradient.Color = colorSequenceColor
		else
			percentValue.MissingPartType.Value = "Trans"
			error("Unknown Type. Only 3 available: “Trans”, “Color” and “TransAndColor”, changing to “Trans”.")
		end
	end
end

function module:CancelProgress()
	percentValue.Value = 0
	update()
	enabled = false
end

function module:GenerateProgress(seconds)
	-- per100 = seconds/100

	-- so let's say seconds is, 3
	-- per100 = 3/100
	-- per100 = 0.03
	
	enabled = true
	percentValue.Value = 0
	
	local ti = TweenInfo.new(seconds, Enum.EasingStyle.Linear)
	local tween = ts:Create(percentValue, ti, {Value = 100})
	tween:Play();tween:Destroy()
end

update()

runService.Stepped:Connect(update)

return module

]]



local module: {[any]: any} = {}

module.__index = module

function module.new(instance, p2, p3)
	local object = setmetatable({}, module)

	object.Progress = 0
	object.Config = {}
	object.Config.ImageColor = Color3.fromRGB(255, 255, 255)
	object.Config.ImageId = p2 or "6553408336"
	object.Config.ImageTransparency = 0
	object.Config.FlipProgress = false
	object.Config.BackgroundTransparency = p3.BackgroundTransparency or 0.8
	object.Config.BackgroundType = p3.BackgroundType or "TransAndColor"
	object.Config.BackgroundColor = p3.BackgroundColor or Color3.fromRGB(0, 0, 0)
	object.Config.ProgressTransparency = p3.ProgressTransparency or 0
	object.Config.ProgressColor = p3.ProgressColor or Color3.fromRGB(255, 255, 255)

	local colorSequenceNew = ColorSequence.new

	object.ColorSequenceColor = colorSequenceNew({
		ColorSequenceKeypoint.new(0, object.Config.ProgressColor),
		ColorSequenceKeypoint.new(0.5, object.Config.ProgressColor),
		ColorSequenceKeypoint.new(0.501, object.Config.BackgroundColor),
		ColorSequenceKeypoint.new(1, object.Config.BackgroundColor)
	})

	local numberSequenceNew = NumberSequence.new

	object.NumberSequenceTrans = numberSequenceNew({
		NumberSequenceKeypoint.new(0, object.Config.ProgressTransparency),
		NumberSequenceKeypoint.new(0.5, object.Config.ProgressTransparency),
		NumberSequenceKeypoint.new(0.501, object.Config.BackgroundTransparency),
		NumberSequenceKeypoint.new(1, object.Config.BackgroundTransparency)
	})
	object.Instance = instance

	return object
end
function module.Update(p4)
	local v9 = math.clamp(p4.Progress * 3.6, 0, 360)
	local imageLabel = p4.Instance.Frame1.ImageLabel
	local v11 = p4.Instance.Frame2.ImageLabel
	local imageLabelUiGradient = imageLabel.UIGradient
	local v13 = p4.Config.FlipProgress == false and math.clamp(v9, 180, 360)

	if not v13 then
		v13 = 180 - math.clamp(v9, 0, 180)
	end

	imageLabelUiGradient.Rotation = v13

	local uiGradient = v11.UIGradient

	v13 = p4.Config.FlipProgress == false and math.clamp(v9, 0, 180)

	if not v13 then
		v13 = 180 - math.clamp(v9, 180, 360)
	end

	uiGradient.Rotation = v13
	imageLabel.ImageColor3 = p4.Config.ImageColor
	v11.ImageColor3 = p4.Config.ImageColor
	imageLabel.ImageTransparency = p4.Config.ImageTransparency
	v11.ImageTransparency = p4.Config.ImageTransparency
	imageLabel.Image = "rbxassetid://" .. p4.Config.ImageId
	v11.Image = "rbxassetid://" .. p4.Config.ImageId

	if p4.Config.BackgroundType == "Color" then
		imageLabel.UIGradient.Color = p4.ColorSequenceColor
		v11.UIGradient.Color = p4.ColorSequenceColor
		imageLabel.UIGradient.Transparency = NumberSequence.new(0)
		v11.UIGradient.Transparency = NumberSequence.new(0)

		return
	end

	if p4.Config.BackgroundType == "Trans" then
		imageLabel.UIGradient.Transparency = p4.NumberSequenceTrans
		v11.UIGradient.Transparency = p4.NumberSequenceTrans
		imageLabel.UIGradient.Color = ColorSequence.new(Color3.new(1, 1, 1))
		v11.UIGradient.Color = ColorSequence.new(Color3.new(1, 1, 1))

		return
	end

	if p4.Config.BackgroundType == "TransAndColor" then
		imageLabel.UIGradient.Transparency = p4.NumberSequenceTrans
		v11.UIGradient.Transparency = p4.NumberSequenceTrans
		imageLabel.UIGradient.Color = p4.ColorSequenceColor
		v11.UIGradient.Color = p4.ColorSequenceColor

		return
	end

	p4.Config.BackgroundType = "Trans"
	error("Unknown Type. Only 3 available: “Trans”, “Color” and “TransAndColor”, changing to “Trans”.")
end
function module.SetProgress(p5, progress)
	p5.Progress = progress
	p5:Update()
end
function module.TweenProgress(p7, p8, p9)
	local tweenInfo = TweenInfo.new(p9 or 1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
	local numberValue: NumberValue = Instance.new("NumberValue")

	numberValue.Value = p7.Progress

	local v22: Tween = game:GetService("TweenService"):Create(numberValue, tweenInfo, { Value = p8 or 100 })

	local connection = game:GetService("RunService").Heartbeat:Connect(function()
		p7.Progress = numberValue.Value
		p7:Update()
	end)

	v22:Play()
	v22.Completed:Connect(function()
		connection:Disconnect()
		numberValue:Destroy()
		p7.Progress = p8

		if p7.Callback then
			p7.Callback()
		end
	end)

	return { v22, connection, numberValue }
end

return module
