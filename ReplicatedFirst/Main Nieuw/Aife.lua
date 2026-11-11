





local tweenService: TweenService = game:GetService("TweenService")
local runService: RunService = game:GetService("RunService")
local marketplaceService: MarketplaceService = game:GetService("MarketplaceService")
local runServiceRenderStepped = runService.RenderStepped
local LocalPlayer = game.Players.LocalPlayer
local visGui = LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("VisGui")
local visGuiAifeFrame = visGui.AifeFrame
local visGuiAifeFrameOptionFrame = visGuiAifeFrame.OptionFrame
local visGuiAife = visGui.Aife

require(game.ReplicatedStorage.Animation)

local handy = require(script.Parent.Handy)
local transition = require(script.Parent.Transition)
local audioService = require(game.ReplicatedStorage.AudioService)
local nonGameCard = require(script.Parent.NonGameCard)
local data = require(script.Parent.Data)
local effects = require(game.ReplicatedStorage.Effects)
local foilEffect = require(game.ReplicatedStorage.FoilEffect)
local cardAnim = require(game.ReplicatedStorage.CardAnim)
local network = require(script.Parent.Network)
local cardLibrary = require(game.ReplicatedStorage.CardLibrary)
local config = require(game.ReplicatedStorage.CONFIG)
local networkFireServer = network.FireServer
local networkInvokeServer = network.InvokeServer
local networkClient = network.client
local configCardsize = config.CARDSIZE
local n1: number = 34290567
local n2: number = 1324784794
local s1 = "None"
local s2 = "None"
local s3 = "None"
local s4: string = "Featured"
local n3 = 0
local t1: {[any]: any} = {}
local t2: {[any]: any} = {}
local t3: {[any]: any} = { Total = 0, Neutral = 0, Red = 0, Blue = 0, Green = 0, Yellow = 0 }

local function debounce(p1, p2, p3)
	if p3 then
		t1[p1] = tick() + p2

		return
	end

	local v73 = t1[p1] or 0
	local timestamp = tick()

	return v73 < timestamp
end
local function UpdatePlayButton()
	if s4 == "Featured" then
		visGuiAifeFrame.Play.Text = "PLAY FOR 75<stroke color=\"#023508\" joins=\"miter\" thickness=\"2\" transparency=\"0.25\"><font color =\"#00e12d\">R$</font></stroke>"
		visGuiAifeFrame.TenPlay.Text = "PLAY 10x FOR 750<stroke color=\"#023508\" joins=\"miter\" thickness=\"2\" transparency=\"0.25\"><font color =\"#00e12d\">R$</font></stroke><br />(Skips Minigame)"

		return
	end

	if s2 == "None" then
		visGuiAifeFrame.Play.Text = "PLAY FOR 35<stroke color=\"#023508\" joins=\"miter\" thickness=\"2\" transparency=\"0.25\"><font color =\"#00e12d\">R$</font></stroke>"
		visGuiAifeFrame.TenPlay.Text = "PLAY 10x FOR 350<stroke color=\"#023508\" joins=\"miter\" thickness=\"2\" transparency=\"0.25\"><font color =\"#00e12d\">R$</font></stroke><br />(Skips Minigame)"

		return
	end

	visGuiAifeFrame.Play.Text = "PLAY FOR 50<stroke color=\"#023508\" joins=\"miter\" thickness=\"2\" transparency=\"0.25\"><font color =\"#00e12d\">R$</font></stroke>"
	visGuiAifeFrame.TenPlay.Text = "PLAY 10x FOR 500<stroke color=\"#023508\" joins=\"miter\" thickness=\"2\" transparency=\"0.25\"><font color =\"#00e12d\">R$</font></stroke><br />(Skips Minigame)"
end

for _, v in pairs(visGuiAifeFrameOptionFrame:GetChildren()) do
	v.MouseButton1Click:connect(function()
		audioService.PlaySound("lock")

		if s1 == v then
			s1.BackgroundTransparency = 0.75
			s1 = "None"
			s2 = "None"
			visGuiAifeFrame.Play.BackgroundColor3 = Color3.fromRGB(123, 0, 245)
			visGuiAifeFrame.TenPlay.BackgroundColor3 = Color3.fromRGB(123, 0, 245)
			visGuiAifeFrame.ChanceTitle.Text = "<stroke color=\"#000000\" joins=\"miter\" thickness=\"2\" transparency=\"0.25\"><b>Odds of rolling specific card: (</b></stroke>" .. tostring(100 / t3.Total) .. "<stroke color=\"#000000\" joins=\"miter\" thickness=\"2\" transparency=\"0.25\"><b>%)</b></stroke>"
			visGuiAifeFrame.ChanceTitle.ChanceTitleShadow.Text = "<stroke color=\"#000000\" joins=\"miter\" thickness=\"2\" transparency=\"0.25\"><b>Odds of rolling specific card: (</b></stroke>" .. tostring(100 / t3.Total) .. "<stroke color=\"#000000\" joins=\"miter\" thickness=\"2\" transparency=\"0.25\"><b>%)</b></stroke>"
		else
			if s1 ~= "None" then
				s1.BackgroundTransparency = 0.75
			end

			s1 = v
			s2 = v.Name
			s1.BackgroundTransparency = 0
			visGuiAifeFrame.Play.BackgroundColor3 = v.BackgroundColor3
			visGuiAifeFrame.TenPlay.BackgroundColor3 = v.BackgroundColor3
			visGuiAifeFrame.ChanceTitle.Text = "<stroke color=\"#000000\" joins=\"miter\" thickness=\"2\" transparency=\"0.25\"><b>Odds of rolling specific card: (</b></stroke>" .. tostring(100 / t3[s2]) .. "<stroke color=\"#000000\" joins=\"miter\" thickness=\"2\" transparency=\"0.25\"><b>%)</b></stroke>"
			visGuiAifeFrame.ChanceTitle.ChanceTitleShadow.Text = "<stroke color=\"#000000\" joins=\"miter\" thickness=\"2\" transparency=\"0.25\"><b>Odds of rolling specific card: (</b></stroke>" .. tostring(100 / t3[s2]) .. "<stroke color=\"#000000\" joins=\"miter\" thickness=\"2\" transparency=\"0.25\"><b>%)</b></stroke>"
		end

		if s4 == "Featured" then
			visGuiAifeFrame.Play.Text = "PLAY FOR 75<stroke color=\"#023508\" joins=\"miter\" thickness=\"2\" transparency=\"0.25\"><font color =\"#00e12d\">R$</font></stroke>"
			visGuiAifeFrame.TenPlay.Text = "PLAY 10x FOR 750<stroke color=\"#023508\" joins=\"miter\" thickness=\"2\" transparency=\"0.25\"><font color =\"#00e12d\">R$</font></stroke><br />(Skips Minigame)"
		elseif s2 == "None" then
			visGuiAifeFrame.Play.Text = "PLAY FOR 35<stroke color=\"#023508\" joins=\"miter\" thickness=\"2\" transparency=\"0.25\"><font color =\"#00e12d\">R$</font></stroke>"
			visGuiAifeFrame.TenPlay.Text = "PLAY 10x FOR 350<stroke color=\"#023508\" joins=\"miter\" thickness=\"2\" transparency=\"0.25\"><font color =\"#00e12d\">R$</font></stroke><br />(Skips Minigame)"
		else
			visGuiAifeFrame.Play.Text = "PLAY FOR 50<stroke color=\"#023508\" joins=\"miter\" thickness=\"2\" transparency=\"0.25\"><font color =\"#00e12d\">R$</font></stroke>"
			visGuiAifeFrame.TenPlay.Text = "PLAY 10x FOR 500<stroke color=\"#023508\" joins=\"miter\" thickness=\"2\" transparency=\"0.25\"><font color =\"#00e12d\">R$</font></stroke><br />(Skips Minigame)"
		end

		print(s2)
	end)
end

local module: {[any]: any} = {}

function module.Show(p4)
	if not networkInvokeServer("CanUseArtBox") then
		networkClient.WarningMsg("Due to regional restrictions, Art Box is disabled for you, sorry!")
	elseif not visGui.OmniShop.Visible and not visGui.BattleNew.Visible and not visGui.QuestMenu.Visible then
		local timestamp = tick()

		if timestamp - n3 < 0.1 or visGuiAifeFrame.Visible then
			return
		end

		n3 = timestamp
		transition.ToggleBlack(1, 0.2)
		task.spawn(function()
			handy.Hide()
			transition.ShowBattleBack()
			transition.ToggleBlack(-1, 0.2)
		end)
		visGuiAifeFrame.Visible = true
		module.StartSlideshow()

		if not p4 then
			audioService.ChangeSong("Minigame")
		end

		return
	end
end

visGuiAifeFrame.Exit.MouseButton1Click:connect(function()
	local timestamp = tick()

	if timestamp - n3 < 0.1 or not visGuiAifeFrame.Visible then
		return
	end

	n3 = timestamp
	audioService.PlaySound("Toot")
	task.spawn(function()
		transition.ToggleBlack(1, 0.2)
		transition.HideBattleBack()
		audioService.Revert()
		task.wait(0.1)
		visGuiAifeFrame.Visible = false
		module.StopSlideshow()
		task.wait(0.1)
		handy.Show()
		handy.Expand()
		transition.ToggleBlack(-1, 0.2)
	end)
end)
visGuiAifeFrame.Play.MouseButton1Click:connect(function()
	if not networkInvokeServer("CanUseArtBox") then
		networkClient.WarningMsg("Due to regional restrictions, you cannot purchase this, sorry!")

		return
	end

	if not ((t1.Play or 0) < tick()) then
		return
	end

	t1.Play = tick() + 1
	audioService.PlaySound("lock")
	print("Playing")
	handy.Hide()
	n1 = if s4 == "Featured" then 1594253522 else if s2 == "None" then 34290567 else 1324784663
	s3 = s2
	marketplaceService:PromptProductPurchase(LocalPlayer, n1)
end)
visGuiAifeFrame.TenPlay.MouseButton1Click:connect(function()
	if not networkInvokeServer("CanUseArtBox") then
		networkClient.WarningMsg("Due to regional restrictions, you cannot purchase this, sorry!")

		return
	end

	if not ((t1.Play or 0) < tick()) then
		return
	end

	t1.Play = tick() + 1
	audioService.PlaySound("lock")
	print("Playing")
	handy.Hide()
	n2 = if s4 == "Featured" then 1594254182 else if s2 == "None" then 1324784794 else 1324784850
	s3 = s2
	marketplaceService:PromptProductPurchase(LocalPlayer, n2)
end)
visGuiAifeFrame.Title.Featured.MouseButton1Click:connect(function()
	local v78 = t1.SwitchTab or 0
	local timestamp = tick()

	if not (v78 < timestamp) then
		return
	end

	if s4 == "Featured" then
		return
	end

	t1.SwitchTab = tick() + 1
	audioService.PlaySound("click1")
	s4 = "Featured"
	visGuiAifeFrame.SubTitle.Text = "<stroke color=\"#000000\" joins=\"miter\" thickness=\"2\" transparency=\"0.25\"><b>Roll a Featured Exclusive Alt-art recently added to the Art Box!</b></stroke><br/><stroke color=\"#9c3282\" joins=\"miter\" thickness=\"2\" transparency=\"0\"><font color =\"#ec67c8\">50% chance</font></stroke><stroke color=\"#000000\" joins=\"miter\" thickness=\"2\" transparency=\"0.25\"> of Foil (★) on <b>duplicate pull!</b></stroke>"
	visGuiAifeFrame.SubTitle.SubTitleShadow.Text = "<stroke color=\"#000000\" joins=\"miter\" thickness=\"2\" transparency=\"0.95\"><b>Roll a Featured Exclusive Alt-art recently added to the Art Box!</b></stroke><br/><stroke color=\"#9c3282\" joins=\"miter\" thickness=\"2\" transparency=\"1\"><font color =\"#ec67c8\">50% chance</font></stroke><stroke color=\"#000000\" joins=\"miter\" thickness=\"2\" transparency=\"0.95\"> of Foil (★) on <b>duplicate pull!</b></stroke>"
	visGuiAifeFrame.ChanceTitle.Text = "<stroke color=\"#000000\" joins=\"miter\" thickness=\"2\" transparency=\"0.25\"><b>Odds of rolling specific card: (1%)</b></stroke>"
	visGuiAifeFrame.ChanceTitle.ChanceTitleShadow.Text = "<stroke color=\"#000000\" joins=\"miter\" thickness=\"2\" transparency=\"0.25\"><b>Odds of rolling specific card: (1%)</b></stroke>"

	local visGuiAifeFrameCardDisplayFrame = visGuiAifeFrame.CardDisplayFrame
	local CardDisplayFramePosition = visGuiAifeFrame.CardDisplayFrame.Position
	local v82 = UDim2.fromScale(1, 0)

	visGuiAifeFrameCardDisplayFrame:TweenPosition(CardDisplayFramePosition - v82, "Out", "Quart", 1)

	local visGuiAifeFrameOptionFrame = visGuiAifeFrame.OptionFrame

	CardDisplayFramePosition = visGuiAifeFrame.OptionFrame.Position
	v82 = UDim2.fromScale(1, 0)
	visGuiAifeFrameOptionFrame:TweenPosition(CardDisplayFramePosition - v82, "Out", "Quart", 1)

	local visGuiAifeFrameTargetInfo = visGuiAifeFrame.TargetInfo

	CardDisplayFramePosition = visGuiAifeFrame.TargetInfo.Position
	v82 = UDim2.fromScale(1, 0)
	visGuiAifeFrameTargetInfo:TweenPosition(CardDisplayFramePosition - v82, "Out", "Quart", 1)

	local visGuiAifeFrameFeaturedDisplayFrame = visGuiAifeFrame.FeaturedDisplayFrame

	CardDisplayFramePosition = visGuiAifeFrame.FeaturedDisplayFrame.Position
	v82 = UDim2.fromScale(-1, 0)
	visGuiAifeFrameFeaturedDisplayFrame:TweenPosition(CardDisplayFramePosition + v82, "Out", "Quart", 1)

	local visGuiAifeFrameViewContents = visGuiAifeFrame.ViewContents

	CardDisplayFramePosition = visGuiAifeFrame.ViewContents.Position
	v82 = UDim2.fromScale(-1, 0)
	visGuiAifeFrameViewContents:TweenPosition(CardDisplayFramePosition + v82, "Out", "Quart", 1)

	local visGuiAifeFrameTenPlay = visGuiAifeFrame.TenPlay
	local tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
	local color3 = Color3.fromRGB(245, 0, 87)

	tweenService:Create(visGuiAifeFrameTenPlay, tweenInfo, { BackgroundColor3 = color3 }):Play()

	local visGuiAifeFramePlay = visGuiAifeFrame.Play
	local tweenInfo2 = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
	local color32 = Color3.fromRGB(245, 0, 87)

	tweenService:Create(visGuiAifeFramePlay, tweenInfo2, { BackgroundColor3 = color32 }):Play()

	local visGuiAifeRouletteFrame = visGuiAife.RouletteFrame
	local tweenInfo3 = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
	local color33 = Color3.fromRGB(245, 0, 87)

	tweenService:Create(visGuiAifeRouletteFrame, tweenInfo3, { BackgroundColor3 = color33 }):Play()

	local arrowBot = visGuiAife.RouletteFrame.ArrowBot
	local tweenInfo4 = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
	local color34 = Color3.fromRGB(245, 0, 87)

	tweenService:Create(arrowBot, tweenInfo4, { BackgroundColor3 = color34 }):Play()

	local arrowTop = visGuiAife.RouletteFrame.ArrowTop
	local tweenInfo5 = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
	local color35 = Color3.fromRGB(245, 0, 87)

	tweenService:Create(arrowTop, tweenInfo5, { BackgroundColor3 = color35 }):Play()

	local shine = visGuiAife.RouletteFrame.Shine
	local tweenInfo6 = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
	local color36 = Color3.fromRGB(193, 0, 109)

	tweenService:Create(shine, tweenInfo6, { ImageColor3 = color36 }):Play()

	local back = visGuiAife.RouletteFrame.SpinButton.Back
	local tweenInfo7 = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
	local color37 = Color3.fromRGB(185, 0, 89)

	tweenService:Create(back, tweenInfo7, { ImageColor3 = color37 }):Play()

	local visGuiAifeFrameTitle = visGuiAifeFrame.Title
	local tweenInfo8 = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
	local color38 = Color3.fromRGB(245, 0, 87)

	tweenService:Create(visGuiAifeFrameTitle, tweenInfo8, { BackgroundColor3 = color38 }):Play()

	local featured = visGuiAifeFrame.Title.Featured
	local tweenInfo9 = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
	local color39 = Color3.fromRGB(180, 0, 66)

	tweenService:Create(featured, tweenInfo9, { BackgroundColor3 = color39 }):Play()

	local normal = visGuiAifeFrame.Title.Normal
	local tweenInfo10 = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
	local color310 = Color3.fromRGB(180, 0, 66)

	tweenService:Create(normal, tweenInfo10, { BackgroundColor3 = color310 }):Play()

	if s4 == "Featured" then
		visGuiAifeFrame.Play.Text = "PLAY FOR 75<stroke color=\"#023508\" joins=\"miter\" thickness=\"2\" transparency=\"0.25\"><font color =\"#00e12d\">R$</font></stroke>"
		visGuiAifeFrame.TenPlay.Text = "PLAY 10x FOR 750<stroke color=\"#023508\" joins=\"miter\" thickness=\"2\" transparency=\"0.25\"><font color =\"#00e12d\">R$</font></stroke><br />(Skips Minigame)"

		return
	end

	if s2 == "None" then
		visGuiAifeFrame.Play.Text = "PLAY FOR 35<stroke color=\"#023508\" joins=\"miter\" thickness=\"2\" transparency=\"0.25\"><font color =\"#00e12d\">R$</font></stroke>"
		visGuiAifeFrame.TenPlay.Text = "PLAY 10x FOR 350<stroke color=\"#023508\" joins=\"miter\" thickness=\"2\" transparency=\"0.25\"><font color =\"#00e12d\">R$</font></stroke><br />(Skips Minigame)"

		return
	end

	visGuiAifeFrame.Play.Text = "PLAY FOR 50<stroke color=\"#023508\" joins=\"miter\" thickness=\"2\" transparency=\"0.25\"><font color =\"#00e12d\">R$</font></stroke>"
	visGuiAifeFrame.TenPlay.Text = "PLAY 10x FOR 500<stroke color=\"#023508\" joins=\"miter\" thickness=\"2\" transparency=\"0.25\"><font color =\"#00e12d\">R$</font></stroke><br />(Skips Minigame)"
end)
visGuiAifeFrame.Title.Normal.MouseButton1Click:connect(function()
	local v117 = t1.SwitchTab or 0
	local timestamp = tick()

	if not (v117 < timestamp) then
		return
	end

	if s4 == "Normal" then
		return
	end

	t1.SwitchTab = tick() + 1
	audioService.PlaySound("click1")
	s4 = "Normal"
	visGuiAifeFrame.SubTitle.Text = "<stroke color=\"#000000\" joins=\"miter\" thickness=\"2\" transparency=\"0.25\"><b>Roll an Exclusive Alternate Art Card!</b></stroke><br/><stroke color=\"#3918be\" joins=\"miter\" thickness=\"2\" transparency=\"0\"><font color =\"#8762ff\">50% chance</font></stroke><stroke color=\"#000000\" joins=\"miter\" thickness=\"2\" transparency=\"0.25\"> of Foil (★) on <b>duplicate pull!</b></stroke>"
	visGuiAifeFrame.SubTitle.SubTitleShadow.Text = "<stroke color=\"#000000\" joins=\"miter\" thickness=\"2\" transparency=\"0.95\"><b>Roll an Exclusive Alternate Art Card!</b></stroke><br/><stroke color=\"#514dbe\" joins=\"miter\" thickness=\"2\" transparency=\"1\"><font color =\"#8762ff\">50% chance</font></stroke><stroke color=\"#000000\" joins=\"miter\" thickness=\"2\" transparency=\"0.95\"> of Foil (★) on <b>duplicate pull!</b></stroke>"

	if s2 == "None" then
		visGuiAifeFrame.ChanceTitle.Text = "<stroke color=\"#000000\" joins=\"miter\" thickness=\"2\" transparency=\"0.25\"><b>Odds of rolling specific card: (</b></stroke>" .. tostring(100 / t3.Total) .. "<stroke color=\"#000000\" joins=\"miter\" thickness=\"2\" transparency=\"0.25\"><b>%)</b></stroke>"
		visGuiAifeFrame.ChanceTitle.ChanceTitleShadow.Text = "<stroke color=\"#000000\" joins=\"miter\" thickness=\"2\" transparency=\"0.25\"><b>Odds of rolling specific card: (</b></stroke>" .. tostring(100 / t3.Total) .. "<stroke color=\"#000000\" joins=\"miter\" thickness=\"2\" transparency=\"0.25\"><b>%)</b></stroke>"
	else
		visGuiAifeFrame.ChanceTitle.Text = "<stroke color=\"#000000\" joins=\"miter\" thickness=\"2\" transparency=\"0.25\"><b>Odds of rolling specific card: (</b></stroke>" .. tostring(100 / t3[s2]) .. "<stroke color=\"#000000\" joins=\"miter\" thickness=\"2\" transparency=\"0.25\"><b>%)</b></stroke>"
		visGuiAifeFrame.ChanceTitle.ChanceTitleShadow.Text = "<stroke color=\"#000000\" joins=\"miter\" thickness=\"2\" transparency=\"0.25\"><b>Odds of rolling specific card: (</b></stroke>" .. tostring(100 / t3[s2]) .. "<stroke color=\"#000000\" joins=\"miter\" thickness=\"2\" transparency=\"0.25\"><b>%)</b></stroke>"
	end

	local visGuiAifeFrameFeaturedDisplayFrame = visGuiAifeFrame.FeaturedDisplayFrame
	local FeaturedDisplayFramePosition = visGuiAifeFrame.FeaturedDisplayFrame.Position
	local v121 = UDim2.fromScale(-1, 0)

	visGuiAifeFrameFeaturedDisplayFrame:TweenPosition(FeaturedDisplayFramePosition - v121, "Out", "Quart", 1)

	local visGuiAifeFrameViewContents = visGuiAifeFrame.ViewContents

	FeaturedDisplayFramePosition = visGuiAifeFrame.ViewContents.Position
	v121 = UDim2.fromScale(-1, 0)
	visGuiAifeFrameViewContents:TweenPosition(FeaturedDisplayFramePosition - v121, "Out", "Quart", 1)

	local visGuiAifeFrameCardDisplayFrame = visGuiAifeFrame.CardDisplayFrame

	FeaturedDisplayFramePosition = visGuiAifeFrame.CardDisplayFrame.Position
	v121 = UDim2.fromScale(1, 0)
	visGuiAifeFrameCardDisplayFrame:TweenPosition(FeaturedDisplayFramePosition + v121, "Out", "Quart", 1)

	local visGuiAifeFrameOptionFrame = visGuiAifeFrame.OptionFrame

	FeaturedDisplayFramePosition = visGuiAifeFrame.OptionFrame.Position
	v121 = UDim2.fromScale(1, 0)
	visGuiAifeFrameOptionFrame:TweenPosition(FeaturedDisplayFramePosition + v121, "Out", "Quart", 1)

	local visGuiAifeFrameTargetInfo = visGuiAifeFrame.TargetInfo

	FeaturedDisplayFramePosition = visGuiAifeFrame.TargetInfo.Position
	v121 = UDim2.fromScale(1, 0)
	visGuiAifeFrameTargetInfo:TweenPosition(FeaturedDisplayFramePosition + v121, "Out", "Quart", 1)

	local visGuiAifeFrameTenPlay = visGuiAifeFrame.TenPlay
	local tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
	local color3 = Color3.fromRGB(123, 0, 245)

	tweenService:Create(visGuiAifeFrameTenPlay, tweenInfo, { BackgroundColor3 = color3 }):Play()

	local visGuiAifeFramePlay = visGuiAifeFrame.Play
	local tweenInfo11 = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
	local color311 = Color3.fromRGB(123, 0, 245)

	tweenService:Create(visGuiAifeFramePlay, tweenInfo11, { BackgroundColor3 = color311 }):Play()

	local visGuiAifeRouletteFrame = visGuiAife.RouletteFrame
	local tweenInfo12 = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
	local color312 = Color3.fromRGB(123, 0, 245)

	tweenService:Create(visGuiAifeRouletteFrame, tweenInfo12, { BackgroundColor3 = color312 }):Play()

	local arrowBot = visGuiAife.RouletteFrame.ArrowBot
	local tweenInfo13 = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
	local color313 = Color3.fromRGB(123, 0, 245)

	tweenService:Create(arrowBot, tweenInfo13, { BackgroundColor3 = color313 }):Play()

	local arrowTop = visGuiAife.RouletteFrame.ArrowTop
	local tweenInfo14 = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
	local color314 = Color3.fromRGB(123, 0, 245)

	tweenService:Create(arrowTop, tweenInfo14, { BackgroundColor3 = color314 }):Play()

	local shine = visGuiAife.RouletteFrame.Shine
	local tweenInfo15 = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
	local color315 = Color3.fromRGB(111, 0, 175)

	tweenService:Create(shine, tweenInfo15, { ImageColor3 = color315 }):Play()

	local back = visGuiAife.RouletteFrame.SpinButton.Back
	local tweenInfo16 = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
	local color316 = Color3.fromRGB(111, 0, 175)

	tweenService:Create(back, tweenInfo16, { ImageColor3 = color316 }):Play()

	local visGuiAifeFrameTitle = visGuiAifeFrame.Title
	local tweenInfo17 = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
	local color317 = Color3.fromRGB(123, 0, 245)

	tweenService:Create(visGuiAifeFrameTitle, tweenInfo17, { BackgroundColor3 = color317 }):Play()

	local featured = visGuiAifeFrame.Title.Featured
	local tweenInfo18 = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
	local color318 = Color3.fromRGB(82, 0, 153)

	tweenService:Create(featured, tweenInfo18, { BackgroundColor3 = color318 }):Play()

	local normal = visGuiAifeFrame.Title.Normal
	local tweenInfo19 = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
	local color319 = Color3.fromRGB(82, 0, 153)

	tweenService:Create(normal, tweenInfo19, { BackgroundColor3 = color319 }):Play()

	if s4 == "Featured" then
		visGuiAifeFrame.Play.Text = "PLAY FOR 75<stroke color=\"#023508\" joins=\"miter\" thickness=\"2\" transparency=\"0.25\"><font color =\"#00e12d\">R$</font></stroke>"
		visGuiAifeFrame.TenPlay.Text = "PLAY 10x FOR 750<stroke color=\"#023508\" joins=\"miter\" thickness=\"2\" transparency=\"0.25\"><font color =\"#00e12d\">R$</font></stroke><br />(Skips Minigame)"

		return
	end

	if s2 == "None" then
		visGuiAifeFrame.Play.Text = "PLAY FOR 35<stroke color=\"#023508\" joins=\"miter\" thickness=\"2\" transparency=\"0.25\"><font color =\"#00e12d\">R$</font></stroke>"
		visGuiAifeFrame.TenPlay.Text = "PLAY 10x FOR 350<stroke color=\"#023508\" joins=\"miter\" thickness=\"2\" transparency=\"0.25\"><font color =\"#00e12d\">R$</font></stroke><br />(Skips Minigame)"

		return
	end

	visGuiAifeFrame.Play.Text = "PLAY FOR 50<stroke color=\"#023508\" joins=\"miter\" thickness=\"2\" transparency=\"0.25\"><font color =\"#00e12d\">R$</font></stroke>"
	visGuiAifeFrame.TenPlay.Text = "PLAY 10x FOR 500<stroke color=\"#023508\" joins=\"miter\" thickness=\"2\" transparency=\"0.25\"><font color =\"#00e12d\">R$</font></stroke><br />(Skips Minigame)"
end)

local u40: boolean = false
local n4: number = 0
local t5: {[any]: any} = {}
local t6: {[any]: any} = {}
local t7: {[any]: any} = {}
local t8: {[any]: any} = {}

for _, v in pairs(cardLibrary) do
	if v.Rarity and v.Rarity ~= "Token" and not v.Foil and not v.PlayTest then
		if v.AltArt then
			local vColor = v.Color

			t3[vColor] = t3[vColor] + 1
			t3.Total = t3.Total + 1
			table.insert(t7, v)
		end

		if v.PremiumArt then
			t2[v.PremiumArt] = v.LibraryIndex
		end
	end
end

local t9 = {}

for k, v in pairs(t2) do
	local numberValue: number? = tonumber(k)

	if numberValue then
		table.insert(t9, { number = numberValue, libraryIndex = v })
	end
end

table.sort(t9, function(p5, p6)
	return p5.number > p6.number
end)

for i = 1, math.min(100, #t9) do
	local v54 = cardLibrary[t9[i].libraryIndex]

	if v54 then
		table.insert(t8, v54)
	end
end

for _, v in pairs(visGuiAifeFrame.CardDisplayFrame:GetChildren()) do
	if v.Name ~= "UIListLayout" and v:FindFirstChild("Preview") then
		table.insert(t5, v.Preview)
	end
end

for _, v in pairs(visGuiAifeFrame.FeaturedDisplayFrame:GetChildren()) do
	if v.Name ~= "UIListLayout" and v:FindFirstChild("Preview") then
		table.insert(t6, v.Preview)
	end
end

t9 = function(p7)
	for _, v in pairs(p7:GetChildren()) do
		v:Destroy()
	end

	p7.Image = ""
end

local function SetCard(parent, p9)
	if parent and parent.Parent and p9 then
		for _, v in pairs(parent:GetChildren()) do
			v:Destroy()
		end

		local physicalCard: ImageButton = Instance.new("ImageButton")

		physicalCard.Name = "PhysicalCard"
		physicalCard.Position = UDim2.fromScale(0, 0)
		physicalCard.Size = UDim2.fromScale(1, 1)
		physicalCard.BackgroundTransparency = 1
		physicalCard.ImageTransparency = 1
		physicalCard.Image = "rbxassetid://" .. p9.Id
		physicalCard.Parent = parent
		nonGameCard.BindInspect(physicalCard, p9)

		local tweenInfo = TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)

		tweenService:Create(physicalCard, tweenInfo, { ImageTransparency = 0 }):Play()

		return
	end
end
local function HideCard(p10)
	if not p10 or not p10.Parent then
		return
	end

	local physicalCard = p10:FindFirstChild("PhysicalCard")

	if physicalCard then
		local tweenInfo = TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)

		tweenService:Create(physicalCard, tweenInfo, { ImageTransparency = 1 }):Play()

		return
	end

	p10.ImageTransparency = 1
end
local function GetShuffledCards(p11, p12, p13)
	local t11: {[any]: any} = {}

	for _, v in ipairs(p11) do
		table.insert(t11, v)
	end

	for i = #t11, 2, -1 do
		local randomNumber = math.random(1, i)
		local v178 = t11[i]

		t11[i] = t11[randomNumber]
		t11[randomNumber] = v178
	end

	local t12: {[any]: any} = {}

	for _, v in ipairs(t11) do
		local u182: boolean = false

		if p13 then
			for _, iterValue in ipairs(p13) do
				if iterValue == v then
					u182 = true

					break
				end
			end
		end

		if not u182 or p12 >= #t11 then
			table.insert(t12, v)
		end

		if p12 <= #t12 then
			break
		end
	end

	if p12 > #t12 then
		for _, v in ipairs(t11) do
			local u187: boolean = false

			for _, iterValue2 in ipairs(t12) do
				if iterValue2 == v then
					u187 = true

					break
				end
			end

			if not u187 then
				table.insert(t12, v)
			end

			if p12 <= #t12 then
				break
			end
		end
	end

	return t12
end
local function ShowNormalCards()
	local v190 = GetShuffledCards(t7, #t5)

	for i, v in ipairs(t5) do
		if v.Parent then
			local v193 = v190[i]

			if v193 then
				SetCard(v, v193)
			end
		end
	end
end
local function ShowFeaturedCards(p14)
	local v195 = GetShuffledCards(t8, #t6, p14)

	for i, v in ipairs(t6) do
		if v.Parent then
			local v198 = v195[i]

			if v198 then
				SetCard(v, v198)
			end
		end
	end

	return v195
end
local function HideAll(p15)
	for _, v in ipairs(p15) do
		if v.Parent then
			HideCard(v)
		end
	end
end
function module.StartSlideshow()
	if u40 then
		return
	end

	u40 = true
	n4 += 1

	local v202: number = n4

	task.spawn(function()
		task.wait(0.1)

		local t17 = {}

		while u40 and v202 == n4 and visGuiAifeFrame.Visible do
			for _, v in ipairs(t5) do
				if v.Parent then
					HideCard(v)
				end
			end

			task.wait(0.65)

			if not u40 or v202 ~= n4 or not visGuiAifeFrame.Visible then
				break
			end

			ShowNormalCards()

			for _, v in ipairs(t6) do
				if v.Parent then
					HideCard(v)
				end
			end

			task.wait(0.65)

			if not u40 or v202 ~= n4 or not visGuiAifeFrame.Visible then
				break
			end

			t17 = ShowFeaturedCards(t17)

			local n1 = 0

			while n1 < 7 and u40 and v202 == n4 and visGuiAifeFrame.Visible do
				local v292 = task.wait(0.25)

				n1 += v292
			end
		end
	end)
end
function module.StopSlideshow()
	u40 = false
	n4 += 1

	for _, v in ipairs(t5) do
		if v.Parent then
			for _, iterValue in pairs(v:GetChildren()) do
				iterValue:Destroy()
			end

			v.Image = ""
			v.ImageTransparency = 1
		end
	end

	for _, v in ipairs(t6) do
		if v.Parent then
			for _, iterValue2 in pairs(v:GetChildren()) do
				iterValue2:Destroy()
			end

			v.Image = ""
			v.ImageTransparency = 1
		end
	end
end

visGuiAifeFrame.ViewContents.MouseButton1Click:Connect(function()
	audioService.PlaySound("lock")
	visGuiAifeFrame.BoxContents:TweenPosition(UDim2.new(0.1, 0, 0.05, 0), "Out", "Quad", 0.8, true)
	UpdateFeaturedContentDisplay()
end)

function UpdateFeaturedContentDisplay()
	for _, v in pairs(visGuiAifeFrame.BoxContents.ContentList:GetChildren()) do
		if v:IsA("Frame") and v.Name ~= "TemplateCard" then
			v:Destroy()
		end
	end

	visGuiAifeFrame.BoxContents.ContentList.CanvasPosition = Vector2.new(0, 0)

	local templateCard = visGuiAifeFrame.BoxContents.ContentList.TemplateCard

	print(t2)

	for i = 1, #t2 do
		if i <= 100 then
			local v215 = t2[#t2 - i + 1]

			if not cardLibrary[v215] or cardLibrary[v215].Rarity == "Token" or not not cardLibrary[v215].PlayTest then
				continue
			end

			local clone = templateCard:Clone()

			clone.CardImage.Image = "rbxassetid://" .. cardLibrary[v215].Id
			clone.Name = cardLibrary[v215].Name
			clone.Parent = visGuiAifeFrame.BoxContents.ContentList
			clone.Visible = true
			nonGameCard.BindInspect(clone.CardImage, cardLibrary[v215])

			local v217 = data.OwnedCardCopies(v215)
			local v218 = data.OwnedCardCopies(v215 .. "-Foil")

			if v217 and v217["0"] and v217["0"] > 0 or v218 and v218["0"] and v218["0"] > 0 then
				local cloneOwnCount = clone.OwnCount
				local text: string = tostring(v217["0"] or 0)

				cloneOwnCount.Text = "Owned x" .. text

				if v218 and v218["0"] and v218["0"] > 0 then
					local ownCount = clone.OwnCount
					local OwnCountText = clone.OwnCount.Text
					local text2: string = tostring(v218["0"])

					ownCount.Text = OwnCountText .. " (" .. text2 .. "★)"
				end
			else
				clone.OwnCount.Text = "Unowned"
				clone.OwnCount.BackgroundColor3 = Color3.fromRGB(53, 53, 56)
				clone.CardImage.ImageColor3 = Color3.fromRGB(53, 53, 56)
			end

			clone.LayoutOrder = config.REVERSECOLORORDER[cardLibrary[v215].Color]
		end
	end
end

visGuiAifeFrame.BoxContents.Close.MouseButton1Click:Connect(function()
	audioService.PlaySound("Door_unlock")
	visGuiAifeFrame.BoxContents:TweenPosition(UDim2.new(0.1, 0, -3.05, 0), "Out", "Quad", 0.8, true)

	for _, v in pairs(visGuiAifeFrame.BoxContents.ContentList:GetChildren()) do
		if v:IsA("Frame") and v.Name ~= "TemplateCard" then
			v:Destroy()
		end
	end
end)

local function BaseCard(parent, p17)
	local imageButton: ImageButton = Instance.new("ImageButton")

	imageButton.Image = "rbxassetid://" .. data.CurrentSleeveId()
	imageButton.BackgroundTransparency = 1
	imageButton.Size = UDim2.new(configCardsize.x / configCardsize.y / (parent.AbsoluteSize.X / (parent.AbsoluteSize.Y * p17)), 0, p17, 0)
	imageButton.Parent = parent

	return imageButton
end
local function RevealCard(p18, p19)
	local scale = p18.Size.X.Scale
	local v232 = p18.Size.Y.Scale
	local uDim2 = UDim2.new(0, 0, v232, 0)

	p18:TweenSize(uDim2, "In", "Quad", 0.25, true)
	task.wait(0.25)

	local t13: {[any]: any} = { LibraryIndex = p19 }

	setmetatable(t13, { __index = cardLibrary[p19] })
	nonGameCard.BindInspect(p18, t13)
	p18.Image = "rbxassetid:\\\\" .. cardLibrary[p19].Id

	local uDim22 = UDim2.new(scale, 0, v232, 0)

	p18:TweenSize(uDim22, "Out", "Back", 0.25, true)

	if t13.Foil then
		foilEffect(p18, t13.LibraryIndex)
		spawn(function()
			effects.Foil(visGui.Aife, p18, p18)
		end)
	end

	if t13.ArtAnimation then
		cardAnim(p18, t13.ArtAnimation, t13.Foil)
	end
end

local t10: {[any]: any} = {
	Pick = function(p20)
		local u237 = nil
		local randomNumber = math.random(2, 4)
		local visGuiAifeChoiceFrame = visGuiAife.ChoiceFrame
		local visGuiAifeChoiceFrameHolder = visGuiAifeChoiceFrame.Holder

		visGuiAifeChoiceFrame.EndButton.Position = UDim2.new(1.1, 0, 0.1, 0)
		visGuiAifeChoiceFrame.Visible = true

		for i = 1, randomNumber do
			local n1 = randomNumber + 1
			local v243 = BaseCard(visGuiAifeChoiceFrameHolder, 0.9)

			v243.Position = UDim2.new(1 / n1 * i - v243.Size.X.Scale / 2, 0, 1.2, 0)
			v243.MouseButton1Click:connect(function()
				if u237 then
					return
				end

				u237 = v243
			end)

			local uDim2 = UDim2.new(1 / n1 * i - v243.Size.X.Scale / 2, 0, 0.05, 0)

			v243:TweenPosition(uDim2, "Out", "Quad", 1.5, true)
			task.wait(0.5)
		end

		u237 = nil

		repeat
			wait()
		until u237

		for _, v in pairs(visGuiAifeChoiceFrameHolder:GetChildren()) do
			if v ~= u237 then
				local uDim23 = UDim2.new(v.Position.X.Scale, 0, 1, 0)

				v:TweenPosition(uDim23, "Out", "Quad", 1.5, true)
				task.wait(0.5)
			end
		end

		task.wait(1)

		local uDim24 = UDim2.new(0.5 - u237.Size.X.Scale / 2, 0, 0.05, 0)

		u237:TweenPosition(uDim24, "InOut", "Quad", 1, true)
		task.wait(1.25)
		RevealCard(u237, p20)
		task.wait(1)
		visGuiAifeChoiceFrame.EndButton:TweenPosition(UDim2.new(0.8, 0, 0.1, 0), "InOut", "Quad", 1, true)
		visGuiAifeChoiceFrame.EndButton.MouseButton1Click:wait()
		delay(1, function()
			visGuiAifeChoiceFrame.Visible = false
			u237:Destroy()
		end)
	end,
	Spin = function(p21)
		local visGuiAifeRouletteFrame = visGuiAife.RouletteFrame
		local visGuiAifeRouletteFrameHolder = visGuiAifeRouletteFrame.Holder
		local t14: {[any]: any} = { "SPIN", "START", "GO" }
		local title = visGuiAifeRouletteFrame.SpinButton.Title
		local randomNumber = math.random(#t14)

		title.Text = t14[randomNumber]
		visGuiAifeRouletteFrame.Visible = true
		visGuiAifeRouletteFrame.SpinButton.MouseButton1Click:wait()
		t14 = { "STOP", "HALT", "CEASE", "DONE" }
		local v255 = visGuiAifeRouletteFrame.SpinButton.Title
		local randomNumber2 = math.random(#t14)

		v255.Text = t14[randomNumber2]

		local u257 = nil
		local u258 = nil

		u257 = visGuiAifeRouletteFrame.SpinButton.MouseButton1Click:connect(function()
			audioService.PlaySound("lock")
			u257:disconnect()

			local t18: {[any]: any} = { "!!!", "~", "..!", ":U" }
			local title = visGuiAifeRouletteFrame.SpinButton.Title
			local randomNumber3 = math.random(#t18)

			title.Text = t18[randomNumber3]
			u258 = true
			delay(1, function()
				visGuiAifeRouletteFrame.SpinButton.Title.Text = "Close"
			end)
		end)
		print("Spinning")

		local t15: {[any]: any} = {}

		local function NewCard()
			local v296 = BaseCard(visGuiAifeRouletteFrameHolder, 0.9)

			v296.Position = UDim2.new(-v296.Size.X.Scale, 0, 0.05, 0)
			v296:TweenPosition(UDim2.new(1, 0, 0.05, 0), nil, "Linear", 0.5, true)
			table.insert(t15, v296)
		end

		local n1 = 0

		while true do
			local v262 = runServiceRenderStepped:wait()

			n1 += v262

			for k, v in pairs(t15) do
				if v.Position.X.Scale == 1 then
					v:Destroy()
					table.remove(t15, k)
				end
			end

			v262 = t1.LastCardMade or 0

			local timestamp = tick()

			if v262 < timestamp then
				t1.LastCardMade = tick() + 0.1
				NewCard()
			end

			if u258 then
				break
			end
		end

		for _, v in pairs(t15) do
			v:TweenPosition(v.Position, nil, "Linear", 1, true)
		end

		local v268 = (function()
			local t19: {[any]: any} = { math.huge, nil }

			for _, v in pairs(t15) do
				local absoluteValue = math.abs(v.Position.X.Scale - (0.5 - v.Size.X.Scale / 2))

				if absoluteValue < t19[1] then
					t19[1] = absoluteValue
					t19[2] = v
				end
			end

			return t19[2]
		end)()

		RevealCard(v268, p21)
		task.wait(1)
		visGuiAifeRouletteFrame.SpinButton.MouseButton1Click:wait()
		delay(1, function()
			visGuiAifeRouletteFrame.Visible = false
			visGuiAifeRouletteFrameHolder:ClearAllChildren()
		end)
	end,
	Fountain = function(p22)
		local visGuiAifeFountainFrame = visGuiAife.FountainFrame

		visGuiAifeFountainFrame.Visible = true
		visGuiAifeFountainFrame.EndButton.Position = UDim2.new(1.1, 0, 0.7, 0)

		local visGuiAifeFountainFrameHolder = visGuiAifeFountainFrame.Holder
		local u272 = nil
		local n1 = 0
		local t16: {[any]: any} = {}

		local function NewCard()
			local v301 = BaseCard(visGuiAifeFountainFrameHolder, 0.2)

			v301.MouseButton1Click:connect(function()
				if u272 then
					return
				end

				u272 = v301
			end)

			local uDim2New = UDim2.new
			local n1 = 0.5 - v301.Size.X.Scale / 2
			local timestamp = tick()
			local randomNumber = math.random()
			local sine = math.sin(timestamp * randomNumber)
			local randomNumber4 = math.random()

			v301.Position = uDim2New(n1 + sine * 0.05 * randomNumber4, 0, 1, 0)

			local randomNumber5 = math.random(15, 20)
			local randomNumber6 = math.random(-20, 20)

			table.insert(t16, {
				v301,
				{ randomNumber5 * 1 / 4, randomNumber6 * 1 / 40 }
			})
		end

		while true do
			local v276 = runServiceRenderStepped:wait()

			n1 += v276

			for k, v in pairs(t16) do
				local v279 = v[1]

				if u272 ~= v279 then
					local v280 = v[2]

					v279.Position = UDim2.new(v279.Position.X.Scale + v280[2] * v276 * 0.4, 0, v279.Position.Y.Scale - v280[1] * v276 * 0.4, 0)
					v280[1] = v280[1] - 9 * v276 * 0.4

					if v279.Position.Y.Scale > 1 then
						v279:Destroy()
						table.remove(t16, k)
					end
				end
			end

			if not u272 and (t1.LastCardMade or 0) < tick() and #t16 < 50 then
				t1.LastCardMade = tick() + 0.05

				for _ = 2, math.random(4) do
					NewCard()
				end
			end

			if u272 and #t16 == 1 then
				break
			end
		end

		task.wait(0.25)

		local uDim2 = UDim2.new(u272.Size.X.Scale * 3.5, 0, u272.Size.Y.Scale * 3.5, 0)
		local uDim25 = UDim2.new(0.5 - u272.Size.X.Scale / 2 * 3.5, 0, 0.05, 0)

		u272:TweenSizeAndPosition(uDim2, uDim25, "InOut", "Quad", 1, true)
		task.wait(1)
		RevealCard(u272, p22)
		task.wait(1)
		visGuiAifeFountainFrame.EndButton:TweenPosition(UDim2.new(0.8, 0, 0.7, 0), "InOut", "Quad", 1, true)
		visGuiAifeFountainFrame.EndButton.MouseButton1Click:wait()
		delay(1, function()
			visGuiAifeFountainFrame.Visible = false
			u272:Destroy()
		end)
	end
}

local function HideMiniGame()
	transition.ToggleBlack(1)
	task.wait(1)
	transition.ToggleBlack(-1)
end
local function PlayMiniGame(p23)
	networkClient.Preload({ cardLibrary[p23].Id })
	transition.ToggleBlack(1)
	visGuiAifeFrame.Visible = false
	module.StopSlideshow()
	handy.Hide()
	task.wait(0.25)
	spawn(function()
		t10.Spin(p23)
		coroutine.resume(coroutine.create(function()
			task.wait(0.525)
			module.Show(true)
		end))
		transition.ToggleBlack(1)
		task.wait(1)
		transition.ToggleBlack(-1)
	end)
	task.wait(0.25)
	transition.ToggleBlack(-1)
	handy.Hide()
end
function networkClient.PlayAifeMinigame(p24)
	PlayMiniGame(p24)
end
function networkClient.GetColorTargetPurchase()
	return s3
end

print("Finished loading " .. script.Name)

return module
