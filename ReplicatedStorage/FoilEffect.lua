



require(game.ReplicatedStorage.CardLibrary)

local scriptFoilGradient = script.FoilGradient
local scriptCardFoilGradient = script.CardFoilGradient
local image = script.FoilPrism.Image

local function waitForEvent(p1)
	local v7 = coroutine.running()

	p1:Once(function(...)
		if coroutine.status(v7) ~= "dead" then
			task.spawn(v7, ...)
		end
	end)
	coroutine.yield()
end

local t1: {[any]: any} = {
	Seasonals = {
		["Metaverse Series: Bioblades"] = "rbxassetid://12815850193",
		["Metaverse Series: Pixies"] = "rbxassetid://11875207918",
		["Metaverse Series: Yourei"] = "rbxassetid://12217191410",
		["Metaverse Series: Cash Grabs"] = "rbxassetid://11881457234",
		["Metaverse Series: Lost Commissions"] = "rbxassetid://11901968170",
		["Metaverse Series: Developers & Contributors"] = "rbxassetid://11893226132",
		["Metaverse Series: Babylon"] = "rbxassetid://11873186226",
		["Metaverse Series: Robloxia Pet Shelter"] = "rbxassetid://13896913615",
		["Metaverse Series: Egg Emporium"] = "rbxassetid://14218623310",
		["Metaverse Series: Stars"] = "rbxassetid://14567690062",
		["Metaverse Series: Vagabonds"] = "rbxassetid://13334778502",
		["Metaverse Series: Stagnation"] = "rbxassetid://15407069697",
		["Metaverse Series: Bargetown"] = "rbxassetid://15708188578",
		["Metaverse Series: Mekas"] = "rbxassetid://16790661736",
		["Metaverse Series: Grinders"] = "rbxassetid://17295166275",
		["Metaverse Series: Blacksite"] = "rbxassetid://91943285820062",
		["Metaverse Series: House of Horror"] = "rbxassetid://76880303788364",
		["Metaverse Series: Awesome Weapons Guys"] = "rbxassetid://88841879440953",
		["Metaverse Series: Mega Hunters"] = "rbxassetid://110279411710997",
		["Metaverse Series: Testers Set 1"] = "rbxassetid://117308922363273",
		["Metaverse Series: Testers Set 2"] = "rbxassetid://117308922363273",
		["Post Cataclysm"] = "rbxassetid://92419590788254",
		["Cross-World Series: Crossover Arena"] = "rbxassetid://114798630335922",
		["Cross-World Series: Die of Death"] = "rbxassetid://106990387299062",
		["Cross-World Series: Grace"] = "rbxassetid://113159162182761",
		["Cross-World Series: Phighting"] = "rbxassetid://133928570668406",
		["Cross-World Series: Project Somnia"] = "rbxassetid://117341137120884",
		["Cross-World Series: Rorvik"] = "rbxassetid://136915133915691",
		["Cross-World Series: Seaside"] = "rbxassetid://94195819222275",
		["Cross-World Series: Project: Afternight"] = "rbxassetid://75197655861337",
		["Cross-World Series: Color & Electricity"] = "rbxassetid://90499551049109",
		["CRiMP Alt Art Bundle"] = "rbxassetid://103045542350658",
		["Birthday Bash"] = "rbxassetid://14207047159",
		["Hallow's Tales"] = "rbxassetid://15159067582",
		["Easter Feast"] = "rbxassetid://11902407032",
		["Summer Salt"] = "rbxassetid://11895133141",
		["Teaism's Gifts"] = "rbxassetid://15617277909",
		["Tough Love"] = "rbxassetid://11903308824"
	},
	Archetypes = {
		Acolyte = "rbxassetid://11881256908",
		Alar = "rbxassetid://12124963901",
		Anthrest = "rbxassetid://12219653303",
		Apocrypha = "rbxassetid://11902507652",
		Apocryspectre = "rbxassetid://12126130195",
		Bee = "rbxassetid://11895336907",
		Bowl = "rbxassetid:/139270072617923",
		CatEye = "rbxassetid://11902125779",
		Celestial = "rbxassetid://12126107290",
		Component = "rbxassetid://11893704377",
		Doge = "rbxassetid://11868584417",
		Dwarf = "rbxassetid://11893704377",
		Era = "rbxassetid://11885022720",
		Gladiator = "rbxassetid://12297196368",
		["High Roller"] = "rbxassetid://11881072447",
		Infurnished = "rbxassetid://11902264901",
		Korblox = "rbxassetid://11903029886",
		Lycanthrope = "rbxassetid://11899480111",
		Meeboid = "rbxassetid://11892917878",
		Morphic = "rbxassetid://11901825556",
		Neodragon = "rbxassetid://11902509797",
		Ninja = "rbxassetid://12158426766",
		Nightmare = "rbxassetid://12125031622",
		Noob = "rbxassetid://11868153332",
		Orinthian = "rbxassetid://11894465663",
		Overseer = "rbxassetid://11902302533",
		Police = "rbxassetid://11899175388",
		Rageborne = "rbxassetid://11876800469",
		Redcliff = "rbxassetid://11902989256",
		Resistance = "rbxassetid://128109930822642",
		Sentry = "rbxassetid://11893704377",
		Shedletsky = "rbxassetid://11892115037",
		Sinister = "rbxassetid://11901632583",
		Studling = "rbxassetid://11891281515",
		Starstone = "rbxassetid://11886226881",
		Survivor = "rbxassetid://11882279520",
		Terrarian = "rbxassetid://12210711224",
		["The Federation"] = "rbxassetid://11886226881",
		Titan = "rbxassetid://11876731092",
		Toy = "rbxassetid://11899762406",
		Ultra = "rbxassetid://11881169349",
		Vibeshark = "rbxassetid://11876984014",
		["World of Wood"] = "rbxassetid://11903493487"
	},
	Logos = {
		Arkhive = "rbxassetid://11868433082",
		Smiley = "rbxassetid://11868547560",
		Plurral = "rbxassetid://11868548845",
		Nefoco = "rbxassetid://11868548167",
		Lordbreaker = "rbxassetid://11868555530",
		Astral = "rbxassetid://11868552958"
	}
}

return function(parent, p3, p4)
	if parent:FindFirstChild("CardFoilGradient") then
		return
	end

	local clone = script.CardFoilGradient:Clone()

	clone.Parent = parent

	local tweenService: TweenService = game:GetService("TweenService")
	local tweenInfo = TweenInfo.new(40, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1, true)
	local v14: Tween = tweenService:Create(clone, tweenInfo, { Rotation = 720 })

	v14:Play()

	if p4 then
		return
	end

	local tweenInfo2 = TweenInfo.new(6, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
	local v16: Tween = tweenService:Create(clone, tweenInfo2, { Offset = Vector2.new(0.03, 0.15) })
	local v17: Tween = tweenService:Create(clone, tweenInfo2, { Offset = Vector2.new(-0.03, -0.15) })

	local function waitForEvent(p5)
		local v32 = coroutine.running()

		p5:Once(function(...)
			if coroutine.status(v32) ~= "dead" then
				task.spawn(v32, ...)
			end
		end)
		coroutine.yield()
	end

	local v19 = task.spawn(function()
		while parent do
			v16:Play()

			local completed = v16.Completed
			local v34 = coroutine.running()

			completed:Once(function(...)
				if coroutine.status(v34) ~= "dead" then
					task.spawn(v34, ...)
				end
			end)
			coroutine.yield()
			v17:Play()

			local v35 = v17.Completed
			local v36 = coroutine.running()

			v35:Once(function(...)
				if coroutine.status(v36) ~= "dead" then
					task.spawn(v36, ...)
				end
			end)
			coroutine.yield()
		end
	end)

	if p3 then
		local clone2 = script.FoilPrism:Clone()

		script.FoilGradient:Clone()
		clone2.Parent = parent
		clone2.ZIndex = parent.ZIndex + 1

		local cardLibrary = require(game.ReplicatedStorage.CardLibrary)
		local clone2Image = clone2.Image
		local v23 = cardLibrary[p3]
		local parts = string.split(p3, "-Foil")
		local v25 = cardLibrary[parts[1]]

		if v25.AltArt then
			clone2.Image = "rbxassetid://14207049044"
		end

		if clone2Image == clone2.Image and v25.ArtAnimation then
			clone2.Image = "rbxassetid://12244600565"
		end

		if t1.Seasonals[v23.Pack] or t1.Seasonals[v23.PackDisplayOverride] then
			if v23.PackDisplayOverride and t1.Seasonals[v23.PackDisplayOverride] then
				clone2.Image = t1.Seasonals[v23.PackDisplayOverride]
			else
				clone2.Image = t1.Seasonals[v23.Pack]
			end
		end

		if v23.Logo and t1.Logos[v23.Logo] then
			clone2.Image = t1.Logos[v23.Logo]
		end

		if clone2Image == clone2.Image and v23.Archetype and t1.Archetypes[v23.Archetype] then
			clone2.Image = t1.Archetypes[v23.Archetype]
		end

		local tweenInfo3 = TweenInfo.new(2.75, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
		local uiGradient = clone2:WaitForChild("UIGradient")
		local v28: Tween = tweenService:Create(uiGradient, tweenInfo3, { Offset = Vector2.new(-1.15, 0) })
		local v29: Tween = tweenService:Create(uiGradient, tweenInfo3, { Offset = Vector2.new(1.15, 0) })

		local v30 = task.spawn(function()
			while parent do
				v29:Play()

				local completed = v29.Completed
				local v38 = coroutine.running()

				completed:Once(function(...)
					if coroutine.status(v38) ~= "dead" then
						task.spawn(v38, ...)
					end
				end)
				coroutine.yield()
				task.wait(4)
				v28:Play()

				local v39 = v28.Completed
				local v40 = coroutine.running()

				v39:Once(function(...)
					if coroutine.status(v40) ~= "dead" then
						task.spawn(v40, ...)
					end
				end)
				coroutine.yield()
				task.wait(4)
			end
		end)

		parent.Destroying:Connect(function()
			v29:Cancel()
			v29:Destroy()
			v28:Cancel()
			v28:Destroy()
			v16:Cancel()
			v16:Destroy()
			v17:Cancel()
			v17:Destroy()
			v14:Cancel()
			v14:Destroy()
			task.cancel(v19)
			task.cancel(v30)
		end)
	end
end
