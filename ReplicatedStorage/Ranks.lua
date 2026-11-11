



local t1: {[any]: any} = {
	rabbit = {
		"Wabbit",
		"Hazel",
		"Buggs",
		"Judy Hopps",
		"Cream",
		"Lopunny",
		"Miffy",
		"Rabbit",
		"Bune",
		"White Rabbit"
	},
	clover = {
		"m8",
		"m8y",
		"Shamrock",
		"Cynical",
		"Tat collector",
		"Proper Irish",
		"Wandering Scotsman",
		"Saint Patrick",
		"McDuck"
	},
	battle = {
		"Trainee",
		"Novice",
		"Apprentice",
		"Warrior",
		"Battler",
		"Soldier",
		"Rogue",
		"Challenger",
		"Mercenary",
		"Sergeant",
		"Captain",
		"Insurgent",
		"Samurai",
		"Knight",
		"Warlord",
		"Trainer",
		"Martial Cardist",
		"Champion",
		"Master",
		"Leader",
		"Senpai",
		"Devil Beater"
	},
	artcards = {
		"Uncultured",
		"Hipster",
		"Snob",
		"Cultured",
		"Alternative",
		"Monsieur",
		"Eccentric",
		"Artistic",
		"Weird",
		"ASCENDED",
		"Haute Culture",
		"True Connoisseur"
	},
	sleeves = {
		"T-Shirt & Jeans",
		"Shopper",
		"Colorful",
		"Flamboyant",
		"Stylish",
		"Catwalker",
		"Trendsetter",
		"Stylist",
		"Couturier",
		"Beauty",
		"Tailor",
		"Sleeve Collector",
		"Supermodel",
		"Fashionista",
		"Fresh",
		"/fa/",
		"Fashion Guru"
	},
	cards = {
		"Novice collector",
		"Collector",
		"Intermediate Collector",
		"Advanced Collector",
		"Professional Collector",
		"Scientist",
		"Card accumulator",
		"Card Magnet",
		"Master Collector",
		"Card Connoisseur",
		"Card Maniac",
		"Collectionist",
		"Card specialist",
		"Card Hoarder",
		"Completionist",
		"Caught 'em all",
		"OCD",
		"Golden God",
		"Platinum God",
		"True Platinum God"
	},
	supporter = {
		"Supporter",
		"Sponsor",
		"Lobbyist",
		"Super Supporter",
		"Loyalist",
		"Mega Supporter",
		"Ultimate Supporter",
		"THE #1 FAN",
		"Illuminati"
	},
	cardsluck = {
		"Lucky Collector",
		"Luckier Collector",
		"OCD Luckster",
		"Fortunate Fellow",
		"Gladstone",
		"Found all nickels"
	},
	battlecards = {
		"Battle Collector",
		"Librarian",
		"Battlemage",
		"Hunter and Gatherer",
		"Cardmancer",
		"Deckmaster",
		"Collect and Conquer"
	},
	battleluck = {
		"Lucky Fighter",
		"Luckier Fighter",
		"Coin Flipper",
		"Poker Pro",
		"Warluck",
		"RIGGED",
		"Politician",
		"Battlepriest",
		"RNGesus",
		"Lucky Luke"
	},
	balanced = {
		"Newbie",
		"Newfriend",
		"Player",
		"Fan",
		"Regular",
		"Big Fan",
		"Enthusiast",
		"Superfan",
		"Fun Old Man",
		"Veteran",
		"Oldie",
		"Elder",
		"Ancient Deity"
	}
}
local n1: number = 0
local sleeves = require(game.ReplicatedStorage.Sleeves)

for _, v in pairs(sleeves) do
	for _, iterValue in pairs(v) do
		if iterValue[4] == nil or iterValue[4] == false then
			n1 += 1
		end
	end
end

local n2: number = n1 / 1.5

local function CountSleeves(p1)
	local n1: number = 0

	for _, _ in pairs(p1[6]) do
		n1 += 1
	end

	return n1
end

local cardLibrary = require(game.ReplicatedStorage.CardLibrary)

local function OneToTable(p2, p3)
	local v22 = math.min(p2, 1)
	local roundedUp = math.ceil(v22 * #p3)

	return (math.max(roundedUp, 1))
end
local function GetCardStats(p4)
	local n1: number = 0
	local n2: number = 0

	for k, _ in pairs(p4) do
		local v29 = cardLibrary[k]

		if v29.Rarity ~= "Token" then
			n1 += 1

			if v29.AltArt then
				n2 += 1
			end
		end
	end

	return n1, n2
end
local function GetCardPercent(p5)
	local v31, v32 = GetCardStats(p5)

	return v31 / 1000
end

GetCardPercent = function(p6)
	local floored = math.floor((p6 * 10) ^ 0.5 * 0.5)

	return (math.max(1, floored))
end

local module: {[any]: any} = {
	GetLevel = function(list)
		if not list then
			return 0
		end

		local v36 = math.max(0, list[4] + list[5] * 0.2)
		local floored = math.floor((v36 * 10) ^ 0.5 * 0.5)

		return (math.max(1, floored))
	end
}

local function UpUntilForNext(p8, p9, p10)
	local roundedUp = math.ceil(p8 / p9 * #p10)
	local roundedUp2

	if roundedUp >= #p10 then
		roundedUp2 = 0
		roundedUp = #p10
	else
		roundedUp2 = math.ceil((roundedUp + 1) / #p10 * p9)
	end

	local roundedUp3 = math.ceil(roundedUp2)

	return roundedUp, roundedUp3, p8 / p9
end
function module.GetUnlockedRanks(list)
	local t3: {[any]: any} = {}
	local v46 = math.max(1, list[5])
	local v47 = list[4]
	local n1 = v47 / v46 * (v47 + v46 * 0.2)
	local battle = t1.battle
	local roundedUp = math.ceil(n1 / 500 * #battle)
	local roundedUp4

	if roundedUp >= #battle then
		roundedUp4 = 0
		roundedUp = #battle
	else
		roundedUp4 = math.ceil((roundedUp + 1) / #battle * 500)
	end

	local t4: {[any]: any} = { battle = roundedUp }
	local t5: {[any]: any} = { battle = math.ceil(roundedUp4) }
	local t6: {[any]: any} = { battle = n1 / 500 }
	local n3: number = 0

	for _, _ in pairs(list[6]) do
		n3 += 1
	end

	local v58 = n2
	local sleeves = t1.sleeves
	local roundedUp5 = math.ceil(n3 / v58 * #sleeves)
	local roundedUp6

	if roundedUp5 >= #sleeves then
		roundedUp6 = 0
		roundedUp5 = #sleeves
	else
		roundedUp6 = math.ceil((roundedUp5 + 1) / #sleeves * v58)
	end

	local roundedUp7 = math.ceil(roundedUp6)

	t4.sleeves = roundedUp5
	t5.sleeves = roundedUp7
	t6.sleeves = n3 / v58

	local v63, v64 = GetCardStats(list[3])
	local cards = t1.cards
	local roundedUp8 = math.ceil(v63 / 1000 * #cards)
	local roundedUp9

	if roundedUp8 >= #cards then
		roundedUp9 = 0
		roundedUp8 = #cards
	else
		roundedUp9 = math.ceil((roundedUp8 + 1) / #cards * 1000)
	end

	local roundedUp10 = math.ceil(roundedUp9)

	t4.cards = roundedUp8
	t5.cards = roundedUp10
	t6.cards = v63 / 1000

	local artcards = t1.artcards
	local roundedUp11 = math.ceil(v64 / 100 * #artcards)
	local roundedUp12

	if roundedUp11 >= #artcards then
		roundedUp12 = 0
		roundedUp11 = #artcards
	else
		roundedUp12 = math.ceil((roundedUp11 + 1) / #artcards * 100)
	end

	local roundedUp13 = math.ceil(roundedUp12)

	t4.artcards = roundedUp11
	t5.artcards = roundedUp13
	t6.artcards = v64 / 100

	local bloxBux = list[33].BloxBux
	local supporter = t1.supporter
	local roundedUp14 = math.ceil(bloxBux / 10000 * #supporter)
	local roundedUp15

	if roundedUp14 >= #supporter then
		roundedUp15 = 0
		roundedUp14 = #supporter
	else
		roundedUp15 = math.ceil((roundedUp14 + 1) / #supporter * 10000)
	end

	local roundedUp16 = math.ceil(roundedUp15)

	t4.supporter = roundedUp14
	t5.supporter = roundedUp16
	t6.supporter = bloxBux / 10000

	local v78 = list[33]["Rabbit's Feet"]
	local rabbit = t1.rabbit
	local roundedUp17 = math.ceil(v78 / 15 * #rabbit)
	local roundedUp18

	if roundedUp17 >= #rabbit then
		roundedUp18 = 0
		roundedUp17 = #rabbit
	else
		roundedUp18 = math.ceil((roundedUp17 + 1) / #rabbit * 15)
	end

	local roundedUp19 = math.ceil(roundedUp18)

	t4.rabbit = roundedUp17
	t5.rabbit = roundedUp19
	t6.rabbit = v78 / 15
	v78 = list[8][2]

	local clover = t1.clover
	local roundedUp20 = math.ceil(v78 / 15 * #clover)
	local roundedUp21

	if roundedUp20 >= #clover then
		roundedUp21 = 0
		roundedUp20 = #clover
	else
		roundedUp21 = math.ceil((roundedUp20 + 1) / #clover * 15)
	end

	local roundedUp22 = math.ceil(roundedUp21)

	t4.clover = roundedUp20
	t5.clover = roundedUp22
	t6.clover = v78 / 15
	t6.balanced = (t6.cards + t6.supporter + t6.battle + (t6.rabbit + t6.clover) / 2) / 4 * 1.1

	local n10 = (t6.rabbit + t6.clover) / 2

	t6.battleluck = (n10 + t6.battle) / 2 * 1.1
	t6.battlecards = (t6.cards + t6.battle) / 2 * 1.1
	t6.cardsluck = (t6.cards + n10) / 2 * 1.1

	for k, v in pairs(t6) do
		if not t4[k] then
			local v90 = t1[k]
			local v91 = math.min(v, 1)
			local roundedUp23 = math.ceil(v91 * #v90)

			t4[k] = math.max(roundedUp23, 1)
		end

		local t7: {[any]: any} = {}

		for i = 1, t4[k] do
			t7[i] = t1[k][i]
		end

		t3[k] = t7
	end

	v58 = module.GetRank(list, t3)

	local v95 = module.GetLevel(list)

	return { rank = v58, ranks = t3, pp = t6, fornext = t5, level = v95 }
end
function module.GetRank(p12, p13)
	if not p12[9] then
		if not p13 then
			p13 = module.GetUnlockedRanks(p12)
		end

		p12[9] = {
			"balanced",
			#p13.balanced,
			{}
		}
	end

	local v98 = p12[9][1]
	local v99 = p12[9][2]

	if v98 == "special" then
		return p12[9][3][v99]
	end

	local s1 = t1[v98] and v98 or "balanced"
	local v101 = math.min(#t1[s1], v99)

	return t1[s1][v101]
end

return module
