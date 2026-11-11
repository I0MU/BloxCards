





local LocalPlayer = game.Players.LocalPlayer
local visGui = LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("VisGui")
local starterQuests = visGui:WaitForChild("StarterQuests")
local ugcEvent = visGui:WaitForChild("UGCEvent")
local scrollMenu = LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("ScrollMenu")
local umberlordMenu = LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("UmberlordMenu")

game:GetService("Chat")

local replicatedStorage = game:GetService("ReplicatedStorage")
local BloxBuxValue = game.ReplicatedStorage.Strings.BloxBux.Value
local stepped = game:GetService("RunService").Stepped
local userInputService: UserInputService = game:GetService("UserInputService")
local contextualize = require(script.Parent.Contextualize)
local engines = require(script.Parent.Engines)
local enginesEngines = engines.engines
local transition = require(script.Parent.Transition)

require(script.Parent.UnpackCards)

local mainOffers = require(script.MainOffers)
local foilEffect = require(game.ReplicatedStorage.FoilEffect)
local utils = require(game.ReplicatedStorage.Utils)
local utilsSetZIndex = utils.SetZIndex
local utilsLerp = utils.Lerp
local nevermore = require(script.Parent.Nevermore)
local nevermorePaperRipple = nevermore.PaperRipple
local v22 = nevermore.ScrollingFrame
local u23: boolean = false
local s1: string = ""

nevermore = require(script.Parent.HorizontalScrollingList)

local handy = require(script.Parent.Handy)
local handyHandy = handy.handy
local customscalings = require(script.Parent.CustomScalings).customscalings
local nonGameCard = require(script.Parent.NonGameCard)
local audioService = require(game.ReplicatedStorage.AudioService)
local cardLibrary = (function()
	local real = require(game.ReplicatedStorage.CardLibrary)
	return setmetatable({}, {
		__index = function(_, name)
			local c = real[name]
			if c == nil and type(name) == "string" then return { Id = 0, Name = name } end
			return c
		end,
		__pairs = function() return pairs(real) end,
	})
end)()
local robuxService = require(script.Parent.RobuxService)

require(script.Parent.PreloadService)

local animation = require(game.ReplicatedStorage.Animation)
local mouseAwayFrom = require(script.Parent.FakeMouse).MouseAwayFrom
local unpackCards = require(script.Parent.UnpackCards)
local aife = require(script.Parent.Aife)
local packs = require(game.ReplicatedStorage.Packs)
local effects = require(game.ReplicatedStorage.Effects)
local network = require(script.Parent.Network)
local networkFireServer = network.FireServer
local networkInvokeServer = network.InvokeServer
local networkClient = network.client
local battleBackgrounds = require(game.ReplicatedStorage.BattleBackgrounds)
local battleTutorial = require(game.ReplicatedStorage.BattleTutorial)
local sleeveMenu = require(replicatedStorage.UI.SleeveMenu)

replicatedStorage = require(script.Parent.Sleeves)

local replicatedStorageSleeves = replicatedStorage.sleeves
local replicatedStoragePrettysleeves = replicatedStorage.prettysleeves
local data = require(script.Parent.Data)
local dataUpdateCashMoney = data.UpdateCashMoney
local config = require(game.ReplicatedStorage.CONFIG)
local configCardzindex = config.CARDZINDEX

replicatedStorage = config.CARDSIZE

local configClr = config.CLR
local v52 = config.NOTICES
local color3New = Color3.new
local uDim2New = UDim2.new

local function isTestServer()
	return utils.IsPBE() or game.PlaceId == 5932060432
end
function networkClient.UpdateProducts(products)
	robuxService.Products = products
end

handyHandy.Shop.MouseEnter:connect(function()
	contextualize(handyHandy.Shop, "Buy cards, decks, sleeves, bloxbux!", nil)
end)

local visGuiOmniShop = visGui.OmniShop
local s2 = "Start"
local t1: {[any]: any} = {}
local n1: number = 0
local n2: number = 1
local u61 = nil
local visGuiOmniShopStart = visGuiOmniShop.Start
local t2: {[any]: any} = {
	BloxBux = "Premium offers that cost Robux",
	Packs = "Buy cards here!",
	Decks = "Prebuilt decks of Groups!",
	Sleeves = "Cosmetic card sleeves or \"backs\"",
	Codes = "Redeem codes and get insant rewards!",
	Close = "Thank you, come again!",
	ArtBox = "Roll for unique card arts!",
	Sets = "Group, set, and collection deals!",
	Crossovers = "Card sets and Groups based off other games!",
	Backgrounds = "Buy and earn cosmetic battle backgrounds!",
	EventShop = "Exchange special currency for rewards!"
}

local function v64(p2)
	if game:GetService("RunService"):IsStudio() then
		print(p2)
	end
end

visGuiOmniShop.Title.Back.MouseEnter:connect(function()
	if s2 == "Start" then
		contextualize(visGuiOmniShop.Title.Back, "Thank you, come again!")

		return
	end

	contextualize(visGuiOmniShop.Title.Back, "Back")
end)

for _, v in pairs(visGuiOmniShopStart:GetChildren()) do
	if v52[v.Name] and v:FindFirstChild("ButtonNotice") then
		v.ButtonNotice.Visible = true
		v.ButtonNotice.Title.Text = v52[v.Name]
	end

	if t2[v.Name] and v:FindFirstChild("Title") then
		v.Title.MouseEnter:connect(function()
			contextualize(v, t2[v.Name])
		end)
	end
end

local function OutPos(p3, p4)
	if p3.X.Scale < 0.005 and p3.Y.Scale > 0.5 then
		return uDim2New(0, 0, 1, 0)
	end

	if p3.X.Scale + p4.X.Scale > 0.9 or p3.X.Scale > 0.5 then
		return uDim2New(1 + p3.X.Scale, 0, p3.Y.Scale, 0)
	end

	if p3.Y.Scale + p4.Y.Scale > 0.9 and p4.X.Scale > 0.5 then
		return uDim2New(p3.X.Scale, 0, 1 + p3.Y.Scale, 0)
	end

	if p3.X.Scale < 0.5 then
		return uDim2New(-p4.X.Scale, 0, p3.Y.Scale, 0)
	end

	return p3
end

local t3: {[any]: any} = {}

for _, v in pairs(visGuiOmniShop:GetChildren()) do
	if v:IsA("Folder") then
		for _, iterValue in pairs(v:GetChildren()) do
			t3[v.Name .. iterValue.Name] = iterValue.Position
		end
	end
end

t3.Title = visGuiOmniShop.Title.Position

local v73 = game.ReplicatedStorage.FoilEffect
local t4: {[any]: any} = { 0, 1, 2, 1, 1.41, 2.24 }
local visGuiOmniShopBloxBux = visGuiOmniShop.BloxBux

local function AnimationAsyncBatch(...)
	for _, v in pairs(...) do
		animation.AnimateAsync(v)
	end
end
local function PrepareElement(p5)
	local t11: {[any]: any} = {}

	if p5.Name == "Button" then
		t11.ImageTransparency = 1
	elseif p5.Name == "Title" then
		t11.TextTransparency = 1
		t11.TextStrokeTransparency = 0.9
	elseif p5.Name == "Back" then
		t11.TextTransparency = 1
		t11.TextStrokeTransparency = 1
	elseif p5.Name == "Shadow" or p5.Name == "PercentOff" then
		t11.BackgroundTransparency = 1
	end

	animation.AnimateAsync(p5, t11, 0, "Out", "Linear")

	for _, v in pairs(p5:GetChildren()) do
		PrepareElement(v)
	end
end
local function PrepareButton(p6)
	p6.Position = t3[visGuiOmniShopBloxBux.Name .. p6.Name] + UDim2.new(0, 0, 0.1, 0)
	PrepareElement(p6)
	p6.Visible = true
end
local function FadeInElement(p7)
	local t12: {[any]: any} = {}

	if p7.Name == "Button" then
		t12.ImageTransparency = 0
	elseif p7.Name == "TicketLabel" then
		p7.Visible = true
	elseif p7.Name == "Title" then
		t12.TextTransparency = 0
		t12.TextStrokeTransparency = 0.9
	elseif p7.Name == "Back" then
		t12.TextTransparency = 0.9
		t12.TextStrokeTransparency = 0.9
	elseif p7.Name == "Shadow" then
		t12.BackgroundTransparency = 0.8
	elseif p7.Name == "PercentOff" then
		t12.BackgroundTransparency = 0
	end

	animation.AnimateAsync(p7, t12, 0.3333333333333333, "Out", "Quad")

	for _, v in pairs(p7:GetChildren()) do
		FadeInElement(v)
	end
end
local function FadeInButton(p8)
	animation.AnimateAsync(p8, { ImageTransparency = 0, Position = t3["BloxBux" .. p8.Name] }, 0.3333333333333333, "Out", "Quad")

	for _, v in pairs(p8:GetChildren()) do
		FadeInElement(v)
	end
end
local function FadeOutElement(p9)
	local t13: {[any]: any} = {}

	if p9:IsA("ImageButton") then
		t13.ImageTransparency = 1
	elseif p9.Name == "Title" or p9.Name == "Back" then
		t13.TextTransparency = 1
		t13.TextStrokeTransparency = 1
	elseif p9:IsA("Frame") then
		t13.BackgroundTransparency = 1
	elseif p9.Name == "TicketLabel" then
		p9.Visible = false
	end

	animation.AnimateAsync(p9, t13, 0.16666666666666666, "In", "Quad")

	for _, v in pairs(p9:GetChildren()) do
		FadeOutElement(v)
	end
end
local function FadeOutButton(p10)
	animation.AnimateAsync(p10, { ImageTransparency = 1 }, 0.16666666666666666, "In", "Quad").Completed:Connect(function()
		p10.Visible = false
	end)

	for _, v in pairs(p10:GetChildren()) do
		FadeOutElement(v)
	end
end

local t5: {[any]: any} = {
	BloxBux = {
		In = function()
			task.wait(0.25)

			for i = 1, #t4 do
				delay(t4[i] * 0.04, function()
					local text: string = tostring(i)
					local v600 = visGuiOmniShopBloxBux[text]

					v600.Position = t3[visGuiOmniShopBloxBux.Name .. v600.Name] + UDim2.new(0, 0, 0.1, 0)
					PrepareElement(v600)
					v600.Visible = true

					local text2: string = tostring(i)

					FadeInButton(visGuiOmniShopBloxBux[text2])
				end)
			end
		end,
		Out = function()
			for i = 1, #t4 do
				local text: string = tostring(i)

				FadeOutButton(visGuiOmniShopBloxBux[text])
			end

			task.wait(0.16666666666666666)
		end
	},
	Sleeves = {
		In = function()
			u61 = sleeveMenu.Controller.new({
				handleToBackgrounds = function()
					task.defer(function()
						audioService.PlaySound("lock")
						GoTo("Backgrounds")
					end)
				end
			})

			if u61 ~= nil then
				u61:Mount(visGuiOmniShop)
			end
		end,
		Out = function()
			pcall(function()
				if u61 ~= nil then
					u61:Destroy()
					u61 = nil
				end
			end)
		end
	}
}

local function FadeOut(p11)
	if t5[p11] then
		t5[p11].Out()

		return
	end

	local v255 = visGuiOmniShop[p11]

	for _, v in pairs(v255:GetChildren()) do
		task.spawn(function()
			local animationAnimateAsync = animation.AnimateAsync
			local v603 = OutPos(t3[v255.Name .. v.Name], v.Size)

			animationAnimateAsync(v, { Position = v603 }, 0.45, "Out", "Quad")
			task.wait(0.35)
			v.Visible = false
		end)
	end
end
local function FadeIn(p12)
	if t5[p12] then
		t5[p12].In()

		return
	end

	local v259 = visGuiOmniShop[p12]

	for _, v in pairs(v259:GetChildren()) do
		v.Position = OutPos(t3[v259.Name .. v.Name], v.Size)
		v:TweenPosition(t3[v259.Name .. v.Name], "Out", "Quad", 0.8, true)
		v.Visible = true
	end
end

local t6: {[any]: any} = {}

function GetCurrentOffers()
	if not config.CURRENT_OFFER then
		return nil
	end

	local t14: {[any]: any} = {}

	data.GetPurchases()

	for _, v in pairs(config.CURRENT_OFFER) do
		local v265 = mainOffers.OfferMap[v]

		if not v265 or network.InvokeServer("OfferValid", v265) then
			t14[#t14 + 1] = v
		end
	end

	return t14
end

v52 = { CurrentOffers = GetCurrentOffers() }
local currentOffers = v52.CurrentOffers

function UpdateCurrentOffers(currentOffers)
	robuxService.CurrentOffers = currentOffers
end

network.client.UpdateOffers = UpdateCurrentOffers

local u88: boolean = false

function GoTo(p14)
	while u88 do
		task.wait()
	end

	print("Going to", p14, "from", s2)

	if p14 == s2 then
		return
	end

	if p14 == "Start" then
		n1 = if n1 == #currentOffers then 1 else n1 + 1
		SwitchOffer(n1)
	end

	if p14 == "Backgrounds" then
		networkClient.UpdateBackgroundShop()
	else
		local transitionChangeBattleBackground = transition.ChangeBattleBackground
		local v269 = data.CurrentBackgroundName()

		transitionChangeBattleBackground(v269 or "")
	end

	if p14 == "Close" then
		FadeOut(s2)
		HideOmniShop()
		networkClient.SetControlsEnabled(true)

		return
	end

	u88 = true

	if s2 ~= "Closed" then
		FadeOut(s2)
	end

	FadeIn(p14)

	if p14 == "Unpack" then
		local visGuiOmniShopTitle = visGuiOmniShop.Title
		local v271 = uDim2New(-1, 0, visGuiOmniShop.Title.Position.Y.Scale, 0)

		visGuiOmniShopTitle:TweenPosition(v271, "Out", "Quad", 0.8, true)
	elseif s2 == "Unpack" then
		local title = visGuiOmniShop.Title
		local v273 = uDim2New(0, 0, visGuiOmniShop.Title.Position.Y.Scale, 0)

		title:TweenPosition(v273, "Out", "Quad", 0.8, true)
	end

	s2 = p14

	if t6[p14] then
		t6[p14]()
	end

	visGuiOmniShop.Title.Title.Text = s2 ~= "Start" and s2 or "Shop"

	if s2 == "EventShop" or s2 == "EventSubShop" then
		visGuiOmniShop.Title.Title.Text = "Exchange Shop"
	end

	task.wait(0.8)
	u88 = false
end
function ShowOmniShop(p15)
	while visGuiOmniShop.Visible do
		task.wait()
	end

	if visGui.BattleNew.Visible then
		return
	end

	spawn(handy.Hide)
	transition.ToggleBlack(1, 0.3)
	spawn(function()
		audioService.ChangeSong("Premium")
	end)
	visGuiOmniShop.Title.Position = uDim2New(-1, 0, visGuiOmniShop.Title.Position.Y.Scale, 0)
	visGuiOmniShop.Visible = true
	transition.ShowBattleBack()

	local visGuiOmniShopTitle = visGuiOmniShop.Title
	local v276 = uDim2New(0, 0, visGuiOmniShop.Title.Position.Y.Scale, 0)

	visGuiOmniShopTitle:TweenPosition(v276, "Out", "Quad", 0.6, true)
	networkFireServer("EnterShop")
	task.spawn(function()
		transition.ToggleBlack(-1, 0.3)
	end)

	if next(mainOffers.CardAnims) then
		for _, v in pairs(mainOffers.CardAnims) do
			for k, _ in pairs(v) do
				for k2, _ in pairs(v[k]) do
					v[k][k2]:Play()
				end
			end
		end
	end

	if type(p15) == "string" then
		GoTo(p15)

		return
	end

	GoTo("Start")
end

networkClient.ShowOmniShop = ShowOmniShop

function HideOmniShop()
	spawn(function()
		if s2 ~= "Closed" then
			FadeOut(s2)
		end

		s2 = "Closed"
		task.spawn(function()
			transition.ToggleBlack(1, 0.3)
		end)

		local visGuiOmniShopTitle = visGuiOmniShop.Title
		local v605 = uDim2New(-1, 0, visGuiOmniShop.Title.Position.Y.Scale, 0)

		visGuiOmniShopTitle:TweenPosition(v605, "Out", "Quad", 0.5, true)
		task.wait(0.3)
		visGuiOmniShop.Visible = false
	end)
	networkFireServer("LeaveShop")
	transition.ToggleBlur(-1, 0.3)
	task.spawn(transition.HideBattleBack)
	visGui.UnpackScreen.Visible = false

	if next(mainOffers.CardAnims) then
		for _, v in pairs(mainOffers.CardAnims) do
			for k, _ in pairs(v) do
				for k3, _ in pairs(v[k]) do
					v[k][k3]:Pause()
				end
			end
		end
	end

	task.spawn(function()
		task.wait(0.4)
		handy.Show()
		handy.Expand()
		task.wait(0.2)
		transition.ToggleBlack(-1, 0.3)
	end)
	audioService.Revert()
end

networkClient.HideOmniShop = HideOmniShop
task.spawn(function()
	FadeOut("Start")
	s2 = "Closed"
end)

for _, v in pairs(visGuiOmniShop.Start:GetChildren()) do
	if not v:IsA("Offers") and v:FindFirstChild("Title") then
		local darken = v:WaitForChild("Darken")
		local default = v:WaitForChild("Default")
		local light = v:WaitForChild("Light")
		local tweenService: TweenService = game:GetService("TweenService")
		local tweenInfo = TweenInfo.new(0.1, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut)
		local v96: Tween = tweenService:Create(v, tweenInfo, { ImageColor3 = darken.Value })
		local v97: Tween = tweenService:Create(v, tweenInfo, { ImageColor3 = default.Value })
		local v98: Tween = tweenService:Create(v, tweenInfo, { ImageColor3 = light.Value })

		nevermorePaperRipple.FromParent(v)
		v.MouseButton1Click:connect(function()
			if u23 and s1 ~= v.Name then
				return
			end

			v96:Play()
			print(v.Name)
			audioService.PlaySound("lock")

			if v.Name == "ArtBox" then
				if not networkInvokeServer("CanUseArtBox") then
					networkClient.WarningMsg("Due to regional restrictions, Art Box is disabled for you, sorry!")

					return
				end

				GoToArtBox()
				aife.Show()

				return
			end

			GoTo(v.Name)
		end)

		local n3: number = 1
		local n4 = 0
		local vIcon = v.Icon

		local function StopFunction(_, _)
			vIcon.Rotation = utilsLerp(vIcon.Rotation, 0, 0.1)

			if vIcon.Rotation == 0 then
				engines.RemoveEngine("UpdateShopButton" .. v.Name .. "Stop")
			end
		end
		local function SwayFunction(p18, _)
			local sine = math.sin(n4)

			vIcon.Rotation = utilsLerp(vIcon.Rotation, sine * 15, 0.2)
			n4 += p18 * n3 * 3

			if s2 ~= "Start" then
				engines.RemoveEngine("UpdateShopButton" .. v.Name)
				enginesEngines["UpdateShopButton" .. v.Name .. "Stop"] = StopFunction
			end
		end

		v.MouseEnter:connect(function()
			audioService.PlaySound("click2")
			v98:Play()
			n4 = 0
			n3 = if math.random() > 0.5 then 1 else -1
			engines.RemoveEngine("UpdateShopButton" .. v.Name .. "Stop")
			enginesEngines["UpdateShopButton" .. v.Name] = SwayFunction
		end)
		v.MouseLeave:connect(function()
			v97:Play()
			engines.RemoveEngine("UpdateShopButton" .. v.Name)
			enginesEngines["UpdateShopButton" .. v.Name .. "Stop"] = StopFunction
		end)
	end
end

function GoToArtBox()
	task.spawn(function()
		if s2 ~= "Closed" then
			FadeOut(s2)
		end

		s2 = "Closed"
		transition.ToggleBlack(1, 0.2)

		local visGuiOmniShopTitle = visGuiOmniShop.Title
		local v607 = uDim2New(-1, 0, visGuiOmniShop.Title.Position.Y.Scale, 0)

		visGuiOmniShopTitle:TweenPosition(v607, "Out", "Quad", 0.2, true)
		visGuiOmniShop.Visible = false
	end)
	networkFireServer("LeaveShop")
	task.spawn(transition.HideBattleBack)
	audioService.Revert()
end

nevermorePaperRipple.FromParent(visGuiOmniShop.Title)

local function CannotGoToStart()
	if visGui.PreconstructedDeckSelector.Visible == true then
		return true
	end

	return false
end
local function StartShopTutorial()
	mainOffers.DisableButtons(true)
	u23 = true
	task.wait(2)
	battleTutorial.SetSpritesheet("rbxassetid://121407898586909", 3)
	battleTutorial.SetFace(9)
	battleTutorial.SetVisible(true)
	battleTutorial.ShowText("Welcome to my card shop! I knew you'd show up sooner or later.")
	battleTutorial.SetFace(2)
	battleTutorial.ShowText("Since I'm feeling nice, I'll give you a quick tour.")
	s1 = "Packs"
	battleTutorial.SetFace(2)
	battleTutorial.FlipPosition(true)
	battleTutorial.ShowText("Let's take a look at Card Pack!", true)

	local effectsBriecreategui = effects.briecreategui
	local color3 = Color3.fromRGB(0, 0, 0)

	effectsBriecreategui("arrow", "rbxassetid://103896382515633", UDim2.new(0.09, 1, 0.18, 1), UDim2.new(0.2, 0, 0.28, 0), UDim2.new(0.2, 0, 0.21, 0), 0, 1, color3, 1, 0.5, 1001)

	local v296 = effects.briecreategui
	local color32 = Color3.fromRGB(0, 0, 0)

	v296("darkbg", "", UDim2.new(2, 2, 2, 2), UDim2.new(0, 0, 0, 0), UDim2.new(0, 0, 0, 0), 0, 0, color32, 0.4, 0.5, 0)

	local v298 = effects.briecreategui
	local color33 = Color3.fromRGB(0, 0, 0)
	local color34 = Color3.fromRGB(255, 0, 0)

	v298("borderguh", "Border", UDim2.new(0.335, 0, 0.11, 0), UDim2.new(0.01, 0, 0.2, 0), UDim2.new(0.01, 0, 0.2, 0), 0, 0, color33, 1, 0, 1000, color34, 15)

	repeat
		task.wait(0.1)
	until s2 == "Packs"

	battleTutorial.FlipPosition(false)
	effects.briedestroygui("borderguh", 0)
	effects.briedestroygui("arrow", 0.5)
	effects.briedestroygui("darkbg", 0.5)
	battleTutorial.SetFace(3)
	battleTutorial.ShowText("This is the Packs Shop. Buy packs and rip them open for new cards!!")
	battleTutorial.SetFace(2)
	battleTutorial.ShowText("This is the main way you'll grow your collection.")
	battleTutorial.FlipPosition(true)
	battleTutorial.ShowText("Let's head back to the main page now.", true)
	effects.briedestroygui("arrow2", 0.5)

	local v301 = effects.briecreategui
	local color35 = Color3.fromRGB(0, 0, 0)

	v301("arrow3", "rbxassetid://103896382515633", UDim2.new(0.09, 1, 0.18, 1), UDim2.new(0.2, 0, 0.11, 0), UDim2.new(0.2, 0, 0.07, 0), 0, 0, color35, 1, 0.4, 1001)
	s1 = "Back"

	repeat
		task.wait(0.1)
	until s2 == "Start"

	s1 = ""
	battleTutorial.FlipPosition(false)
	effects.briedestroygui("arrow3", 0.5)
	battleTutorial.ShowText("Let's look at Deck next.", true)

	local v303 = effects.briecreategui
	local color36 = Color3.fromRGB(0, 0, 0)

	v303("arrow4", "rbxassetid://103896382515633", UDim2.new(0.09, 1, 0.18, 1), UDim2.new(0.2, 0, 0.38, 0), UDim2.new(0.2, 0, 0.33, 0), 0, 0, color36, 1, 0.5, 1001)

	local v305 = effects.briecreategui
	local color37 = Color3.fromRGB(0, 0, 0)

	v305("darkbg2", "", UDim2.new(2, 2, 2, 2), UDim2.new(0, 0, 0, 0), UDim2.new(0, 0, 0, 0), 0, 0, color37, 0.4, 0.5, 0)

	local v307 = effects.briecreategui
	local color38 = Color3.fromRGB(0, 0, 0)
	local color39 = Color3.fromRGB(255, 0, 0)

	v307("borderguh2", "Border", UDim2.new(0.335, 0, 0.1, 0), UDim2.new(0.011, 0, 0.33, 0), UDim2.new(0.011, 0, 0.33, 0), 0, 0, color38, 1, 0, 1000, color39, 15)
	s1 = "Decks"

	repeat
		task.wait(0.1)
	until s2 == "Decks"

	effects.briedestroygui("borderguh2", 0)
	effects.briedestroygui("arrow4", 0.5)
	effects.briedestroygui("darkbg2", 0.5)
	battleTutorial.SetFace(3)
	battleTutorial.ShowText("Here in the Deck Shop you can buy fully built decks ready to play!")
	battleTutorial.SetFace(2)
	battleTutorial.ShowText("A great option if you don't want to build a deck yourself.")
	battleTutorial.FlipPosition(true)
	battleTutorial.ShowText("Let's head back again.", true)
	s1 = "Back"

	local v310 = effects.briecreategui
	local color310 = Color3.fromRGB(0, 0, 0)

	v310("arrow5", "rbxassetid://103896382515633", UDim2.new(0.09, 1, 0.18, 1), UDim2.new(0.2, 0, 0.11, 0), UDim2.new(0.2, 0, 0.07, 0), 0, 0, color310, 1, 0.4, 1001)

	repeat
		task.wait(0.1)
	until s2 == "Start"

	s1 = ""
	effects.briedestroygui("arrow5", 0.5)
	battleTutorial.FlipPosition(false)
	battleTutorial.SetFace(2)

	local v312 = effects.briecreategui
	local color311 = Color3.fromRGB(0, 0, 0)
	local color312 = Color3.fromRGB(255, 0, 0)

	v312("borderguh3", "Border", UDim2.new(0.335, 0, 0.1, 0), UDim2.new(0.011, 0, 0.465, 0), UDim2.new(0.011, 0, 0.465, 0), 0, 0, color311, 1, 0, 1000, color312, 15)
	battleTutorial.ShowText("Sets and Crossovers contain special card collections like the Metaverse Series.")

	local effectsBriealtergui = effects.briealtergui
	local color313 = Color3.fromRGB(0, 0, 0)

	effectsBriealtergui("borderguh3", UDim2.new(0.011, 0, 0.593, 0), UDim2.new(0.335, 0, 0.1, 0), 0, 1, color313, 1, 0.5)
	battleTutorial.SetFace(9)
	battleTutorial.ShowText("Accessories and Backgrounds are where you can buy sleeves and battle backgrounds to customize your matches!")

	local v317 = effects.briealtergui
	local color314 = Color3.fromRGB(0, 0, 0)

	v317("borderguh3", UDim2.new(0.011, 0, 0.73, 0), UDim2.new(0.16, 0, 0.1, 0), 0, 1, color314, 1, 0.5)
	battleTutorial.SetFace(2)
	battleTutorial.ShowText("T9 Offers lets you buy BloxBux with Robux.")
	battleTutorial.SetFace(5)
	battleTutorial.ShowText("Don't ask me why. The higher-ups say it keeps the lights on.")

	local v319 = effects.briealtergui
	local color315 = Color3.fromRGB(0, 0, 0)

	v319("borderguh3", UDim2.new(0.187, 0, 0.73, 0), UDim2.new(0.164, 0, 0.09, 0), 0, 1, color315, 1, 0.5)
	battleTutorial.SetFace(1)
	battleTutorial.ShowText("Feeling fancy? The Art Box sells alternate card art!")

	local v321 = effects.briealtergui
	local color316 = Color3.fromRGB(0, 0, 0)

	v321("borderguh3", UDim2.new(0.011, 0, 0.885, 0), UDim2.new(0.16, 0, 0.09, 0), 0, 1, color316, 1, 0.5)
	battleTutorial.SetFace(2)
	battleTutorial.ShowText("Enter community codes here for free rewards!!")

	local v323 = effects.briealtergui
	local color317 = Color3.fromRGB(0, 0, 0)

	v323("borderguh3", UDim2.new(0.187, 0, 0.885, 0), UDim2.new(0.164, 0, 0.09, 0), 0, 1, color317, 1, 0.5)
	battleTutorial.ShowText("Finally, the Event Shop lets you trade event currencies here for special rewards!")
	battleTutorial.SetFace(9)

	local v325 = effects.briealtergui
	local color318 = Color3.fromRGB(0, 0, 0)

	v325("borderguh3", UDim2.new(0.187, 0, 1.5, 0), UDim2.new(0.16, 0, 0.09, 0), 0, 1, color318, 1, 0.5)
	battleTutorial.ShowText("And that’s everything. Whew, that was a lot of talking.")
	battleTutorial.ShowText("Go explore and see what catches your eye.")
	battleTutorial.SetFace(4)
	battleTutorial.ShowText("And don't be afraid to spend! I like money.")
	effects.briedestroygui("borderguh3", 0)
	networkFireServer("FirstTimeViewProgress", "Shop")
	networkClient.UpdateStatsData()
	battleTutorial.SetVisible(false)
	u23 = false
	mainOffers.DisableButtons(false)
end

local u106: boolean = false
local u107: boolean = false

visGuiOmniShop.Title.Back.MouseButton1Click:connect(function()
	if u23 and s1 ~= "Back" then
		return
	end

	if u106 then
		return
	end

	if u107 then
		return
	end

	audioService.PlaySound("lock")

	if s2 == "Start" then
		HideOmniShop()
	elseif s2 == "EventSubShop" then
		GoTo("EventShop")
	else
		if visGui.PreconstructedDeckSelector.Visible == true then
			return
		end

		GoTo("Start")
	end

	u106 = true
	task.wait(0.5)
	u106 = false
end)
ugcEvent.HelpHolder.ShopTip.ShopButton.MouseButton1Down:connect(function()
	if u106 then
		return
	end

	u106 = true
	audioService.PlaySound("lock")
	ugcEvent.Visible = false
	ShowOmniShop("Start")
	task.wait(0.5)
	u106 = false
end)
handyHandy.Shop.MouseButton1Down:connect(function()
	if networkClient.IsSubPlayer() then
		networkClient.WarningMsg("You are in a party, you will enter the game when your party leader creates one.")

		return
	end

	if not handy.Visible() then
		return
	end

	if handy.GlobalDebounce == true then
		return
	end

	if u106 then
		return
	end

	handy.GlobalDebounce = true
	networkClient.UpdateStatsData()

	local v327 = data.GetQuestStats()

	u106 = true
	audioService.PlaySound("lock")
	task.spawn(function()
		if config.TUTOR_LADY_ENABLED and v327.FirstTimeViewedShop == 0 then
			StartShopTutorial()
		end
	end)
	ShowOmniShop("Start")
	task.wait(0.5)
	u106 = false
	handy.GlobalDebounce = false
end)

local dataOwnsSleeve = data.OwnsSleeve
local u109 = nil
local u110: boolean = false

local function DeselectSleeve(p20)
	if not u109 then
		return
	end

	u109.Button.Title.Text = "Select"
	u109.Button.Title.Back.Text = u109.Button.Title.Text

	if p20 and p20.Hidden then
		p20.Physical.ImageColor3 = Color3.new(0, 0, 0)
	end
end
local function SelectSleeve(p21, p22)
	local v331 = p21.Name
	local v332 = data.CurrentSleeveName()

	if v331 == v332 and p22 ~= true then
		return
	end

	if u109 then
		u109.Button.Title.Text = "Select"
		u109.Button.Title.Back.Text = u109.Button.Title.Text

		if p21 and p21.Hidden then
			p21.Physical.ImageColor3 = Color3.new(0, 0, 0)
		end
	end

	data.SetSleeve(p21.Name)
	networkFireServer("SetSleeve", p21.Name)

	if p21 then
		p21.Button.Title.Text = "Selected"
		p21.Button.Title.Back.Text = p21.Button.Title.Text
		p21.Physical.ImageColor3 = Color3.fromRGB(255, 255, 255)
	end

	u109 = p21
	dataUpdateCashMoney()
end
local function CheckForSleeveBadge()
	if data.SleeveAmount() >= 5 and not u110 then
		print("Sent sleevebadge request")
		networkFireServer("GimmeSleeveBadge")
		u110 = true
	end
end
local function PurchaseSleeve(p23, p24)
	if not (data.Money() >= p24[2]) then
		robuxService.InsufficientFunds(p24[2])
	elseif networkInvokeServer("BuySleeve", p23.Name) then
		SelectSleeve(p23)

		if data.SleeveAmount() >= 5 and not u110 then
			print("Sent sleevebadge request")
			networkFireServer("GimmeSleeveBadge")
			u110 = true

			return
		end
	end
end
local function HandleSleeveButton(p25, p26)
	if dataOwnsSleeve(p25.Name) then
		SelectSleeve(p25)
	elseif p25.Hidden == false then
		if not (data.Money() >= p26[2]) then
			robuxService.InsufficientFunds(p26[2])
		elseif networkInvokeServer("BuySleeve", p25.Name) then
			SelectSleeve(p25)

			if data.SleeveAmount() >= 5 and not u110 then
				print("Sent sleevebadge request")
				networkFireServer("GimmeSleeveBadge")
				u110 = true

				return
			end
		end

		return
	end
end

local u116 = nil

local function MoveSleeveOutOfView()
	local v337 = u116

	if not v337 then
		return
	end

	v337.Button.ImageTransparency = 0.7
	v337.Button.ImageColor3 = color3New(1, 1, 1)
end
local function UpdateViewSleeve(p27, p28)
	local v340 = u116

	if v340 then
		v340.Button.ImageTransparency = 0.7
		v340.Button.ImageColor3 = color3New(1, 1, 1)
	end

	v340 = p27 or u116
	v340.Button.ImageTransparency = 0

	local v341 = data.CurrentSleeveName() == v340.Name and Color3.fromRGB(224, 64, 251)

	if not v341 then
		v341 = dataOwnsSleeve(v340.Name) and Color3.fromRGB(0, 176, 255) or v340.Hidden and Color3.new(0.5, 0.5, 0.5) or Color3.fromRGB(0, 200, 83)
	end

	v340.Button.ImageColor3 = v341

	if v340.Hidden and p28 == false then
		v340.Physical.ImageColor3 = Color3.new(0, 0, 0)
	elseif v340.Hidden and data.CurrentSleeveName() == v340.Name and p28 ~= false and dataOwnsSleeve(v340.Name) then
		v340.Physical.ImageColor3 = Color3.new(255, 255, 255)
	end

	if dataOwnsSleeve(v340.Name) and data.CurrentSleeveName() ~= v340.Name then
		v340.ImageColor3 = Color3.new(1, 1, 1)
		v340.Button.Title.Text = "Select"
		v340.Button.Title.Back.Text = v340.Button.Title.Text
	end
end
local function externalUpdate(p29)
	local v343 = u116

	if v343 then
		v343.Button.ImageTransparency = 0.7
		v343.Button.ImageColor3 = color3New(1, 1, 1)
	end

	u116 = p29
	UpdateViewSleeve(p29)
end

local scaler = visGuiOmniShop.Sleeves.SideBar.Scaler
local v121 = scaler.BaseButton
local scalerSelected = scaler.Selected
local t7: {[any]: any} = {}
local u124 = nil

local function SelectCategory(p30, p31)
	if p30 == u124 then
		return
	end

	if u116 then
		UpdateViewSleeve(u116, p31 == "Unlockables")
	end

	local v346, v347 = unpack(t7[p30])
	local v348 = uDim2New(0.01, 0, p30 - 1, 0)

	scalerSelected:TweenPosition(v348, "Out", "Quad", 0.2, true)

	local absoluteValue = math.abs((u124 or 0) - p30)

	u124 = p30

	for k, v in pairs(t7) do
		local v352, v353 = unpack(v)
		local physical = v353.Physical
		local v355 = uDim2New(0, 0, (k - p30) * 1 + 0.125, 0)

		physical:TweenPosition(v355, "Out", "Quad", absoluteValue * 0.2, true)
	end
end

local baseSleeve = visGuiOmniShop.Sleeves.SleeveHolders.SleeveHolderBase.BaseSleeve

function NewSleeve(name, list, p35, parent)
	local clone = baseSleeve:Clone()

	clone.Name = name
	clone.Image = "rbxassetid://" .. list[1]

	local t15: {[any]: any} = {
		Name = name,
		Physical = clone,
		Cost = list[2],
		Id = list[1],
		Button = clone.Button,
		Hidden = if list[4] == true then true else false
	}

	table.insert(p35, t15)
	t15.Number = #p35
	clone.Button.Title.Text = if dataOwnsSleeve(t15.Name) then "Select" else utils.FormatNumber((tostring(list[2]))) .. BloxBuxValue

	if list[4] == true then
		if dataOwnsSleeve(t15.Name) then
			clone.ImageColor3 = Color3.new(1, 1, 1)
			clone.Button.Title.Text = "Select"
		else
			clone.ImageColor3 = Color3.new(0.356863, 0.356863, 0.356863)
			clone.Button.Title.Text = "Unlock This!"
		end
	end

	clone.Button.Title.Back.Text = clone.Button.Title.Text
	clone.Visible = true
	clone.Parent = parent
	nevermorePaperRipple.FromParent(clone.Button)
	clone.Button.MouseButton1Click:connect(function()
		local v608: {[any]: any} = t15
		local v609 = list

		if dataOwnsSleeve(v608.Name) then
			SelectSleeve(v608)
		elseif v608.Hidden == false then
			if not (data.Money() >= v609[2]) then
				robuxService.InsufficientFunds(v609[2])
			elseif networkInvokeServer("BuySleeve", v608.Name) then
				SelectSleeve(v608)

				if data.SleeveAmount() >= 5 and not u110 then
					print("Sent sleevebadge request")
					networkFireServer("GimmeSleeveBadge")
					u110 = true
				end
			end
		end

		UpdateViewSleeve(t15)
	end)

	return t15
end

local EventShop = nil

for k, v in pairs(replicatedStoragePrettysleeves) do
	local n5: number = #t7 + 1
	local t8: {[any]: any} = {}
	local clone = v121:Clone()

	clone.Title.Text = k
	clone.Name = k
	clone.Position = uDim2New(0, 0, n5 - 1, 0)
	clone.Visible = true
	clone.Parent = scaler
	nevermorePaperRipple.new(clone)

	local clone2 = visGuiOmniShop.Sleeves.SleeveHolders.SleeveHolderBase:Clone()

	clone2.Position = uDim2New(0, 0, n5 - 1, 0)
	clone2.Visible = true
	clone2.Parent = visGuiOmniShop.Sleeves.SleeveHolders

	local v134 = nevermore.new(clone2, -0.2, replicatedStorage, t8, 0.6666666666666666)

	function customscalings.RedrawSleeveScroll()
		v134:Redraw()
	end

	v134.ExternalUpdate = externalUpdate
	t7[n5] = { k, v134 }
	clone.MouseButton1Click:connect(function()
		SelectCategory(n5)
	end)
	clone.TouchTap:Connect(function()
		SelectCategory(n5)
	end)

	for k4, iterValue2 in pairs(v) do
		local v137 = NewSleeve(k4, iterValue2, t8, clone2)

		v137.Physical.MouseButton1Click:connect(function()
			v134:SelectPack(v137.Number)
		end)

		if data.CurrentSleeveName() == v137.Name then
			v134.currentpacknumber = v137.Number
			SelectSleeve(v137, true)
			EventShop = k
		end
	end

	v134:Redraw()
end;

(function(p32)
	for k, v in pairs(t7) do
		if p32 == v[1] then
			SelectCategory(k, p32)

			return
		end
	end

	SelectCategory(1)
end)(EventShop)
spawn(function()
	repeat
		task.wait(0.2)
	until robuxService.Products.Ready == true

	for _, v in pairs(visGuiOmniShop.BloxBux:GetChildren()) do
		local numberValue: number? = tonumber(v.Name)
		local v368 = robuxService.Products.BloxBux.Ids[numberValue]

		if v368 then
			local infos = robuxService.Products.BloxBux.Infos
			local text: string = tostring(v368)
			local v371 = infos[text]

			v.Image = "rbxassetid://" .. v371.IconImageAssetId
			v.Title.Text = "x" .. v371.BloxBux
			v.Title.Back.Text = v.Title.Text
			v.Button.Title.Text = v371.PriceInRobux .. "R$"
			v.Button.Title.Back.Text = v.Button.Title.Text

			if v371.PercentOff then
				v.PercentOff.Visible = true
				v.PercentOff.Title.Text = v371.PercentOff .. "% BONUS!"
			end

			v.Button.MouseButton1Click:connect(function()
				if not networkInvokeServer("CanUseArtBox") then
					networkClient.WarningMsg("Due to regional restrictions, you cannot purchase this, sorry!")

					return
				end

				game:GetService("MarketplaceService"):PromptProductPurchase(LocalPlayer, v368)
			end)
			nevermorePaperRipple.FromParent(v.Button)
		end
	end

	local offerHolder = visGuiOmniShop.Charms.Offers.OfferHolder

	for _, v in pairs({
		{ "Feet", 29831631 },
		{ "Clover", 29831644 }
	}) do
		local v375 = v[1]
		local v376 = v[2]
		local v377 = robuxService.Products.Charms.Infos
		local text: string = tostring(v376)
		local v379 = robuxService.CurrentOffers[v375]
		local priceInRobux = v377[text].PriceInRobux
		local v381 = offerHolder[v375]
		local purchase = v381.Purchase

		purchase.Expires.Visible = false
		purchase.Title.Text = priceInRobux .. "R$"
		purchase.Title.Back.Text = purchase.Title.Text
		v381.Title.Text = v379.Title
		v381.Title.Back.Text = v381.Title.Text
		v381.SubTitle.Text = v379.SubTitle
		v381.SubTitle.Back.Text = v381.SubTitle.Text
		v381.Image = v379.Image
		nevermorePaperRipple.FromParent(purchase)
		purchase.MouseButton1Click:connect(function()
			if u23 then
				return
			end

			game:GetService("MarketplaceService"):PromptProductPurchase(LocalPlayer, v376)
		end)
	end
end)

local codes = visGui.OmniShop.Codes

codes.Code.Box.FocusLost:connect(function(p37)
	if not p37 and userInputService.GamepadEnabled ~= true then
		codes.Code.Box.Text = ""

		return
	end

	local v384 = networkInvokeServer("RedeemCode", codes.Code.Box.Text)

	if v384 == true then
		codes.Code.Box.Text = "Code Redeemed!"
		RedrawCodes()
	elseif v384 ~= false then
		codes.Code.Box.Text = v384
	end
end)
EventShop = v22.new(codes.Redeemed.Clip.ScrollingFrame):AddScrollBar(codes.Redeemed.Clip.BarFrame)
EventShop.BarFrame.BackgroundColor3 = codes.Exposition.ImageColor3
EventShop.BarFrame.BackgroundTransparency = 0
EventShop.BarFrame.Backing.Visible = false

local v139 = codes.Redeemed.Clip.ScrollingFrame.Scaler
local baseCode = v139.BaseCode
local n6: number = 0

function customscalings.RescaleCodeHolder()
	local v385 = v139.Parent
	local uDim2New = UDim2.new
	local v387: number = n6
	local roundedUp = math.ceil(v139.AbsoluteSize.Y)

	v385.Size = uDim2New(1, 0, 0, v387 * roundedUp)
end
function RedrawCodes()
	n6 = 0

	local v389 = data.RedeemedCodes()

	for _, v in pairs(v389) do
		if v ~= nil and v ~= "" then
			if not v139:FindFirstChild(v) then
				local clone3 = baseCode:Clone()

				clone3.Title.Text = v
				clone3.Name = v
				clone3.Visible = true
				clone3.Parent = v139

				local uDim2New = UDim2.new
				local v394: number = n6
				local roundedUp = math.ceil(clone3.AbsoluteSize.Y)

				clone3.Position = uDim2New(0, 0, 0, v394 * roundedUp)
			end

			n6 += 1
		end
	end

	local v396 = v139.Parent
	local v397 = UDim2.new
	local v398: number = n6
	local roundedUp = math.ceil(v139.AbsoluteSize.Y)

	v396.Size = v397(1, 0, 0, v398 * roundedUp)
end

RedrawCodes()

function CodeTeleportEffect()
	audioService.ChangeSong("Silence")
	audioService.PlaySound("ErrorTone")

	local codes = visGui.OmniShop.Codes

	codes.Code.Rotation = math.random(-45, 45)
	codes.Code.ImageColor3 = Color3.new(0.866667, 0.333333, 1)
	codes.Exposition.Rotation = math.random(-45, 45)
	codes.Exposition.Exposition.Text = "ERROR ERROR ERROR"
	codes.Redeemed.ImageColor3 = Color3.new(0.419608, 0.160784, 0.486275)
	codes.Redeemed.Rotation = math.random(-45, 45)
	visGui.OmniShop.Overlay.Visible = true
	visGui.OmniShop.Title.Rotation = math.random(-45, 45)
	visGui.OmniShop.Title.ImageColor3 = Color3.new(0.290196, 0.0666667, 0.486275)
	visGui.OmniShop.Title.Title.Text = "ERROR ERROR ERROR"
	visGui.OmniShop.Title.Balance.Text = "ERROR ERROR ERROR"
	visGui.OmniShop.Title.Back.TextLabel.Text = "ERROR ERROR ERROR"
end

networkClient.CodeTeleportEffect = CodeTeleportEffect
EventShop = visGui.OmniShop.EventShop
v22 = visGui.OmniShop.EventSubShop

local eventItemHolder = v22.EventItemHolder
local sideBar = v22.SideBar
local buy = v22.Buy
local currencyTotal = v22.CurrencyTotal
local amountNew = v22.AmountNew
local v147 = networkInvokeServer("GetCurrentEventItems")

v22 = networkInvokeServer("GetEventShops")

local u148 = nil
local n7 = 1
local u150: boolean = false
local v151 = visGui.OmniShop.Packs
local omniShop = visGui.OmniShop
local v153 = v151.Packs
local v154 = v151.Buy
local v155 = v151.SideBar
local mathAbs = math.abs
local v157 = networkInvokeServer("GetPacksForSale")
local v158 = nevermore.new(v153, -0.25, replicatedStorage, v157)

local function WinRequirementMet(p38)
	local v402 = data.Wins()
	local v403 = p38.WinRequirement or 0

	return v402 >= v403, v403 - v402
end

v151.TargetInfo.InfoButton.MouseEnter:connect(function()
	contextualize(v151.TargetInfo.InfoButton, "Targetting a color ensures that for a small price increase, packs bought with BB will give you only cards of that color when purchased!", nil)
end)
omniShop.Title.Charm.MouseEnter:connect(function()
	contextualize(omniShop.Title.Charm, "Lucky charms used to boost the rate of getting a foil card! Up to 20 are used to boost the rate!", nil)
end)
omniShop.Title.BB.MouseEnter:connect(function()
	contextualize(omniShop.Title.BB, "Currency used on Card Packs, Decks, or other offers!", nil)
end)

local buyTickets = v151.BuyTickets
local colorTarget = v151.ColorTarget
local s3 = "None"
local n8 = 1
local u164: boolean = true
local n9 = 0

function TranscendTime(p39)
	local hand = v155.Stopwatch.Hand

	if u164 then
		u164 = false

		local n1: number = 1

		if p39 < n9 then
			n1 = -1
		end

		n9 = p39

		repeat
			wait(0.01)
			hand.Rotation = hand.Rotation + n1 * 36
		until hand.Rotation % 360 == 0

		hand.Rotation = 0
		u164 = true
	end
end
local function UpdateEventBuyButton()
	if u107 == true then
		buy.TextLabel.Text = "Purchasing..."
		buy.TextLabel.Back.Text = buy.TextLabel.Text
		buy.ImageColor3 = Color3.new(0.356863, 0.356863, 0.356863)
		buy.CurrencyImage.Image = "rbxassetid://"

		return
	end

	buy.ImageColor3 = Color3.new(0.0784314, 0.627451, 0.305882)

	local v407 = u148
	local price = v407.Price
	local v409 = data.GetEventPurchaseAmount(v407.Index)
	local v410 = data.GetEventCurrency()

	if v410[v407.CurrencyType] then
		currencyTotal.CurrencyAmount.Text = v410[v407.CurrencyType]
	else
		currencyTotal.CurrencyAmount.Text = "0"
	end

	currencyTotal.CurrencyImage.Image = "rbxassetid://" .. config.EVENTCURRENCYIMAGE[v407.CurrencyType]
	currencyTotal.CurrencyImage.MouseEnter:connect(function()
		contextualize(currencyTotal.CurrencyImage, config.EVENTCURRENCYCONTEXT[v407.CurrencyType])
	end)

	if not v409 then
		v409 = v407.BuyLimit
	end

	if v409 <= 0 then
		buy.ImageColor3 = Color3.new(0.356863, 0.356863, 0.356863)
		buy.TextLabel.Text = "Out of stock"
		buy.TextLabel.Back.Text = buy.TextLabel.Text
		buy.CurrencyImage.Image = "rbxassetid://"

		return
	end

	if v409 < n7 then
		n7 = v409
		amountNew.InputBox.Text = v409
	end

	if price and price ~= 0 then
		buy.ImageColor3 = Color3.new(0.0784314, 0.627451, 0.305882)
		buy.TextLabel.Text = "Buy for " .. utils.FormatNumber(n7 * price)
		buy.TextLabel.Back.Text = buy.TextLabel.Text
		buy.CurrencyImage.Image = "rbxassetid://" .. config.EVENTCURRENCYIMAGE[v407.CurrencyType]

		return
	end
end
local function updateBuyButton()
	if u107 == true then
		v154.TextLabel.Text = "Purchasing Pack..."
		v154.TextLabel.Back.Text = v154.TextLabel.Text
		v154.ImageColor3 = Color3.new(0.356863, 0.356863, 0.356863)

		return
	end

	v154.ImageColor3 = Color3.new(0.0784314, 0.627451, 0.305882)
	data.Money()

	local v411 = v157[v158.currentpacknumber]
	local v412 = v411.PriceInBloxBux
	local v413 = data.Wins()
	local v414 = v411.WinRequirement or 0
	local v415 = data.PackTickets()[v411.Name] or 0

	if s3 ~= "None" and not v411.ColorPack then
		v412 = if v411.AltPack then v412 + 250 else v412 + 25
	end

	local text = v411.Timeline or "???"
	local packTime = v155.Stopwatch.PackTime

	if text ~= packTime.Text then
		packTime.Text = text
		task.spawn(function()
			TranscendTime(v158.currentpacknumber)
		end)
	end

	if v415 > 0 and s2 == "Packs" then
		local s1: string = ""

		if n8 > 1 then
			s1 = "s"
		end

		buyTickets.TextLabel.Text = "Buy for " .. (v415 >= n8 and n8 or v415) .. " Ticket" .. s1
		buyTickets.Visible = true
	else
		buyTickets.Visible = false
	end

	if v411.Hidden then
		v154.Visible = false
	elseif s2 == "Packs" then
		v154.Visible = true
	end

	if not (v413 >= v414) then
		v154.ShineLabel.ImageColor3 = Color3.fromRGB(202, 148, 0)
		v154.ImageColor3 = Color3.fromRGB(250, 187, 0)
		v154.TextLabel.Text = "Win " .. v414 - v413 .. " more battles!"
		v154.TextLabel.Back.Text = v154.TextLabel.Text
	elseif v411.CoreCost and not data.GetOwnedPacks()[v411.Name] then
		v154.ShineLabel.ImageColor3 = Color3.fromRGB(155, 74, 185)
		v154.ImageColor3 = Color3.fromRGB(212, 100, 250)
		v154.TextLabel.Text = "Unlock with " .. v411.CoreCost .. " History Core!"
		v154.TextLabel.Back.Text = v154.TextLabel.Text
	elseif v412 and v412 ~= 0 then
		local v419 = utils.FormatNumber(n8 * v412)

		v154.ShineLabel.ImageColor3 = Color3.fromRGB(5, 88, 2)
		v154.ImageColor3 = Color3.fromRGB(0, 200, 83)
		v154.TextLabel.Text = "Buy for " .. v419 .. BloxBuxValue .. "!"
		v154.TextLabel.Back.Text = v154.TextLabel.Text

		return
	end
end

networkClient.UpdateBuyButton = updateBuyButton

function networkClient.ShowPackUnlockAnimation(_)
	if s2 == "Packs" then
		data.UpdateCashMoney()
		v158.Locked = true
		effects.UnlockPack(visGui.Effect, nil, v158.packs[v158.currentpacknumber].Physical)
		v158.Locked = false

		return
	end
end

amountNew.InputBox.FocusLost:connect(function()
	if tonumber(amountNew.InputBox.Text) ~= nil then
		local numberValue: number? = tonumber(amountNew.InputBox.Text)

		n7 = math.round(numberValue)
	end

	if not n7 or n7 <= 1 or n7 ~= n7 then
		n7 = 1
	end

	amountNew.InputBox.Text = tostring(n7)
	UpdateEventBuyButton()
end)

local u168: boolean = true
local v169 = v151.AmountNew
local t9: {[any]: any} = { "Small", [5] = "Medium", [10] = "Large" }

v121 = function(p41)
	for k, v in pairs(t9) do
		if v == p41.Name then
			return k
		end
	end

	return 1
end

local function DeselectAmount()
	animation.AnimateAsync(v169[t9[n8]], { BackgroundTransparency = 1 }, 0.2, "In", "Quad")
end
local function SelectAmount(p42)
	v169[t9[p42]].BackgroundTransparency = 0.5
	n8 = p42
	updateBuyButton()
end

v169[t9[1]].BackgroundTransparency = 0.5
n8 = 1
updateBuyButton()

local function ChangeAmount(p43)
	animation.AnimateAsync(v169[t9[n8]], { BackgroundTransparency = 1 }, 0.2, "In", "Quad")
	v169[t9[p43]].BackgroundTransparency = 0.5
	n8 = p43
	updateBuyButton()
end

for _, v in pairs(v169:GetChildren()) do
	local v176 = v121(v)

	v.Title.MouseButton1Click:Connect(function()
		if not u168 then
			return
		end

		audioService.PlaySound("lock")

		local v427 = v176

		animation.AnimateAsync(v169[t9[n8]], { BackgroundTransparency = 1 }, 0.2, "In", "Quad")
		v169[t9[v427]].BackgroundTransparency = 0.5
		n8 = v427
		updateBuyButton()
	end)
end

local function UpdateTargetButtons(p44)
	for _, v in pairs(colorTarget:GetChildren()) do
		if p44 == v.Name then
			v.BackgroundTransparency = 0.5
		else
			v.BackgroundTransparency = 1
		end
	end

	updateBuyButton()
end

for _, v in pairs(colorTarget:GetChildren()) do
	v.Title.MouseButton1Click:Connect(function()
		s3 = if s3 == v.Name then "None" else v.Name
		audioService.PlaySound("lock")
		print(s3)
		UpdateTargetButtons(s3)
	end)
end

v151.SideBar.ViewContents.MouseButton1Click:Connect(function()
	local v431 = v158.packs[v158.currentpacknumber]

	audioService.PlaySound("lock")
	v151.PackContents:TweenPosition(UDim2.new(0.1, 0, 0.05, 0), "Out", "Quad", 0.8, true)
	UpdatePackContentDisplay(v431)
end)
v151.PackContents.Close.MouseButton1Click:Connect(function()
	audioService.PlaySound("Door_unlock")
	v151.PackContents:TweenPosition(UDim2.new(0.1, 0, -3.05, 0), "Out", "Quad", 0.8, true)

	for _, v in pairs(v151.PackContents.ContentList:GetChildren()) do
		if v:IsA("Frame") and v.Name ~= "TemplateCard" then
			v:Destroy()
		end
	end
end)

local function EnableAmounts()
	for _, v in pairs(v169:GetChildren()) do
		animation.AnimateAsync(v.Title, { TextTransparency = 0, TextStrokeTransparency = 0.9 }, 0.2, "Out", "Quad")
	end

	u168 = true
end
local function DisableAmounts()
	u168 = false

	for _, v in pairs(v169:GetChildren()) do
		animation.AnimateAsync(v.Title, { TextTransparency = 1, TextStrokeTransparency = 1 }, 0.2, "In", "Quad")
		animation.AnimateAsync(v, { BackgroundTransparency = 1 }, 0.2, "In", "Quad")
	end
end
function CorrectAmount(p45)
	if p45.PriceInRobux ~= 0 and p45.PriceInRobux then
		DisableAmounts()
		n8 = 1

		return
	end

	EnableAmounts()
end
local function MakeEventItem(p46)
	local clone4 = eventItemHolder.ItemFrame.BaseItem:Clone()

	clone4.Name = p46.Index
	clone4.Visible = true
	clone4.ItemCost.Text = p46.Price
	clone4.CurrencyImage.Image = "rbxassetid://" .. config.EVENTCURRENCYIMAGE[p46.CurrencyType]
	clone4.CurrencyImage.MouseEnter:connect(function()
		contextualize(clone4.CurrencyImage, config.EVENTCURRENCYCONTEXT[p46.CurrencyType])
	end)
	p46.Physical = clone4
	clone4.Parent = eventItemHolder.ItemFrame
	clone4.LayoutOrder = p46.ItemOrder

	if p46.RewardId then
		clone4.Image = "rbxassetid://" .. p46.RewardId
	elseif p46.Packs then
		for k, _ in pairs(p46.Packs) do
			local u443: boolean = false
			local v444 = nil

			for _, v in pairs(packs) do
				local parts = string.split(k, "-Foil")

				if k == v.Name then
					v444 = v
				end

				if v.Name == parts[1] and string.find(k, "-Foil") then
					v444 = v
					u443 = true
				end
			end

			if v444 then
				clone4.Image = "rbxassetid://" .. v444.CardPackId

				if u443 then
					foilEffect(clone4)
				end
			end
		end
	elseif p46.Sleeves then
		for _, v in pairs(p46.Sleeves) do
			clone4.Image = "rbxassetid://" .. replicatedStorageSleeves[v][1]
		end
	elseif p46.Ranks then
		clone4.Image = "rbxassetid://9483401524"
	elseif p46.Cards then
		for k, _ in pairs(p46.Cards) do
			local v452 = cardLibrary[k]

			if not v452 then
				warn(k .. " Is not a valid card index")
			end

			nonGameCard.BindInspect(clone4, v452)

			local foil = v452.Foil

			clone4.Image = "rbxassetid://" .. v452.Id

			if foil then
				foilEffect(clone4, v452.LibraryIndex)
			end
		end
	elseif not p46.Charms then
		if p46.BattleBackground then
			clone4.Image = "rbxassetid://82724795023332"
		else
			clone4.Image = "rbxassetid://475466844"
		end
	elseif p46.Charms[1] > 0 then
		clone4.Image = "rbxassetid://12744377673"
	else
		clone4.Image = "rbxassetid://9546584078"
	end

	clone4.MouseButton1Click:connect(function()
		audioService.PlaySound("Pop")

		if u148 and eventItemHolder.ItemFrame:FindFirstChild(u148.Index) then
			eventItemHolder.ItemFrame:FindFirstChild(u148.Index).Selection.Visible = false
		end

		u148 = p46
		clone4.Selection.Visible = true
		print(u148)
		UpdateEventSidebar(u148)
	end)
	clone4.SelectionGained:connect(function()
		u148 = p46
		UpdateEventSidebar(u148)
	end)
end
local function MakePackButton(p47, _)
	local clone5 = v153.BasePack:Clone()

	clone5.Name = p47.Name
	clone5.Visible = true

	if p47.FoilPack then
		foilEffect(clone5)
	end

	if p47.CoreCost and not data.OwnsPack(p47.Name) then
		clone5.Locked.Visible = true
		clone5.ImageColor3 = Color3.fromRGB(185, 185, 185)
	end

	clone5.Image = "rbxassetid://" .. p47.CardPackId

	if clone5:FindFirstChild("PackViewPort") then
		local packViewPort = clone5:FindFirstChild("PackViewPort")

		packViewPort.CardModel.Card.Front.Texture = "rbxassetid://" .. p47.CardPackId
		packViewPort.CardModel.Card.Back.Texture = "rbxassetid://" .. p47.CardPackId
		require(packViewPort.PortCardRotation).SetupMovement()

		if p47.FoilPack then
			foilEffect(packViewPort)
		end
	end

	p47.Physical = clone5
	clone5.Parent = v153
	clone5.MouseButton1Click:connect(function()
		audioService.PlaySound("Draw")
		v158:SelectPackFromName(p47.Name)
	end)
	clone5.SelectionGained:connect(function()
		v158:SelectPackFromName(p47.Name)
	end)
end
local function RemovePackButton(p49)
	local foundChild = v153:FindFirstChild(p49.Name)

	if foundChild then
		foundChild:Destroy()
	end
end
local function updatePackHolder()
	-- v158.packs is the same table as v157, and Remove() uses table.remove, so walk it
	-- backwards (removing while iterating forwards skipped packs, leaving them without a button).
	for k = #v157, 1, -1 do
		local v = v157[k]
		if v.Hidden and (not data.PackTickets()[v.Name] or not (data.PackTickets()[v.Name] > 0)) then
			local vName = v153:FindFirstChild(v.Name)

			if vName then
				vName:Destroy()
			end

			v158:Remove(k)
		end
	end

	for k, v in ipairs(v157) do
		if not v153:FindFirstChild(v.Name) then
			MakePackButton(v, k)
		end
	end

	v158:Redraw()
end

networkClient.UpdatePackHolder = updatePackHolder

function networkClient.AddPackToHolder(p50)
	for i = 1, #v158.packs do
		if v158.packs[i].Name == p50.Name then
			return
		end
	end

	v158:Add(p50)
	MakePackButton(p50, #v158.packs)
end
local function updateEventHolder(p51)
	for _, v in pairs(eventItemHolder.ItemFrame:GetChildren()) do
		if v:IsA("GuiObject") and v.Name ~= "BaseItem" then
			v:Destroy()
		end
	end

	u148 = nil

	for _, v in pairs(v147) do
		if p51 == v.ShopType then
			MakeEventItem(v)

			if v.ItemOrder == 1 or u148 == nil then
				u148 = v
			end
		end
	end
end

networkClient.UpdateEventHolder = updateEventHolder
SelectAmount = {}
local s4 = ""

local function UpdatePackOdds()
	local v470 = networkInvokeServer("GetFoilPercent")
	local v471 = networkInvokeServer("GetOdds")
	local n1 = 0

	for _, v in pairs(v471) do
		local v475, v476 = unpack(v)

		n1 += v476
	end

	local t16: {[any]: any} = {}

	for _, v in pairs(v471) do
		local v480, v481 = unpack(v)
		local rounded = math.round(v481 / n1 * 10000)

		t16[#t16 + 1] = v480 .. " " .. rounded / 100 .. "%"
	end

	t16[#t16 + 1] = "(Odds favour cards you don't own.)\nFoil Chance: " .. math.floor(1 / v470 * 10000) / 100 .. "%"
	s4 = table.concat(t16, "\n")
end

data.UpdateCallbacks.UpdatePackOdds = UpdatePackOdds
v155.Odds.MouseEnter:Connect(function()
	UpdatePackOdds()
	contextualize(v155.OddsWide, s4)
end)

local n10: number = 0
local n11: number = 0
local n12: number = 0

local function RedrawSidebarContents()
	local currentpacknumber = v158.currentpacknumber

	n10 = 0
	n11 = 0
	n12 = 0

	for _, v in pairs(v158.packs[currentpacknumber].Cards) do
		if not cardLibrary[v].PlayTest then
			if data.OwnsCard(v) and cardLibrary[v].Rarity ~= "Token" then
				n10 += 1
			elseif cardLibrary[v].Rarity == "Legendary" then
				n12 += 1
			end

			if cardLibrary[v].Rarity ~= "Token" then
				n11 += 1
			end
		end
	end

	local floored = math.floor(n10 / n11 * 100)

	if floored >= 100 then
		v155.Completed.Text = "100%!"
	else
		v155.Completed.Text = floored .. "% Collected"
	end

	spawn(UpdatePackOdds)
end

data.UpdateCallbacks.RedrawSidebarContents = RedrawSidebarContents

function GetCompletedText()
	if n10 == n11 then
		return "Congrats!~"
	end

	if n12 > 0 and n10 + n12 == n11 then
		local v487: number = n12
		local v488 = utils.Plural(n12)

		return v487 .. " legendary " .. (if v488 then "cards left!" else "card remains!")
	end

	return n10 .. " / " .. n11
end

local v193 = mouseAwayFrom(v155.Completed, 10)

v155.Completed.MouseEnter:Connect(function()
	local currentpacknumber = v158.currentpacknumber

	contextualize(v155.Completed, GetCompletedText, function()
		return v193() or currentpacknumber ~= v158.currentpacknumber
	end)
end)

local function SidebarToDescription()
end

SidebarToDescription = function()
end

function UpdateSidebar(p52)
	updatePackHolder()
	v155.Title.Text = p52.Name
	v155.Description.Text = p52.Description
	v155.Cards.CardCount.Text = "x" .. p52.CardsInPack
	updateBuyButton()
	CorrectAmount(p52)
	RedrawSidebarContents(p52)
end
function UpdateEventSidebar(p53)
	local v492 = data.GetEventPurchaseAmount(p53.Index) or p53.BuyLimit

	sideBar.ItemName.Text = p53.Title

	local sideBarAmountLeft = sideBar.AmountLeft
	local text: string = tostring(v492)
	local text3: string = tostring(p53.BuyLimit)

	sideBarAmountLeft.Text = text .. "/" .. text3 .. " Remaining"
	UpdateEventBuyButton()
end
function UpdatePackContentDisplay(p54)
	for _, v in pairs(v151.PackContents.ContentList:GetChildren()) do
		if v:IsA("Frame") and v.Name ~= "TemplateCard" then
			v:Destroy()
		end
	end

	v151.PackContents.ContentList.CanvasPosition = Vector2.new(0, 0)

	local templateCard = v151.PackContents.ContentList.TemplateCard

	for _, v in pairs(p54.Cards) do
		if cardLibrary[v].Rarity ~= "Token" and not cardLibrary[v].PlayTest then
			local clone6 = templateCard:Clone()

			clone6.CardImage.Image = "rbxassetid://" .. cardLibrary[v].Id
			clone6.Name = cardLibrary[v].Name
			clone6.Parent = v151.PackContents.ContentList
			clone6.Visible = true
			nonGameCard.BindInspect(clone6.CardImage, cardLibrary[v])

			local v503 = data.OwnedCardCopies(v)
			local v504 = data.OwnedCardCopies(v .. "-Foil")

			if v503 and v503["0"] and v503["0"] > 0 or v504 and v504["0"] and v504["0"] > 0 then
				local clone6OwnCount = clone6.OwnCount
				local text: string = tostring(v503["0"] or 0)

				clone6OwnCount.Text = "Owned x" .. text

				if v504 and v504["0"] and v504["0"] > 0 then
					local ownCount = clone6.OwnCount
					local OwnCountText = clone6.OwnCount.Text
					local text4: string = tostring(v504["0"])

					ownCount.Text = OwnCountText .. " (" .. text4 .. "★)"
				end
			else
				clone6.OwnCount.Text = "Unowned"
				clone6.OwnCount.BackgroundColor3 = Color3.fromRGB(53, 53, 56)
				clone6.CardImage.ImageColor3 = Color3.fromRGB(53, 53, 56)
			end

			clone6.LayoutOrder = config.REVERSECOLORORDER[cardLibrary[v].Color]
		end
	end
end
function t6.Packs()
	updateBuyButton()

	for _, v in pairs(v153:GetChildren()) do
		if data.PackTickets()[v.Name] and data.PackTickets()[v.Name] > 0 then
			local v512 = nil

			for _, iterValue in pairs(v157) do
				if v.Name == iterValue.Name then
					v512 = iterValue
				end
			end

			local ticketAmount = v.TicketLabel.TicketAmount
			local v516 = data.PackTickets()

			ticketAmount.Text = tostring(v516[v.Name])
			v.TicketLabel.ImageColor3 = v512.Color
			v.TicketLabel.Visible = true
		else
			v.TicketLabel.Visible = false
		end
	end

	UpdateSidebar(v158.packs[v158.currentpacknumber])
end
function t6.EventSubShop()
	UpdateEventSidebar(u148)
end

UpdateSidebar(v158.packs[1])
v158.ExternalUpdate = UpdateSidebar
visGuiOmniShop.Start.Packs.MouseButton1Click:connect(function()
	UpdateSidebar(v158.packs[v158.currentpacknumber])
end)

for k, v in pairs(v22) do
	local clone7 = EventShop.Templates.TemplateShopButton:Clone()

	clone7.Name = k
	clone7.Parent = EventShop.Window.ShopSelect
	clone7.ShopIcon.Image = "rbxassetid://" .. config.EVENTCURRENCYIMAGE[v.ShopIcon]
	clone7.ShopName.Text = k
	clone7.LayoutOrder = v.Order

	if v.ButtonColor then
		clone7.BackgroundColor3 = v.ButtonColor
	end

	clone7.MouseButton1Click:Connect(function()
		audioService.PlaySound("click1")
		updateEventHolder(clone7.Name)
		eventItemHolder.CanvasPosition = Vector2.new(0, 0)
		GoTo("EventSubShop")
	end)
	clone7.Visible = true
end

function customscalings.RedrawPackHolder()
	v158:Redraw()
end

v158:Redraw()

function ShowShop(p55, p56)
	if networkClient.IsSubPlayer() then
		networkClient.WarningMsg("You are in a party, you will enter the game when your party leader creates one.")

		return
	end

	if visGui.AifeFrame.Visible == true then
		return
	end

	if not p56 then
		if p55 then
			v158:SelectPackFromName(p55)
		end

		ShowOmniShop("Packs")

		return
	end

	ShowOmniShop(p56)
end

v52.ShowShop = ShowShop

function ShowEventShop()
	if networkClient.IsSubPlayer() then
		networkClient.WarningMsg("You are in a party, you will enter the game when your party leader creates one.")

		return
	end

	if visGui.AifeFrame.Visible == true then
		return
	end

	ShowOmniShop("EventShop")
end

v52.ShowEventShop = ShowEventShop

local n13 = 0

local function UnpackPack(p57, p58)
	local v521 = v157[v158.currentpacknumber]

	if tick() - n13 < 2 then
		return
	end

	if u107 == true then
		return
	end

	if p57 then
		local v522 = data.PackTickets()[v521.Name] or 0
		local v523 = v522 >= n8 and n8 or v522

		n13 = tick()
		networkFireServer("PurchaseCardPack", v521.Name, v523, true, "None")

		return
	end

	local v524 = data.Wins()
	local v525 = v521.WinRequirement or 0
	local n1 = v525 - v524

	if not (v524 >= v525) then
		return
	end

	local n2: number = 0

	if s3 ~= "None" and not v521.ColorPack then
		n2 = if v521.AltPack then 250 else 25
	end

	v524 = false

	if not v521.CoreCost then
		u107 = true
	elseif data.GetOwnedPacks()[v521.Name] == true then
		u107 = true
		v524 = true
	end

	if v521.PriceInBloxBux ~= 0 and v521.PriceInBloxBux and v524 == true and n8 * (v521.PriceInBloxBux + n2) > data.Money() then
		robuxService.InsufficientFunds(n8 * (v521.PriceInBloxBux + n2))
		u107 = false

		return
	end

	updateBuyButton()
	n13 = tick()

	if v521.ColorPack then
		networkFireServer("PurchaseCardPack", v521.Name, n8, false, "None")
	else
		networkFireServer("PurchaseCardPack", v521.Name, n8, false, p58)
	end

	task.spawn(function()
		task.wait(5)

		if u107 == true then
			u107 = false
		end
	end)
end
local function EventPurchase()
	if not u148 then
		return
	end

	local v528 = u148

	if tick() - n13 < 2 then
		return
	end

	if u107 == true then
		return
	end

	if (data.GetEventPurchaseAmount(v528.Index) or v528.BuyLimit) - n7 < 0 then
		return
	end

	local v529 = data.GetEventCurrency()
	local timestamp

	if v528.Price ~= 0 and v528.Price then
		if not v529[v528.CurrencyType] then
			return
		end

		if n7 ~= n7 then
			return
		end

		if n7 * v528.Price > v529[v528.CurrencyType] then
			return
		end

		u107 = true
		timestamp = tick()
		n13 = timestamp
		networkFireServer("PurchaseEventItem", v528.Index, n7)
		UpdateEventSidebar(u148)

		return
	end

	u107 = true
	timestamp = tick()
	n13 = timestamp
	networkFireServer("PurchaseEventItem", v528.Index, n7)
	UpdateEventSidebar(u148)
end
function networkClient.EventItemPurchased(_)
	u107 = false
	UpdateEventSidebar(u148)
end
function networkClient.DisplayShop()
	ShowOmniShop("Rewards")
end
function networkClient.DisplayPack(p60)
	v158:SelectPackFromName(p60)

	if visGuiOmniShop.Visible == false then
		networkClient.CloseQuestMenu()

		if starterQuests.Visible == true then
			starterQuests.Visible = false
		elseif ugcEvent.Visible == true then
			ugcEvent.Visible = false
		elseif scrollMenu.Enabled == true then
			scrollMenu.Enabled = false
		elseif umberlordMenu.Enabled == true then
			umberlordMenu.Enabled = false
		end

		ShowOmniShop("Packs")

		return
	end

	GoTo("Packs")
end
function networkClient.CardPackPurchased(p61)
	u107 = false
	v158:SelectPackFromName(p61.PackName)
	GoTo("Unpack")
	unpackCards.ShowPacks(p61.Cards, p61.NewCards, p61.CardPackId, p61.CardsPerPack)
	visGui.UnpackScreen.UnpackSummary.Close.MouseButton1Click:Wait()
	networkClient.SetData(data.Load())
	updatePackHolder()
	UpdateSidebar(v157[v158.currentpacknumber])
	updateBuyButton()
	GoTo("Packs")
	u150 = false
end

nevermorePaperRipple.FromParent(v154)
buy.MouseButton1Click:connect(function()
	audioService.PlaySound("lock")
	EventPurchase()
end)
v154.MouseButton1Click:connect(function()
	if u23 then
		return
	end

	audioService.PlaySound("lock")
	UnpackPack(false, s3)
end)
buyTickets.MouseButton1Click:connect(function()
	if u23 then
		return
	end

	audioService.PlaySound("lock")

	local v534 = v157[v158.currentpacknumber]

	if tick() - n13 < 2 then
		return
	end

	if u107 == true then
		return
	end

	local v535 = data.PackTickets()[v534.Name] or 0
	local v536 = v535 >= n8 and n8 or v535

	n13 = tick()
	networkFireServer("PurchaseCardPack", v534.Name, v536, true, "None")
end)
v121 = visGuiOmniShop.Rewards

local v201 = nevermore.new(v121.RewardList, -0.4, replicatedStorage, {})
local clone8 = v121.RewardList.BaseReward:Clone()

local t10: {[any]: any} = {
	BloxBux = function(p62)
		local clone9 = clone8:Clone()

		clone9.Parent = v201.Physical
		clone9.Title.Text = "+" .. p62 .. BloxBuxValue
		clone9.Visible = true

		local t17: {[any]: any} = { Physical = clone9, Number = #v201.packs + 1 }

		table.insert(v201.packs, t17)
		t17.Physical.MouseButton1Click:connect(function()
			v201:SelectPack(t17.Number)
		end)
	end,
	Charms = function(p63)
		local t18: {[any]: any} = { "Rabbit's Foot", "Clovers" }

		for i = 1, 2 do
			local v543 = p63[i]
			local v544 = t18[i]
			local clone10 = clone8:Clone()

			clone10.Parent = v201.Physical
			clone10.Title.Text = "+" .. v543 .. " " .. v544
			clone10.Visible = v543 > 0

			if clone10.Visible then
				local t19: {[any]: any} = { Physical = clone10, Number = #v201.packs + 1 }

				table.insert(v201.packs, t19)
				t19.Physical.MouseButton1Click:connect(function()
					v201:SelectPack(t19.Number)
				end)
			end
		end
	end,
	Ranks = function(p64)
		for _, v in pairs(p64) do
			local clone11 = clone8:Clone()

			clone11.Parent = v201.Physical
			clone11.Title.Text = v
			clone11.Type.Text = "Rank"
			clone11.Type.Visible = true
			clone11.Visible = true

			local t20: {[any]: any} = { Physical = clone11, Number = #v201.packs + 1 }

			table.insert(v201.packs, t20)
			t20.Physical.MouseButton1Click:connect(function()
				v201:SelectPack(t20.Number)
			end)
		end
	end,
	Sleeves = function(p65)
		for _, v in pairs(p65) do
			local v555 = NewSleeve(v, replicatedStorageSleeves[v], v201.packs, v201.Physical)

			v555.Physical.MouseButton1Click:connect(function()
				v201:SelectPack(v555.Number)
			end)
		end
	end,
	Cards = function(p66)
		for k, v in pairs(p66) do
			for _ = 1, v do
				local v560 = cardLibrary[k]
				local name = v560.Name
				local v562 = v560.Id
				local v563 = v560.Color
				local rarity = v560.Rarity
				local imageButton: ImageButton = Instance.new("ImageButton")

				imageButton.BackgroundTransparency = 1
				imageButton.Name = k

				local t21: {[any]: any} = {
					LibraryIndex = k,
					Name = name,
					Id = v562,
					Color = v563,
					Rarity = rarity
				}

				imageButton.Image = "rbxassetid://" .. t21.Id
				imageButton.ZIndex = configCardzindex
				imageButton.Parent = v201.Physical
				t21.Physical = imageButton
				nonGameCard.BindInspect(imageButton, t21)

				if v560.Foil then
					foilEffect(imageButton, v560.LibraryIndex)
				end

				t21.Number = #v201.packs + 1
				table.insert(v201.packs, t21)
				t21.Physical.MouseButton1Click:connect(function()
					v201:SelectPack(t21.Number)
				end)
			end
		end
	end
}

t10.RandomCards = t10.Cards

function Awarded(p67)
	data.Load()

	for k, v in pairs(v201.packs) do
		v.Physical:Destroy()
		v201.packs[k] = nil
	end

	v201.packs = {}
	v201.Physical:ClearAllChildren()
	v201.currentpacknumber = 1

	for k, v in pairs(p67) do
		if t10[k] then
			t10[k](v)
			v201:Redraw()
		end
	end

	GoTo("Rewards")
end

network.client.Awarded = Awarded

local offer = require(script.Parent.Offer)
local offerActive = offer.Active

v121 = visGuiOmniShopStart.Offers.OfferHolder
replicatedStorage = v121.BaseOffer

for k, v in pairs(robuxService.CurrentOffers) do
	if not v.Hidden then
		replicatedStorage.Visible = false

		local clone12 = replicatedStorage:Clone()

		clone12.Visible = true
		clone12.Name = k
		clone12.Parent = v121
		clone12.LayoutOrder = v.Order or 99
		offer.new(clone12, v, v.Image, k)
	end
end

local function UpdateOfferVisibility()
	for k, v in pairs(offer.Active) do
		v.Physical.Visible = k == 1
	end
end

replicatedStorage = require(script.Parent.Prebuilt)

local replicatedStorageActive = replicatedStorage.Active

v121 = visGuiOmniShop.Decks.Offers.OfferHolder
nevermore = v121.BaseOffer
v22 = visGuiOmniShop.Crossovers.Offers.OfferHolder
EventShop = v22.BaseOffer

for k, v in pairs(robuxService.CurrentPrebuilts) do
	if not v.Hidden and (v.TestServerOnly ~= true or not not isTestServer()) then
		if v.Crossover then
			EventShop.Visible = false

			local clone13 = EventShop:Clone()

			clone13.Visible = true
			clone13.Name = k
			clone13.Parent = v22
			clone13.LayoutOrder = v.Order or 1
			replicatedStorage.new(clone13, v, v.Image, k)
		end

		nevermore.Visible = false

		local clone14 = nevermore:Clone()

		clone14.LayoutOrder = v.Order or 99
		clone14.Visible = true
		clone14.Name = k
		clone14.Parent = v121
		replicatedStorage.new(clone14, v, v.Image, k)
	end
end

local sets = require(script.Parent.Sets)
local setsActive = sets.Active

nevermore = visGuiOmniShop.Sets.Offers.OfferHolder
v121 = nevermore.BaseOffer

for k, v in pairs(robuxService.CurrentSetups) do
	if not v.Hidden and (v.TestServerOnly ~= true or not not isTestServer()) then
		if v.Crossover then
			EventShop.Visible = false

			local clone15 = EventShop:Clone()

			clone15.Visible = true
			clone15.Name = k
			clone15.Parent = v22
			clone15.LayoutOrder = v.Order or 1
			sets.new(clone15, v, v.Image, k)
		else
			v121.Visible = false

			local clone16 = v121:Clone()

			clone16.Visible = true
			clone16.Name = k
			clone16.Parent = nevermore
			clone16.LayoutOrder = v.Order or 1
			sets.new(clone16, v, v.Image, k)
		end
	end
end

function networkClient.OpenSinglePurchaseMenu(p68, p69)
	print(p68)
	print(p69)

	local u576 = visGuiOmniShop.Sets.MetaverseContents

	if p68.Crossover then
		u576 = visGuiOmniShop.Crossovers.MetaverseContents
	end

	for _, v in pairs(u576.ContentList:GetChildren()) do
		if v:IsA("Frame") and v.Name ~= "TemplateCard" then
			v:Destroy()
		end
	end

	u576.ContentList.CanvasPosition = Vector2.new(0, 0)

	local templateCard = u576.ContentList.TemplateCard

	for k, _ in pairs(p68.Cards) do
		if cardLibrary[k].Rarity ~= "Token" and not cardLibrary[k].PlayTest and not cardLibrary[k].Original and (not p68.ValidSingleCosts or table.find(p68.ValidSingleCosts, cardLibrary[k].LibraryIndex)) then
			local clone17 = templateCard:Clone()

			clone17.CardImage.Image = "rbxassetid://" .. cardLibrary[k].Id
			clone17.Name = cardLibrary[k].Name
			clone17.Parent = u576.ContentList
			clone17.Visible = true
			nonGameCard.BindInspect(clone17.CardImage, cardLibrary[k])

			local v583 = data.OwnedCardCopies(k)
			local v584 = data.OwnedCardCopies(k .. "-Foil")

			if v583 and v583["0"] and v583["0"] > 0 or v584 and v584["0"] and v584["0"] > 0 then
				if v583 and v583["0"] then
					local clone17OwnCount = clone17.OwnCount
					local text: string = tostring(v583["0"] or 0)

					clone17OwnCount.Text = "Owned x" .. text
				else
					clone17.OwnCount.Text = "Owned x0"
				end

				if v584 and v584["0"] and v584["0"] > 0 then
					local ownCount = clone17.OwnCount
					local v588 = clone17.OwnCount.Text
					local text: string = tostring(v584["0"])

					ownCount.Text = v588 .. " (" .. text .. "★)"
				end
			else
				clone17.OwnCount.Text = "Unowned"
			end

			clone17.OwnCount.MouseButton1Click:Connect(function()
				if u107 == true then
					return
				end

				if not p68.Hidden and (not p68.SingleCost or not (p68.SingleCost > data.Money())) then
					network.FireServer("HandleSingleCardPurchase", k, p69)
					task.spawn(function()
						u107 = true
						task.wait(2)
						sets.DisableButtons(false)
						u107 = false
					end)
					u576:TweenPosition(UDim2.new(0.1, 0, -3.05, 0), "Out", "Quad", 0.8, true)

					return
				end

				robuxService.InsufficientFunds(p68.SingleCost)
			end)
			clone17.LayoutOrder = config.REVERSECOLORORDER[cardLibrary[k].Color]
		end
	end

	u576:TweenPosition(UDim2.new(0.1, 0, 0.05, 0), "Out", "Quad", 0.8, true)
end

visGuiOmniShop.Sets.MetaverseContents.Close.MouseButton1Click:Connect(function()
	audioService.PlaySound("Door_unlock")
	visGuiOmniShop.Sets.MetaverseContents:TweenPosition(UDim2.new(0.1, 0, -3.05, 0), "Out", "Quad", 0.8, true)
	sets.DisableButtons(false)

	for _, v in pairs(visGuiOmniShop.Sets.MetaverseContents.ContentList:GetChildren()) do
		if v:IsA("Frame") and v.Name ~= "TemplateCard" then
			v:Destroy()
		end
	end
end)
visGuiOmniShop.Crossovers.MetaverseContents.Close.MouseButton1Click:Connect(function()
	audioService.PlaySound("Door_unlock")
	visGuiOmniShop.Crossovers.MetaverseContents:TweenPosition(UDim2.new(0.1, 0, -3.05, 0), "Out", "Quad", 0.8, true)
	sets.DisableButtons(false)

	for _, v in pairs(visGuiOmniShop.Crossovers.MetaverseContents.ContentList:GetChildren()) do
		if v:IsA("Frame") and v.Name ~= "TemplateCard" then
			v:Destroy()
		end
	end
end)

local u221 = nil

function SwitchOffer(p70)
	if u221 then
		u221.Visible = false
	end

	visGuiOmniShopStart.Offers[currentOffers[p70]].Visible = true
	u221 = visGuiOmniShopStart.Offers[currentOffers[p70]]

	for _, v in pairs(visGuiOmniShopStart.Offers.Arrows.MiniOffers:GetChildren()) do
		if v:IsA("GuiObject") then
			local vName = v.Name
			local text: string = tostring(p70)

			if vName == text then
				v.BackgroundColor3 = Color3.fromRGB(0, 255, 238)
			else
				v.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			end
		end
	end
end

if currentOffers then
	for k, v in pairs(currentOffers) do
		-- one broken offer (e.g. a card missing from this copy) must not kill the whole shop
		local okOffer, errOffer = pcall(mainOffers[v], visGuiOmniShopStart.Offers[v])

		if not okOffer then
			warn("[Shop] offer '" .. tostring(v) .. "' failed to set up: " .. tostring(errOffer))
		end

		local clone18 = visGuiOmniShopStart.Offers.Arrows.Template.TemplateMini:Clone()

		clone18.Parent = visGuiOmniShopStart.Offers.Arrows.MiniOffers
		clone18.Name = k
		clone18.Visible = true
	end

	SwitchOffer(1)

	local arrows = visGuiOmniShopStart.Offers.Arrows

	arrows.Previous.MouseButton1Click:Connect(function()
		audioService.PlaySound("clickfast.wav")
		n1 = if n1 == 1 then #currentOffers else n1 - 1
		SwitchOffer(n1)
	end)
	arrows.Next.MouseButton1Click:Connect(function()
		audioService.PlaySound("clickfast.wav")
		n1 = if n1 == #currentOffers then 1 else n1 + 1
		SwitchOffer(n1)
	end)
end

function networkClient.UpdateBackgroundShop()
	transition.ChangeBattleBackground(battleBackgrounds[n2][1])

	if data.CurrentBackgroundName() == battleBackgrounds[n2][1] then
		visGuiOmniShop.Backgrounds.Buy.TextLabel.Text = "Selected!"
		visGuiOmniShop.Backgrounds.Buy.TextLabel.Back.Text = visGuiOmniShop.Backgrounds.Buy.TextLabel.Text
		visGuiOmniShop.Backgrounds.Buy.ImageColor3 = Color3.fromRGB(0, 67, 27)

		return
	end

	if data.OwnsBackground(battleBackgrounds[n2][1]) then
		visGuiOmniShop.Backgrounds.Buy.TextLabel.Text = "Select"
		visGuiOmniShop.Backgrounds.Buy.TextLabel.Back.Text = visGuiOmniShop.Backgrounds.Buy.TextLabel.Text
		visGuiOmniShop.Backgrounds.Buy.ImageColor3 = Color3.fromRGB(0, 200, 83)

		return
	end

	if battleBackgrounds[n2][3] then
		if battleBackgrounds[n2][4] then
			visGuiOmniShop.Backgrounds.Buy.TextLabel.Text = "Obtained from: " .. battleBackgrounds[n2][4]
		else
			visGuiOmniShop.Backgrounds.Buy.TextLabel.Text = "Locked"
		end

		visGuiOmniShop.Backgrounds.Buy.TextLabel.Back.Text = visGuiOmniShop.Backgrounds.Buy.TextLabel.Text
		visGuiOmniShop.Backgrounds.Buy.ImageColor3 = Color3.fromRGB(58, 72, 61)

		return
	end

	visGuiOmniShop.Backgrounds.Buy.TextLabel.Text = "Buy for " .. battleBackgrounds[n2][2] .. "R$"
	visGuiOmniShop.Backgrounds.Buy.TextLabel.Back.Text = visGuiOmniShop.Backgrounds.Buy.TextLabel.Text
	visGuiOmniShop.Backgrounds.Buy.ImageColor3 = Color3.fromRGB(0, 200, 83)
end

visGuiOmniShop.Backgrounds.Buy.MouseButton1Click:Connect(function()
	audioService.PlaySound("lock")

	if data.OwnsBackground(battleBackgrounds[n2][1]) then
		data.SetBackground(battleBackgrounds[n2][1])
		networkFireServer("SetBackground", battleBackgrounds[n2][1])
		networkClient.UpdateBackgroundShop()
	elseif not battleBackgrounds[n2][3] then
		network.FireServer("OfferPrepare", "Background", battleBackgrounds[n2][1])
	end
end)
visGuiOmniShop.Backgrounds.Back.MouseButton1Click:Connect(function()
	audioService.PlaySound("lock")
	n2 = if n2 == 1 then #battleBackgrounds else n2 - 1
	networkClient.UpdateBackgroundShop()
end)
visGuiOmniShop.Backgrounds.Forward.MouseButton1Click:Connect(function()
	audioService.PlaySound("lock")
	n2 = if n2 == #battleBackgrounds then 1 else n2 + 1
	networkClient.UpdateBackgroundShop()
end)
visGuiOmniShop.Backgrounds.SwitchMenu.MouseButton1Click:Connect(function()
	audioService.PlaySound("lock")
	GoTo("Sleeves")
end)
visGuiOmniShop.Sleeves.SwitchMenu.MouseButton1Click:Connect(function()
	audioService.PlaySound("lock")
	GoTo("Backgrounds")
end)
print("Finished loading " .. script.Name)

return v52
