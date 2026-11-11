



local LocalPlayer = game.Players.LocalPlayer
local visGui = LocalPlayer.PlayerGui:WaitForChild("VisGui")
local replicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")
local cardLibrary = (function()
	local real = require(replicatedStorage.CardLibrary)
	return setmetatable({}, {
		__index = function(_, name)
			local c = real[name]
			if c == nil then
				warn("[MainOffers] card '" .. tostring(name) .. "' missing from CardLibrary; using placeholder")
				return { Id = 0, Name = tostring(name) }
			end
			return c
		end,
	})
end)()
local nonGameCard = require(script.Parent.Parent.NonGameCard)
local cardAnim = require(game.ReplicatedStorage.CardAnim)
local foilEffect = require(game.ReplicatedStorage.FoilEffect)
local audioService = require(game.ReplicatedStorage.AudioService)
local effects = require(game.ReplicatedStorage.Effects)
local tweenService: TweenService = game:GetService("TweenService")
local replicatedStorage2: ReplicatedStorage = game:GetService("ReplicatedStorage")
local spr = require(replicatedStorage2.spr)
local network = require(script.Parent.Parent.Network)
local networkFireServer = network.FireServer
local networkInvokeServer = network.InvokeServer
local networkClient = network.client
local u17 = false

local function BuyDebounce()
	task.spawn(function()
		u17 = true
		task.wait(2)
		u17 = false
	end)
end

local module: {[any]: any} = {
	DisableButtons = function(p1)
		u17 = p1
	end,
	CardAnims = {},
	OfferMap = {
		NecrosyndicatesAct1 = "NecrosyndicatesAct1",
		NecrosyndicatesAct2 = "NecrosyndicatesAct2",
		NecrosyndicatesAct3 = "NecrosyndicatesAct3",
		BiobladeBundle = "BiobladesCollectors",
		VagabondBundle = "VagabondCollectors",
		RPSBundle = "RPSCollectors",
		EggEmporiumBundle = "EggEmproiumCollectors",
		AnniversaryBundle = "Anniversary2023",
		StarsBundle = "StarsCollectors",
		HalloweenBundle = "Halloween2023",
		StagnationBundle = "StagnationCollectors",
		BargetownBundle = "BargetownCollectors",
		ChristmasBundle = "Christmas2023",
		ValentinesBundle2024 = "ValentinesBundle2024",
		EasterBundle2024 = "Easter2024",
		ExtraLivesBundle = "ExtraLives",
		AWHBundle = "AWIH",
		MekaBundle = "MekaCollectors",
		GrindersBundle = "GrindersCollectors",
		BlacksiteBundle = "Blacksite",
		Summer2024Bundle = "Summer2024",
		AnniversaryBundle2024 = "Anniversary2024",
		UGCAd = "UGCAd",
		Testers1Bundle = "FoilsMetaverseTesters1",
		RareRivalryBundle = "RareRivalry",
		CrimpBundle = "Crimp",
		ResistanceBundle = "ResistanceBundle",
		StarterBundle = "StarterPack",
		Anniversary10Bundle = "Anniversary10",
		SEWHBundle = "SEWHBundle",
		Halloween25Bundle = "Halloween25Bundle",
		GraceBundle = "GraceBundle",
		HoHBundle = "HoHBundle",
		WTDBundle = "WTDBundle",
		DoDBundle = "DoDBundle",
		GamepassSaleAd = "GamepassSaleAd",
		SomniaBundle = "SomniaBundle",
		MegaHuntersBundle = "MegaHuntersBundle",
		AfternightBundle = "AfternightBundle",
		MushipBundle = "MushipBundle",
		DTTBundle = "DTTBundle",
		LunarImpactBundle = "LunarImpactBundle",
		LunarImpactVIPBundle = "LunarImpactVIPBundle",
		BowlBundle = "BowlBundle"
	}
}

function module.NecrosyndicatesAct1(p2)
	local u22 = nil
	local BoxSize = p2.Box.Size

	p2.Box.MouseEnter:Connect(function()
		audioService.PlaySound("ui_hover")
		spr.stop(p2.Box)

		local sprTarget = spr.target
		local box = p2.Box
		local v432 = UDim2.fromScale(BoxSize.X.Scale * 1.1, BoxSize.Y.Scale * 1.1)

		sprTarget(box, 0.1, 4, { Size = v432 })
	end)
	p2.Box.MouseLeave:Connect(function()
		spr.stop(p2.Box)
		spr.target(p2.Box, 0.2, 4, { Size = BoxSize })
	end)
	p2.Box.MouseButton1Click:Connect(function()
		audioService.PlaySound("lock")

		if not u22 then
			p2.MainWindow.Warning.Text = "(select an animated art first to view contents)"
			p2.MainWindow.Warning.Visible = true

			return
		end

		local v433 = networkInvokeServer("GetOfferContents", nil, "NecrosyndicatesAct1_" .. u22.Name)

		networkClient.QuickShowRewards(v433)
	end)
	p2.Button.MouseButton1Click:Connect(function()
		if u17 then
			return
		end

		if not u22 then
			p2.MainWindow.Warning.Visible = true

			return
		end

		network.FireServer("OfferPrepare", "Offer", "NecrosyndicatesAct1_" .. u22.Name)
	end)

	for k, v in pairs({
		"Fl00fy_Bonez-Offer",
		"McKayla, Bane of Hierarchy-Offer",
		"Apollo Scott, Visionary-Offer",
		"Bloxburg Mayor Astarossa-Offer",
		"Kingrin, Surrounded by Familey-Offer",
		"Caitlin, Paladin of Nature-Offer"
	}) do
		local v26 = cardLibrary[v]
		local cards = p2.MainWindow.Cards
		local text: string = tostring(k)
		local v29 = cards[text]

		v29.LayoutOrder = k
		v29.Image = "rbxassetid://" .. v26.Id
		table.insert(module.CardAnims, cardAnim(v29, v26.ArtAnimation))
		nonGameCard.BindInspect(v29, v26)
		v29.MouseButton1Click:Connect(function()
			audioService.PlaySound("lock")

			if u22 then
				u22.UIStroke.Enabled = false
			end

			u22 = v29
			v29.UIStroke.Enabled = true
			p2.MainWindow.Warning.Text = "You've selected " .. v26.Name .. "."
			p2.MainWindow.Warning.TextColor3 = Color3.fromRGB(255, 255, 255)
			p2.MainWindow.Warning.Visible = true
		end)
	end
end
function module.NecrosyndicatesAct2(p3)
	local u31 = nil
	local v32 = p3.Box.Size

	p3.Box.MouseEnter:Connect(function()
		audioService.PlaySound("ui_hover")
		spr.stop(p3.Box)

		local sprTarget = spr.target
		local box = p3.Box
		local v436 = UDim2.fromScale(v32.X.Scale * 1.1, v32.Y.Scale * 1.1)

		sprTarget(box, 0.1, 4, { Size = v436 })
	end)
	p3.Box.MouseLeave:Connect(function()
		spr.stop(p3.Box)
		spr.target(p3.Box, 0.2, 4, { Size = v32 })
	end)
	p3.Box.MouseButton1Click:Connect(function()
		audioService.PlaySound("lock")

		if not u31 then
			p3.MainWindow.Warning.Text = "(select an animated art first to view contents)"
			p3.MainWindow.Warning.Visible = true

			return
		end

		local v437 = networkInvokeServer("GetOfferContents", nil, "NecrosyndicatesAct2_" .. u31.Name)

		networkClient.QuickShowRewards(v437)
	end)
	p3.Button.MouseButton1Click:Connect(function()
		if u17 then
			return
		end

		if not u31 then
			p3.MainWindow.Warning.Visible = true

			return
		end

		network.FireServer("OfferPrepare", "Offer", "NecrosyndicatesAct2_" .. u31.Name)
	end)

	for k, v in pairs({
		"Catlyn Nyaxon, Hunter-Offer",
		"Biggs, Liquidated-Offer",
		"Apollo, Fearless-Offer",
		"Astarossa Van Buren-Offer",
		"Thec, the Robloxcity Ripper-Offer",
		"Caitlin Nixon, Hunted-Offer"
	}) do
		local v35 = cardLibrary[v]
		local cards = p3.MainWindow.Cards
		local text: string = tostring(k)
		local v38 = cards[text]

		v38.LayoutOrder = k
		v38.Image = "rbxassetid://" .. v35.Id
		table.insert(module.CardAnims, cardAnim(v38, v35.ArtAnimation))
		nonGameCard.BindInspect(v38, v35)
		v38.MouseButton1Click:Connect(function()
			audioService.PlaySound("lock")

			if u31 then
				u31.UIStroke.Enabled = false
			end

			u31 = v38
			v38.UIStroke.Enabled = true
			p3.MainWindow.Warning.Text = "You've selected " .. v35.Name .. "."
			p3.MainWindow.Warning.TextColor3 = Color3.fromRGB(255, 255, 255)
			p3.MainWindow.Warning.Visible = true
		end)
	end
end
function module.BiobladeBundle(p4)
	local imageLabel = p4.ImageLabel
	local tweenInfo = TweenInfo.new(8, Enum.EasingStyle.Linear)

	p4.Button.MouseButton1Click:Connect(function()
		if u17 then
			return
		end

		network.FireServer("OfferPrepare", "Offer", "BiobladesCollectors")
	end)
	p4.Contents.MouseButton1Click:Connect(function()
		local v438 = networkInvokeServer("GetOfferContents", nil, "BiobladesCollectors")

		networkClient.QuickShowRewards(v438)
	end)

	local t2: {[any]: any} = { { tweenService:Create(imageLabel, tweenInfo, { Rotation = 360 }) } }

	task.spawn(function()
		while true do
			t2[1][1]:Play()
			t2[1][1].Completed:Wait()
			p4.ImageLabel.Rotation = 0
		end
	end)
	table.insert(module.CardAnims, t2)

	for k, v in pairs({
		"Bioblade Excavator-Bundle",
		"Bioblade Digger-Anim",
		"Xhartyr-Anim",
		"Bioblade Demolitionist-Anim",
		"Bioblade Stud Curator-Bundle"
	}) do
		local v45 = cardLibrary[v]
		local cards = p4.MainWindow.Cards
		local text: string = tostring(k)
		local v48 = cards[text]

		v48.LayoutOrder = k
		v48.Image = "rbxassetid://" .. v45.Id

		if v45.ArtAnimation then
			table.insert(module.CardAnims, cardAnim(v48, v45.ArtAnimation))
		end

		nonGameCard.BindInspect(v48, v45)
	end
end
function module.VagabondBundle(p5)
	local imageLabel = p5.ImageLabel
	local tweenInfo = TweenInfo.new(8, Enum.EasingStyle.Linear)

	p5.Button.MouseButton1Click:Connect(function()
		if u17 then
			return
		end

		network.FireServer("OfferPrepare", "Offer", "VagabondCollectors")
	end)
	p5.Contents.MouseButton1Click:Connect(function()
		local v439 = networkInvokeServer("GetOfferContents", nil, "VagabondCollectors")

		networkClient.QuickShowRewards(v439)
	end)

	local t3: {[any]: any} = { { tweenService:Create(imageLabel, tweenInfo, { Rotation = 360 }) } }

	task.spawn(function()
		while true do
			t3[1][1]:Play()
			t3[1][1].Completed:Wait()
			p5.ImageLabel.Rotation = 0
		end
	end)
	table.insert(module.CardAnims, t3)

	for k, v in pairs({
		"Soulless Slayer-Bundle",
		"Sleepless Steward-Bundle",
		"Rage Rider-Anim",
		"Range Rider-Anim",
		"Hazenwyld, Dying Sanctum-Offer"
	}) do
		local v55 = cardLibrary[v]
		local cards = p5.MainWindow.Cards
		local text: string = tostring(k)
		local v58 = cards[text]

		v58.LayoutOrder = k
		v58.Image = "rbxassetid://" .. v55.Id

		if v55.ArtAnimation then
			table.insert(module.CardAnims, cardAnim(v58, v55.ArtAnimation))
		end

		nonGameCard.BindInspect(v58, v55)
	end
end
function module.RPSBundle(p6)
	local viewNurtured = p6.ViewNurtured
	local tweenInfo = TweenInfo.new(2, Enum.EasingStyle.Quad)
	local v62: Tween = tweenService:Create(viewNurtured, tweenInfo, { Rotation = -2 })
	local v63 = p6.ViewNurtured
	local tweenInfo2 = TweenInfo.new(2, Enum.EasingStyle.Quad)
	local unnurturedText = p6.MainWindow.UnnurturedText
	local tweenInfo3 = TweenInfo.new(2, Enum.EasingStyle.Quad)
	local v67: Tween = tweenService:Create(unnurturedText, tweenInfo3, { Rotation = -2 })
	local v68 = p6.MainWindow.UnnurturedText
	local tweenInfo4 = TweenInfo.new(2, Enum.EasingStyle.Quad)

	p6.Button.MouseButton1Click:Connect(function()
		if u17 then
			return
		end

		network.FireServer("OfferPrepare", "Offer", "RPSCollectors")
	end)
	p6.Contents.MouseButton1Click:Connect(function()
		local v440 = networkInvokeServer("GetOfferContents", nil, "RPSCollectors")

		networkClient.QuickShowRewards(v440)
	end)
	p6.ViewNurtured.MouseButton1Click:Connect(function()
		p6.MainWindow.Cards.Visible = not p6.MainWindow.Cards.Visible
		p6.MainWindow.NurturedCards.Visible = not p6.MainWindow.NurturedCards.Visible
		p6.MainWindow.NurturedText.Visible = not p6.MainWindow.NurturedText.Visible
		p6.MainWindow.UnnurturedText.Visible = not p6.MainWindow.UnnurturedText.Visible
		audioService.PlaySound("Pop")

		if p6.MainWindow.Cards.Visible then
			p6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)

			return
		end

		p6.BackgroundColor3 = Color3.fromRGB(255, 208, 208)
		audioService.PlaySound("toonybeep")

		for i = 1, 5 do
			if i ~= 3 then
				effects.NurtureAsync(visGui.Effect, nil, p6.MainWindow.NurturedCards[i])
			end
		end
	end)

	local t4: {[any]: any} = {
		{
			v62,
			tweenService:Create(v63, tweenInfo2, { Rotation = 2 })
		},
		{
			v67,
			tweenService:Create(v68, tweenInfo4, { Rotation = 2 })
		}
	}

	task.spawn(function()
		while true do
			t4[1][1]:Play()
			t4[1][1].Completed:Wait()
			t4[1][2]:Play()
			t4[1][2].Completed:Wait()
		end
	end)
	task.spawn(function()
		while true do
			t4[2][1]:Play()
			t4[2][1].Completed:Wait()
			t4[2][2]:Play()
			t4[2][2].Completed:Wait()
		end
	end)
	table.insert(module.CardAnims, t4)

	for k, v in pairs({
		"Claudia, Preordained Hero-Offer",
		"RPS Pouncer-Offer",
		"Strange Shipment-Offer",
		"RPS Feeder-Offer",
		"RPS Catcher-Offer"
	}) do
		local v73 = cardLibrary[v]
		local cards = p6.MainWindow.Cards
		local text: string = tostring(k)
		local v76 = cards[text]

		v76.LayoutOrder = k
		v76.Image = "rbxassetid://" .. v73.Id

		if v73.ArtAnimation then
			table.insert(module.CardAnims, cardAnim(v76, v73.ArtAnimation))
		end

		if v73.NurtureArt then
			local nurturedCards = p6.MainWindow.NurturedCards
			local text2: string = tostring(k)
			local v79 = nurturedCards[text2]

			v79.LayoutOrder = k
			v79.Image = "rbxassetid://" .. v73.NurtureArt

			if v73.NurtureArtAnimation then
				table.insert(module.CardAnims, cardAnim(v79, v73.NurtureArtAnimation))
			end

			nonGameCard.BindInspect(v79, v73)
		else
			local v80 = p6.MainWindow.NurturedCards
			local text3: string = tostring(k)
			local v82 = v80[text3]

			v82.LayoutOrder = k
			v82.Image = "rbxassetid://" .. v73.Id
			nonGameCard.BindInspect(v82, v73)
		end

		nonGameCard.BindInspect(v76, v73)
	end
end
function module.EggEmporiumBundle(p7)
	p7.Button.MouseButton1Click:Connect(function()
		if u17 then
			return
		end

		network.FireServer("OfferPrepare", "Offer", "EggEmporiumCollectors")
	end)
	p7.Contents.MouseButton1Click:Connect(function()
		local v442 = networkInvokeServer("GetOfferContents", nil, "EggEmporiumCollectors")

		networkClient.QuickShowRewards(v442)
	end)

	for k, v in pairs({
		"Emporium Ad Designer-Offer",
		"Emporium Salesdevil-Offer",
		"Asmodeus, Emporium Proprieter-Offer",
		"Emporium Soulbinder-Offer",
		"Controlled Scarcity-Offer",
		"Emporium Herder-Offer"
	}) do
		local v86 = cardLibrary[v]
		local cards = p7.MainWindow.Cards
		local text: string = tostring(k)
		local v89 = cards[text]

		v89.LayoutOrder = k
		v89.Image = "rbxassetid://" .. v86.Id

		if v86.ArtAnimation then
			table.insert(module.CardAnims, cardAnim(v89, v86.ArtAnimation))
		end

		nonGameCard.BindInspect(v89, v86)
	end

	for k, v in pairs({ "Pet Egg-Offer", "Pet1-Offer", "Pet2-Offer", "Pet3-Offer" }) do
		local v92 = cardLibrary[v]
		local tokens = p7.MainWindow.Tokens
		local text4: string = tostring(k)
		local v95 = tokens[text4]

		v95.LayoutOrder = k
		v95.Image = "rbxassetid://" .. v92.Id

		if v92.ArtAnimation then
			table.insert(module.CardAnims, cardAnim(v95, v92.ArtAnimation))
		end

		nonGameCard.BindInspect(v95, v92)
	end
end
function module.AnniversaryBundle(p8)
	p8.Button.MouseButton1Click:Connect(function()
		if u17 then
			return
		end

		network.FireServer("OfferPrepare", "Offer", "Anniversary2023")
	end)
	p8.Contents.MouseButton1Click:Connect(function()
		local v443 = networkInvokeServer("GetOfferContents", nil, "Anniversary2023")

		networkClient.QuickShowRewards(v443)
	end)

	for k, v in pairs({
		"EzCheez-AN",
		"Alex, Developer Depraved-Offer",
		"Combine Garrison-Offer",
		"Has-AN",
		"Crazyblox-AN"
	}) do
		local v99 = cardLibrary[v]
		local cards = p8.MainWindow.Cards
		local text: string = tostring(k)
		local v102 = cards[text]

		v102.LayoutOrder = k
		v102.Image = "rbxassetid://" .. v99.Id

		if v99.ArtAnimation then
			table.insert(module.CardAnims, cardAnim(v102, v99.ArtAnimation))
		end

		nonGameCard.BindInspect(v102, v99)
	end

	for k, v in pairs({
		"The Inner #####-Offer",
		"Elder Vitality Demon-Offer",
		"Combine Garrison-Offer 2",
		"Has Token-AN",
		"CrazybloxStance2-AN"
	}) do
		local v105 = cardLibrary[v]
		local cards2 = p8.MainWindow.Cards2
		local text5: string = tostring(k)
		local v108 = cards2[text5]

		v108.LayoutOrder = k
		v108.Image = "rbxassetid://" .. v105.Id
		nonGameCard.BindInspect(v108, v105)
	end
end
function module.StarsBundle(p9)
	p9.Button.MouseButton1Click:Connect(function()
		if u17 then
			return
		end

		network.FireServer("OfferPrepare", "Offer", "StarsCollectors")
	end)
	p9.Contents.MouseButton1Click:Connect(function()
		local v444 = networkInvokeServer("GetOfferContents", nil, "StarsCollectors")

		networkClient.QuickShowRewards(v444)
	end)

	for k, v in pairs({
		"Rock-Star Impstrument-Offer",
		"Soul-Star Chorus Familiar-Offer",
		"Pop-Star Cheerubus-Offer",
		"Dance-Star Revelords-Offer",
		"Luthier, Morning-Star Ruler-Offer"
	}) do
		local v112 = cardLibrary[v]
		local cards = p9.MainWindow.Cards
		local text: string = tostring(k)
		local v115 = cards[text]

		v115.LayoutOrder = k
		v115.Image = "rbxassetid://" .. v112.Id

		if v112.ArtAnimation then
			table.insert(module.CardAnims, cardAnim(v115, v112.ArtAnimation))
		end

		nonGameCard.BindInspect(v115, v112)
	end

	for k, v in pairs({ "Devil's Chord-Offer", "Spirit Melody-Offer", "Light-Motif-Offer" }) do
		local v118 = cardLibrary[v]
		local tokens = p9.MainWindow.Tokens
		local text6: string = tostring(k)
		local v121 = tokens[text6]

		v121.LayoutOrder = k
		v121.Image = "rbxassetid://" .. v118.Id

		if v118.ArtAnimation then
			table.insert(module.CardAnims, cardAnim(v121, v118.ArtAnimation))
		end

		nonGameCard.BindInspect(v121, v118)
	end
end
function module.NecrosyndicatesAct3(p10)
	local u123 = nil
	local v124 = p10.Box.Size

	p10.Box.MouseEnter:Connect(function()
		audioService.PlaySound("ui_hover")
		spr.stop(p10.Box)

		local sprTarget = spr.target
		local box = p10.Box
		local v447 = UDim2.fromScale(v124.X.Scale * 1.1, v124.Y.Scale * 1.1)

		sprTarget(box, 0.1, 4, { Size = v447 })
	end)
	p10.Box.MouseLeave:Connect(function()
		spr.stop(p10.Box)
		spr.target(p10.Box, 0.2, 4, { Size = v124 })
	end)
	p10.Box.MouseButton1Click:Connect(function()
		audioService.PlaySound("lock")

		if not u123 then
			p10.MainWindow.Warning.Text = "(select an animated art first to view contents)"
			p10.MainWindow.Warning.Visible = true

			return
		end

		local v448 = networkInvokeServer("GetOfferContents", nil, "NecrosyndicatesAct3_" .. u123.Name)

		networkClient.QuickShowRewards(v448)
	end)
	p10.Button.MouseButton1Click:Connect(function()
		if u17 then
			return
		end

		if not u123 then
			p10.MainWindow.Warning.Visible = true

			return
		end

		network.FireServer("OfferPrepare", "Offer", "NecrosyndicatesAct3_" .. u123.Name)
	end)

	for k, v in pairs({
		"Nina Hellensoft-Offer",
		"Captain Skewerglee-Offer",
		"Eric Newman-Offer",
		"LeBlanc, Dread Priest-Offer",
		"Grey, Mending the Lost-Offer",
		"Apate, Demon Investor-Offer"
	}) do
		local v127 = cardLibrary[v]
		local cards = p10.MainWindow.Cards
		local text: string = tostring(k)
		local v130 = cards[text]

		v130.LayoutOrder = k
		v130.Image = "rbxassetid://" .. v127.Id
		table.insert(module.CardAnims, cardAnim(v130, v127.ArtAnimation))
		nonGameCard.BindInspect(v130, v127)
		v130.MouseButton1Click:Connect(function()
			audioService.PlaySound("lock")

			if u123 then
				u123.UIStroke.Enabled = false
			end

			u123 = v130
			v130.UIStroke.Enabled = true
			p10.MainWindow.Warning.Text = "You've selected " .. v127.Name .. "."
			p10.MainWindow.Warning.TextColor3 = Color3.fromRGB(255, 255, 255)
			p10.MainWindow.Warning.Visible = true
		end)
	end
end
function module.DoomspireAct1(p11)
	local u132 = nil
	local v133 = p11.Box.Size

	p11.Box.MouseEnter:Connect(function()
		audioService.PlaySound("ui_hover")
		spr.stop(p11.Box)

		local sprTarget = spr.target
		local box = p11.Box
		local v451 = UDim2.fromScale(v133.X.Scale * 1.1, v133.Y.Scale * 1.1)

		sprTarget(box, 0.1, 4, { Size = v451 })
	end)
	p11.Box.MouseLeave:Connect(function()
		spr.stop(p11.Box)
		spr.target(p11.Box, 0.2, 4, { Size = v133 })
	end)
	p11.Box.MouseButton1Click:Connect(function()
		audioService.PlaySound("lock")

		if not u132 then
			p11.MainWindow.Warning.Text = "(select an animated art first to view contents)"
			p11.MainWindow.Warning.Visible = true

			return
		end

		local v452 = networkInvokeServer("GetOfferContents", nil, "DoomspireAct1_" .. u132.Name)

		networkClient.QuickShowRewards(v452)
	end)
	p11.Button.MouseButton1Click:Connect(function()
		if u17 then
			return
		end

		if not u132 then
			p11.MainWindow.Warning.Visible = true

			return
		end

		network.FireServer("OfferPrepare", "Offer", "DoomspireAct1_" .. u132.Name)
	end)
	p11.BuyAll.MouseButton1Click:Connect(function()
		if u17 then
			return
		end

		network.FireServer("OfferPrepare", "Offer", "DoomspireAct1Full")
	end)

	for k, v in pairs({
		"Claymaker, Master Architect-Offer",
		"Queen Shedare II-Offer",
		"Deidre, Timeslayer-Offer",
		"Warriors of Justice-Offer"
	}) do
		local v136 = cardLibrary[v]
		local cards = p11.MainWindow.Cards
		local text: string = tostring(k)
		local v139 = cards[text]

		v139.LayoutOrder = k
		v139.Image = "rbxassetid://" .. v136.Id

		if v136.ArtAnimation then
			table.insert(module.CardAnims, cardAnim(v139, v136.ArtAnimation))
		end

		nonGameCard.BindInspect(v139, v136)
		v139.MouseButton1Click:Connect(function()
			audioService.PlaySound("lock")

			if u132 then
				u132.UIStroke.Enabled = false
			end

			u132 = v139
			v139.UIStroke.Enabled = true
			p11.MainWindow.Warning.Text = "You've selected " .. v136.Name .. "."
			p11.MainWindow.Warning.TextColor3 = Color3.fromRGB(255, 255, 255)
			p11.MainWindow.Warning.Visible = true
		end)
	end
end
function module.DoomspireAct2(p12)
	local u141 = nil
	local v142 = p12.Box.Size

	p12.Box.MouseEnter:Connect(function()
		audioService.PlaySound("ui_hover")
		spr.stop(p12.Box)

		local sprTarget = spr.target
		local box = p12.Box
		local v455 = UDim2.fromScale(v142.X.Scale * 1.1, v142.Y.Scale * 1.1)

		sprTarget(box, 0.1, 4, { Size = v455 })
	end)
	p12.Box.MouseLeave:Connect(function()
		spr.stop(p12.Box)
		spr.target(p12.Box, 0.2, 4, { Size = v142 })
	end)
	p12.Box.MouseButton1Click:Connect(function()
		audioService.PlaySound("lock")

		if not u141 then
			p12.MainWindow.Warning.Text = "(select an animated art first to view contents)"
			p12.MainWindow.Warning.Visible = true

			return
		end

		local v456 = networkInvokeServer("GetOfferContents", nil, "DoomspireAct2_" .. u141.Name)

		networkClient.QuickShowRewards(v456)
	end)
	p12.Button.MouseButton1Click:Connect(function()
		if u17 then
			return
		end

		if not u141 then
			p12.MainWindow.Warning.Visible = true

			return
		end

		network.FireServer("OfferPrepare", "Offer", "DoomspireAct2_" .. u141.Name)
	end)
	p12.BuyAll.MouseButton1Click:Connect(function()
		if u17 then
			return
		end

		network.FireServer("OfferPrepare", "Offer", "DoomspireAct2Full")
	end)

	for k, v in pairs({
		"The Imperfect Ones-Offer",
		"Twin Dragons of Salvation-Offer",
		"The Shedarian Royalty-Offer",
		"Blackmoore, Inverted Villain-Offer",
		"The Saviour-Offer",
		"The Cornered Rat-Offer"
	}) do
		local v145 = cardLibrary[v]
		local cards = p12.MainWindow.Cards
		local text: string = tostring(k)
		local v148 = cards[text]

		v148.LayoutOrder = k
		v148.Image = "rbxassetid://" .. v145.Id

		if v145.ArtAnimation then
			table.insert(module.CardAnims, cardAnim(v148, v145.ArtAnimation))
		end

		nonGameCard.BindInspect(v148, v145)
		v148.MouseButton1Click:Connect(function()
			audioService.PlaySound("lock")

			if u141 then
				u141.UIStroke.Enabled = false
			end

			u141 = v148
			v148.UIStroke.Enabled = true
			p12.MainWindow.Warning.Text = "You've selected " .. v145.Name .. "."
			p12.MainWindow.Warning.TextColor3 = Color3.fromRGB(255, 255, 255)
			p12.MainWindow.Warning.Visible = true
		end)
	end
end
function module.GelatinVariety(p13)
	local u150 = nil
	local v151 = p13.Box.Size

	p13.Box.MouseEnter:Connect(function()
		audioService.PlaySound("ui_hover")
		spr.stop(p13.Box)

		local sprTarget = spr.target
		local box = p13.Box
		local v459 = UDim2.fromScale(v151.X.Scale * 1.1, v151.Y.Scale * 1.1)

		sprTarget(box, 0.1, 4, { Size = v459 })
	end)
	p13.Box.MouseLeave:Connect(function()
		spr.stop(p13.Box)
		spr.target(p13.Box, 0.2, 4, { Size = v151 })
	end)
	p13.Box.MouseButton1Click:Connect(function()
		audioService.PlaySound("lock")

		if not u150 then
			p13.MainWindow.Warning.Text = "(select an animated art first to view contents)"
			p13.MainWindow.Warning.Visible = true

			return
		end

		local v460 = networkInvokeServer("GetOfferContents", nil, "GelatinVariety_" .. u150.Name)

		networkClient.QuickShowRewards(v460)
	end)
	p13.Button.MouseButton1Click:Connect(function()
		if u17 then
			return
		end

		if not u150 then
			p13.MainWindow.Warning.Visible = true

			return
		end

		network.FireServer("OfferPrepare", "Offer", "GelatinVariety_" .. u150.Name)
	end)
	p13.BuyAll.MouseButton1Click:Connect(function()
		if u17 then
			return
		end

		network.FireServer("OfferPrepare", "Offer", "GelatinVarietyFull")
	end)

	for k, v in pairs({
		"CopperGlow-Blue",
		"Hard-hat Immortal-Red",
		"Offroad Mechabike-Green",
		"ADeadBody14-Yellow"
	}) do
		local v154 = cardLibrary[v]
		local cards = p13.MainWindow.Cards
		local text: string = tostring(k)
		local v157 = cards[text]

		v157.LayoutOrder = k
		v157.Image = "rbxassetid://" .. v154.Id

		if v154.ArtAnimation then
			table.insert(module.CardAnims, cardAnim(v157, v154.ArtAnimation))
		end

		nonGameCard.BindInspect(v157, v154)
		v157.MouseButton1Click:Connect(function()
			audioService.PlaySound("lock")

			if u150 then
				u150.UIStroke.Enabled = false
			end

			u150 = v157
			v157.UIStroke.Enabled = true
			p13.MainWindow.Warning.Text = "You've selected " .. v154.Name .. "."
			p13.MainWindow.Warning.TextColor3 = Color3.fromRGB(255, 255, 255)
			p13.MainWindow.Warning.Visible = true
		end)
	end
end
function module.HalloweenBundle(p14)
	p14.Button.MouseButton1Click:Connect(function()
		if u17 then
			return
		end

		network.FireServer("OfferPrepare", "Offer", "Halloween2023")
	end)
	p14.Contents.MouseButton1Click:Connect(function()
		local v461 = networkInvokeServer("GetOfferContents", nil, "Halloween2023")

		networkClient.QuickShowRewards(v461)
	end)

	for k, v in pairs({
		"LeetWizard-Offer",
		"Arsenal Squad-Offer",
		"Patchwork of Disease-Offer",
		"The Killer-Offer",
		"The ChairmanNS-Offer"
	}) do
		local v161 = cardLibrary[v]
		local cards = p14.MainWindow.Cards
		local text: string = tostring(k)
		local v164 = cards[text]

		v164.LayoutOrder = k
		v164.Image = "rbxassetid://" .. v161.Id

		if v161.ArtAnimation then
			table.insert(module.CardAnims, cardAnim(v164, v161.ArtAnimation))
		end

		nonGameCard.BindInspect(v164, v161)
	end
end
function module.StagnationBundle(p15)
	p15.Button.MouseButton1Click:Connect(function()
		if u17 then
			return
		end

		network.FireServer("OfferPrepare", "Offer", "StagnationCollectors")
	end)
	p15.Contents.MouseButton1Click:Connect(function()
		local v462 = networkInvokeServer("GetOfferContents", nil, "StagnationCollectors")

		networkClient.QuickShowRewards(v462)
	end)

	for k, v in pairs({
		"Fluffle, Fractured",
		"Kgxraqyt of Infinite Depravity",
		"Alex the Demon-Human Hybrid",
		"Count Celes",
		"Herrus the Inscrutable",
		"Traverse the Four Hells-Bundle"
	}) do
		local v168 = cardLibrary[v]
		local cards = p15.MainWindow.Cards
		local text: string = tostring(k)
		local v171 = cards[text]

		v171.LayoutOrder = k
		v171.Image = "rbxassetid://" .. v168.Id

		if v168.ArtAnimation then
			table.insert(module.CardAnims, cardAnim(v171, v168.ArtAnimation))
		end

		nonGameCard.BindInspect(v171, v168)
	end
end
function module.BargetownBundle(p16)
	p16.Button.MouseButton1Click:Connect(function()
		if u17 then
			return
		end

		network.FireServer("OfferPrepare", "Offer", "BargetownCollectors")
	end)
	p16.Contents.MouseButton1Click:Connect(function()
		local v463 = networkInvokeServer("GetOfferContents", nil, "BargetownCollectors")

		networkClient.QuickShowRewards(v463)
	end)

	for k, v in pairs({
		"Darius, the Kingmaker-Offer",
		"Bargetowner Overboard-Offer",
		"Gunshop Price Gouger",
		"Coalition Smuggler-Offer",
		"Adjusting Amputee"
	}) do
		local v175 = cardLibrary[v]
		local cards = p16.MainWindow.Cards
		local text: string = tostring(k)
		local v178 = cards[text]

		v178.LayoutOrder = k
		v178.Image = "rbxassetid://" .. v175.Id

		if v175.ArtAnimation then
			table.insert(module.CardAnims, cardAnim(v178, v175.ArtAnimation))
		end

		nonGameCard.BindInspect(v178, v175)
	end
end
function module.ChristmasBundle(p17)
	p17.Button.MouseButton1Click:Connect(function()
		if u17 then
			return
		end

		network.FireServer("OfferPrepare", "Offer", "Christmas2023")
	end)
	p17.Contents.MouseButton1Click:Connect(function()
		local v464 = networkInvokeServer("GetOfferContents", nil, "Christmas2023")

		networkClient.QuickShowRewards(v464)
	end)

	for k, v in pairs({
		"The Killer-C",
		"Kara Sinister-C",
		"Epic Duck-C",
		"Arach Vadis-C",
		"NNickel-C"
	}) do
		local v182 = cardLibrary[v]
		local cards = p17.MainWindow.Cards
		local text: string = tostring(k)
		local v185 = cards[text]

		v185.LayoutOrder = k
		v185.Image = "rbxassetid://" .. v182.Id

		if v182.ArtAnimation then
			table.insert(module.CardAnims, cardAnim(v185, v182.ArtAnimation))
		end

		nonGameCard.BindInspect(v185, v182)
	end
end
function module.ValentinesBundle2024(p18)
	p18.Button.MouseButton1Click:Connect(function()
		if u17 then
			return
		end

		network.FireServer("OfferPrepare", "Offer", "Valentines2024")
	end)
	p18.Contents.MouseButton1Click:Connect(function()
		local v465 = networkInvokeServer("GetOfferContents", nil, "Valentines2024")

		networkClient.QuickShowRewards(v465)
	end)

	for k, v in pairs({
		"radiogamer-V-Offer",
		"Mouth of Kala-V-Offer",
		"Cindering-V-Offer",
		"Parting Words-V-Offer",
		"TheEnderCorp-V-Offer"
	}) do
		local v189 = cardLibrary[v]
		local cards = p18.MainWindow.Cards
		local text: string = tostring(k)
		local v192 = cards[text]

		v192.LayoutOrder = k
		v192.Image = "rbxassetid://" .. v189.Id

		if v189.ArtAnimation then
			table.insert(module.CardAnims, cardAnim(v192, v189.ArtAnimation))
		end

		nonGameCard.BindInspect(v192, v189)
	end
end
function module.EasterBundle2024(p19)
	p19.Button.MouseButton1Click:Connect(function()
		if u17 then
			return
		end

		network.FireServer("OfferPrepare", "Offer", "Easter2024")
	end)
	p19.Contents.MouseButton1Click:Connect(function()
		local v466 = networkInvokeServer("GetOfferContents", nil, "Easter2024")

		networkClient.QuickShowRewards(v466)
	end)

	for k, v in pairs({
		"Ancalagon, Sword Critic-E-Offer",
		"Sinister Snatchings-E-Offer",
		"Cow God-E-Offer",
		"Xenotrent-E-Offer",
		"Waking World-E-Offer"
	}) do
		local v196 = cardLibrary[v]
		local cards = p19.MainWindow.Cards
		local text: string = tostring(k)
		local v199 = cards[text]

		v199.LayoutOrder = k
		v199.Image = "rbxassetid://" .. v196.Id

		if v196.ArtAnimation then
			table.insert(module.CardAnims, cardAnim(v199, v196.ArtAnimation))
		end

		nonGameCard.BindInspect(v199, v196)
	end
end
function module.ExtraLivesBundle(p20)
	local t5: {[any]: any} = {
		"Roxapox-ET",
		"Distressed Tourist-ET",
		"Apollo, Fearless-ET",
		"Julez - Magician of Cards-ET",
		"The Oddsmakers' Cabal-ET",
		"Hallow's Boon-ET",
		"Split Ego-ET",
		"Wild Reporter Tracy-ET",
		"Rolimon-ET",
		"Ravenshield-ET",
		"Happy Clown-ET"
	}
	local imageLabel = p20.ImageLabel
	local tweenInfo = TweenInfo.new(8, Enum.EasingStyle.Linear)

	p20.Button.MouseButton1Click:Connect(function()
		if u17 then
			return
		end

		network.FireServer("OfferPrepare", "Offer", "ExtraLives")
	end)
	p20.Contents.MouseButton1Click:Connect(function()
		local v467 = networkInvokeServer("GetOfferContents", nil, "ExtraLives")

		networkClient.QuickShowRewards(v467)
	end)

	local t6: {[any]: any} = { { tweenService:Create(imageLabel, tweenInfo, { Rotation = -360 }) } }

	task.spawn(function()
		while true do
			t6[1][1]:Play()
			t6[1][1].Completed:Wait()
			p20.ImageLabel.Rotation = 0
		end
	end)
	table.insert(module.CardAnims, t6)

	local cardTemplate = p20.MainWindow.CardTemplate
	local n1: number = 0

	task.spawn(function()
		while true do
			for k, v in pairs(t5) do
				if n1 >= 6 then
					task.wait(6.5)

					for _, iterValue in pairs(p20.MainWindow.Cards:GetChildren()) do
						if iterValue:IsA("GuiObject") then
							local tweenInfo5 = TweenInfo.new(1.5, Enum.EasingStyle.Linear)
							local t14: {[any]: any} = { { tweenService:Create(iterValue, tweenInfo5, { ImageTransparency = 1 }) } }

							t14[1][1]:Play()
						end
					end

					task.wait(1.5)

					for _, iterValue2 in pairs(p20.MainWindow.Cards:GetChildren()) do
						if iterValue2:IsA("GuiObject") then
							iterValue2:Destroy()
						end
					end

					n1 = 0
				end

				n1 += 1

				local v476 = cardLibrary[v]
				local clone = cardTemplate:Clone()

				clone.Parent = p20.MainWindow.Cards
				clone.Visible = true
				clone.ImageTransparency = 1
				clone.LayoutOrder = k
				clone.Image = "rbxassetid://" .. v476.Id

				if v476.ArtAnimation then
					table.insert(module.CardAnims, cardAnim(clone, v476.ArtAnimation))
				end

				local tweenInfo6 = TweenInfo.new(1.5, Enum.EasingStyle.Linear)
				local t15: {[any]: any} = { { tweenService:Create(clone, tweenInfo6, { ImageTransparency = 0 }) } }

				t15[1][1]:Play()
				nonGameCard.BindInspect(clone, v476)
			end

			task.wait(6.5)

			for _, v in pairs(p20.MainWindow.Cards:GetChildren()) do
				if v:IsA("ImageButton") then
					local tweenInfo7 = TweenInfo.new(1.5, Enum.EasingStyle.Linear)
					local t16: {[any]: any} = { { tweenService:Create(v, tweenInfo7, { ImageTransparency = 1 }) } }

					t16[1][1]:Play()
				end
			end

			task.wait(1.5)

			for _, v in pairs(p20.MainWindow.Cards:GetChildren()) do
				if v:IsA("ImageButton") then
					v:Destroy()
				end
			end

			n1 = 0
		end
	end)
end
function module.AWHBundle(p21)
	p21.Button.MouseButton1Click:Connect(function()
		if u17 then
			return
		end

		network.FireServer("OfferPrepare", "Offer", "AWIH")
	end)
	p21.Contents.MouseButton1Click:Connect(function()
		local v486 = networkInvokeServer("GetOfferContents", nil, "AWIH")

		networkClient.QuickShowRewards(v486)
	end)

	for k, v in pairs({
		"Death Match-AWIH",
		"HighlanderR2-AWIH",
		"HighlanderG2-AWIH",
		"HighlanderB-AWIH",
		"HighlanderY2-AWIH"
	}) do
		local v210 = cardLibrary[v]
		local cards = p21.MainWindow.Cards
		local text: string = tostring(k)
		local v213 = cards[text]

		v213.LayoutOrder = k
		v213.Image = "rbxassetid://" .. v210.Id

		if v210.ArtAnimation then
			table.insert(module.CardAnims, cardAnim(v213, v210.ArtAnimation))
		end

		nonGameCard.BindInspect(v213, v210)
	end
end
function module.MekaBundle(p22)
	p22.Button.MouseButton1Click:Connect(function()
		if u17 then
			return
		end

		network.FireServer("OfferPrepare", "Offer", "MekaCollectors")
	end)
	p22.Contents.MouseButton1Click:Connect(function()
		local v487 = networkInvokeServer("GetOfferContents", nil, "MekaCollectors")

		networkClient.QuickShowRewards(v487)
	end)

	for k, v in pairs({
		"Meka Official-Offer",
		"Meka Warrior-Offer",
		"Meka Citizen-Offer",
		"PierMeka-Offer",
		"Alpha-O-Offer"
	}) do
		local v217 = cardLibrary[v]
		local cards = p22.MainWindow.Cards
		local text: string = tostring(k)
		local v220 = cards[text]

		v220.LayoutOrder = k
		v220.Image = "rbxassetid://" .. v217.Id

		if v217.ArtAnimation then
			table.insert(module.CardAnims, cardAnim(v220, v217.ArtAnimation))
		end

		nonGameCard.BindInspect(v220, v217)
	end
end
function module.GrindersBundle(p23)
	p23.Button.MouseButton1Click:Connect(function()
		if u17 then
			return
		end

		network.FireServer("OfferPrepare", "Offer", "GrindersCollectors")
	end)
	p23.Contents.MouseButton1Click:Connect(function()
		local v488 = networkInvokeServer("GetOfferContents", nil, "GrindersCollectors")

		networkClient.QuickShowRewards(v488)
	end)

	for k, v in pairs({
		"Weakling Enemy-Offer",
		"Leaderboard Topper-Offer",
		"Autoclick Grinder-Offer",
		"Overleveler-Offer",
		"New Area-Offer"
	}) do
		local v224 = cardLibrary[v]
		local cards = p23.MainWindow.Cards
		local text: string = tostring(k)
		local v227 = cards[text]

		v227.LayoutOrder = k
		v227.Image = "rbxassetid://" .. v224.Id

		if v224.ArtAnimation then
			table.insert(module.CardAnims, cardAnim(v227, v224.ArtAnimation))
		end

		nonGameCard.BindInspect(v227, v224)
	end
end
function module.Summer2024Bundle(p24)
	p24.Button.MouseButton1Click:Connect(function()
		if u17 then
			return
		end

		network.FireServer("OfferPrepare", "Offer", "Summer2024")
	end)
	p24.Contents.MouseButton1Click:Connect(function()
		local v489 = networkInvokeServer("GetOfferContents", nil, "Summer2024")

		networkClient.QuickShowRewards(v489)
	end)

	for k, v in pairs({
		"Bloxkin Horde-Sun-Offer",
		"Draconic Counsel-Sun-Offer",
		"Faultful-Sun-Offer",
		"Ripper's Gaze-Sun-Offer",
		"ObamaXJesus-Sun-Offer"
	}) do
		local v231 = cardLibrary[v]
		local cards = p24.MainWindow.Cards
		local text: string = tostring(k)
		local v234 = cards[text]

		v234.LayoutOrder = k
		v234.Image = "rbxassetid://" .. v231.Id

		if v231.ArtAnimation then
			table.insert(module.CardAnims, cardAnim(v234, v231.ArtAnimation))
		end

		nonGameCard.BindInspect(v234, v231)
	end
end
function module.AnniversaryBundle2024(p25)
	p25.Button.MouseButton1Click:Connect(function()
		if u17 then
			return
		end

		network.FireServer("OfferPrepare", "Offer", "Anniversary2024")
	end)
	p25.Contents.MouseButton1Click:Connect(function()
		local v490 = networkInvokeServer("GetOfferContents", nil, "Anniversary2024")

		networkClient.QuickShowRewards(v490)
	end)

	for k, v in pairs({
		"Guest 666-AN-Offer",
		"Imaginz00-AN-Offer",
		"Duckie Plush-AN-Offer",
		"Shaylan007-AN-Offer",
		"Faltzen-AN-Offer"
	}) do
		local v238 = cardLibrary[v]
		local cards = p25.MainWindow.Cards
		local text: string = tostring(k)
		local v241 = cards[text]

		v241.LayoutOrder = k
		v241.Image = "rbxassetid://" .. v238.Id

		if v238.ArtAnimation then
			table.insert(module.CardAnims, cardAnim(v241, v238.ArtAnimation))
		end

		nonGameCard.BindInspect(v241, v238)
	end
end
function module.BlacksiteBundle(p26)
	p26.Button.MouseButton1Click:Connect(function()
		if u17 then
			return
		end

		network.FireServer("OfferPrepare", "Prebuilt", "Blacksite")
	end)
	p26.NonFoilButton.MouseButton1Click:Connect(function()
		if u17 then
			return
		end

		task.spawn(function()
			u17 = true
			task.wait(2)
			u17 = false
		end)
		network.FireServer("OfferPrepare", "Prebuilt", "BlacksiteNonFoil")
	end)
	p26.Contents.MouseButton1Click:Connect(function()
		local v491 = networkInvokeServer("GetPrebuiltContents", nil, "Blacksite")

		networkClient.QuickShowRewards(v491)
	end)

	for k, v in pairs({
		"Blacksite Expendable-Offer",
		"Angler-Offer",
		"Sebastian Solace-Offer",
		"Pandemonium-Offer",
		"Searchlights-Offer"
	}) do
		local v245 = cardLibrary[v]
		local cards = p26.MainWindow.Cards
		local text: string = tostring(k)
		local v248 = cards[text]

		v248.LayoutOrder = k
		v248.Image = "rbxassetid://" .. v245.Id

		if v245.ArtAnimation then
			table.insert(module.CardAnims, cardAnim(v248, v245.ArtAnimation))
		end

		nonGameCard.BindInspect(v248, v245)
	end
end
function module.UGCAd(p27)
	p27.Button.MouseButton1Click:Connect(function()
		if u17 then
			return
		end

		LocalPlayer.Character:SetPrimaryPartCFrame(game.ReplicatedStorage.UGCTeleport.CFrame)
		networkClient.HideOmniShop()
	end)

	for k, v in pairs({
		"Wayfarer, Sacred Spear-Promo",
		"Gattai!-Promo",
		"Wonktooth, Prince Regent-Promo",
		"Burn Impurities-Promo"
	}) do
		local v252 = cardLibrary[v]
		local cards = p27.MainWindow.Cards
		local text: string = tostring(k)
		local v255 = cards[text]

		v255.LayoutOrder = k
		v255.Image = "rbxassetid://" .. v252.Id

		if v252.ArtAnimation then
			table.insert(module.CardAnims, cardAnim(v255, v252.ArtAnimation))
		end

		nonGameCard.BindInspect(v255, v252)
	end
end
function module.Testers1Bundle(p28)
	local t7: {[any]: any} = {
		"Svakarataja, the Metropolis",
		"Lid, Caster of Growth",
		"SaltyNope, Cardslinger",
		"Nicky Raum",
		"Apostle of Avarice",
		"wildygamer_tester2",
		"Flatflyer, Cardmancer",
		"Crashing Retribution",
		"Disciple of the Gods",
		"Steve, Skyline Strider",
		"pandemonium, thy name is grafyt",
		"7Gravestalker7",
		"free",
		"Unc, A Scholar",
		"Shiba, Idol Super Fan",
		"Remvolt",
		"The Perfectionist",
		"The Golden Suite",
		"NinWas...",
		"TaterToter321",
		"Meadow of Black & White Flowers",
		"tige1111, Fowl Play",
		"WANTED ADeadBody14",
		"Ziggy Starfluff"
	}

	p28.Button.MouseButton1Click:Connect(function()
		if u17 then
			return
		end

		network.FireServer("OfferPrepare", "Offer", "FoilsMetaverseTesters1")
	end)
	p28.NonFoilButton.MouseButton1Click:Connect(function()
		if u17 then
			return
		end

		task.spawn(function()
			u17 = true
			task.wait(2)
			u17 = false
		end)
		network.FireServer("OfferPrepare", "Offer", "MetaverseTesters1")
	end)
	p28.Contents.MouseButton1Click:Connect(function()
		local v492 = networkInvokeServer("GetOfferContents", nil, "FoilsMetaverseTesters1")

		networkClient.QuickShowRewards(v492)
	end)

	local cardTemplate = p28.MainWindow.CardTemplate
	local n1: number = 0

	task.spawn(function()
		while true do
			for k, v in pairs(t7) do
				if n1 >= 6 then
					task.wait(6.5)

					for _, iterValue in pairs(p28.MainWindow.Cards:GetChildren()) do
						if iterValue:IsA("GuiObject") then
							local tweenInfo = TweenInfo.new(1.5, Enum.EasingStyle.Linear)
							local t17: {[any]: any} = { { tweenService:Create(iterValue, tweenInfo, { ImageTransparency = 1 }) } }

							t17[1][1]:Play()
						end
					end

					task.wait(1.5)

					for _, iterValue2 in pairs(p28.MainWindow.Cards:GetChildren()) do
						if iterValue2:IsA("GuiObject") then
							iterValue2:Destroy()
						end
					end

					n1 = 0
				end

				n1 += 1

				local v501 = cardLibrary[v]
				local clone = cardTemplate:Clone()

				clone.Parent = p28.MainWindow.Cards
				clone.Visible = true
				clone.ImageTransparency = 1
				clone.LayoutOrder = k
				clone.Image = "rbxassetid://" .. v501.Id

				if v501.ArtAnimation then
					table.insert(module.CardAnims, cardAnim(clone, v501.ArtAnimation))
				end

				local tweenInfo = TweenInfo.new(1.5, Enum.EasingStyle.Linear)
				local t18: {[any]: any} = { { tweenService:Create(clone, tweenInfo, { ImageTransparency = 0 }) } }

				t18[1][1]:Play()
				nonGameCard.BindInspect(clone, v501)
			end

			task.wait(6.5)

			for _, v in pairs(p28.MainWindow.Cards:GetChildren()) do
				if v:IsA("ImageButton") then
					local tweenInfo8 = TweenInfo.new(1.5, Enum.EasingStyle.Linear)
					local t19: {[any]: any} = { { tweenService:Create(v, tweenInfo8, { ImageTransparency = 1 }) } }

					t19[1][1]:Play()
				end
			end

			task.wait(1.5)

			for _, v in pairs(p28.MainWindow.Cards:GetChildren()) do
				if v:IsA("ImageButton") then
					v:Destroy()
				end
			end

			n1 = 0
		end
	end)
end
function module.RareRivalryBundle(p29)
	local t8: {[any]: any} = {
		"Weaven-ARR",
		"Wustard-ARR",
		"GreenHearted-ARR",
		"Wizardguy34-ARR",
		"CorgiParade-ARR",
		"ttarproject-ARR",
		"Cluck Buck-ARR",
		"Dun_Goof-ARR",
		"Blitzwolfer-ARR",
		"Uberubert-ARR",
		"Bloxikin Horde-ARR",
		"Haggie125-ARR",
		"SaxoAttack-ARR",
		"Tomarty-ARR",
		"Calamity Box-ARR",
		"Giftsplosion-ARR",
		"Tear and Reshape-ARR",
		"ROBLOXian Reborn-ARR"
	}

	p29.Button.MouseButton1Click:Connect(function()
		if u17 then
			return
		end

		network.FireServer("OfferPrepare", "Offer", "RareRivalry")
	end)
	p29.Contents.MouseButton1Click:Connect(function()
		local v511 = networkInvokeServer("GetOfferContents", nil, "RareRivalry")

		networkClient.QuickShowRewards(v511)
	end)

	local cardTemplate = p29.MainWindow.CardTemplate
	local n1: number = 0

	task.spawn(function()
		while true do
			for k, v in pairs(t8) do
				if n1 >= 6 then
					task.wait(6.5)

					for _, iterValue in pairs(p29.MainWindow.Cards:GetChildren()) do
						if iterValue:IsA("GuiObject") then
							local tweenInfo = TweenInfo.new(1.5, Enum.EasingStyle.Linear)
							local t20: {[any]: any} = { { tweenService:Create(iterValue, tweenInfo, { ImageTransparency = 1 }) } }

							t20[1][1]:Play()
						end
					end

					task.wait(1.5)

					for _, iterValue2 in pairs(p29.MainWindow.Cards:GetChildren()) do
						if iterValue2:IsA("GuiObject") then
							iterValue2:Destroy()
						end
					end

					n1 = 0
				end

				n1 += 1

				local v520 = cardLibrary[v]
				local clone = cardTemplate:Clone()

				clone.Parent = p29.MainWindow.Cards
				clone.Visible = true
				clone.ImageTransparency = 1
				clone.LayoutOrder = k
				clone.Image = "rbxassetid://" .. v520.Id

				if v520.ArtAnimation then
					table.insert(module.CardAnims, cardAnim(clone, v520.ArtAnimation))
				end

				local tweenInfo = TweenInfo.new(1.5, Enum.EasingStyle.Linear)
				local t21: {[any]: any} = { { tweenService:Create(clone, tweenInfo, { ImageTransparency = 0 }) } }

				t21[1][1]:Play()
				nonGameCard.BindInspect(clone, v520)
			end

			task.wait(6.5)

			for _, v in pairs(p29.MainWindow.Cards:GetChildren()) do
				if v:IsA("ImageButton") then
					local tweenInfo9 = TweenInfo.new(1.5, Enum.EasingStyle.Linear)
					local t22: {[any]: any} = { { tweenService:Create(v, tweenInfo9, { ImageTransparency = 1 }) } }

					t22[1][1]:Play()
				end
			end

			task.wait(1.5)

			for _, v in pairs(p29.MainWindow.Cards:GetChildren()) do
				if v:IsA("ImageButton") then
					v:Destroy()
				end
			end

			n1 = 0
		end
	end)
end
function module.ResistanceBundle(p30)
	p30.Button.MouseButton1Click:Connect(function()
		if u17 then
			return
		end

		network.FireServer("OfferPrepare", "Offer", "ResistanceCollectors")
	end)
	p30.NonFoilButton.MouseButton1Click:Connect(function()
		if u17 then
			return
		end

		task.spawn(function()
			u17 = true
			task.wait(2)
			u17 = false
		end)
		network.FireServer("OfferPrepare", "Offer", "Resistance")
	end)
	p30.Contents.MouseButton1Click:Connect(function()
		local v530 = networkInvokeServer("GetOfferContents", nil, "ResistanceCollectors")

		networkClient.QuickShowRewards(v530)
	end)

	for k, v in pairs({
		"Resistance Soldier-Offer",
		"Enhancing Enchantress-Offer",
		"Disgraced Defector-Offer",
		"Vengeful Vigilante-Offer",
		"Volipa the Renowned-Offer"
	}) do
		local v267 = cardLibrary[v]
		local cards = p30.MainWindow.Cards
		local text: string = tostring(k)
		local v270 = cards[text]

		v270.LayoutOrder = k
		v270.Image = "rbxassetid://" .. v267.Id

		if v267.ArtAnimation then
			table.insert(module.CardAnims, cardAnim(v270, v267.ArtAnimation))
		end

		nonGameCard.BindInspect(v270, v267)
	end
end
function module.StarterBundle(p31)
	p31.Button.MouseButton1Click:Connect(function()
		if u17 then
			return
		end

		network.FireServer("OfferPrepare", "Offer", "StarterPack")
	end)
	p31.Contents.MouseButton1Click:Connect(function()
		local v531 = networkInvokeServer("GetOfferContents", nil, "StarterPack")

		networkClient.QuickShowRewards(v531)
	end)
	foilEffect(p31.MainWindow.Foil1)
	foilEffect(p31.MainWindow.Foil2)
end
function module.BargainsAd(p32)
	local v273 = networkInvokeServer("GetOfferDatas")
	local newCards = v273.NewCards

	p32.Button.MouseButton1Click:Connect(function()
		if u17 then
			return
		end

		network.FireServer("OfferPrepare", "Offer", "NewestRotationalShopItems")
	end)
	p32.NonFoilButton.MouseButton1Click:Connect(function()
		if u17 then
			return
		end

		task.spawn(function()
			u17 = true
			task.wait(2)
			u17 = false
		end)
		network.FireServer("PurchaseOfferFromRotationShop")
	end)
	p32.Contents.MouseButton1Click:Connect(function()
		local v532 = networkInvokeServer("GetOfferContents", nil, "NewestRotationalShopItemsNoFoil")

		networkClient.QuickShowRewards(v532)
	end)
	p32.Button.Title.Text = "New + Foils " .. v273.Robux .. "R$"
	p32.NonFoilButton.Title.Text = "New Non-Foils (" .. v273.BloxBux .. "BB)"

	local cardTemplate = p32.MainWindow.CardTemplate
	local n1: number = 0

	task.spawn(function()
		while true do
			for k, v in pairs(newCards) do
				if n1 >= 6 then
					task.wait(6.5)

					for _, iterValue in pairs(p32.MainWindow.Cards:GetChildren()) do
						if iterValue:IsA("GuiObject") then
							local tweenInfo = TweenInfo.new(1.5, Enum.EasingStyle.Linear)
							local t23: {[any]: any} = { { tweenService:Create(iterValue, tweenInfo, { ImageTransparency = 1 }) } }

							t23[1][1]:Play()
						end
					end

					task.wait(1.5)

					for _, iterValue2 in pairs(p32.MainWindow.Cards:GetChildren()) do
						if iterValue2:IsA("GuiObject") then
							iterValue2:Destroy()
						end
					end

					n1 = 0
				end

				n1 += 1

				local v541 = cardLibrary[v]
				local clone = cardTemplate:Clone()

				clone.Parent = p32.MainWindow.Cards
				clone.Visible = true
				clone.ImageTransparency = 1
				clone.LayoutOrder = k
				clone.Image = "rbxassetid://" .. v541.Id

				if v541.ArtAnimation then
					table.insert(module.CardAnims, cardAnim(clone, v541.ArtAnimation))
				end

				local tweenInfo = TweenInfo.new(1.5, Enum.EasingStyle.Linear)
				local t24: {[any]: any} = { { tweenService:Create(clone, tweenInfo, { ImageTransparency = 0 }) } }

				t24[1][1]:Play()
				nonGameCard.BindInspect(clone, v541)
			end

			task.wait(6.5)

			for _, v in pairs(p32.MainWindow.Cards:GetChildren()) do
				if v:IsA("ImageButton") then
					local tweenInfo10 = TweenInfo.new(1.5, Enum.EasingStyle.Linear)
					local t25: {[any]: any} = { { tweenService:Create(v, tweenInfo10, { ImageTransparency = 1 }) } }

					t25[1][1]:Play()
				end
			end

			task.wait(1.5)

			for _, v in pairs(p32.MainWindow.Cards:GetChildren()) do
				if v:IsA("ImageButton") then
					v:Destroy()
				end
			end

			n1 = 0
		end
	end)
end
function module.DimensioniaBundle(p33)
	p33.Button.MouseButton1Click:Connect(function()
		if u17 then
			return
		end

		network.FireServer("OfferPrepare", "Offer", "DimensioniaCollectors")
	end)
	p33.NonFoilButton.MouseButton1Click:Connect(function()
		if u17 then
			return
		end

		task.spawn(function()
			u17 = true
			task.wait(2)
			u17 = false
		end)
		network.FireServer("OfferPrepare", "Offer", "Dimensionia")
	end)
	p33.Contents.MouseButton1Click:Connect(function()
		local v551 = networkInvokeServer("GetOfferContents", nil, "DimensioniaCollectors")

		networkClient.QuickShowRewards(v551)
	end)

	for k, v in pairs({
		"Dimensionia Base-OFFER",
		"Django Haplorhini-OFFER",
		"Cielo de la Asad-OFFER",
		"Phantom Mask-OFFER",
		"Ducasse Jonquil-OFFER"
	}) do
		local v280 = cardLibrary[v]
		local cards = p33.MainWindow.Cards
		local text: string = tostring(k)
		local v283 = cards[text]

		v283.LayoutOrder = k
		v283.Image = "rbxassetid://" .. v280.Id

		if v280.ArtAnimation then
			table.insert(module.CardAnims, cardAnim(v283, v280.ArtAnimation))
		end

		nonGameCard.BindInspect(v283, v280)
	end
end
function module.Anniversary10Bundle(p34)
	local t9: {[any]: any} = {
		"Foroth-10Y",
		"ghxstying-10Y",
		"His Masterpiece-10Y",
		"HighlanderW-10Y",
		"Shedletsky the Fried One-10Y",
		"Grimclaw the Unholy-10Y",
		"Azureless of the Federation-10Y",
		"Unspeakable Summoning-10Y",
		"The Last Flufflefunz-10Y",
		"Bloxburg Under Siege-10Y",
		"Living World-10Y",
		"Alex, Developer Depraved-10Y",
		"Apex of Fantasy-10Y",
		"Zanzel-10Y",
		"Broken Supercomputer-10Y",
		"Chronological Leak-10Y",
		"Waltzel-10Y",
		"Great Beastbreaker-10Y",
		"Traverse the Four Hells-10Y",
		"Person299's Minigames-10Y",
		"Tempted by Redemption-10Y",
		"Despair Surgery-10Y",
		"Fl00fy_Bonez-10Y"
	}

	p34.Button.MouseButton1Click:Connect(function()
		if u17 then
			return
		end

		network.FireServer("OfferPrepare", "Offer", "Anniversary10")
	end)
	p34.NonFoilButton.MouseButton1Click:Connect(function()
		if u17 then
			return
		end

		network.FireServer("OfferPrepare", "Offer", "Anniversary10NoFoil")
	end)
	p34.Contents.MouseButton1Click:Connect(function()
		local v552 = networkInvokeServer("GetOfferContents", nil, "Anniversary10")

		networkClient.QuickShowRewards(v552)
	end)

	local cardTemplate = p34.MainWindow.CardTemplate
	local n1: number = 0

	for _, v in pairs(p34.MainWindow.Cards:GetChildren()) do
		if v:IsA("GuiObject") then
			v:Destroy()
		end
	end

	for k, v in pairs({ "MZH3000-10Y", "Dekkad Deckard-10Y" }) do
		local v292 = cardLibrary[v]

		if not v292 then
			warn(v .. " Is not a valid card")
		end

		local clone = cardTemplate:Clone()

		clone.Parent = p34.MainWindow.Cards
		clone.Visible = true
		clone.ImageTransparency = 1
		clone.LayoutOrder = k
		clone.Name = "ANIMATED"
		clone.Image = "rbxassetid://" .. v292.Id

		if v292.ArtAnimation then
			table.insert(module.CardAnims, cardAnim(clone, v292.ArtAnimation))
		end

		nonGameCard.BindInspect(clone, v292)
	end

	task.spawn(function()
		while true do
			for k, v in pairs(t9) do
				if n1 >= 4 then
					task.wait(6.5)

					for _, iterValue in pairs(p34.MainWindow.Cards:GetChildren()) do
						if iterValue:IsA("GuiObject") and iterValue.Name ~= "ANIMATED" then
							local tweenInfo = TweenInfo.new(1.5, Enum.EasingStyle.Linear)
							local t26: {[any]: any} = { { tweenService:Create(iterValue, tweenInfo, { ImageTransparency = 1 }) } }

							t26[1][1]:Play()
						end
					end

					task.wait(1.5)

					for _, iterValue2 in pairs(p34.MainWindow.Cards:GetChildren()) do
						if iterValue2:IsA("GuiObject") and iterValue2.Name ~= "ANIMATED" then
							iterValue2:Destroy()
						end
					end

					n1 = 0
				end

				n1 += 1

				local v561 = cardLibrary[v]

				if not v561 then
					warn(v .. " Is not a valid card")
				end

				local clone2 = cardTemplate:Clone()

				clone2.Parent = p34.MainWindow.Cards
				clone2.Visible = true
				clone2.ImageTransparency = 1
				clone2.LayoutOrder = k
				clone2.Image = "rbxassetid://" .. v561.Id

				if v561.ArtAnimation then
					table.insert(module.CardAnims, cardAnim(clone2, v561.ArtAnimation))
				end

				local tweenInfo = TweenInfo.new(1.5, Enum.EasingStyle.Linear)
				local t27: {[any]: any} = { { tweenService:Create(clone2, tweenInfo, { ImageTransparency = 0 }) } }

				t27[1][1]:Play()
				nonGameCard.BindInspect(clone2, v561)
			end

			task.wait(6.5)

			for _, v in pairs(p34.MainWindow.Cards:GetChildren()) do
				if v:IsA("ImageButton") and v.Name ~= "ANIMATED" then
					local tweenInfo11 = TweenInfo.new(1.5, Enum.EasingStyle.Linear)
					local t28: {[any]: any} = { { tweenService:Create(v, tweenInfo11, { ImageTransparency = 1 }) } }

					t28[1][1]:Play()
				end
			end

			task.wait(1.5)

			for _, v in pairs(p34.MainWindow.Cards:GetChildren()) do
				if v:IsA("ImageButton") and v.Name ~= "ANIMATED" then
					v:Destroy()
				end
			end

			n1 = 0
		end
	end)
end
function module.SEWHBundle(p35)
	p35.Button.MouseButton1Click:Connect(function()
		if u17 then
			return
		end

		network.FireServer("OfferPrepare", "Sets", "SEWH")
	end)
	p35.NonFoilButton.MouseButton1Click:Connect(function()
		if u17 then
			return
		end

		task.spawn(function()
			u17 = true
			task.wait(2)
			u17 = false
		end)
		network.FireServer("OfferPrepare", "Sets", "SEWHNonFoil")
	end)
	p35.Contents.MouseButton1Click:Connect(function()
		local v571 = networkInvokeServer("GetSetsContents", nil, "SEWH")

		networkClient.QuickShowRewards(v571)
	end)

	for k, v in pairs({
		"Something Evil Will Happen",
		"Builderfan",
		"H3LP3R",
		"Builderfan-Offer"
	}) do
		local v297 = cardLibrary[v]
		local cards = p35.MainWindow.Cards
		local text: string = tostring(k)
		local v300 = cards[text]

		v300.LayoutOrder = k
		v300.Image = "rbxassetid://" .. v297.Id

		if v297.ArtAnimation then
			table.insert(module.CardAnims, cardAnim(v300, v297.ArtAnimation))
		end

		nonGameCard.BindInspect(v300, v297)
	end
end
function module.AfternightBundle(p36)
	p36.Button.MouseButton1Click:Connect(function()
		if u17 then
			return
		end

		network.FireServer("OfferPrepare", "Sets", "Afternight")
	end)
	p36.NonFoilButton.MouseButton1Click:Connect(function()
		if u17 then
			return
		end

		task.spawn(function()
			u17 = true
			task.wait(2)
			u17 = false
		end)
		network.FireServer("OfferPrepare", "Sets", "AfternightNonFoil")
	end)
	p36.Contents.MouseButton1Click:Connect(function()
		local v572 = networkInvokeServer("GetSetsContents", nil, "Afternight")

		networkClient.QuickShowRewards(v572)
	end)

	for k, v in pairs({
		"Afterdreamer",
		"Oasis Isle",
		"Dawndreamer Developers",
		"Afterdreamer-Offer"
	}) do
		local v304 = cardLibrary[v]
		local cards = p36.MainWindow.Cards
		local text: string = tostring(k)
		local v307 = cards[text]

		v307.LayoutOrder = k
		v307.Image = "rbxassetid://" .. v304.Id

		if v304.ArtAnimation then
			table.insert(module.CardAnims, cardAnim(v307, v304.ArtAnimation))
		end

		nonGameCard.BindInspect(v307, v304)
	end
end
function module.GraceBundle(p37)
	p37.Button.MouseButton1Click:Connect(function()
		if u17 then
			return
		end

		network.FireServer("OfferPrepare", "Sets", "Grace")
	end)
	p37.NonFoilButton.MouseButton1Click:Connect(function()
		if u17 then
			return
		end

		task.spawn(function()
			u17 = true
			task.wait(2)
			u17 = false
		end)
		network.FireServer("OfferPrepare", "Sets", "GraceNonFoil")
	end)
	p37.Contents.MouseButton1Click:Connect(function()
		local v573 = networkInvokeServer("GetSetsContents", nil, "Grace")

		networkClient.QuickShowRewards(v573)
	end)

	for k, v in pairs({
		"Carnation-Offer",
		"Doppel-Offer",
		"Dozer-Offer",
		"Doombringer-Offer",
		"Reprieve-Offer"
	}) do
		local v311 = cardLibrary[v]
		local cards = p37.MainWindow.Cards
		local text: string = tostring(k)
		local v314 = cards[text]

		v314.LayoutOrder = k
		v314.Image = "rbxassetid://" .. v311.Id

		if v311.ArtAnimation then
			table.insert(module.CardAnims, cardAnim(v314, v311.ArtAnimation))
		end

		nonGameCard.BindInspect(v314, v311)
	end
end
function module.Halloween25Bundle(p38)
	local t10: {[any]: any} = {
		"mightybaseplate-H25",
		"Teal Eyes Green Dragon-H25",
		"Wielder of the Illumina-H25",
		"Wielder of the Ghostwalker-H25",
		"Plea for Guidance-H25",
		"Her0z-H25",
		"MinePix110-H25",
		"Maelstronomer-H25",
		"Crowd Goes Wild-H25",
		"The Rusting and the Missing-H25",
		"0x2991; Dying Butterfly-H25",
		"The Tainted-H25",
		"NEO ASliceOfYoyleCake-H25",
		"JennyHailings-H25",
		"tige1111, Fowl Play-H25",
		"The Auteur-H25",
		"Oxygenation Unit-H25",
		"Wanderer in Solitude-H25",
		"Noumenal Stalker-H25"
	}

	p38.Button.MouseButton1Click:Connect(function()
		if u17 then
			return
		end

		network.FireServer("OfferPrepare", "Offer", "Halloween25")
	end)
	p38.NonFoilButton.MouseButton1Click:Connect(function()
		if u17 then
			return
		end

		network.FireServer("OfferPrepare", "Offer", "Halloween25NoFoil")
	end)
	p38.Contents.MouseButton1Click:Connect(function()
		local v574 = networkInvokeServer("GetOfferContents", nil, "Halloween25")

		networkClient.QuickShowRewards(v574)
	end)

	local cardTemplate = p38.MainWindow.CardTemplate
	local n1: number = 0

	for _, v in pairs(p38.MainWindow.Cards:GetChildren()) do
		if v:IsA("GuiObject") then
			v:Destroy()
		end
	end

	for k, v in pairs({ "The Doomspire-H25", "Scripter-H25" }) do
		local v323 = cardLibrary[v]

		if not v323 then
			warn(v .. " Is not a valid card")
		end

		local clone = cardTemplate:Clone()

		clone.Parent = p38.MainWindow.Cards
		clone.Visible = true
		clone.ImageTransparency = 1
		clone.LayoutOrder = k
		clone.Name = "ANIMATED"
		clone.Image = "rbxassetid://" .. v323.Id

		if v323.ArtAnimation then
			table.insert(module.CardAnims, cardAnim(clone, v323.ArtAnimation))
		end

		nonGameCard.BindInspect(clone, v323)
	end

	task.spawn(function()
		while true do
			for k, v in pairs(t10) do
				if n1 >= 4 then
					task.wait(6.5)

					for _, iterValue in pairs(p38.MainWindow.Cards:GetChildren()) do
						if iterValue:IsA("GuiObject") and iterValue.Name ~= "ANIMATED" then
							local tweenInfo = TweenInfo.new(1.5, Enum.EasingStyle.Linear)
							local t29: {[any]: any} = { { tweenService:Create(iterValue, tweenInfo, { ImageTransparency = 1 }) } }

							t29[1][1]:Play()
						end
					end

					task.wait(1.5)

					for _, iterValue2 in pairs(p38.MainWindow.Cards:GetChildren()) do
						if iterValue2:IsA("GuiObject") and iterValue2.Name ~= "ANIMATED" then
							iterValue2:Destroy()
						end
					end

					n1 = 0
				end

				n1 += 1

				local v583 = cardLibrary[v]

				if not v583 then
					warn(v .. " Is not a valid card")
				end

				local clone3 = cardTemplate:Clone()

				clone3.Parent = p38.MainWindow.Cards
				clone3.Visible = true
				clone3.ImageTransparency = 1
				clone3.LayoutOrder = k
				clone3.Image = "rbxassetid://" .. v583.Id

				if v583.ArtAnimation then
					table.insert(module.CardAnims, cardAnim(clone3, v583.ArtAnimation))
				end

				local tweenInfo = TweenInfo.new(1.5, Enum.EasingStyle.Linear)
				local t30: {[any]: any} = { { tweenService:Create(clone3, tweenInfo, { ImageTransparency = 0 }) } }

				t30[1][1]:Play()
				nonGameCard.BindInspect(clone3, v583)
			end

			task.wait(6.5)

			for _, v in pairs(p38.MainWindow.Cards:GetChildren()) do
				if v:IsA("ImageButton") and v.Name ~= "ANIMATED" then
					local tweenInfo12 = TweenInfo.new(1.5, Enum.EasingStyle.Linear)
					local t31: {[any]: any} = { { tweenService:Create(v, tweenInfo12, { ImageTransparency = 1 }) } }

					t31[1][1]:Play()
				end
			end

			task.wait(1.5)

			for _, v in pairs(p38.MainWindow.Cards:GetChildren()) do
				if v:IsA("ImageButton") and v.Name ~= "ANIMATED" then
					v:Destroy()
				end
			end

			n1 = 0
		end
	end)
end
function module.HoHBundle(p39)
	p39.Button.MouseButton1Click:Connect(function()
		if u17 then
			return
		end

		network.FireServer("OfferPrepare", "Sets", "HouseOfHorror")
	end)
	p39.NonFoilButton.MouseButton1Click:Connect(function()
		if u17 then
			return
		end

		task.spawn(function()
			u17 = true
			task.wait(2)
			u17 = false
		end)
		network.FireServer("OfferPrepare", "Sets", "HouseOfHorrorNonFoil")
	end)
	p39.Contents.MouseButton1Click:Connect(function()
		local v593 = networkInvokeServer("GetSetsContents", nil, "HouseOfHorror")

		networkClient.QuickShowRewards(v593)
	end)

	for k, v in pairs({
		"ajarbythedoor-Offer",
		"NEBULAW0RLD-Offer",
		"Thomas-Offer",
		"JAMESWARRIOR14-Offer",
		"Rochas313-Offer",
		"JX1DX1-Offer"
	}) do
		local v328 = cardLibrary[v]
		local cards = p39.MainWindow.Cards
		local text: string = tostring(k)
		local v331 = cards[text]

		v331.LayoutOrder = k
		v331.Image = "rbxassetid://" .. v328.Id

		if v328.ArtAnimation then
			table.insert(module.CardAnims, cardAnim(v331, v328.ArtAnimation))
		end

		nonGameCard.BindInspect(v331, v328)
	end
end
function module.WTDBundle(p40)
	p40.Button.MouseButton1Click:Connect(function()
		if u17 then
			return
		end

		network.FireServer("OfferPrepare", "Prebuilt", "AWG")
	end)
	p40.NonFoilButton.MouseButton1Click:Connect(function()
		if u17 then
			return
		end

		task.spawn(function()
			u17 = true
			task.wait(2)
			u17 = false
		end)
		network.FireServer("OfferPrepare", "Prebuilt", "AWGNonFoil")
	end)
	p40.Contents.MouseButton1Click:Connect(function()
		local v594 = networkInvokeServer("GetPrebuiltContents", nil, "AWG")

		networkClient.QuickShowRewards(v594)
	end)

	for k, v in pairs({
		"Soldier-Offer",
		"Lookout-Offer",
		"Destructor-Offer",
		"Mudsplatter-Offer",
		"Kindler-Offer"
	}) do
		local v335 = cardLibrary[v]
		local cards = p40.MainWindow.Cards
		local text: string = tostring(k)
		local v338 = cards[text]

		v338.LayoutOrder = k
		v338.Image = "rbxassetid://" .. v335.Id

		if v335.ArtAnimation then
			table.insert(module.CardAnims, cardAnim(v338, v335.ArtAnimation))
		end

		nonGameCard.BindInspect(v338, v335)
	end
end
function module.MegaHuntersBundle(p41)
	p41.Button.MouseButton1Click:Connect(function()
		if u17 then
			return
		end

		network.FireServer("OfferPrepare", "Prebuilt", "MegaHunters")
	end)
	p41.NonFoilButton.MouseButton1Click:Connect(function()
		if u17 then
			return
		end

		task.spawn(function()
			u17 = true
			task.wait(2)
			u17 = false
		end)
		network.FireServer("OfferPrepare", "Prebuilt", "MegaHuntersNonFoil")
	end)
	p41.Contents.MouseButton1Click:Connect(function()
		local v595 = networkInvokeServer("GetPrebuiltContents", nil, "MegaHunters")

		networkClient.QuickShowRewards(v595)
	end)

	for k, v in pairs({
		"Robey100-Offer",
		"Duddedud-Offer",
		"Duddedud-Offer-2",
		"Mega Champion Shayph-Offer",
		"bllocky-Offer",
		"pokedragon100000-Offer"
	}) do
		local v342 = cardLibrary[v]
		local cards = p41.MainWindow.Cards
		local text: string = tostring(k)
		local v345 = cards[text]

		v345.LayoutOrder = k
		v345.Image = "rbxassetid://" .. v342.Id

		if v342.ArtAnimation then
			table.insert(module.CardAnims, cardAnim(v345, v342.ArtAnimation))
		end

		nonGameCard.BindInspect(v345, v342)
	end
end
function module.DoDBundle(p42)
	p42.Button.MouseButton1Click:Connect(function()
		if u17 then
			return
		end

		network.FireServer("OfferPrepare", "Sets", "DoD")
	end)
	p42.NonFoilButton.MouseButton1Click:Connect(function()
		if u17 then
			return
		end

		task.spawn(function()
			u17 = true
			task.wait(2)
			u17 = false
		end)
		network.FireServer("OfferPrepare", "Sets", "DoDNonFoil")
	end)
	p42.Contents.MouseButton1Click:Connect(function()
		local v596 = networkInvokeServer("GetSetsContents", nil, "DoD")

		networkClient.QuickShowRewards(v596)
	end)

	for k, v in pairs({
		"Harken-Offer",
		"Killdroid-Offer",
		"Stalk-Offer",
		"Harken-Offer-Anim",
		"Artful-Offer",
		"Badware-Offer",
		"Stalk-Offer2"
	}) do
		local v349 = cardLibrary[v]
		local cards = p42.MainWindow.Cards
		local text: string = tostring(k)
		local v352 = cards[text]

		v352.LayoutOrder = k
		v352.Image = "rbxassetid://" .. v349.Id

		if v349.ArtAnimation then
			table.insert(module.CardAnims, cardAnim(v352, v349.ArtAnimation))
		end

		nonGameCard.BindInspect(v352, v349)
	end
end
function module.GamepassSaleAd(_)
end
function module.SomniaBundle(p44)
	p44.Button.MouseButton1Click:Connect(function()
		if u17 then
			return
		end

		network.FireServer("OfferPrepare", "Sets", "Somnia")
	end)
	p44.NonFoilButton.MouseButton1Click:Connect(function()
		if u17 then
			return
		end

		task.spawn(function()
			u17 = true
			task.wait(2)
			u17 = false
		end)
		network.FireServer("OfferPrepare", "Sets", "SomniaNonFoil")
	end)
	p44.Contents.MouseButton1Click:Connect(function()
		local v597 = networkInvokeServer("GetSetsContents", nil, "Somnia")

		networkClient.QuickShowRewards(v597)
	end)

	for k, v in pairs({
		"Nexus",
		"Anukriti",
		"Enchanted Gem",
		"Anukriti-Offer",
		"Enchanted Gem-Offer"
	}) do
		local v357 = cardLibrary[v]
		local cards = p44.MainWindow.Cards
		local text: string = tostring(k)
		local v360 = cards[text]

		v360.LayoutOrder = k
		v360.Image = "rbxassetid://" .. v357.Id

		if v357.ArtAnimation then
			table.insert(module.CardAnims, cardAnim(v360, v357.ArtAnimation))
		end

		nonGameCard.BindInspect(v360, v357)
	end
end
function module.MushipBundle(p45)
	p45.Button.MouseButton1Click:Connect(function()
		if u17 then
			return
		end

		network.FireServer("OfferPrepare", "Sets", "ColorElectricity")
	end)
	p45.NonFoilButton.MouseButton1Click:Connect(function()
		if u17 then
			return
		end

		task.spawn(function()
			u17 = true
			task.wait(2)
			u17 = false
		end)
		network.FireServer("OfferPrepare", "Sets", "ColorElectricityNonFoil")
	end)
	p45.Contents.MouseButton1Click:Connect(function()
		local v598 = networkInvokeServer("GetSetsContents", nil, "ColorElectricity")

		networkClient.QuickShowRewards(v598)
	end)

	for k, v in pairs({
		"Shikisai Denki",
		"Tsuyoko Akaku",
		"Kodomo",
		"Shikisai Denki-Offer",
		"Tsuyoko Akaku-Offer",
		"Kodomo-Offer"
	}) do
		local v364 = cardLibrary[v]
		local cards = p45.MainWindow.Cards
		local text: string = tostring(k)
		local v367 = cards[text]

		v367.LayoutOrder = k
		v367.Image = "rbxassetid://" .. v364.Id

		if v364.ArtAnimation then
			table.insert(module.CardAnims, cardAnim(v367, v364.ArtAnimation))
		end

		nonGameCard.BindInspect(v367, v364)
	end
end
function module.DTTBundle(p46)
	p46.Button.MouseButton1Click:Connect(function()
		if u17 then
			return
		end

		network.FireServer("OfferPrepare", "Prebuilt", "Dubious")
	end)
	p46.NonFoilButton.MouseButton1Click:Connect(function()
		if u17 then
			return
		end

		task.spawn(function()
			u17 = true
			task.wait(2)
			u17 = false
		end)
		network.FireServer("OfferPrepare", "Prebuilt", "DubiousNonFoil")
	end)
	p46.Contents.MouseButton1Click:Connect(function()
		local v599 = networkInvokeServer("GetPrebuiltContents", nil, "Dubious")

		networkClient.QuickShowRewards(v599)
	end)

	for k, v in pairs({
		"D.T.T. Employee-Offer",
		"The Capos-Offer",
		"Vanessa Eleniore-Offer",
		"D.T.T. Accountant-Offer",
		"Dubious Tasks Taken-Offer"
	}) do
		local v371 = cardLibrary[v]
		local cards = p46.MainWindow.Cards
		local text: string = tostring(k)
		local v374 = cards[text]

		v374.LayoutOrder = k
		v374.Image = "rbxassetid://" .. v371.Id

		if v371.ArtAnimation then
			table.insert(module.CardAnims, cardAnim(v374, v371.ArtAnimation))
		end

		nonGameCard.BindInspect(v374, v371)
	end

	task.spawn(function()
		while true do
			local v600 = cardLibrary["TrainBack-OfferToken"]
			local trainPartA = p46.TrainParts:FindFirstChild("TrainPartA")

			trainPartA.Image = "rbxassetid://" .. v600.Id
			nonGameCard.BindInspect(trainPartA, v600)

			local tweenInfo = TweenInfo.new(1.5, Enum.EasingStyle.Linear)
			local t32: {[any]: any} = { { tweenService:Create(trainPartA, tweenInfo, { ImageTransparency = 0 }) } }

			t32[1][1]:Play()
			v600 = cardLibrary["TrainMid-OfferToken"]

			local trainPartB = p46.TrainParts:FindFirstChild("TrainPartB")

			trainPartB.Image = "rbxassetid://" .. v600.Id
			nonGameCard.BindInspect(trainPartB, v600)

			local tweenInfo13 = TweenInfo.new(1.5, Enum.EasingStyle.Linear)
			t32 = { { tweenService:Create(trainPartB, tweenInfo13, { ImageTransparency = 0 }) } }
			t32[1][1]:Play()
			v600 = cardLibrary["TrainFront-OfferToken"]

			local trainPartC = p46.TrainParts:FindFirstChild("TrainPartC")

			trainPartC.Image = "rbxassetid://" .. v600.Id
			nonGameCard.BindInspect(trainPartC, v600)

			local tweenInfo14 = TweenInfo.new(1.5, Enum.EasingStyle.Linear)
			t32 = { { tweenService:Create(trainPartC, tweenInfo14, { ImageTransparency = 0 }) } }
			t32[1][1]:Play()
			task.wait(6.5)

			for _, v in pairs(p46.TrainParts:GetChildren()) do
				if v:IsA("ImageButton") and v.Name ~= "ANIMATED" then
					local tweenInfo15 = TweenInfo.new(1.5, Enum.EasingStyle.Linear)
					local t33: {[any]: any} = { { tweenService:Create(v, tweenInfo15, { ImageTransparency = 1 }) } }

					t33[1][1]:Play()
				end
			end

			task.wait(1.5)

			local clone = p46.TrainParts:FindFirstChild("TrainPartA"):Clone()

			clone.Name = "ContractorA"
			clone.Parent = p46.TrainParts
			v600 = cardLibrary["Medic-OfferToken"]
			clone.Image = "rbxassetid://" .. v600.Id
			nonGameCard.BindInspect(clone, v600)

			local tweenInfo16 = TweenInfo.new(1.5, Enum.EasingStyle.Linear)
			local t34: {[any]: any} = { { tweenService:Create(clone, tweenInfo16, { ImageTransparency = 0 }) } }

			t34[1][1]:Play()

			local clone4 = p46.TrainParts:FindFirstChild("TrainPartB"):Clone()

			clone4.Name = "ContractorB"
			clone4.Parent = p46.TrainParts
			v600 = cardLibrary["Gunslinger-OfferToken"]
			clone4.Image = "rbxassetid://" .. v600.Id
			nonGameCard.BindInspect(clone4, v600)

			local tweenInfo17 = TweenInfo.new(1.5, Enum.EasingStyle.Linear)
			t34 = { { tweenService:Create(clone4, tweenInfo17, { ImageTransparency = 0 }) } }
			t34[1][1]:Play()

			local clone5 = p46.TrainParts:FindFirstChild("TrainPartC"):Clone()

			clone5.Name = "ContractorC"
			clone5.Parent = p46.TrainParts
			v600 = cardLibrary["Psycho-OfferToken"]
			clone5.Image = "rbxassetid://" .. v600.Id
			nonGameCard.BindInspect(clone5, v600)

			local tweenInfo18 = TweenInfo.new(1.5, Enum.EasingStyle.Linear)
			t34 = { { tweenService:Create(clone5, tweenInfo18, { ImageTransparency = 0 }) } }
			t34[1][1]:Play()
			p46.TrainParts:FindFirstChild("TrainPartA"):Destroy()
			p46.TrainParts:FindFirstChild("TrainPartB"):Destroy()
			p46.TrainParts:FindFirstChild("TrainPartC"):Destroy()
			task.wait(6.5)

			for _, v in pairs(p46.TrainParts:GetChildren()) do
				if v:IsA("ImageButton") and v.Name ~= "ANIMATED" then
					local tweenInfo19 = TweenInfo.new(1.5, Enum.EasingStyle.Linear)
					local t35: {[any]: any} = { { tweenService:Create(v, tweenInfo19, { ImageTransparency = 1 }) } }

					t35[1][1]:Play()
				end
			end

			task.wait(1.5)

			local clone6 = p46.TrainParts:FindFirstChild("ContractorA"):Clone()

			clone6.Name = "TrainPartA"
			clone6.Parent = p46.TrainParts

			local clone7 = p46.TrainParts:FindFirstChild("ContractorB"):Clone()

			clone7.Name = "TrainPartB"
			clone7.Parent = p46.TrainParts

			local clone8 = p46.TrainParts:FindFirstChild("ContractorC"):Clone()

			clone8.Name = "TrainPartC"
			clone8.Parent = p46.TrainParts
			p46.TrainParts:FindFirstChild("ContractorA"):Destroy()
			p46.TrainParts:FindFirstChild("ContractorB"):Destroy()
			p46.TrainParts:FindFirstChild("ContractorC"):Destroy()
		end
	end)
end
function module.LunarImpactBundle(p47)
	p47.Button.MouseButton1Click:Connect(function()
		if u17 then
			return
		end

		network.FireServer("OfferPrepare", "Offer", "LunarImpactCollectors")
	end)
	p47.Contents.MouseButton1Click:Connect(function()
		local v626 = networkInvokeServer("GetOfferContents", nil, "LunarImpactCollectors")

		networkClient.QuickShowRewards(v626)
	end)

	for k, v in pairs({
		"Biggs, Fiscal Preditor-Collectors",
		"Drake, Vengeful Lover-Collectors",
		"Gilfred Swordfrost-Collector",
		"Lua, Paraselene Cadet-Collector",
		"Adreti, Farseeker Chieftain-Collectors"
	}) do
		local v378 = cardLibrary[v]
		local cards = p47.MainWindow.Cards
		local text: string = tostring(k)
		local v381 = cards[text]

		v381.LayoutOrder = k
		v381.Image = "rbxassetid://" .. v378.Id

		if v378.ArtAnimation then
			table.insert(module.CardAnims, cardAnim(v381, v378.ArtAnimation))
		end

		nonGameCard.BindInspect(v381, v378)
	end
end
function module.LunarImpactVIPBundle(p48)
	local t11: {[any]: any} = {
		"Rageborne Bike-Offer",
		"Rageborne Bandit-Offer",
		"Midas, Emperor of Gold-Offer",
		"Adreti, the Rageborne's Judgment-Offer",
		"Angry Local-Offer",
		"Robloxian Immigrant-Offer",
		"homermafia1-Offer",
		"Drake, Vengeful Lover-Offer",
		"Card Hoarder-Offer",
		"The Oddsman, Spirit of Money-Offer"
	}

	p48.Button.MouseButton1Click:Connect(function()
		if u17 then
			return
		end

		network.FireServer("OfferPrepare", "Offer", "AltLI")
	end)
	p48.Contents.MouseButton1Click:Connect(function()
		local v627 = networkInvokeServer("GetOfferContents", nil, "AltLI")

		networkClient.QuickShowRewards(v627)
	end)

	local cardTemplate = p48.MainWindow.CardTemplate
	local n1: number = 0

	task.spawn(function()
		while true do
			for k, v in pairs(t11) do
				if n1 >= 5 then
					task.wait(6.5)

					for _, iterValue in pairs(p48.MainWindow.Cards:GetChildren()) do
						if iterValue:IsA("GuiObject") then
							local tweenInfo = TweenInfo.new(1.5, Enum.EasingStyle.Linear)
							local t36: {[any]: any} = { { tweenService:Create(iterValue, tweenInfo, { ImageTransparency = 1 }) } }

							t36[1][1]:Play()
						end
					end

					task.wait(1.5)

					for _, iterValue2 in pairs(p48.MainWindow.Cards:GetChildren()) do
						if iterValue2:IsA("GuiObject") then
							iterValue2:Destroy()
						end
					end

					n1 = 0
				end

				n1 += 1

				local v636 = cardLibrary[v]
				local clone = cardTemplate:Clone()

				clone.Parent = p48.MainWindow.Cards
				clone.Visible = true
				clone.ImageTransparency = 1
				clone.LayoutOrder = k
				clone.Image = "rbxassetid://" .. v636.Id

				if v636.ArtAnimation then
					table.insert(module.CardAnims, cardAnim(clone, v636.ArtAnimation))
				end

				local tweenInfo = TweenInfo.new(1.5, Enum.EasingStyle.Linear)
				local t37: {[any]: any} = { { tweenService:Create(clone, tweenInfo, { ImageTransparency = 0 }) } }

				t37[1][1]:Play()
				nonGameCard.BindInspect(clone, v636)
			end

			task.wait(6.5)

			for _, v in pairs(p48.MainWindow.Cards:GetChildren()) do
				if v:IsA("ImageButton") then
					local tweenInfo20 = TweenInfo.new(1.5, Enum.EasingStyle.Linear)
					local t38: {[any]: any} = { { tweenService:Create(v, tweenInfo20, { ImageTransparency = 1 }) } }

					t38[1][1]:Play()
				end
			end

			task.wait(1.5)

			for _, v in pairs(p48.MainWindow.Cards:GetChildren()) do
				if v:IsA("ImageButton") then
					v:Destroy()
				end
			end

			n1 = 0
		end
	end)
end
function module.CombatInitiationBundle(p49)
	p49.Button.MouseButton1Click:Connect(function()
		if u17 then
			return
		end

		network.FireServer("OfferPrepare", "Sets", "CombatInitiation")
	end)
	p49.NonFoilButton.MouseButton1Click:Connect(function()
		if u17 then
			return
		end

		task.spawn(function()
			u17 = true
			task.wait(2)
			u17 = false
		end)
		network.FireServer("OfferPrepare", "Sets", "CombatInitiationNonFoil")
	end)
	p49.Contents.MouseButton1Click:Connect(function()
		local v646 = networkInvokeServer("GetSetsContents", nil, "CombatInitiation")

		networkClient.QuickShowRewards(v646)
	end)

	for k, v in pairs({
		"King",
		"Great Drakobloxxer",
		"Vagabond",
		"King-Offer",
		"Great Drakobloxxer-Offer",
		"Vagabond-Offer"
	}) do
		local v389 = cardLibrary[v]
		local cards = p49.MainWindow.Cards
		local text: string = tostring(k)
		local v392 = cards[text]

		v392.LayoutOrder = k
		v392.Image = "rbxassetid://" .. v389.Id

		if v389.ArtAnimation then
			table.insert(module.CardAnims, cardAnim(v392, v389.ArtAnimation))
		end

		nonGameCard.BindInspect(v392, v389)
	end
end
function module.Testers2Bundle(p50)
	local t12: {[any]: any} = {
		"Promised Rites",
		"Rayburn, Priest of the G.Y.R.S.C.",
		"Arrêt de bus Gelé et Solitaire",
		"Hugh J.",
		"ST@GE TO ETERNITY",
		"NoKnowledge",
		"Food Fan tige1111",
		"Lid, Ruinous Hexblade",
		"Brie The Gingerbread Witch",
		"Slickster",
		"The Dreadnought",
		"Taken",
		"Hellfire Mantle",
		"Stroke of Misfortune",
		"SaltyNope, Architect Of 'Tech'",
		"Vanity",
		"pikutree",
		"0x2991; SkyFractured",
		"Samsara Lotus",
		"ShovelAction",
		"Sunderworld Apothecary",
		"RobberBros",
		"ADeadBody¹⁴"
	}

	p50.Button.MouseButton1Click:Connect(function()
		if u17 then
			return
		end

		network.FireServer("OfferPrepare", "Sets", "MetaverseTesters2")
	end)
	p50.NonFoilButton.MouseButton1Click:Connect(function()
		if u17 then
			return
		end

		task.spawn(function()
			u17 = true
			task.wait(2)
			u17 = false
		end)
		network.FireServer("OfferPrepare", "Sets", "MetaverseTesters2NonFoil")
	end)
	p50.Contents.MouseButton1Click:Connect(function()
		local v647 = networkInvokeServer("GetSetsContents", nil, "MetaverseTesters2")

		networkClient.QuickShowRewards(v647)
	end)

	local cardTemplate = p50.MainWindow.CardTemplate
	local n1: number = 0

	task.spawn(function()
		while true do
			for k, v in pairs(t12) do
				if n1 >= 6 then
					task.wait(6.5)

					for _, iterValue in pairs(p50.MainWindow.Cards:GetChildren()) do
						if iterValue:IsA("GuiObject") then
							local tweenInfo = TweenInfo.new(1.5, Enum.EasingStyle.Linear)
							local t39: {[any]: any} = { { tweenService:Create(iterValue, tweenInfo, { ImageTransparency = 1 }) } }

							t39[1][1]:Play()
						end
					end

					task.wait(1.5)

					for _, iterValue2 in pairs(p50.MainWindow.Cards:GetChildren()) do
						if iterValue2:IsA("GuiObject") then
							iterValue2:Destroy()
						end
					end

					n1 = 0
				end

				n1 += 1

				local v656 = cardLibrary[v]
				local clone = cardTemplate:Clone()

				clone.Parent = p50.MainWindow.Cards
				clone.Visible = true
				clone.ImageTransparency = 1
				clone.LayoutOrder = k
				clone.Image = "rbxassetid://" .. v656.Id

				if v656.ArtAnimation then
					table.insert(module.CardAnims, cardAnim(clone, v656.ArtAnimation))
				end

				local tweenInfo = TweenInfo.new(1.5, Enum.EasingStyle.Linear)
				local t40: {[any]: any} = { { tweenService:Create(clone, tweenInfo, { ImageTransparency = 0 }) } }

				t40[1][1]:Play()
				nonGameCard.BindInspect(clone, v656)
			end

			task.wait(6.5)

			for _, v in pairs(p50.MainWindow.Cards:GetChildren()) do
				if v:IsA("ImageButton") then
					local tweenInfo21 = TweenInfo.new(1.5, Enum.EasingStyle.Linear)
					local t41: {[any]: any} = { { tweenService:Create(v, tweenInfo21, { ImageTransparency = 1 }) } }

					t41[1][1]:Play()
				end
			end

			task.wait(1.5)

			for _, v in pairs(p50.MainWindow.Cards:GetChildren()) do
				if v:IsA("ImageButton") then
					v:Destroy()
				end
			end

			n1 = 0
		end
	end)
end
function module.DemonWarsAct1(p51)
	local u398 = nil
	local v399 = p51.Box.Size

	p51.Box.MouseEnter:Connect(function()
		audioService.PlaySound("ui_hover")
		spr.stop(p51.Box)

		local sprTarget = spr.target
		local box = p51.Box
		local v668 = UDim2.fromScale(v399.X.Scale * 1.1, v399.Y.Scale * 1.1)

		sprTarget(box, 0.1, 4, { Size = v668 })
	end)
	p51.Box.MouseLeave:Connect(function()
		spr.stop(p51.Box)
		spr.target(p51.Box, 0.2, 4, { Size = v399 })
	end)
	p51.Box.MouseButton1Click:Connect(function()
		audioService.PlaySound("lock")

		if not u398 then
			p51.MainWindow.Warning.Text = "(select an animated art first to view contents)"
			p51.MainWindow.Warning.Visible = true

			return
		end

		local v669 = networkInvokeServer("GetOfferContents", nil, "DemonWarsAct1_" .. u398.Name)

		networkClient.QuickShowRewards(v669)
	end)
	p51.Button.MouseButton1Click:Connect(function()
		if u17 then
			return
		end

		if not u398 then
			p51.MainWindow.Warning.Visible = true

			return
		end

		network.FireServer("OfferPrepare", "Offer", "DemonWarsAct1_" .. u398.Name)
	end)
	p51.BuyAll.MouseButton1Click:Connect(function()
		if u17 then
			return
		end

		network.FireServer("OfferPrepare", "Offer", "DemonWarsAct1Full")
	end)

	for k, v in pairs({
		"William the Conqueror-Offer",
		"Herrus the Omniscient-Offer",
		"Queen Celes-Offer",
		"Slumbering Leviathan-Offer"
	}) do
		local v402 = cardLibrary[v]
		local cards = p51.MainWindow.Cards
		local text: string = tostring(k)
		local v405 = cards[text]

		v405.LayoutOrder = k
		v405.Image = "rbxassetid://" .. v402.Id

		if v402.ArtAnimation then
			table.insert(module.CardAnims, cardAnim(v405, v402.ArtAnimation))
		end

		nonGameCard.BindInspect(v405, v402)
		v405.MouseButton1Click:Connect(function()
			audioService.PlaySound("lock")

			if u398 then
				u398.UIStroke.Enabled = false
			end

			u398 = v405
			v405.UIStroke.Enabled = true
			p51.MainWindow.Warning.Text = "You've selected " .. v402.Name .. "."
			p51.MainWindow.Warning.TextColor3 = Color3.fromRGB(255, 255, 255)
			p51.MainWindow.Warning.Visible = true
		end)
	end
end
function module.CrimpBundle(p52)
	local t13: {[any]: any} = {
		"EzCheez-Mango",
		"VetexGames-Mango",
		"SquidShock-Mango",
		"Spark-Mango",
		"Alexnewtron-Mango",
		"audi80-Mango",
		"Dwarvern Engineer-Mango",
		"Unplumbed Lead-Mango",
		"SamsonXVI-Mango",
		"Lord Tethamet-Mango",
		"SharpTH-Mango",
		"Eye Spy-Mango",
		"Heavy Rain-Mango",
		"Ultimate Build-Mango",
		"ColonelGraff-Mango",
		"Federation Stratagem: Abduction-Mango",
		"Love Contract-Mango",
		"Dr. Grey-Mango",
		"Draconic Counsel-Mango",
		"Join the Cause-Mango",
		"Defender of Democracy-Mango",
		"WookieCookieHD-Mango",
		"Dark Side of the Moon-Mango",
		"1nicopatty-Mango",
		"Dark Spellbook of the Forgotten-Mango",
		"Pious Adherent-Mango",
		"R1601, The Void Scourge-Mango"
	}

	p52.Button.MouseButton1Click:Connect(function()
		if u17 then
			return
		end

		network.FireServer("OfferPrepare", "Offer", "Crimp")
	end)
	p52.Contents.MouseButton1Click:Connect(function()
		local v670 = networkInvokeServer("GetOfferContents", nil, "Crimp")

		networkClient.QuickShowRewards(v670)
	end)

	local cardTemplate = p52.MainWindow.CardTemplate
	local n1: number = 0

	for _, v in pairs(p52.MainWindow.Cards:GetChildren()) do
		if v:IsA("GuiObject") then
			v:Destroy()
		end
	end

	for k, v in pairs({ "litozinnamon-Mango" }) do
		local v414 = cardLibrary[v]

		if not v414 then
			warn(v .. " Is not a valid card")
		end

		local clone = cardTemplate:Clone()

		clone.Parent = p52.MainWindow.Cards
		clone.Visible = true
		clone.ImageTransparency = 1
		clone.LayoutOrder = k
		clone.Name = "ANIMATED"
		clone.Image = "rbxassetid://" .. v414.Id

		if v414.ArtAnimation then
			table.insert(module.CardAnims, cardAnim(clone, v414.ArtAnimation))
		end

		nonGameCard.BindInspect(clone, v414)
	end

	task.spawn(function()
		while true do
			for k, v in pairs(t13) do
				if n1 >= 5 then
					task.wait(6.5)

					for _, iterValue in pairs(p52.MainWindow.Cards:GetChildren()) do
						if iterValue:IsA("GuiObject") and iterValue.Name ~= "ANIMATED" then
							local tweenInfo = TweenInfo.new(1.5, Enum.EasingStyle.Linear)
							local t42: {[any]: any} = { { tweenService:Create(iterValue, tweenInfo, { ImageTransparency = 1 }) } }

							t42[1][1]:Play()
						end
					end

					task.wait(1.5)

					for _, iterValue2 in pairs(p52.MainWindow.Cards:GetChildren()) do
						if iterValue2:IsA("GuiObject") and iterValue2.Name ~= "ANIMATED" then
							iterValue2:Destroy()
						end
					end

					n1 = 0
				end

				n1 += 1

				local v679 = cardLibrary[v]

				if not v679 then
					warn(v .. " Is not a valid card")
				end

				local clone9 = cardTemplate:Clone()

				clone9.Parent = p52.MainWindow.Cards
				clone9.Visible = true
				clone9.ImageTransparency = 1
				clone9.LayoutOrder = k
				clone9.Image = "rbxassetid://" .. v679.Id

				if v679.ArtAnimation then
					table.insert(module.CardAnims, cardAnim(clone9, v679.ArtAnimation))
				end

				local tweenInfo = TweenInfo.new(1.5, Enum.EasingStyle.Linear)
				local t43: {[any]: any} = { { tweenService:Create(clone9, tweenInfo, { ImageTransparency = 0 }) } }

				t43[1][1]:Play()
				nonGameCard.BindInspect(clone9, v679)
			end

			task.wait(6.5)

			for _, v in pairs(p52.MainWindow.Cards:GetChildren()) do
				if v:IsA("ImageButton") and v.Name ~= "ANIMATED" then
					local tweenInfo22 = TweenInfo.new(1.5, Enum.EasingStyle.Linear)
					local t44: {[any]: any} = { { tweenService:Create(v, tweenInfo22, { ImageTransparency = 1 }) } }

					t44[1][1]:Play()
				end
			end

			task.wait(1.5)

			for _, v in pairs(p52.MainWindow.Cards:GetChildren()) do
				if v:IsA("ImageButton") and v.Name ~= "ANIMATED" then
					v:Destroy()
				end
			end

			n1 = 0
		end
	end)
end
function module.BoothGameBundle(p53)
	p53.Button.MouseButton1Click:Connect(function()
		if u17 then
			return
		end

		network.FireServer("OfferPrepare", "Sets", "BoothGame")
	end)
	p53.NonFoilButton.MouseButton1Click:Connect(function()
		if u17 then
			return
		end

		task.spawn(function()
			u17 = true
			task.wait(2)
			u17 = false
		end)
		network.FireServer("OfferPrepare", "Sets", "BoothGameNonFoil")
	end)
	p53.Contents.MouseButton1Click:Connect(function()
		local v689 = networkInvokeServer("GetSetsContents", nil, "BoothGame")

		networkClient.QuickShowRewards(v689)
	end)

	for k, v in pairs({
		"ScriptArchiver",
		"Trollfaic",
		"Booth",
		"Trollfaic-Offer",
		"ScriptArchiver-Offer",
		"Booth-Offer"
	}) do
		local v419 = cardLibrary[v]
		local cards = p53.MainWindow.Cards
		local text: string = tostring(k)
		local v422 = cards[text]

		if not v419 or not v422 then
			warn("[MainOffers] BoothGameBundle: card '" .. tostring(v) .. "' is missing from this copy; skipped")
			continue
		end

		v422.LayoutOrder = k
		v422.Image = "rbxassetid://" .. v419.Id

		if v419.ArtAnimation then
			table.insert(module.CardAnims, cardAnim(v422, v419.ArtAnimation))
		end

		nonGameCard.BindInspect(v422, v419)
	end
end
function module.BowlBundle(p54)
	p54.Button.MouseButton1Click:Connect(function()
		if u17 then
			return
		end

		network.FireServer("OfferPrepare", "Prebuilt", "Bowls")
	end)
	p54.NonFoilButton.MouseButton1Click:Connect(function()
		if u17 then
			return
		end

		task.spawn(function()
			u17 = true
			task.wait(2)
			u17 = false
		end)
		network.FireServer("OfferPrepare", "Prebuilt", "BowlsNonFoil")
	end)
	p54.Contents.MouseButton1Click:Connect(function()
		local v690 = networkInvokeServer("GetPrebuiltContents", nil, "Bowls")

		networkClient.QuickShowRewards(v690)
	end)

	for k, v in pairs({
		"Bowl of Wrath-Offer",
		"Bowl of Pride-Offer",
		"Artifact Antiquarian-Offer",
		"Bowl of Desire-Offer",
		"Spirit of the Bowl of Greed-Offer"
	}) do
		local v426 = cardLibrary[v]
		local cards = p54.MainWindow.Cards
		local text: string = tostring(k)
		local v429 = cards[text]

		v429.LayoutOrder = k
		v429.Image = "rbxassetid://" .. v426.Id

		if v426.ArtAnimation then
			table.insert(module.CardAnims, cardAnim(v429, v426.ArtAnimation))
		end

		nonGameCard.BindInspect(v429, v426)
	end
end

return module
