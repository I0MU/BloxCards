--[[ ServerScriptService/Handlers/Battlehandlers  (ModuleScript)
Server.lua loads it automatically.

sNPC battles. YOU play normally; the NPC draws a starting hand like you, draws one card a turn, casts ONE card from its
hand each turn for free (fighter or action, targets are random), then every fighter that can attack swings at a random target.

RULES IMPLEMENTED
  * A coin flip decides who goes first. Colourless ("white") studs at the start: 4 if you go first, 6 if second.
  * Both players start with 2 "Mark Stud" cards in their Baseplate. You draw 7 cards to start.
  * Studs are a spendable pool. Colourless studs are kept. At the end of a player's turn their coloured studs reset
    to 0, then every card they have in play or in their Baseplate that isn't inert generates 1 stud of its colour.
  * Discarding from hand: colourless cards always go to the Graveyard (+1 colourless stud). The FIRST coloured card
    each turn goes to the Baseplate (+1 stud of its colour); later coloured cards that turn go to the Graveyard
    and still give a stud of their colour.
    Cards that are inert when discarded give nothing.
  * Fighters can attack enemy fighters or the face. Defender (Shield) fighters must be attacked first.
  * Card effects: see the EFFECTS section. The common triggers and verbs work; anything else is skipped safely.
  * PATCH (wiki PDF): added triggers OnLifeLoss/OnLifeGain/OnHealthLoss/OnHealthGain/OnEnemyLifeGain/OnEnemyHealthLoss/
    OnEnemyHealthGain, OnStrike, OnAnySummon, OnDrawn/OnAllyDraw/OnEnemyDraw/OnAnyDraw, OnLockIncrease/OnEffectLock, OnRageGain;
    (round 2: OnSummonOrEnd, OnCast/OnAnyCast/OnAnyEnemyCast, OnEffectDamage/OnDamaged, OnDiscarded/OnAnyDiscard, OnAllyPut/OnEnemyPut/
    OnAllySecondPut, OnAllyTarget/OnEnemyTarget/OnFighterTarget/OnTargetByEnemy; Gladiator's StartDeckChecks requirement)
    verbs GivePassive, RemovePassive, Suspend, SummonWithEffect; passives Rageborne (Rage), Liberate, Continued, SuspendImmune.

Numbers marked ASSUMED are guesses. Change them here or add a BATTLE = { ... } table to ServerScriptService/Modules/Config.
]]
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")

local Config = require(script.Parent.Parent.Modules.Config)
local DeckUtil = require(script.Parent.Parent.Modules.DeckUtil)

local BattleHandlers = {}

local RULES = {
	StartingLife = 4000, -- players start with 4000 health
	FieldCap = 8, -- a board holds up to 8 fighters (the client reads this from GetBattleRules)
	HandCap = 10, -- ASSUMED
	StageCap = 6, -- ASSUMED (passed to the client, which reads the field if present)
	StartingHand = 7,
	FirstPlayer = "Random", -- "Random", "You" or "Enemy"
	StartingStudsFirst = 4, -- colourless studs for whoever goes first
	StartingStudsSecond = 6, -- colourless studs for whoever goes second
	StartingBaseplateCards = 2, -- "Mark Stud" cards in each Baseplate at the start
	DrawOnFirstTurn = false, -- false: whoever goes first skips the draw on turn 1 (the second player still draws)
	FieldGenerates = true, -- at the end of your turn every non-inert fighter on your field generates a stud
	BaseplateGenerates = true, -- ... and so does every non-inert card in your baseplate
	ColouredReset = true, -- coloured studs reset to 0 at the end of your turn, before generating
	EnemyDeckSize = 40,
	BaseplatesPerTurn = 1, -- the first discard each turn goes to the baseplate; 0 = every discard can
	FaceNeedsEmptyField = true, -- true: you can only hit the face when the enemy has no fighters
	EnemyPool = "All", -- "All" = every real card in the CardLibrary; "Fighters" = only plain fighters
	EnemyActionDelay = 0.7, -- seconds between NPC actions
	TargetTimeout = 30, -- seconds you get to pick a target before one is chosen for you
	ZoneTargetTimeout = 60, -- seconds you get to pick cards from your deck / graveyard (the card picker window) before it is decided for you
	MaxEffectDepth = 8, -- stops effect chains from looping forever
	EffectAnimDelay = 0.6, -- seconds the server waits after a card's cast animation starts, so the damage lands with the hit
	LossAnimTime = 2.5, -- seconds the defeated face explodes before the result screen
	TurnTime = 60, -- seconds per turn; when it runs out your turn ends by itself (the client clock shows the same number)
}
if type(Config.BATTLE) == "table" then
	for k, v in pairs(Config.BATTLE) do
		RULES[k] = v
	end
end

local COLORS = { "Neutral", "Red", "Green", "Blue", "Yellow" }
local STUD_CARDS = { "Mark Stud", "Stud", "Neutral Stud" } -- first one that exists is used for the starting baseplate

local Net -- the server Network module, set in Init
local PlayerDataModule
local byPlayer = {} -- [Player] = battle

---------------------------------------------------------------------- helpers

local function sanitize(v, depth)
	depth = depth or 0
	local t = typeof(v)
	if t == "function" or t == "thread" then
		return nil
	end
	if t ~= "table" then
		return v
	end
	if depth > 6 then
		return nil
	end
	local out = {}
	for k, val in pairs(v) do
		local s = sanitize(val, depth + 1)
		if s ~= nil then
			out[k] = s
		end
	end
	local mt = getmetatable(v)
	if mt and type(mt.__index) == "table" then
		for k, val in pairs(mt.__index) do
			if out[k] == nil then
				local s = sanitize(val, depth + 1)
				if s ~= nil then
					out[k] = s
				end
			end
		end
	end
	return out
end

local function shuffle(list)
	for i = #list, 2, -1 do
		local j = math.random(i)
		list[i], list[j] = list[j], list[i]
	end
end

local function wait(seconds)
	task.wait(seconds)
end

local function alert(player, text)
	Net.Send(player, "Alert", text)
end

local function other(owner)
	return owner == "You" and "Enemy" or "You"
end

-- AddToBaseplate / SummonCard want "" for the player and "Enemy" for the opponent.
local function clientSide(owner)
	return owner == "Enemy" and "Enemy" or ""
end

local function isTerrain(card)
	return card.Terrain or card.Archetype == "Terrain"
end

local function cardType(def)
	if isTerrain(def) then
		return "Terrain"
	end
	if def.Gear then
		return "Gear"
	end
	if (def.Health or 0) <= 0 then
		return "Effect" -- no health = can't sit on a field, treat as a spell
	end
	return "Fighter"
end

-- An action that carries stats (Health > 0 on the card itself, e.g. a Havaluvian Blackmarketeer ghost sent back to the hand)
-- "manifests into a fighter" when it is cast, so it is played as a Fighter and enters the field with those stats.
local function playKind(card)
	local k = cardType(card.def)
	if k == "Effect" and (card.health or 0) > 0 then
		return "Fighter"
	end
	return k
end

-- The colour of stud a card generates ("Neutral" = colourless).
local function studColor(def)
	if table.find(COLORS, def.Color) then
		return def.Color
	end
	return "Neutral"
end

-- "Inert" keywords from RulesSyntax: an inert card doesn't generate studs in that zone / situation.
local function inertInPlay(card)
	local d = card.def
	-- FIX: card.extra.TokenOmni marks one specific card as inert (the copy DevRolve summons), not every card of that name
	return d.Token or d.TokenOmni or d.LooksFalse or d.LooksTrue or (card.extra and (card.extra.TokenOmni or card.extra.Token))
end
local function inertInBaseplate(card)
	local d = card.def
	return d.TokenGenZone or d.TokenOmni or (card.extra and (card.extra.TokenGenZone or card.extra.TokenOmni))
end
local function inertWhenDiscarded(card)
	local d = card.def
	return d.TokenDiscard or d.TokenOmni or (card.extra and (card.extra.TokenOmni or card.extra.TokenDiscard))
end

local fighterPool
local function getFighterPool()
	if fighterPool then
		return fighterPool
	end
	fighterPool = {}
	local lib = DeckUtil.GetLibrary()
	if lib then
		for name, card in pairs(lib) do
			if
				type(name) == "string"
				and type(card) == "table"
				and card.Rarity
				and card.Rarity ~= "Token"
				and type(card.Cost) == "table"
				and (card.Health or 0) > 0
				and not isTerrain(card)
				and not card.Gear
				and not card.IsBotCard
				and not card.Blessing
				and not card.Requirement
			then
				table.insert(fighterPool, name)
			end
		end
		table.sort(fighterPool)
	end
	return fighterPool
end

-- Every real card in the game (tokens and boss cards are left out now that effects run: some of them end the game).
local allPool
local function getAllPool()
	if allPool then
		return allPool
	end
	allPool = {}
	local lib = DeckUtil.GetLibrary()
	if lib then
		for name, card in pairs(lib) do
			if type(name) == "string" and type(card) == "table" and card.Rarity and card.Rarity ~= "Token" and not card.IsBotCard then
				table.insert(allPool, name)
			end
		end
		table.sort(allPool)
	end
	return allPool
end

local function getEnemyPool()
	if RULES.EnemyPool == "Fighters" then
		return getFighterPool()
	end
	return getAllPool()
end

local function findStudCard()
	for _, name in ipairs(STUD_CARDS) do
		if DeckUtil.GetCard(name) then
			return name
		end
	end
	return nil
end

------------------------------------------------------------ alt arts & foils
-- Alt arts and foils are the same card with different art, so they must play exactly like it. The library copies the
-- original's fields into every alt art / foil, but an alt can override some of them (and the library can be patched
-- later), so the battle always takes the gameplay fields from the ORIGINAL card and keeps only the cosmetic ones
-- (name, art, bio, foil flag...) from the alt. References to other cards by name (Summonant, Addant, ...) stay the
-- variant's own, so a foil still summons the foil token.
local COSMETIC_KEYS = {
	Name = true,
	Id = true,
	Bio = true,
	AttackEffect = true,
	ArtAnimation = true,
	AltArt = true,
	PremiumArt = true,
	Commissioner = true,
	Foil = true,
	LibraryIndex = true,
	UnfoiledIndex = true,
	Original = true,
	AltCards = true,
	Pack = true,
	CopyBodge = true,
	Field = true,
	BattleModel = true,
	SearchTerms = true,
	PackDisplayOverride = true,
	ReplacementArt = true,
	NurtureArt = true,
	InPacks = true,
	StarterCard = true,
}
local OWN_REFERENCE_KEYS = {
	Summonant = true,
	Addant = true,
	GenZoneSummonant = true,
	Terrariant = true,
	Transformant = true,
}
local gameplayCache = setmetatable({}, { __mode = "k" })
local function gameplayDef(def)
	local cached = gameplayCache[def]
	if cached then
		return cached
	end
	local result = def
	local lib = DeckUtil.GetLibrary()
	local base = type(def.Original) == "string" and lib and lib[def.Original] or nil
	if type(base) == "table" and base ~= def then
		result = {}
		for k, v in pairs(def) do
			result[k] = v
		end
		for k, v in pairs(base) do
			if not COSMETIC_KEYS[k] and (not OWN_REFERENCE_KEYS[k] or result[k] == nil) then
				result[k] = v
			end
		end
	end
	gameplayCache[def] = result
	return result
end

-- Every printing of a card (original, alt arts, foils) shares one key; used wherever cards are matched by name.
local function baseKey(libName)
	local def = DeckUtil.GetCard(libName)
	if def and type(def.Original) == "string" then
		return def.Original
	end
	return libName
end

local function actionCastAllowsType(def, trigger, otherDef)
	local effect = def.Effect
	if type(effect) ~= "table" then
		return true
	end
	if effect.ActionOnly then
		return cardType(otherDef) == "Effect"
	end
	if trigger == "OnCast" then
		return cardType(otherDef) == "Effect"
	end
	if trigger ~= "OnAllyCast" and trigger ~= "OnEnemyCast" and trigger ~= "OnAnyCast" then
		return true
	end
	local description = string.lower(tostring(effect.Description or ""))
	local hasActionCast = false
	local allowsFighter, allowsGear, allowsTerrain = false, false, false
	for clause in description:gmatch("[^%.:;\n]+") do
		if clause:find("action", 1, true) and clause:find("cast", 1, true) then
			local isAllyClause = clause:find("you", 1, true) or clause:find("your", 1, true)
				or clause:find("allied", 1, true)
			local isEnemyClause = clause:find("opponent", 1, true) or clause:find("enemy", 1, true)
			if (trigger == "OnAllyCast" and not isEnemyClause)
				or (trigger == "OnEnemyCast" and (isEnemyClause or not isAllyClause))
				or trigger == "OnAnyCast" then
				hasActionCast = true
				allowsFighter = allowsFighter or clause:find("fighter", 1, true) ~= nil
				allowsGear = allowsGear or clause:find("gear", 1, true) ~= nil
				allowsTerrain = allowsTerrain or clause:find("terrain", 1, true) ~= nil
			end
		end
	end
	if not hasActionCast then
		return true
	end
	local kind = cardType(otherDef)
	return kind == "Effect" or (kind == "Fighter" and allowsFighter)
		or (kind == "Gear" and allowsGear) or (kind == "Terrain" and allowsTerrain)
end

------------------------------------------------------------------ card state

local function newCard(b, owner, libName)
	local def = DeckUtil.GetCard(libName)
	if not def then
		return nil
	end
	def = gameplayDef(def)
	b.counter = b.counter + 1
	local card = {
		n = b.counter,
		id = "Card" .. b.counter,
		lib = libName,
		def = def,
		owner = owner, -- "You" or "Enemy"
		zone = "Deck", -- Deck / Hand / Field / Baseplate / Graveyard / Dead
		health = def.Health or 0,
		power = def.Power or 0,
		lockTurns = 0, -- > 0 = locked (can't attack). Counts down at the end of its owner's turn.
		summonedTurn = 0,
		handSeq = 0, -- order the card entered the hand (lowest = oldest = leftmost)
		died = false, -- true once it has died on the field (it then sits in the Graveyard)
	}
	b.cards[card.id] = card
	return card
end

-- IncreaseCost keeps per-card deltas in card.costMod[colour]; this is the cost the card really has now.
local function effectiveCost(card)
	local cost = card.def.Cost
	-- FIX (Blood Moon Seeker): AlternateCost = { IgnoreColor = "Neutral" } while its AlternateCostRequirement is met (card.altCost is refreshed before every affordability check / cast)
	local alt = card.altCost and type(card.def.AlternateCost) == "table" and card.def.AlternateCost.IgnoreColor or nil
	if type(cost) ~= "table" or not (card.costMod or alt) then
		return cost
	end
	cost = table.clone(cost)
	if alt then
		cost[alt] = nil
	end
	for color, delta in pairs(card.costMod or {}) do
		cost[color] = math.max(0, (tonumber(cost[color]) or 0) + delta)
	end
	return cost
end

local function fullInfo(card)
	local info = sanitize(card.def)
	info.AltCards = nil
	info.SearchTerms = nil
	info.PackDisplayOverride = nil
	info.CardId = card.id
	info.Locked = { IsLocked = card.lockTurns > 0, TurnsLeft = card.lockTurns } -- the client reads card.Locked.IsLocked
	info.LibraryIndex = card.lib
	info.Health = card.health
	info.Power = card.power
	if card.costMod then
		info.Cost = effectiveCost(card)
	end
	if card.extra and card.extra.TokenOmni then
		info.TokenOmni = true -- FIX: the client shows per-card inert status too
	end
	if card.descOverride then
		info.ModifiedDescription = card.descOverride -- FIX (Biggs, Liquidated): replaced effect text (level); the client shows this instead of the library text
	end
	if card.fleeting then
		info.Fleeting = true -- FIX (v18): cards made fleeting by an effect (M3soSAd, Ravenshield ...) show as Fleeting
	end
	return info
end

local function hiddenInfo(card)
	return { CardId = card.id, Locked = { IsLocked = false, TurnsLeft = 0 } }
end

local function inZone(b, owner, zone)
	local out = {}
	for _, c in pairs(b.cards) do
		if c.zone ~= "Field" then
			c.fieldSeq = nil -- left the field: it joins the right end again when it comes back
		end
		if c.owner == owner and c.zone == zone then
			table.insert(out, c)
		end
	end
	table.sort(out, function(a, c)
		return a.n < c.n
	end)
	if zone == "Field" then
		-- FIX (casting onto a full board): the field is laid out in the order fighters ENTERED it (the newest is the rightmost), not in the
		-- order the cards were created. It was sorted by creation, so a card drawn early but cast late counted as the "leftmost" fighter and
		-- was killed instead of the one on the far left. Any card that has no entry number yet gets the next one (creation order among them).
		for _, c in ipairs(out) do
			if not c.fieldSeq then
				b.fieldCounter = (b.fieldCounter or 0) + 1
				c.fieldSeq = b.fieldCounter
			end
		end
		table.sort(out, function(a, c)
			return a.fieldSeq < c.fieldSeq
		end)
	end
	return out
end

local function fieldOf(b, owner)
	return inZone(b, owner, "Field")
end

-- A card enters its owner's hand (it becomes the newest, i.e. rightmost, card).
local function toHand(b, card)
	card.zone = "Hand"
	b.handCounter = b.handCounter + 1
	card.handSeq = b.handCounter
end

local function allFighters(b)
	local out = fieldOf(b, "You")
	for _, c in ipairs(fieldOf(b, "Enemy")) do
		table.insert(out, c)
	end
	return out
end

local function createCards(b, owner, names)
	local ids = {}
	for _, name in ipairs(names) do
		local card = newCard(b, owner, name)
		if card then
			table.insert(ids, card.id)
		end
	end
	return ids
end

-- The enemy never runs out: after each draw a fresh random card from the whole pool goes back under the deck.
local function refillEnemyDeck(b)
	local pool = getEnemyPool()
	while #b.decks.Enemy < RULES.EnemyDeckSize and #pool > 0 do
		local card = newCard(b, "Enemy", pool[math.random(#pool)])
		if not card then
			break
		end
		table.insert(b.decks.Enemy, 1, card.id)
	end
end

----------------------------------------------------------------------- studs

-- Returns ok, payment {color = amount}, missing {color = true}
local function planPayment(avail, cost)
	local pool = table.clone(avail)
	local pay, missing = {}, {}
	local ok = true
	local neutralNeed = 0
	for key, amount in pairs(cost) do
		if type(amount) == "number" and amount > 0 then
			if key == "Neutral" then
				neutralNeed = neutralNeed + amount
			else
				local parts = string.split(key, " ") -- "Red Green" = either colour
				local remaining = amount
				for _, color in ipairs(parts) do
					local take = math.min(pool[color] or 0, remaining)
					if take > 0 then
						pool[color] = pool[color] - take
						pay[color] = (pay[color] or 0) + take
						remaining = remaining - take
					end
					if remaining <= 0 then
						break
					end
				end
				if remaining > 0 then
					ok = false
					missing[parts[1]] = true
				end
			end
		end
	end
	if neutralNeed > 0 then
		-- Colourless costs can only be paid with colourless studs
		local have = pool.Neutral or 0
		if have >= neutralNeed then
			pool.Neutral = have - neutralNeed
			pay.Neutral = (pay.Neutral or 0) + neutralNeed
		else
			ok = false
			missing.Neutral = true
		end
	end
	return ok, pay, missing
end

-- "Cast only if ..." rules (card.Requirement = { kind, scope, min, max, key }). The value must be min <= value < max.
-- Kinds the engine doesn't know are treated as met, so a card is never made uncastable by mistake.
local function requirementValue(b, card, r)
	local kind, scope, key = r[1], r[2], r[5]
	local owner, foe = card.owner, other(card.owner)
	if kind == "Deck" then
		if key == "Cards" then
			return #b.decks[owner]
		elseif key == "Archetype" and card.def.Archetype ~= nil then
			local n = 0
			for _, id in ipairs(b.decks[owner]) do
				if b.cards[id].def.Archetype == card.def.Archetype then
					n = n + 1
				end
			end
			return n
		end
	elseif kind == "Playertable" then
		if key == "BypassUltra" then
			return b.flags[owner].BypassUltra or 0
		end
	elseif kind == "Archetype" and scope == "AllyHand" and type(key) == "string" then
		-- FIX (Stud Crystals): "Cast only if there are N or more <archetype> cards in your hand" (the card being cast is still in the hand)
		local n = 0
		for _, c in ipairs(inZone(b, owner, "Hand")) do
			if c.def.Archetype == key then
				n = n + 1
			end
		end
		return n
	elseif kind == "Archetype" and scope == "Ally" and type(key) == "string" then
		local n = 0
		for _, c in ipairs(fieldOf(b, owner)) do
			if c.def.Archetype == key then
				n = n + 1
			end
		end
		return n
	elseif kind == "Board" then
		if scope == "Ally" then
			return #fieldOf(b, owner)
		elseif scope == "Opponent" then
			return #fieldOf(b, foe)
		elseif scope == "All" then
			return #fieldOf(b, owner) + #fieldOf(b, foe)
		end
	elseif kind == "Turns" and scope == "Ally" then
		return owner == "You" and b.playerTurns or math.max(0, b.turnCount - b.playerTurns)
	elseif kind == "Rarity" and scope == "Ally" and type(key) == "string" then
		local n = 0
		for _, c in ipairs(fieldOf(b, owner)) do
			if c.def.Rarity == key then
				n = n + 1
			end
		end
		return n
	end
	return nil
end

-- Returns true, or false plus the card's own "Cast only if ..." line to tell the player.
local function requirementMet(b, card)
	local r = card.def.Requirement
	-- PATCH: Gladiator (StartDeckChecks): castable only if the starting deck had 2 or fewer Gladiators and no duplicates
	if type(r) == "table" and r[1] == "StartDeckChecks" and card.owner == "You" and b.gladiatorOk and not b.gladiatorOk.You then
		return false, "Cast only if your starting deck has 2 or fewer Gladiators and no duplicate cards."
	end
	if type(r) ~= "table" or tonumber(r[3]) == nil then
		return true
	end
	local value = requirementValue(b, card, r)
	if value == nil then
		return true
	end
	local lo, hi = tonumber(r[3]), tonumber(r[4]) or math.huge
	if value >= lo and value < hi then
		return true
	end
	local text = type(card.def.Effect) == "table" and card.def.Effect.Description or nil
	local line = type(text) == "string" and text:match("^[^\n]+") or nil
	return false, line or "You can't cast this card right now."
end

local function sendAffordable(b)
	local map = {}
	for _, c in ipairs(inZone(b, "You", "Hand")) do
		local t = cardType(c.def)
		local ok = false
		if RULES.AltCostCheck then
			c.altCost = RULES.AltCostCheck(b, c) -- FIX (Blood Moon Seeker)
		end
		if t == "Fighter" or t == "Effect" or t == "Terrain" or t == "Gear" then
			ok = (t ~= "Gear" or #fieldOf(b, "You") > 0) and (planPayment(b.studs.You, effectiveCost(c))) and requirementMet(b, c) and not (t == "Effect" and b.noActions.You) and not (t == "Fighter" and b.noSummon.You)
		end
		map[c.id] = ok
	end
	Net.Send(b.player, "GetAffordableHand", map, {})
end

-- Change a player's stud pool (amount can be negative) and tell the client.
local function addStuds(b, owner, color, amount, cardId)
	local pool = b.studs[owner]
	pool[color] = (pool[color] or 0) + amount
	Net.Send(b.player, "AddIcons", { [owner] = { [color] = amount } }, cardId)
end

-- End of a player's turn: coloured studs reset, then every non-inert card in play / baseplate generates a stud.
-- FIX: the reset used to run here, AFTER the end-step effects. Studs made by an end-step "Generate" (Infernal / Fried
-- Acolyte ...) were therefore shown arriving and then wiped before they could be spent. The reset now happens FIRST
-- (resetColouredStuds, called before the end step fires) and generateStuds only adds the regular studs on top.
local function resetColouredStuds(b, owner)
	if not RULES.ColouredReset then
		return
	end
	local pool = b.studs[owner]
	local reset = {}
	for _, color in ipairs(COLORS) do
		if color ~= "Neutral" and (pool[color] or 0) ~= 0 then
			reset[color] = -(pool[color])
			pool[color] = 0
		end
	end
	if next(reset) then
		Net.Send(b.player, "AddIcons", { [owner] = reset })
	end
end

local function generateStuds(b, owner)
	local sources = {}
	if RULES.FieldGenerates then
		for _, c in ipairs(inZone(b, owner, "Field")) do
			if not inertInPlay(c) then
				table.insert(sources, c)
			end
		end
	end
	if RULES.BaseplateGenerates then
		for _, c in ipairs(inZone(b, owner, "Baseplate")) do
			if not inertInBaseplate(c) then
				table.insert(sources, c)
			end
		end
	end
	for _, c in ipairs(sources) do
		addStuds(b, owner, studColor(c.def), 1, c.id)
	end
end

---------------------------------------------------------------------- battle

local function endBattle(b, result, via)
	if b.ended then
		return
	end
	b.ended = true
	if byPlayer[b.player] == b then
		byPlayer[b.player] = nil
	end
	local pending = b.pending
	if pending then
		b.pending = nil
		task.spawn(pending.co, nil)
	end
	-- The client reads rewards.BloxBux / rewards.Cards on the result screen; nil there made it error before the Close button appeared.
	-- NEW: the defeated face explodes (client PlayLossAnimation) before the result screen
	local loser = (result == "Victory" and "Enemy") or (result == "Defeat" and "You") or nil
	local info = loser and b.faceInfo and b.faceInfo[loser]
	local player = b.player
	if info then
		Net.Send(player, "PlayLossAnimation", info)
		task.delay(RULES.LossAnimTime, function()
			Net.Send(player, "GameEnd", result, via, {}, true)
		end)
	else
		Net.Send(player, "GameEnd", result, via, {}, true)
	end
end

local function checkLife(b)
	if b.life.Enemy <= 0 then
		endBattle(b, "Victory", "Reducing the opponent's life to 0")
	elseif b.life.You <= 0 then
		endBattle(b, "Defeat", "Your life reaching 0")
	end
	return b.ended
end

local function sendDraw(b, you, enemy)
	local payload = {}
	if you and #you > 0 then
		payload.You = {}
		for _, c in ipairs(you) do
			table.insert(payload.You, fullInfo(c))
		end
	end
	if enemy and #enemy > 0 then
		payload.Enemy = {}
		for _, c in ipairs(enemy) do
			table.insert(payload.Enemy, hiddenInfo(c))
		end
	end
	if next(payload) == nil then
		return
	end
	Net.Send(b.player, "DrawCard", payload, { You = #b.decks.You, Enemy = #b.decks.Enemy })
end

-- PATCH: hooks assigned further down, once fireTrigger exists
local onLifeChanged, onCardsDrawn

-- FATIGUE: drawing from an empty deck costs life instead: 100, then 200, then 300 ... (per player, for the whole battle).
-- The client plays its "Fatigue" fire-breath effect on the deck and the face's life number drops.
local function fatigueHit(b, owner)
	if b.fatigueImmune and b.fatigueImmune[owner] then
		return false -- FIX: SetFatigueImmune (raid bosses) - no fatigue damage
	end
	b.fatigue = b.fatigue or { You = 0, Enemy = 0 }
	b.fatigue[owner] = b.fatigue[owner] + 1
	local before = b.life[owner]
	b.life[owner] = math.max(0, before - 100 * b.fatigue[owner])
	local lost = before - b.life[owner]
	Net.Send(b.player, "Fatigue", owner, lost, b.life[owner])
	local ended = checkLife(b)
	if not ended and onLifeChanged and lost ~= 0 then
		onLifeChanged(b, owner, -lost)
	end
	return ended
end

local function drawCards(b, owner, count, noFatigue)
	local drawn = {}
	local burnedAny = false
	local burnedCards = {}
	for _ = 1, count do
		local deck = b.decks[owner]
		if #deck == 0 then
			if noFatigue then
				break
			end
			if fatigueHit(b, owner) then
				break -- the fatigue killed them
			end
			continue
		end
		if #inZone(b, owner, "Hand") >= RULES.HandCap then
			-- FIX (v12): full hand - each card you would draw goes from the deck to the graveyard instead (it is not drawn,
			-- so no draw triggers). Server-side only, like the other deck -> graveyard moves; milled = can't be seanced.
			local burnId = table.remove(deck)
			local burned = b.cards[burnId]
			if burned then
				burned.zone = "Graveyard"
				burned.milled = true
				burnedAny = true
				table.insert(burnedCards, burned)
			end
			continue
		end
		local id = table.remove(deck)
		local card = b.cards[id]
		toHand(b, card)
		if b.fleetingNow then
			card.fleeting = true -- FIX: "draw a fleeting card" - it is destroyed at the end step if it isn't cast
		end
		table.insert(drawn, card)
	end
	-- FIX (v19): tell the client about each overdrawn card so it really shows up in that side's graveyard
	-- (the client only knows graveyard cards from AddToGraveyard events) and the graveyard count updates.
	for _, burned in ipairs(burnedCards) do
		Net.Send(b.player, "AddToGraveyard", clientSide(owner), nil, fullInfo(burned))
	end
	if burnedAny then
		if #drawn == 0 then
			-- FIX (v15): nothing could be drawn: send the client's native empty-draw signal so it shows
			-- "Undrawable cards were destroyed!" and updates both deck counters (sendDraw skips empty draws).
			Net.Send(b.player, "DrawCard", {}, { You = #b.decks.You, Enemy = #b.decks.Enemy })
		else
			Net.Send(b.player, "SetDeckAmount", owner, #b.decks[owner]) -- FIX (v12): keep the deck counter right
		end
	end
	return drawn
end

-- NPC HAND: draw for either side and tell the client (the enemy's cards are sent face down, as sleeves).
local function drawFor(b, owner, n, noFatigue)
	local cards = drawCards(b, owner, n, noFatigue)
	if owner == "You" then
		sendDraw(b, cards, nil)
	else
		sendDraw(b, nil, cards)
	end
	if onCardsDrawn then
		onCardsDrawn(b, owner, cards)
	end
	return cards
end

-- sourceId (optional): the card causing the change. With it the client plays its CostHealth / GrantHealth animation
-- (amount is life LOST, so a gain is negative); without it only the life number updates.
local function changeLife(b, owner, delta, sourceId)
	local before = b.life[owner]
	b.life[owner] = math.max(0, before + delta)
	local actual = b.life[owner] - before
	if sourceId and actual ~= 0 and b.cards[sourceId] then
		Net.Send(b.player, actual < 0 and "CostHealth" or "GrantHealth", sourceId, owner, -actual, b.life[owner])
	else
		Net.Send(b.player, "UpdateLife", b.life.You, b.life.Enemy)
	end
	local ended = checkLife(b)
	if not ended and onLifeChanged then
		onLifeChanged(b, owner, actual)
	end
	return ended
end

local function setLock(b, card, turns)
	local was = card.lockTurns
	card.lockTurns = math.max(0, turns)
	if card.lockTurns > 0 then
		if was > 0 then
			Net.Send(b.player, "ChangeFreeze", card.id, card.lockTurns)
		else
			Net.Send(b.player, "Freeze", card.id, card.lockTurns)
		end
	elseif was > 0 then
		Net.Send(b.player, "UnFreeze", card.id)
	end
end

-- At the end of a player's turn every lock on their fighters counts down by one.
local function tickLocks(b, owner)
	for _, c in ipairs(fieldOf(b, owner)) do
		if c.lockTurns > 0 then
			setLock(b, c, c.lockTurns - 1)
		end
		-- FIX: TempStrengthen wears off at the end of the owner's turn
		if c.tempPower and c.tempPower > 0 then
			c.power = math.max(0, c.power - c.tempPower)
			c.tempPower = nil
			Net.Send(b.player, "WeakenCard", c.id, c.power)
		end
		-- FIX (v10): TempWeaken: the Power it took away comes back at the end of the owner's turn
		if c.tempWeak and c.tempWeak > 0 then
			c.power = c.power + c.tempWeak
			c.tempWeak = nil
			Net.Send(b.player, "StrengthenCard", c.id, c.power)
		end
	end
end

-- PASSIVES: Unstoppable fighters can attack the opposing face even while that player has fighters.
local function hasUnstoppable(b, owner)
	for _, c in ipairs(fieldOf(b, owner)) do
		if c.def.Unstoppable and c.health > 0 then
			return true
		end
	end
	return false
end

-- A player's face card only sits on the battlefield (and can only be attacked) while they have no fighters.
-- With a fighter out it goes to the corner.
local function syncFaces(b)
	for _, owner in ipairs({ "You", "Enemy" }) do
		-- PASSIVES: an Unstoppable fighter on the other side can attack this face even while it has fighters
		local show = #fieldOf(b, owner) == 0 or hasUnstoppable(b, other(owner))
		if b.faceShown[owner] ~= nil and b.faceShown[owner] ~= show then
			b.faceShown[owner] = show
			if show then
				Net.Send(b.player, "RevealFace", clientSide(owner), b.life[owner])
			else
				Net.Send(b.player, "HideFace", clientSide(owner))
			end
		end
	end
end

-- FIX: hide a face BEFORE a fighter lands in its row. Hiding it afterwards made the fighter appear next to the face and
-- then jump when the face left.
local function faceLeaves(b, owner)
	if b.faceShown and b.faceShown[owner] then
		b.faceShown[owner] = false
		Net.Send(b.player, "HideFace", clientSide(owner))
	end
end

-- Locks a card gets when it enters the field: haste = none, cards cast on the very first turn of the game
-- (by whoever goes first) = 2, everything else = 1. Locks count down by 1 at the end of the owner's turn.
local function entryLock(b, card)
	if card.def.Charge or card.def.Haste or (RULES.ChargeReqCheck and RULES.ChargeReqCheck(b, card)) then -- PASSIVES: Haste is the wiki name for Charge; FIX: ChargeRequirement (Perigee Visionary)
		return 0
	end
	return b.turnCount == 1 and 2 or 1
end

-- A card is put on the field.
local checkCrowdsFavour -- defined below putInBaseplate
local function enterField(b, card)
	card.zone = "Field"
	b.fieldCounter = (b.fieldCounter or 0) + 1
	card.fieldSeq = b.fieldCounter
	card.summonedTurn = b.turnCount
	setLock(b, card, entryLock(b, card))
	syncFaces(b)
	checkCrowdsFavour(b, card.owner)
end

-- PASSIVES: Defender is the wiki name for Shield; both mean "must be attacked before other fighters".
local function isDefender(c)
	return (c.def.Shield or c.def.Defender) and true or false
end

local function hasDefender(b, owner)
	for _, c in ipairs(fieldOf(b, owner)) do
		if isDefender(c) and c.health > 0 then
			return true
		end
	end
	return false
end

----------------------------------------------------------------------- PASSIVES
-- Everything below implements the passives from the Blox Cards wiki "Passives" page. A passive is a boolean key on the
-- card definition (card.def.Fading = true ...). Immunities against card effects are filtered centrally in forCardTargets.

-- Effect damage (not combat): DamageImmune blocks it, Moonward turns it into exactly 100, Marked adds 100 on top.
local function effectDamageAmount(t, n)
	if t.def.DamageImmune then
		return 0
	end
	if t.def.Moonward then
		n = 100
	end
	if t.def.Marked then
		n = n + 100
	end
	return n
end

local function isStealthy(card)
	return card.def.Stealth or card.def.Stormless
end

-- Dextrous = the first attack each turn doesn't lock the fighter (so it attacks twice); Super Dextrous = the first two (three attacks).
local function freeAttacks(card)
	if card.def.SuperDextrous or card.def["Super Dextrous"] then
		return 2
	end
	if card.def.Dextrous then
		return 1
	end
	return 0
end

-- Called when a fighter attacks. Returns the lock it should get (0 = stays ready).
local function attackLock(b, atk)
	if atk.attackTurn ~= b.turnCount then
		atk.attackTurn = b.turnCount
		atk.attackCount = 0
	end
	atk.attackCount = atk.attackCount + 1
	return atk.attackCount <= freeAttacks(atk) and 0 or 1
end

-- Dominant / Prosperous / Sociable: bonus when the card is cast.
local function castPassives(b, card)
	local d = card.def
	if d.Dominant then
		card.power = card.power + 200
		Net.Send(b.player, "StrengthenCard", card.id, card.power)
	end
	if d.Prosperous then
		card.health = card.health + 200
		Net.Send(b.player, "SetCardHealth", card.id, card.health)
	end
	if d.Sociable then
		addStuds(b, card.owner, "Neutral", 1, card.id)
	end
end

------------------------------------------------------------------------ EFFECTS
-- Cards store effects as data. Two formats exist:
--   new: Effect.Ability = { OnSummon = { Power = { {"Damage", 300}, ... }, Target = "Single" }, OnDeath = {...} }
--   old: Effect = { Type = "OnSummon", Power = "Strengthen" / { {"Heal", 50} }, Target = "Single", Increase = 500 }
-- Supported triggers: OnSummon, OnDeath, OnEnd, OnStart, OnAllyStart, OnAttack, OnAllyAttack, OnEnemyAttack, OnAttackDestroy, OnAttackEnd,
--   OnAllySummon, OnEnemySummon, OnAllyDeath, OnEnemyDeath, OnAnyDeath.
-- Supported verbs: Damage, PierceDamage, Heal, Strengthen, Weaken, Destroy, Lock, Unlock, Draw, Cost, Inflict, Add,
--   Summon, AddGenZone, GraveAdd.
-- An ability that uses anything else (conditions, variables, zone targeting, gear...) is skipped, never half-run.

local EFFECT_VERBS = {
	CreateChoices = true,
	PaySetCost = true, Red = true, Blue = true, Green = true, Yellow = true, -- FIX (Eyedeeuhs Djinn)
	Damage = true,
	DamageOverloaded = true,
	ReplaceRarity = true, 
	ReplaceColor = true,-- FIX (Shayph et al.): was missing, so every ability using it was skipped
	PierceDamage = true,
	Heal = true,
	Strengthen = true,
	BoostHealth = true,
	Weaken = true,
	Destroy = true,
	Lock = true,
	RepeatingSummon = true, -- FIX (Pawesome Party et al.): was missing, so every ability using it was skipped
	LockPulse = true, -- FIX (Regular_Show): lock then ready, N times, net change zero
	Unlock = true,
	Draw = true,
	FleetingDraw = true,
	DiscardLimit = true, -- FIX (NooberTuber et al.): "you may baseplate again this turn"; was unknown, so the whole ability was skipped
	Cost = true,
	Inflict = true,
	Add = true,
	Summon = true,
	AddGenZone = true, AddHandModifier = true,
	BypassHandDestroy = true, RemoveHandModifiers = true, -- FIX (Solstice the Demonseeker, Knockdown, Herrus): unknown verbs made the whole ability (blessings included) get skipped
	GraveAdd = true,
	RandomGraveAdd = true,
	Ban = true, MoveGenZone = true, GraveZoneDiscard = true, TransformWithRarity = true, ForceTrigger = true, SetCost = true, StrengthenTargetInHand = true, HealTargetInHand = true, RemoveDeck = true, CopyOpponentDeck = true, DrawFromOpponent = true, AddFighterPower = true,
	NPCSpeech = true, EnemySpeech = true, SetBattleTimer = true, ReplaceAttackEffect = true, AllowRaidRewards = true,
	SetPower = true,
	Swap = true,
	Generate = true,
	Tutorfor = true,
	Neutral = true,
	Red = true,
	Green = true,
	Blue = true,
	Yellow = true,
	SetNeutral = true,
	SetRed = true,
	SetGreen = true,
	SetBlue = true,
	SetYellow = true,
	AlterEV = true,
	ForceCast = true,
	TargetAddStrengthenBonus = true,
	EVGreaterValueCheck = true,
	EVExactValueCheck = true,
	SpecificDiscard = true,
	RandomDeckAdd = true,
	BypassAction = true,
	BypassUltra = true,
	CheckPower = true,
	CheckHealth = true,
	EquipGear = true,
	DestroyGear = true,
	RandomMoveGear = true, -- FIX (Kilnkin Sergeant): move a gear from this fighter onto another one
	BypassAttack = true,
	BypassSummon = true,
	RandomSummon = true,
	RandomAdd = true,
	MoveZone = true,
	SetHealth = true,
	MultiplyHealth = true,
	MultiplyPower = true,
	SetLife = true,
	Obliterate = true, -- FIX: new verbs (see SPECIAL_CHECKS / VERBS below)
	MultiSelectOperation = true, SetArchetype = true,
	TempStrengthen = true,
	SummonCopy = true,
	SummonEnemyCopy = true, -- FIX (Incredibly Friendly and Helpful Devil)
	LastDeath = true,
	DeckAdd = true,
	RandomTutorfor = true,
	Transform = true,
	-- FIX: purely visual / information verbs: they do nothing here, but an ability that contains one was rejected as a whole
	RevealHand = true, RevealCard = true, PlayBossAnimation = true, DelayClient = true, ChangeMusic = true, NOTHING = true,
	ReplaceCardArt = true, ReplaceBio = true, ReplaceDescription = true, AnimateTerrain = true,
	RandomDiscard = true, ArchetypeDiscard = true, Steal = true,
	Reset = true, -- FIX: Seranok "Wary" ({"Reset", 500}, {"Return", 30}) was skipped because these two verbs didn't exist
	Return = true,
	Suspend = true, GivePassive = true, RemovePassive = true, SummonWithEffect = true, RandomSummonWithEffect = true, -- PATCH
	ReplaceEffect = true, -- FIX (ajarbythedoor): unknown verb made the whole ability get skipped
	GraveDestroy = true, RandomTransform = true, IncreaseCost = true, -- FIX: unknown verbs made whole abilities get skipped
	SummonGenZone = true, -- FIX: Infurniture cards ("Summon 4 Hellish Infurniture from your baseplate") were skipped entirely
	ExchangePower = true, ExchangeHealth = true, -- FIX: unknown verbs make the whole ability get skipped (Eye for an eye, Joshriel ...)
	DestroyTerrain = true, GenZoneDiscard = true, SetFatigueImmune = true, -- FIX: these three used to make the whole ability get skipped
	-- FIX (v10): more verbs that were missing, so every ability using them was skipped
	TempWeaken = true, StrengthenHand = true, HealHand = true, ArchetypeHandStrengthen = true, ArchetypeHandHeal = true,
	RepeatingAdd = true, RepeatingRandomAdd = true, RandomEquipGear = true, ShuffleDeck = true,
	Inject = true, InjectHand = true, -- INJECT: see VERBS.Inject / VERBS.InjectHand
	AddCopy = true, RevealTopDeck = true, ChangeMusicNoFade = true, ChangeMusicSpeed = true, -- visual / information only (see the no-op list below)
	Berezaa = true, -- FIX: Bereghost "Explosive Spoils!" used this verb, which did not exist, so the whole ability (incl. its SetHealth) was skipped
	-- NEW (easy verbs): each of these used to make a whole ability get skipped
	SetCastRestriction = true, ResetHealth = true, BumpHealth = true, BumpPower = true, SetHealthModulo = true, SetPowerModulo = true, MultiplyVariable = true, StrengthenGrave = true, HealGrave = true, EndTurn = true, Oblierate = true, ClearChoices = true, NyarlQuips = true, JohnTimer = true, AddSpecialWinQuest = true, IgnoreRaidCastRule = true, DisableBypassLifeLoss = true, RunJournalistCameraEffect = true, TeammateDraw = true,
	TargetAddHealthBonus = true, -- FIX (Absentee Father, Xen ...): this verb didn't exist, so the whole ability was skipped (ForceCast / TargetAddStrengthenBonus are listed above)
}
local STUD_COLORS = { Neutral = true, Red = true, Green = true, Blue = true, Yellow = true }
local CARD_VERBS = { Damage = true, DamageOverloaded = true, PierceDamage = true, Heal = true, BoostHealth = true, Strengthen = true, Weaken = true, Destroy = true, Lock = true, Unlock = true, LockPulse = true, SetPower = true, Swap = true, Generate = true, CheckPower = true, SetHealth = true, MultiplyHealth = true, MultiplyPower = true, Suspend = true, GivePassive = true, RemovePassive = true, ExchangePower = true, ExchangeHealth = true, ReplaceEffect = true }
local CARD_TARGETS = {
	Self = true,
	Ally = true,
	Opponent = true,
	All = true,
	AlliedArchetype = true,
	AlliedRare = true, -- FIX (Bloxikin Horde): "all allied rare fighters"
	AlliedNotArchetype = true,
	Aggressor = true,
	GearOwner = true, -- FIX (Elixir of Dreams et al.): a gear's ability runs with the fighter it is attached to as its source, so this is "Self"
	SummonedCard = true,
	RandomOtherAllyField = true, -- FIX: Ray's death effect used this unknown target, so the whole ability was skipped
	Single = true,
	SingleEnemy = true,
	SingleAlly = true,
	HighestPower = true, -- FIX (Kariu et al.): every fighter tied for the highest power; was unknown, so the whole ability was skipped
	LowestHealth = true, LowestPower = true, HighestHealth = true, -- FIX (SirMing et al.): "each fighter with the lowest health / power"; unknown kinds made the whole ability get skipped
	EnemyLowestHealth = true, AlliedLowestPower = true, AllyHighestPower = true,
	AllyToken = true, -- FIX: "all allied token fighters" (Temporal Halo, Necro Syndicates' Bliss cards, CityTrek ...)
	LowestCost = true, HighestCost = true, EnemyLowestCost = true, EnemyHighestCost = true, AlliedLowestCost = true, AlliedHighestCost = true, -- FIX (Solar Conquest, Doom Spire): "each fighter with the lowest / highest total stud cost"
	CustomTarget = true, -- resolved from the ability's TargetParameters (see runnableOps / runAbility)
	-- INJECT: "a target (allied) fighter that costs 7 or fewer total studs"
	SingleSevenCostOrLess = true, AllySingleSevenCostOrLess = true, EnemySingleSevenCostOrLess = true,
}
-- INJECT: cost-limited single picks. base = the plain pick they behave like, max = highest total stud cost that can be picked.
local COST_KINDS = {
	SingleSevenCostOrLess = { base = "Single", max = 7 },
	AllySingleSevenCostOrLess = { base = "SingleAlly", max = 7 },
	EnemySingleSevenCostOrLess = { base = "SingleEnemy", max = 7 },
}
local function totalCost(def)
	local n = 0
	for _, v in pairs(def.Cost or {}) do
		if type(v) == "number" then
			n = n + v
		end
	end
	return n
end

local SPECIAL_CHECKS
local abilityCache = setmetatable({}, { __mode = "k" })
local function getAbilities(def)
	local cached = abilityCache[def]
	if cached then
		return cached
	end
	local list = {}
	local e = def.Effect
	if type(e) == "table" then
		if type(e.Ability) == "table" then
			for trigger, spec in pairs(e.Ability) do
				if type(spec) == "table" then
					table.insert(list, { trigger = trigger, spec = spec })
				end
			end
		elseif type(e.Type) == "string" and e.Power ~= nil then
			table.insert(list, {
				trigger = e.Type,
				spec = {
					Power = e.Power,
					Target = e.Target,
					Increase = e.Increase,
					Archetype = e.Archetype,
					EffectRequirement = e.EffectRequirement,
					TargetParameters = e.TargetParameters,
					TurnTriggerLimit = e.TurnTriggerLimit,
					TotalTriggerLimit = e.TotalTriggerLimit,
					MetaData = e.MetaData,
					EffectRandomDiscardShuffle = e.EffectRandomDiscardShuffle,
					EffectFleeting = e.EffectFleeting,
					Rarity = e.Rarity, -- FIX (Hoosierdaddy22): "Whenever you cast an EPIC fighter": the rarity filter was dropped, so every cast triggered
					SizeClass = e.SizeClass, -- FIX (Robotic Mob et al.): "total stats 1500 or more / 500 or less" filter was dropped for old-format effects
				},
			})
		end
	end
	table.sort(list, function(a, c)
		return a.trigger < c.trigger
	end)
	abilityCache[def] = list
	return list
end

-- Effect variable (EV): a small number an ability can set from a zone count / maths and then test.
local EV_ZONES = { Hand = "Hand", Field = "Field", GraveZone = "Graveyard", GenZone = "Baseplate", Deck = "Deck" }
local EV_SIDES = { Ally = true, Enemy = true, Opponent = true }
local EV_MATH = { Set = true, Add = true, Subtract = true, Multiply = true, Divide = true }
EV_MATH.__b = { Luckytux = true, Icytea = true, InBliss = true, HealthGain = true, LargerGrave = true, Red = true, Green = true, Blue = true, Yellow = true } -- (kept on EV_MATH: the file is at Luau's local limit)
-- FIX (Kilnkin Swimmer): {"Set"/"Add", "Playertable", "CastAction" | "CastGear" | "CastTerrain" | "CastFighter", "Nil"} = 1 if its owner has cast
-- a card of that type this turn (see noteCast), else 0. Value = the card kind playKind() reports.
local CAST_EV_KINDS = { CastAction = "Effect", CastGear = "Gear", CastTerrain = "Terrain", CastFighter = "Fighter" }
local DISCARD_TARGETS = { AlliedLeftMostHand = true, AlliedRightMostHand = true, EnemyLeftMostHand = true, EnemyRightMostHand = true, LeftMostHand = true, RightMostHand = true }

-- "Common", "Rare Fighter", "Yellow", "Any" ...: rarity / colour / kind words that pick a pool of cards. Returns nil for anything else.
local RARITY_WORDS = { Common = true, Uncommon = true, Rare = true, Epic = true, Legendary = true }
local COLOR_WORDS = { Neutral = true, Red = true, Green = true, Blue = true, Yellow = true }
local archetypeSet
local function isArchetypeWord(word)
	if not archetypeSet then
		archetypeSet = {}
		local lib = DeckUtil.GetLibrary()
		if lib then
			for _, d in pairs(lib) do
				if type(d) == "table" and type(d.Archetype) == "string" then
					archetypeSet[d.Archetype] = true
				end
			end
		end
	end
	return archetypeSet[word] == true
end

local function parsePoolSpec(str)
	if type(str) ~= "string" then
		return nil
	end
	local f = {}
	local any = false
	for rawWord in str:gmatch("%S+") do
		local word = rawWord:gsub("orNoAddBlock$", "") -- FIX: "YelloworNoAddBlock" etc: same filter (the add-block exception isn't modelled)
		if RARITY_WORDS[word] then
			f.rarity = word
		elseif COLOR_WORDS[word] then
			f.colors = f.colors or {}
			f.colors[word] = true
		elseif word == "Fighter" then
			f.kind = "Fighter"
		elseif word == "Action" or word == "Effect" then
			f.kind = "Effect"
		elseif word == "Any" then
			any = true
		elseif word == "Lunar" then
			f.lunar = true -- FIX: "Lunar" is a card tag (Lunar = true), not an archetype, so it used to make the whole spec invalid
		elseif word:find("^MonoOnlyor") or word:find("^MultiColOnlyor") then
			-- FIX: "MonoOnlyorGreenCost", "MultiColOnlyorGreenCostYellowCost" ... made parsePoolSpec return nil, so the whole
			-- effect (ROBLOX, Thug life, ...) was rejected. Meaning (ASSUMED): the card's cost uses no colour except the named ones.
			local allowed = { Neutral = true }
			for col in word:gmatch("(%u%l+)Cost") do
				allowed[col] = true
			end
			f.costColors = allowed
		elseif isArchetypeWord(word) then
			f.archetype = word -- FIX: "Lunar Fighter", "Police" ... an archetype name picks cards of that archetype
		else
			return nil
		end
	end
	if not any and not f.rarity and not f.colors and not f.kind and not f.archetype and not f.lunar then
		return nil
	end
	return f
end

local function costUsesOnly(cost, allowed)
	for color, amount in pairs(cost) do
		if not allowed[color] and (tonumber(amount) or 0) > 0 then
			return false
		end
	end
	return true
end

local function poolFor(f)
	local out = {}
	for _, name in ipairs(getAllPool()) do
		local d = DeckUtil.GetCard(name)
		if d and not d.Gear and not d.Blessing and not d.Requirement and type(d.Cost) == "table" and d.Original == nil then
			local k = cardType(d)
			if k ~= "Terrain" and (not f.rarity or d.Rarity == f.rarity) and (not f.colors or f.colors[d.Color]) and (not f.kind or k == f.kind) and (not f.costColors or costUsesOnly(d.Cost, f.costColors)) and (not f.archetype or d.Archetype == f.archetype) and (not f.lunar or d.Lunar == true) then
				table.insert(out, name)
			end
		end
	end
	return out
end

-- Each returns true only if the exact form of the op is one the engine really implements.
-- FIX: "GraveZone_Ally" -> "GraveZone", "Ally"; "Nil" -> "Nil".
local function parseZoneName(name)
	name = tostring(name)
	if name:lower() == "nil" then
		return "Nil", nil
	end
	local z, side = name:match("^(%a+)_(%a+)$")
	if z then
		return z, side
	end
	return tostring(name), nil
end

-- "Choose a card in a zone" (Demon Tutor and friends): { "AlterEV", { "Set", "Target", ... }, <source> } remembers a card
-- that a later { "MoveZone", { "Target", from, to } } moves. YOU choose the card in the client's card picker window (chooseCards);
-- effects owned by the NPC, and picks that time out, are still random.
local PICK_SOURCES = {
	TargetAllyDeck = { zone = "Deck", mine = true },
	TargetEnemyDeck = { zone = "Deck", mine = false },
	TargetAllyInGraveyard = { zone = "Graveyard", mine = true },
	TargetChoiceZone = { choice = true },
}

local choicePoolCache = {}
local function choicePool(archetype)
	local cached = choicePoolCache[archetype]
	if cached then return cached end
	local out = {}
	local lib = DeckUtil.GetLibrary()
	if not lib then return out end
	for libName, d in pairs(lib) do
		if type(libName) == "string" and type(d) == "table" and d.Rarity and d.Gear and d.Original == nil and d.Archetype == archetype then
			table.insert(out, libName)
		end
	end
	table.sort(out)
	choicePoolCache[archetype] = out
	return out
end

SPECIAL_CHECKS = {
	-- FIX (ajarbythedoor): only the blank-effect form {"ReplaceEffect", "Pet1"} is supported (the fighter loses all abilities)
	ReplaceEffect = function(op)
		return op[2] == "Pet1"
	end,
	CreateChoices = function(op)
		if type(op[2]) == "table" then -- FIX (Eyedeeuhs Djinn): a list of card names ("Blue Stud", "Red Stud" ...) = all of them are the choices
			if #op[2] == 0 then
				return false
			end
			for _, n in ipairs(op[2]) do
				if type(n) ~= "string" or not DeckUtil.GetCard(n) then
					return false
				end
			end
			return true
		end
		return type(op[2]) == "string" and #choicePool(op[2]) > 0
	end,
	-- FIX: Reset / Return act on fighters on the field. The number (30 etc.) is just an animation delay, so it is optional;
	-- a third entry that isn't a card target ("Epic", "Legendary"...) is a different, still unsupported, form.
	Obliterate = function(op, tk)
		return CARD_TARGETS[tk] == true
	end,
	TempStrengthen = function(op, tk)
		return CARD_TARGETS[tk] == true and (tonumber(op[2]) or 0) > 0
	end,
	-- FIX (v10): {"TempWeaken", n[, target]}: the mirror of TempStrengthen
	TempWeaken = function(op, tk)
		return CARD_TARGETS[tk] == true and (tonumber(op[2]) or 0) > 0
	end,
	-- FIX (v10): {"StrengthenHand" | "HealHand" | "ArchetypeHandStrengthen" | "ArchetypeHandHeal", n[, "Ally" | "Opponent"]}
	-- (positive amounts only; the -10000 "wipe the hand" form used by Lezus is still unsupported)
	StrengthenHand = function(op, tk)
		return (tk == "Ally" or tk == "Self" or tk == "Opponent") and (op[2] == "Variable" or (tonumber(op[2]) or 0) > 0) -- FIX (Overseer's Steed): "Variable" = the effect variable
	end,
	HealHand = function(op, tk)
		return (tk == "Ally" or tk == "Self" or tk == "Opponent") and (op[2] == "Variable" or (tonumber(op[2]) or 0) > 0) -- FIX (Overseer's Steed): "Variable" = the effect variable
	end,
	ArchetypeHandStrengthen = function(op, tk)
		return (tk == "Ally" or tk == "Self" or tk == "Opponent") and (op[2] == "Variable" or (tonumber(op[2]) or 0) > 0) -- FIX (Overseer's Steed): "Variable" = the effect variable
	end,
	ArchetypeHandHeal = function(op, tk)
		return (tk == "Ally" or tk == "Self" or tk == "Opponent") and (op[2] == "Variable" or (tonumber(op[2]) or 0) > 0) -- FIX (Overseer's Steed): "Variable" = the effect variable
	end,
	-- FIX (v10): {"RepeatingAdd", { "Card or def key", count | "Variable" }, "Ally"}
	RepeatingAdd = function(op, tk)
		local s = op[2]
		return tk ~= "Opponent" and type(s) == "table" and type(s[1]) == "string" and s[1] ~= "Variable" and (s[2] == "Variable" or tonumber(s[2]) ~= nil)
	end,
	-- FIX (v10): {"RepeatingRandomAdd", { {"Card A", "Card B"} | "Pool spec or archetype", count | "Variable" }, "Ally"}
	RepeatingRandomAdd = function(op, tk)
		local s = op[2]
		if type(s) ~= "table" or not (s[2] == "Variable" or tonumber(s[2]) ~= nil) then
			return false
		end
		if type(s[1]) == "string" then
			return true
		end
		if type(s[1]) ~= "table" or #s[1] == 0 then
			return false
		end
		for _, n in ipairs(s[1]) do
			if type(n) ~= "string" then
				return false
			end
		end
		return true
	end,
	-- FIX (v10): {"RandomEquipGear", {"Gear A", "Gear B"}, target}; the "Fighter" / "Terrain ..." string forms are still unsupported
	RandomEquipGear = function(op, tk)
		if type(op[2]) ~= "table" or #op[2] == 0 or CARD_TARGETS[tk] ~= true then
			return false
		end
		for _, n in ipairs(op[2]) do
			if type(n) ~= "string" then
				return false
			end
		end
		return true
	end,
	-- FIX (v11): {"AddCopy", 30, target}: give yourself a copy of the targeted fighter(s). Abilities with a MetaData block (smuggled copies,
	-- colour conversion, stat overrides...) still need rules this verb does not model, so they stay skipped rather than run wrong.
	AddCopy = function(op, tk, spec)
		return CARD_TARGETS[tk] == true and spec ~= nil and spec.MetaData == nil and (op[2] == nil or tonumber(op[2]) ~= nil)
	end,
	-- INJECT: {"Inject", 30, target}: needs a fighter target (see VERBS.Inject)
	Inject = function(op, tk)
		return CARD_TARGETS[tk] == true and tk ~= "CustomTarget"
	end,
	InjectHand = function(op, tk)
		return (tk == "Ally" or tk == "Self" or tk == "Opponent") and (op[2] == "Variable" or tonumber(op[2]) ~= nil)
	end,
	-- FIX (v10): {"ShuffleDeck", 30, "Ally" | "Opponent"}: the number is only an animation delay
	ShuffleDeck = function(op, tk)
		return tk == "Ally" or tk == "Self" or tk == "Opponent"
	end,
	SummonCopy = function(op, tk)
		return CARD_TARGETS[tk] == true and (op[2] == nil or tonumber(op[2]) ~= nil)
	end,
	SummonEnemyCopy = function(op, tk)
		return CARD_TARGETS[tk] == true and (op[2] == nil or tonumber(op[2]) ~= nil)
	end,
	-- {"Steal"[, 30][, "SingleEnemy"]}: the targeted fighters change sides
	Steal = function(op, tk)
		return CARD_TARGETS[tk] == true
	end,
	-- {"RandomDiscard", n, "Ally"|"Opponent"} / {"ArchetypeDiscard", n, "Ally"|"Opponent", "Archetype"}: cards leave a hand
	RandomDiscard = function(op, tk)
		return tonumber(op[2]) ~= nil
	end,
	ArchetypeDiscard = function(op, tk)
		return tonumber(op[2]) ~= nil and type(op[4]) == "string"
	end,
	-- {"DeckAdd", "Card Name"[, "Opponent"]}; the {"DeckAdd", "Variable", ...} form (card chosen by a saved variable) is still unsupported
	DeckAdd = function(op, tk)
		return type(op[2]) == "string" and op[2] ~= "Variable" and (op[3] == nil or op[3] == "Ally" or op[3] == "Self" or op[3] == "Opponent")
	end,
	-- {"RandomTutorfor", "Neodragon" | "Sinister Fighter" | "Rare Yellow"}; specs that need a computed cost ("...VariableorExactCost") are unsupported
	RandomTutorfor = function(op, tk)
		return type(op[2]) == "string" and not op[2]:find("Variable") and (op[3] == nil or op[3] == "Ally" or op[3] == "Self")
	end,
	Transform = function(op, tk)
		return type(op[2]) == "string" and CARD_TARGETS[tk] == true
	end,
	Reset = function(op, tk)
		return CARD_TARGETS[tk] == true and (op[2] == nil or tonumber(op[2]) ~= nil)
	end,
	Return = function(op, tk)
		return CARD_TARGETS[tk] == true and (op[2] == nil or tonumber(op[2]) ~= nil)
	end,
	-- FIX: MoveZone {mode, from, to, ...}: EffectTarget / BottomCard / TopCard, from Deck / GraveZone, to Nil / GraveZone / Hand / Field / GenZone
	MoveZone = function(op)
		local a = op[2]
		if type(a) ~= "table" then
			return false
		end
		-- SEANCE: {"MoveZone", {"4OrLower"|"200OrLower_IsFair", "GraveZone_Ally", "Field_Ally", ...}, "Self", nil, nil, nil, "Seance"}
		if op[7] == "Seance" and type(a[1]) == "string" and a[1]:match("^%d+OrLower") then
			return parseZoneName(a[2]) == "GraveZone" and parseZoneName(a[3]) == "Field"
		end
		-- FIX (Funeral Eulogist): {"Ranked", "<zone>_Ally", "<zone>_Ally", ...} = pick a ranked card (has a Rank) from the deck / graveyard
		if a[1] == "Ranked" then
			local rf, rt = parseZoneName(a[2]), parseZoneName(a[3])
			return (rf == "Deck" or rf == "GraveZone") and (rt == "Hand" or rt == "GraveZone" or rt == "Nil")
		end
		-- FIX (Astarossa Van Buren): {"VariableOrLower", "GraveZone_Ally", "Hand_Ally", ...} = inject a graveyard fighter that costs the EV or fewer studs
		if a[1] == "VariableOrLower" then
			return parseZoneName(a[2]) == "GraveZone" and parseZoneName(a[3]) == "Hand"
		end
		-- FIX (Overseer Godhand): {"Fighter_VariableOrLowerHealth", "GraveZone_Ally", "Hand_Ally", ...} = recur graveyard fighters whose health is
		-- the effect variable or lower
		if a[1] == "Fighter_VariableOrLowerHealth" then
			return parseZoneName(a[2]) == "GraveZone" and parseZoneName(a[3]) == "Hand"
		end
		-- FIX (Secret_Purple2): {"Variable", "GenZone_Ally", "Nil", ...} = obliterate the baseplate cards the ability picked (ZoneTargetParameters)
		if a[1] == "Variable" and parseZoneName(a[2]) == "GenZone" and parseZoneName(a[3]) == "Nil" then
			return true
		end
		if type(a[1]) == "string" and DeckUtil.GetCard(a[1]) and parseZoneName(a[2]) == "GraveZone"
			and (parseZoneName(a[3]) == "Nil" or parseZoneName(a[3]) == "Hand") then
			return a[6] == nil or (tonumber(a[6]) ~= nil and tonumber(a[6]) > 0)
		end
		if type(a[1]) == "string" and a[1] ~= "EffectTarget" and a[1] ~= "BottomCard" and a[1] ~= "TopCard" and a[1] ~= "Target" and parseZoneName(a[3]) == "Field" then
			local nz = parseZoneName(a[2])
			return nz == "Hand" or nz == "Deck" or nz == "GraveZone" or nz == "GenZone"
		end
		if a[1] ~= "EffectTarget" and a[1] ~= "BottomCard" and a[1] ~= "TopCard" and a[1] ~= "Target" then
			return false
		end
		local fz = parseZoneName(a[2])
		local tz = parseZoneName(a[3])
		-- FIX (Glaggling Gunman): {"EffectTarget", "Field_Opponent", "GraveZone_Ally"} = put a COPY of the targeted fighter into a graveyard
		if fz == "Field" and a[1] == "EffectTarget" and tz == "GraveZone" then
			return true
		end
		-- INJECT: {"EffectTarget", "GenZone_Ally", "Hand_Ally", ...} = inject the baseplate cards the ability picked (Disenfranchise)
		if a[1] == "EffectTarget" and fz == "GenZone" and tz == "Hand" then
			return true
		end
		if fz ~= "Deck" and fz ~= "GraveZone" then
			return false
		end
		return tz == "Nil" or tz == "GraveZone" or tz == "Hand" or tz == "Field" or tz == "GenZone"
	end,
	-- FIX: {"GraveDestroy", 30, "CustomZoneTarget"}: Obliterate the cards picked by the ability's ZoneTargetParameters.
	GraveDestroy = function(op, tk)
		return tk == "CustomZoneTarget" or tk == "CustomTarget"
	end,
	-- FIX: {"RandomTransform", "Fighter", target}: each target becomes a random fighter.
	-- FIX (Havaluvian Blackmarketeer): {"RandomTransform", "Lunar", target}: each target becomes a random Blue or Red Lunar action (see VERBS.RandomTransform).
	RandomTransform = function(op, tk)
		return (op[2] == "Fighter" or op[2] == "Lunar") and CARD_TARGETS[tk] == true
	end,
	-- FIX: {"IncreaseCost", { amount, "Colour", "Nil" | "CapCost", cap }, target}: change one colour of a card's cost.
	-- Supported targets: Self, the picked zone cards (hand) and the picked field cards. ("AddedCard" needs AddCopy, which doesn't exist.)
	IncreaseCost = function(op, tk)
		local a = op[2]
		return type(a) == "table" and tonumber(a[1]) ~= nil and type(a[2]) == "string" and STUD_COLORS[a[2]] == true
			and (tk == "Self" or tk == "CustomZoneTarget" or tk == "CustomTarget")
	end,
	-- NEW: GraveAdd {"GraveAdd", "GraveAddant"}: a copy of the card named by the source's GraveAddant (or a plain card name) goes into the graveyard.
	-- NEW: {"Ban", n[, "Opponent"]}: the target player loses n life (wiki)
	Ban = function(op, tk)
		return (tonumber(op[2]) or 0) > 0 and (tk == "Opponent" or tk == "Ally" or tk == "Self")
	end,
	-- NEW: {"ForceTrigger", "OnEnd"}: every allied fighter fires that trigger (CustomTarget form still unsupported)
	ForceTrigger = function(op, tk)
		return type(op[2]) == "string" and op[2]:sub(1, 2) == "On" and (tk == "Ally" or tk == "Self" or tk == "Opponent")
	end,
	-- NEW: {"SetCost", { n, "Colour" }, "Self"}
	SetCost = function(op, tk)
		local a = op[2]
		return type(a) == "table" and tonumber(a[1]) ~= nil and type(a[2]) == "string" and STUD_COLORS[a[2]] == true
			and (tk == "Self" or tk == "CustomZoneTarget")
	end,
	-- NEW: {"StrengthenTargetInHand" | "HealTargetInHand", n, "CustomZoneTarget"}: the fighters you picked in a zone
	StrengthenTargetInHand = function(op, tk)
		return tk == "CustomZoneTarget" and (tonumber(op[2]) or 0) > 0
	end,
	HealTargetInHand = function(op, tk)
		return tk == "CustomZoneTarget" and (tonumber(op[2]) or 0) > 0
	end,
	-- NEW: {"RemoveDeck", n}: obliterate the top n cards of a deck
	RemoveDeck = function(op, tk)
		return (tk == "Ally" or tk == "Self" or tk == "Opponent") and (tonumber(op[2]) or 0) > 0
	end,
	-- NEW: {"MoveGenZone"[, 30, "All" | "Opponent" ...]}: fighters go into their owner's baseplate
	MoveGenZone = function(op, tk)
		return CARD_TARGETS[tk] == true
	end,
	-- NEW: {"GraveZoneDiscard", {"Blue", 0}[, "Opponent"]}: a colour and a number (0 = all of that colour)
	GraveZoneDiscard = function(op, tk)
		local a = op[2]
		return type(a) == "table" and type(a[1]) == "string" and STUD_COLORS[a[1]] == true and type(a[2]) == "number" and a[2] <= 0
			and (tk == "Opponent" or tk == "Ally" or tk == "Self" or tk == "All")
	end,
	RandomGraveAdd = function(op)
		if type(op[2]) == "table" then
			if #op[2] == 0 then
				return false
			end
			for _, n in ipairs(op[2]) do
				if type(n) ~= "string" then
					return false
				end
			end
			return true
		end
		return parsePoolSpec(op[2]) ~= nil
	end,
	GraveAdd = function(op)
		return type(op[2]) == "string"
	end,
	-- FIX (v14): a non-empty list of card names ({"New Recruit", "New Recruit2", ...}: Revel of the Pits, Cat Cafe, Science!!)
	-- was rejected here, so the whole ability was skipped. The verb now picks one of the listed cards.
	RandomSummon = function(op)
		if type(op[2]) == "table" then
			if #op[2] == 0 then
				return false
			end
			for _, n in ipairs(op[2]) do
				if type(n) ~= "string" then
					return false
				end
			end
			return true
		end
		return op[2] == "Fighter"
	end,
	-- FIX: {"RandomAdd", {"Doge", "Captain Doge", ...}} (a list of card names, e.g. PEEPSTERS / Kolby2020) was rejected, so the
	-- whole ability was skipped. A non-empty list of strings is now valid; the verb picks one of them that exists in the library.
	RandomAdd = function(op)
		if type(op[2]) == "table" then
			if #op[2] == 0 then
				return false
			end
			for _, n in ipairs(op[2]) do
				if type(n) ~= "string" then
					return false
				end
			end
			return true
		end
		return op[2] == "Fighter Variable" or parsePoolSpec(op[2]) ~= nil -- FIX (Peaspod): "Fighter Variable" = a fighter of the archetype saved by AlterEV
	end,
	-- FIX (Absentee Father): {"ForceCast", {"Variable"}} casts the gear picked by the AlterEV SetRandomTableValue before it
	ForceCast = function(op)
		return type(op[2]) == "table" and op[2][1] == "Variable"
	end,
	AlterEV = function(op)
		-- FIX (Kathara Sojourner): {"Set"|"Add", "Target", "Health", "Nil"}, "Single": EV = the health of the fighter this ability targeted
		if type(op[2]) == "table" and (op[2][1] == "Set" or op[2][1] == "Add") and op[2][2] == "Target" and op[2][3] == "Health" and (op[3] == "Single" or op[3] == "SingleAlly" or op[3] == "SingleEnemy") then
			return true
		end
		-- FIX (Twinedhealer89): {"Save"|"Load", "Target", "Color", "<slot>"}: remember / recall the colour of the targeted fighter
		if type(op[2]) == "table" and (op[2][1] == "Save" or op[2][1] == "Load") and op[2][2] == "Target" and op[2][3] == "Color" then
			return true
		end
		-- FIX (Twinedhealer89): {"Add"|"Subtract", "Playertable", "ObliterateCount", "Nil"}: EV += / -= the obliterate counter
		if type(op[2]) == "table" and (op[2][1] == "Add" or op[2][1] == "Subtract") and op[2][2] == "Playertable" and (op[2][3] == "TotalObliterateCount" or op[2][3] == "ObliterateCount") then
			return true
		end
		-- FIX (Absentee Father): {"SetRandomTableValue", "Math", { "Name A", "Name B" ... }, "Nil"}: pick one of the names at random
		if type(op[2]) == "table" and op[2][1] == "SetRandomTableValue" and type(op[2][3]) == "table" and #op[2][3] > 0 then
			return true
		end
		-- FIX (Peaspod): {"Set", "Target", "Archetype", "Nil"} (no op[3]): remember the archetype of the targeted fighter
		if type(op[2]) == "table" and op[2][1] == "Set" and op[2][2] == "Target" and op[2][3] == "Archetype" and (op[3] == nil or op[3] == "GearOwner") then
			return true
		end
		-- FIX (Regent of Warped Mud, Moonlit Fauna): EV = the card space the cast card came from / the cast card's Power
		if type(op[2]) == "table" and op[2][1] == "Set" and op[2][2] == "Target" and (op[2][3] == "HandOrigin" or op[2][3] == "Power") and (op[3] == nil or (op[3] == "Self" and op[2][3] == "Power")) then
			return true
		end
		-- PATCH (Extant Archaeopteryx): EV = Extant fighters that have died since your last end step
		if type(op[2]) == "table" and op[2][1] == "Set" and op[2][2] == "Playertable" and op[2][3] == "ExtantDeathCount" then
			return true
		end
		-- FIX (Shimmering Moonstone, Explore The Depths, Essence Brewer ...): EV = number of blessings you have
		if type(op[2]) == "table" and op[2][1] == "Set" and op[2][2] == "Playertable" and op[2][3] == "ModifiedHandSlots" then
			return true
		end
		-- FIX (Cheshire): {"Save"/"Load", "EffectVariable", "nil", "<slot>"}
		if type(op[2]) == "table" and (op[2][1] == "Save" or op[2][1] == "Load") and op[2][2] == "EffectVariable" and type(op[2][4]) == "string" then
			return true
		end
		-- FIX (Necro Syndicates): EV = 1 while you're in Bliss, else 0 (followed by EVGreaterValueCheck 0)
		if type(op[2]) == "table" and op[2][1] == "Set" and op[2][2] == "Playertable" and op[2][3] == "Bliss" then
			return true
		end
		if type(op[2]) == "table" and (op[2][1] == "Gate" or op[2][1] == "Cap") and op[2][2] == "Math" and type(op[2][3]) == "number" then
			return true
		end
		if type(op[2]) == "table" and op[2][1] == "Set" and op[2][2] == "Playertable" and (op[2][3] == "TotalObliterateCount" or op[2][3] == "ObliterateCount") then
			return true
		end
		if type(op[2]) == "table" and (op[2][1] == "ResetRansack" or (op[2][1] == "Set" and op[2][2] == "Target" and op[2][3] == "RansackCount")) then
			return true
		end
		local a = op[2]
		-- FIX (Absentee Father): {"SetRandomTableValue", "Math", { "Card A", "Card B", ... }, "Nil"}, "Self": remember one random card name
		if type(a) == "table" and a[1] == "SetRandomTableValue" and type(a[3]) == "table" and #a[3] > 0 and (op[3] == nil or op[3] == "Self") then
			return true
		end
		-- FIX (Eisenhower World Ablaze et al.): EV = number of colours in a card's stud cost; {"Load", "Math", 0, "<slot>"} recalls a saved EV
		if type(a) == "table" and a[1] == "Set" and a[2] == "Target" and a[3] == "CostColors"
			and (op[3] == nil or op[3] == "Self" or op[3] == "Aggressor" or op[3] == "CustomTarget") then
			return true
		end
		if type(a) == "table" and a[1] == "Load" and a[2] == "Math" and type(a[4]) == "string" then
			return true
		end
		-- "does the attacked fighter have Marked" check (RaidCards: {"Set","Target","IsMarked","Nil"}, "Aggressor")
		if type(a) == "table" and a[1] == "Set" and a[2] == "Target" and a[3] == "IsMarked" and op[3] == "Aggressor" then
			return true
		end
		-- FIX (Astarossa Van Buren): {"Set", "Target", "Cost", "Nil"}, "Aggressor": EV = the total stud cost of the card that was cast
		if type(a) == "table" and a[1] == "Set" and a[2] == "Target" and a[3] == "Cost" and (op[3] == "Aggressor" or op[3] == "CustomTarget") then
			return true
		end
		-- Dogsbody: remember the attacked card's name
		if type(a) == "table" and a[1] == "Set" and a[2] == "Target" and (a[3] == "CardIndex" or a[3] == "CardIndexOriginal") and op[3] == "Aggressor" then
			return true -- FIX (marbleycake): "CardIndexOriginal" = the card's base name, whatever art / printing it is
		end
		-- FIX (Secret_Purple2): remember the name of the card picked by the ability's ZoneTargetParameters
		if type(a) == "table" and a[1] == "Set" and a[2] == "Target" and a[3] == "CardIndex" and op[3] == "CustomZoneTarget" then
			return true
		end
		if type(a) == "table" and a[1] == "Set" and a[2] == "Target" and PICK_SOURCES[op[3]] then
			return true
		end
		-- FIX (Overseers): {"Set"|"Add", "Target", "Health", "Nil"}[, "Self"]: EV = this card's current health (Prophet, Steed, Drake, Beast, Godhand)
		if type(a) == "table" and (a[1] == "Set" or a[1] == "Add") and a[2] == "Target" and a[3] == "Health" and (op[3] == nil or op[3] == "Self") then
			return true
		end
		-- FIX (Kilnkin Behemoth / Wheeler / Heart / Sergeant, Isolation Border Patrol): EV = number of gears on the fighter (optionally only
		-- those with a given name). Source is the fighter itself (or the Aggressor).
		if type(a) == "table" and a[1] == "Set" and a[2] == "Target" and (op[3] == nil or op[3] == "Self" or op[3] == "Aggressor") then
			if a[3] == "EquippedGearCount" or (a[3] == "SpecificEquippedGearCount" and type(a[4]) == "string") then
				return true
			end
		end
		-- FIX (General's Firerate Boost): EV = number of gears on YOUR TERRAIN
		if type(a) == "table" and a[1] == "Set" and a[2] == "Target" and a[3] == "EquippedGearCount" and op[3] == "AllyTerrain" then
			return true
		end
		-- FIX (Kilnkin Sergeant): {"Save"/"Load", "Target", "CardInstance", "<slot>"}: remember / recall a fighter inside one trigger chain
		if type(a) == "table" and (a[1] == "Save" or a[1] == "Load") and a[2] == "Target" and a[3] == "CardInstance" and type(a[4]) == "string" then
			return true
		end
		-- FIX (Kilnkin Swimmer): EV from the card types cast this turn
		if type(a) == "table" and (a[1] == "Set" or a[1] == "Add") and a[2] == "Playertable" and CAST_EV_KINDS[a[3]] ~= nil then
			return true
		end
		if type(a) ~= "table" or not EV_MATH[a[1]] then
			return false
		end
		if a[2] == "Math" then
			return type(a[3]) == "number"
		end
		local zone, side = tostring(a[2]):match("^(%a+)_(%a+)$")
		-- FIX (Cheshire): was `a[1] == "Set"` only, so {"Subtract", "GraveZone_Ally", "All"} (opponent's graveyard minus yours) made the whole
		-- ability get skipped. VERBS.AlterEV already does Set / Add / Subtract / Multiply / Divide with a zone count.
		local filter = a[3] == "Action" or (type(a[3]) == "string" and DeckUtil.GetCard(a[3]) ~= nil)
		return zone ~= nil and EV_ZONES[zone] ~= nil and EV_SIDES[side] == true
			and (a[3] == "All" or ((zone == "GenZone" or zone == "Field") and STUD_COLORS[a[3]] == true) -- FIX (wish_z): {"Set", "Field_Ally", "<Colour>", "Nil"}
				or (a[3] == "Rarity" and type(a[4]) == "string") -- FIX (Bloxikin Horde): {"Set"/"Add", "<Zone>_Ally", "Rarity", "Rare"}
				or filter)
	end,
	-- FIX (Cheshire, Zombified Chimera summoner): { threshold, "InBliss" | "HealthGain" | "LargerGrave" } = a check whose result fires the follow-up
	-- named OnEVCheckPass<Name> / OnEVCheckFail<Name> instead of the plain OnEVCheckPass / OnEVCheckFail. Only these three names are supported.
	EVGreaterValueCheck = function(op)
		local a = op[2]
		if type(a) == "table" then
			return type(a[1]) == "number" and EV_MATH.__b[a[2]] == true
		end
		return type(a) == "number"
	end,
	EVExactValueCheck = function(op)
		local a = op[2]
		if type(a) == "table" then
			if type(a[1]) == "string" and type(a[2]) == "string" and a[2]:sub(1, 6) == "Select" then
				return true -- FIX (Eyedeeuhs Djinn): { "Red", "SelectRed" } = the colour picked was Red
			end
			return type(a[1]) == "number" and EV_MATH.__b[a[2]] == true
		end
		return type(a) == "number" or type(a) == "string" -- FIX (Rochas313 / Nosoi): "Tree" = compare against the archetype saved by AlterEV
	end,
	SpecificDiscard = function(op)
		return DISCARD_TARGETS[op[3]] == true and type(op[2]) == "number"
	end,
	RandomDeckAdd = function(op)
		if type(op[2]) == "string" then return parsePoolSpec(op[2]) ~= nil end
		return type(op[2]) == "table" and #op[2] > 0
	end,
	CheckPower = function(op)
		return type(op[2]) == "table" and type(op[2][1]) == "number" and type(op[2][2]) == "number"
	end,
	ReplaceColor = function(op, tk)
		return STUD_COLORS[op[2]] == true and CARD_TARGETS[tk] == true
	end,
	BypassAction = function()
		return true
	end,
	EquipGear = function(op, tk)
		if op[2] == "Variable" then
			return CARD_TARGETS[tk] == true
		end
		local d = type(op[2]) == "string" and DeckUtil.GetCard(op[2])
		if not d then
			return type(op[2]) == "string" and CARD_TARGETS[tk] == true -- name comes from the card's own field ("Equippant")
		end
		return d.Gear and CARD_TARGETS[tk] or false
	end,
	DestroyGear = function(op, tk)
		return CARD_TARGETS[tk] and (type(op[2]) == "number" or type(op[2]) == "string") or false
	end,
	-- FIX (Kilnkin Sergeant): {"RandomMoveGear", {"Variable", "<gear name>", true}, "Self"}: needs the gear's name
	RandomMoveGear = function(op, tk)
		return type(op[2]) == "table" and type(op[2][2]) == "string" and CARD_TARGETS[tk] == true
	end,
	BypassAttack = function()
		return true
	end,
	BypassSummon = function()
		return true
	end,
	CheckHealth = function(op)
		return type(op[2]) == "table" and type(op[2][1]) == "number" and type(op[2][2]) == "number"
	end,
	BypassUltra = function(op)
		return tonumber(op[2]) ~= nil
	end,
	-- FIX: {"GenZoneDiscard", {"Red", -1}}: a colour (or "Neutral") and a number
	GenZoneDiscard = function(op)
		return type(op[2]) == "table" and type(op[2][1]) == "string" and type(op[2][2]) == "number"
	end,
}

-- FIX: EffectRequirement was always skipped. Supported form: { "Archetype", "Ally"|"Enemy", min, max, "Name" } (or a list of them)
-- = the number of fighters of that archetype in play on that side must be within min..max.
local VERBS
local function reqList(r)
	if type(r) ~= "table" then
		return nil
	end
	local list = (type(r[1]) == "table") and r or { r }
	-- FIX (PixelFlame): { "Board", "Ally", 2 } has no max: it means "2 or more". It was rejected, so the whole ability was skipped.
	local out = {}
	for i, q in ipairs(list) do
		if type(q) == "table" and q[1] == "Board" and q[4] == nil and tonumber(q[3]) ~= nil then
			q = { q[1], q[2], q[3], 9999, q[5] }
		end
		out[i] = q
	end
	return out
end
-- FIX: more EffectRequirement forms. { kind, side, min, max [, extra] }.
--   side: Ally / Enemy / Opponent (fighters), AllyGenZone / OpponentGenZone (baseplate), AllyGraveZone / OpponentGraveZone,
--         AllyHand / OpponentHand, or Me / Him for the Playertable form.
--   Archetype(extra = archetype)  Board (count)  Color / NotColor (extra = colour)  HasPower (extra = power)
--   Deck (cards in the deck)  Playertable with extra "IconsYellow" etc. (studs of that colour)
-- Anything else (TargetCount, MyTurn, gear / terrain / passive checks ...) is still unsupported and the ability is skipped.
local REQ_SIDES = {
	Ally = { false, "Field" }, Enemy = { true, "Field" }, Opponent = { true, "Field" },
	AllyGenZone = { false, "Baseplate" }, EnemyGenZone = { true, "Baseplate" }, OpponentGenZone = { true, "Baseplate" },
	AllyGraveZone = { false, "Graveyard" }, EnemyGraveZone = { true, "Graveyard" }, OpponentGraveZone = { true, "Graveyard" },
	AllyHand = { false, "Hand" }, EnemyHand = { true, "Hand" }, OpponentHand = { true, "Hand" },
}
local function reqSupported(r)
	local list = reqList(r)
	if not list or #list == 0 then
		return false
	end
	for _, q in ipairs(list) do
		if type(q) ~= "table" or tonumber(q[3]) == nil or tonumber(q[4]) == nil then
			return false
		end
		local kind = q[1]
		if kind == "Archetype" or kind == "TokenArchetype" or kind == "Color" or kind == "NotColor" then
			if type(q[5]) ~= "string" or not REQ_SIDES[q[2]] then
				return false
			end
		elseif kind == "Board" then
			if not REQ_SIDES[q[2]] then
				return false
			end
		elseif kind == "HasPower" then
			if tonumber(q[5]) == nil or not REQ_SIDES[q[2]] then
				return false
			end
		elseif kind == "Deck" then
			if q[2] ~= "Ally" and q[2] ~= "Opponent" and q[2] ~= "Enemy" then
				return false
			end
		elseif kind == "Playertable" then
			if (q[2] ~= "Me" and q[2] ~= "Him") or type(q[5]) ~= "string" or not (q[5] == "DiscardCount" or q[5] == "Crowd's Favour" or q[5] == "Bliss" or q[5] == "Modified Hand Slots" or q[5] == "InModifiedSlot" or q[5] == "Life" or q[5] == "Actions" or STUD_COLORS[q[5]:match("^Icons(%a+)$") or ""]) then
				return false
			end
		elseif kind == "SelfGear" then
			-- FIX (Regent of Warped Mud): { "SelfGear", "HasGear", 0, 1 } = this card carries at least min and fewer than max gears (0, 1 = "no gear on this card")
		else
			return false
		end
	end
	return true
end
local function reqMet(b, card, r)
	for _, q in ipairs(reqList(r)) do
		local kind = q[1]
		local n = 0
		if kind == "Deck" then
			local owner = q[2] == "Ally" and card.owner or other(card.owner)
			n = #(b.decks[owner] or {})
		elseif kind == "Playertable" then
			local owner = q[2] == "Me" and card.owner or other(card.owner)
			if q[5] == "DiscardCount" then
				n = (owner == "You") and (b.discardsThisTurn or 0) or 0
			elseif q[5] == "Crowd's Favour" then
				-- Kara Sinister: 30 while that side has the crowd's favour (the requirement range is 30-69), else 0
				n = (b.flags[owner] and b.flags[owner].CrowdsFavour) and 30 or 0
			elseif q[5] == "Bliss" then
				-- FIX (Necro Syndicates): 30 while that side is in Bliss (the requirement range is 30-69), else 0
				n = (b.flags[owner] and b.flags[owner].Bliss) and 30 or 0
			elseif q[5] == "Modified Hand Slots" then
				n = VERBS.__blessCount(b, owner) -- FIX: "if you have 3 or more blessings"
			elseif q[5] == "Life" then
				n = b.life[owner] or 0
			elseif q[5] == "Actions" then
				-- FIX (EvilJacobthehero2013): 1 once that side has cast an action this turn (haste requirement 1-9999)
				n = (b.castTypes and b.castTypes[owner] and b.castTypes[owner].Effect) and 1 or 0
			elseif q[5] == "InModifiedSlot" then
				n = VERBS.__blessInSlot(b, card) and 1 or 0 -- FIX (Farseeker Guardsman): "if this card is in your hand in a blessed card space"
			else
				n = (b.studs[owner] and b.studs[owner][q[5]:match("^Icons(%a+)$")]) or 0
			end
		elseif kind == "SelfGear" then
			local g = #(card.gears or {}) -- FIX (Regent of Warped Mud)
			n = (g >= tonumber(q[3]) and g < tonumber(q[4])) and tonumber(q[3]) or -1
		elseif kind == "Board" and type(q[5]) == "string" and q[5]:find("^BoardContainsIndex_") then
			-- FIX (Perfected Immortality): "BoardContainsIndex_<card name>" counts only fighters of that card (any printing); it used to count every fighter
			local want = q[5]:match("^BoardContainsIndex_(.+)$")
			local side = REQ_SIDES[q[2]]
			local owner = side[1] and other(card.owner) or card.owner
			for _, c in ipairs(inZone(b, owner, side[2])) do
				if baseKey(c.lib) == want or c.def.Name == want then
					n = n + 1
				end
			end
		elseif kind == "Board" and q[5] == "Rage" then
			local side = REQ_SIDES[q[2]]
			local owner = side[1] and other(card.owner) or card.owner
			for _, c in ipairs(inZone(b, owner, "Baseplate")) do
				if baseKey(c.lib) == "RageIndicator" then
					n = n + 1
				end
			end
		else
			local side = REQ_SIDES[q[2]]
			local owner = side[1] and other(card.owner) or card.owner
			for _, c in ipairs(inZone(b, owner, side[2])) do
				if kind == "Board" then
					-- FIX (Perfected Immortality, Lunar Impact, Raids): "BoardContainsIndex_<name>" counts only the fighters with that name
					local want = type(q[5]) == "string" and q[5]:match("^BoardContainsIndex_(.+)$")
					if q[5] == "Zombified" then
						-- FIX (Vonderland): { "Board", "Ally", 1, 9999, "Zombified" } = "if there's an allied Zombified fighter"; it counted every fighter
						if c.def.Zombified and not c.obliterated then
							n = n + 1
						end
					elseif not want or c.lib == want or c.lib == want .. "-D" or c.def.Name == want or c.def.Original == want then
						n = n + 1
					end
				elseif kind == "Archetype" then
					if c.def.Archetype == q[5] then
						n = n + 1
					end
				elseif kind == "TokenArchetype" then
					if c.def.Archetype == q[5] and (c.def.Token or c.def.TokenOmni or (c.extra and (c.extra.Token or c.extra.TokenOmni))) then
						n = n + 1
					end
				elseif kind == "Color" then
					if c.def.Color == q[5] then
						n = n + 1
					end
				elseif kind == "NotColor" then
					if c.def.Color ~= q[5] then
						n = n + 1
					end
				elseif kind == "HasPower" then
					if c.power >= tonumber(q[5]) then
						n = n + 1
					end
				end
			end
		end
		-- BoardContainsIndex ranges are [min, max): { 0, 1 } = "none", { 1, 9 } = "at least one"
		local idx = kind == "Board" and type(q[5]) == "string" and q[5]:find("^BoardContainsIndex_") ~= nil
		-- FIX (Disaster Survival): the DiscardCount range is [min, max) too: { 2, 3 } is "your SECOND discard" (it also fired on the third),
		-- { 3, 4 } the third, { 0, 4 } fewer than four. (The card data written with 9999 as max is unaffected.)
		if kind == "Playertable" and q[5] == "DiscardCount" then
			idx = true
		end
		if n < tonumber(q[3]) or (idx and n >= tonumber(q[4])) or (not idx and n > tonumber(q[4])) then
			return false
		end
	end
	return true
end

-- FIX (Perigee Visionary): ChargeRequirement = the card has haste while the requirement is met (3+ blessings in your hand).
RULES.ChargeReqCheck = function(b, card)
	local r = card.def.ChargeRequirement
	return r ~= nil and reqSupported(r) and reqMet(b, card, r)
end
-- FIX (Blood Moon Seeker): AlternateCostRequirement = the card can be cast ignoring AlternateCost.IgnoreColor.
RULES.AltCostCheck = function(b, card)
	local r = card.def.AlternateCostRequirement
	return type(card.def.AlternateCost) == "table" and r ~= nil and reqSupported(r) and reqMet(b, card, r)
end

-- FIX: TargetParameters was always skipped. Supported: field-only targeting
--   { Zones = {"Ally_Field"/"Enemy_Field"}, Condition = nil/{}/"All"/"RandomCard"/"Rarities"/"OtherCards"/"Archetype", Modifier = ... }
-- Zone targets (graveyard / hand / deck / baseplate / choice zone) and gear / passive conditions are still skipped.
local TP_CONDITIONS = { EquippedGears = true, All = true, RandomCard = true, Rarities = true, OtherCards = true, Archetype = true, LowestStat = true, HighestStat = true, SizeClass = true, NotHealth = true }
-- FIX: zone targeting (graveyard / deck / hand). Conditions: All / BottomCard / TopCard or a table of known filters.
local ZONE_PARAM = { Ally_GraveZone = "Graveyard", Enemy_GraveZone = "Graveyard", Ally_Deck = "Deck", Enemy_Deck = "Deck", Ally_Hand = "Hand", Enemy_Hand = "Hand", Ally_GenZone = "Baseplate", Enemy_GenZone = "Baseplate" }
local ZCOND_KEYS = { Gear = true, NotRarity = true, Fighter = true, NotFighter = true, Colored = true, CostOrMore = true, CostOrLess = true, Archetype = true, HasDied = true, TopCard = true, HasntPassive = true, NotMatchesParameter = true }
-- Returns "field", "zone" or nil (unsupported).
local function tpKind(tp)
	if type(tp) ~= "table" or type(tp.Zones) ~= "table" or #tp.Zones == 0 then
		return nil
	end
	local fields, zones = 0, 0
	for _, z in ipairs(tp.Zones) do
		if z == "Ally_Field" or z == "Enemy_Field" then
			fields = fields + 1
		elseif ZONE_PARAM[z] then
			zones = zones + 1
		else
			return nil
		end
	end
	local c = tp.Condition
	if zones > 0 then
		if fields > 0 then
			return nil
		end
		if c == nil then
			return "zone"
		end
		if type(c) == "string" then
			return (c == "All" or c == "BottomCard" or c == "TopCard" or c == "RandomLowestCost") and "zone" or nil
		end
		if type(c) ~= "table" then
			return nil
		end
		for k in pairs(c) do
			if not ZCOND_KEYS[k] then
				return nil
			end
		end
		return "zone"
	end
	if c == nil or (type(c) == "table" and next(c) == nil) then
		return "field"
	end
	if type(c) ~= "string" or not TP_CONDITIONS[c] then
		return nil
	end
	if c == "Rarities" then
		return (type(tp.Modifier) == "table" and type(tp.Modifier.Rarities) == "table") and "field" or nil
	elseif c == "Archetype" then
		return type(tp.Modifier) == "string" and "field" or nil
	elseif c == "RandomCard" then
		return (tp.Modifier == nil or tonumber(tp.Modifier) ~= nil) and "field" or nil
	elseif c == "LowestStat" or c == "HighestStat" then
		-- FIX (Lunar Impact): { Condition = "LowestStat", Modifier = "Health" | "Power" | "Cost" }: every fighter tied for the extreme
		return (tp.Modifier == "Health" or tp.Modifier == "Power" or tp.Modifier == "Cost") and "field" or nil
	elseif c == "SizeClass" then
		-- FIX (Fluzard, Neme-shot): { Condition = "SizeClass", Modifier = "Gigant" | "Picant" } on field zones
		return (tp.Modifier == "Gigant" or tp.Modifier == "Picant") and "field" or nil
	elseif c == "NotHealth" then
		-- FIX (The Ratcatcher): { Condition = "NotHealth", Modifier = 250 }: every fighter with that much health or less
		return tonumber(tp.Modifier) ~= nil and "field" or nil
	end
	return "field"
end
local function tpSupported(tp)
	-- FIX (General's Firerate Boost): { Zones = {"Ally_Terrain"}, Condition = "EquippedGears" } is handled by VERBS.Generate itself
	if type(tp) == "table" and type(tp.Zones) == "table" and #tp.Zones == 1 and tp.Zones[1] == "Ally_Terrain" and tp.Condition == "EquippedGears" then
		return true
	end
	return tpKind(tp) ~= nil
end

-- Returns the list of operations, or nil if this ability can't be run safely.
local function runnableOps(spec)
	-- FIX (Secret_Purple2): it carries both TargetParameters (baseplate, RandomCard) and ZoneTargetParameters (baseplate pick); only the
	-- ZoneTargetParameters are used (CustomZoneTarget), so the baseplate TargetParameters must not get the whole ability skipped.
	local tpIgnored = false
	if spec.TargetParameters and spec.ZoneTargetParameters and type(spec.TargetParameters.Zones) == "table" and #spec.TargetParameters.Zones > 0 then
		tpIgnored = true
		for _, z in ipairs(spec.TargetParameters.Zones) do
			if z ~= "Ally_GenZone" and z ~= "Enemy_GenZone" then
				tpIgnored = false
			end
		end
	end
	if (spec.EffectRequirement and not reqSupported(spec.EffectRequirement)) or (spec.TargetParameters and not tpIgnored and not tpSupported(spec.TargetParameters)) or (spec.ZoneTargetParameters and tpKind(spec.ZoneTargetParameters) ~= "zone") then
		return nil
	end
	-- FIX (Mob Mentality): UniqueTargets is supported now (see ctx.unique in resolveCardTargets / runAbility)
	if spec.KeepSameTargets then
		return nil
	end
	local p = spec.Power
	local ops = {}
	if type(p) == "string" then
		ops[1] = { p, spec.Increase }
	elseif type(p) == "table" then
		for _, op in ipairs(p) do
			if type(op) == "table" and op[1] == nil and type(op.Power) == "string" then
				op = { op.Power, op.Increase, op.Target, MetaData = op.MetaData }
			end
			if type(op) ~= "table" or type(op[1]) ~= "string" then
				return nil
			end
			table.insert(ops, op)
		end
	else
		return nil
	end
	if #ops == 0 then
		return nil
	end
	for _, op in ipairs(ops) do
		if op[1] == "Oblierate" then
			op[1] = "Obliterate" -- FIX (v10): typo in the card data; the verb never matched, so the ability was skipped
		end
	end
	-- INJECT: the card data writes "inject" as { "AddCopy", n, target, ... "SingleInject" } followed by { "Destroy", n, target } with a
	-- Zombified MetaData. Fold such a pair into one { "Inject", ... } op so zombified / destroy-immune fighters, the triggers
	-- and the immunity are handled in one place. (The ops are copied, the card data stays untouched.)
	if type(spec.MetaData) == "table" and spec.MetaData.Zombified then
		local folded = {}
		local used = {}
		for i, op in ipairs(ops) do
			if not used[i] then
				local replaced = op
				if op[1] == "AddCopy" then
					local tk1 = (type(op[3]) == "string" and op[3]) or spec.Target or "Self"
					for j = i + 1, #ops do
						local o2 = ops[j]
						if not used[j] and o2[1] == "Destroy" and ((type(o2[3]) == "string" and o2[3]) or spec.Target or "Self") == tk1 then
							used[j] = true
							replaced = { "Inject", op[2], tk1, nil, nil, nil, op[7], MetaData = spec.MetaData }
							break
						end
					end
				end
				table.insert(folded, replaced)
			end
		end
		ops = folded
	end
	for _, op in ipairs(ops) do
		if not EFFECT_VERBS[op[1]] then
			return nil
		end
		local tk = (type(op[3]) == "string" and op[3]) or spec.Target or "Self"
		if CARD_VERBS[op[1]] and not CARD_TARGETS[tk] then
			return nil
		end
		if tk == "CustomTarget" and not (spec.TargetParameters and (tpKind(spec.TargetParameters) == "field" or ((op[1] == "Generate" or op[1] == "MoveZone" or op[1] == "AlterEV") and tpKind(spec.TargetParameters) == "zone")
			or (op[1] == "Generate" and type(spec.TargetParameters.Zones) == "table" and spec.TargetParameters.Zones[1] == "Ally_Terrain"))) then -- FIX: "All gear on your terrain generate"
			return nil
		end
		if CARD_VERBS[op[1]] and tonumber(op[2]) == nil and op[2] ~= "Variable" and op[1] ~= "Destroy" and op[1] ~= "Swap" and op[1] ~= "Generate" and op[1] ~= "CheckPower" and op[2] ~= "TargetPower" and op[1] ~= "Suspend" and op[1] ~= "GivePassive" and op[1] ~= "RemovePassive" and op[1] ~= "ReplaceEffect" then
			return nil
		end
		if SPECIAL_CHECKS[op[1]] and not SPECIAL_CHECKS[op[1]](op, tk, spec) then
			return nil
		end
	end
	return ops
end

local function limitOk(b, card, trigger, spec)
	card.fired = card.fired or {}
	local rec = card.fired[trigger]
	if not rec then
		rec = { total = 0, turn = -1, turnCount = 0 }
		card.fired[trigger] = rec
	end
	if spec.TotalTriggerLimit and rec.total >= spec.TotalTriggerLimit then
		return false
	end
	if spec.TurnTriggerLimit then
		if rec.turn ~= b.turnCount then
			rec.turn = b.turnCount
			rec.turnCount = 0
		end
		if rec.turnCount >= spec.TurnTriggerLimit then
			return false
		end
	end
	rec.total = rec.total + 1
	rec.turnCount = rec.turnCount + 1
	return true
end

-- Pick one target card. Player-owned effects always ask for a choice; NPC-owned effects choose automatically.
local function chooseTarget(b, source, candidates, ctx)
	if #candidates == 0 then
		return nil
	end
	local deathTarget = ctx and ctx.trigger == "OnDeath" and source.zone == "Dying"
	if source.owner == "You" then
		if (source.died and not deathTarget) or b.ended or not b.player or not b.player.Parent then
			return nil
		end
		local set = {}
		for _, c in ipairs(candidates) do
			set[c.id] = c
		end
		local pending = {
			set = set,
			co = coroutine.running(),
			-- End Turn / timeout while a target is being asked for: the source targets ITSELF if it is a legal target (it is one of the
			-- candidates and still on the field); otherwise the effect fizzles (nothing is picked).
			fallback = function()
				local selfTarget = set[source.id]
				if not selfTarget or selfTarget.zone ~= "Field" or selfTarget.died then
					return nil
				end
				-- show the target marker on the fighter that was picked for you, like a click does
				if b.player and b.player.Parent then
					pcall(Net.Send, b.player, "CardTargeted", selfTarget.id)
				end
				return selfTarget
			end,
		}
		b.pending = pending
		Net.Send(b.player, "SetActiveTarget", true)
		Net.Send(b.player, "SingleTarget", fullInfo(source))
		task.delay(RULES.TargetTimeout, function()
			if b.pending == pending then
				b.pending = nil
				task.spawn(pending.co, pending.fallback())
			end
		end)
		local chosen = coroutine.yield()
		-- the client keeps effect pop-ups open while a target is active, so always tell it the choice is over
		Net.Send(b.player, "SetActiveTarget", false)
		return chosen
	end
	return candidates[math.random(#candidates)]
end

local function singleCandidates(b, source, kind)
	local list
	local costKind = COST_KINDS[kind]
	if costKind then
		kind = costKind.base
	end
	if kind == "SingleEnemy" then
		list = fieldOf(b, other(source.owner))
	elseif kind == "SingleAlly" then
		list = fieldOf(b, source.owner)
	else
		list = allFighters(b)
	end
	-- FIX (Dead Tree): TargetImmune fighters CAN be picked. The effect just does nothing to them (see forCardTargets),
	-- but "whenever an effect targets this card" still fires.
	local out = {}
	for _, c in ipairs(list) do
		if not costKind or totalCost(c.def) <= costKind.max then
			table.insert(out, c)
		end
	end
	return out
end

-- Cards that are not on the field (deck / graveyard / hand) can't be clicked, so the client shows its "ZoneTarget" card picker window:
--   server -> client  "ZoneTarget", { card infos }, "description", min, max
--   client -> server  SetTarget(battleId, { cardId, ... })      (validated in the SetTarget handler in Init)
--   server -> client  "CloseZoneTarget"
-- Returns the list of chosen cards (possibly empty). The choice is made automatically (random) when:
--   * there is nothing to decide (the pool has no more cards than the minimum), or the effect belongs to the NPC,
--   * the player doesn't answer in time / the turn timer runs out (min cards), or the battle ends (nothing).
local function randomPicks(pool, n)
	local left = {}
	for _, c in ipairs(pool) do
		table.insert(left, c)
	end
	local out = {}
	while #out < n and #left > 0 do
		table.insert(out, table.remove(left, math.random(#left)))
	end
	return out
end

local function chooseCards(b, source, pool, label, minN, maxN)
	if #pool == 0 then
		return {}
	end
	maxN = math.min(math.max(1, math.floor(tonumber(maxN) or 1)), #pool)
	minN = math.min(math.max(0, math.floor(tonumber(minN) or 0)), maxN)
	if #pool <= minN then
		return randomPicks(pool, #pool) -- everything has to be taken, nothing to choose
	end
	if source.owner ~= "You" or b.ended or b.pending or not b.player or not b.player.Parent then
		return randomPicks(pool, maxN)
	end

	-- what the player sees. A deck is listed by name so its order (the top card) isn't given away.
	local shown = {}
	local allDeck = true
	for _, c in ipairs(pool) do
		table.insert(shown, c)
		if c.zone ~= "Deck" then
			allDeck = false
		end
	end
	if allDeck then
		table.sort(shown, function(x, y)
			if x.lib ~= y.lib then
				return tostring(x.lib) < tostring(y.lib)
			end
			return x.n < y.n
		end)
	end
	-- FIX: a hand is listed in the order it is laid out (oldest card = leftmost), not in the order the cards were created
	local allHand = true
	for _, c in ipairs(shown) do
		if c.zone ~= "Hand" then
			allHand = false
			break
		end
	end
	if allHand then
		table.sort(shown, function(x, y)
			return (x.handSeq or 0) < (y.handSeq or 0)
		end)
	end
	local set, infos = {}, {}
	for _, c in ipairs(shown) do
		set[c.id] = c
		table.insert(infos, fullInfo(c))
	end

	local pending = { set = set, co = coroutine.running(), zone = true, min = minN, max = maxN }
	pending.fallback = function()
		return randomPicks(pool, minN)
	end
	b.pending = pending
	Net.Send(b.player, "SetActiveTarget", true) -- keeps effect pop-ups open while the window is up
	Net.Send(b.player, "ZoneTarget", infos, label, minN, maxN)
	task.delay(RULES.ZoneTargetTimeout, function()
		if b.pending == pending then
			b.pending = nil
			task.spawn(pending.co, pending.fallback())
		end
	end)
	local picked = coroutine.yield()
	-- always tell the client the choice is over (it was made, timed out, or the battle ended)
	Net.Send(b.player, "CloseZoneTarget")
	Net.Send(b.player, "SetActiveTarget", false)
	return type(picked) == "table" and picked or {}
end

-- "Select <this>:" text of the picker window. Cards use a plain description when they have none (a few only say "beep boop").
local function zoneLabel(tp, minN, maxN)
	local d = tp.SelectionDescription
	if type(d) == "string" and d ~= "" and d:lower() ~= "beep boop" then
		return d
	end
	local zones = {}
	for _, z in ipairs(tp.Zones) do
		local zone = ZONE_PARAM[z]
		local mine = z:sub(1, 5) == "Ally_"
		table.insert(zones, (mine and "your " or "the enemy's ") .. (zone or "zone"))
	end
	local what = maxN > 1 and (minN == maxN and (maxN .. " cards") or ("up to " .. maxN .. " cards")) or "a card"
	return what .. " from " .. table.concat(zones, " / ")
end

-- FIX: cards picked from the graveyard / deck / hand by an ability's (Zone)TargetParameters. You choose in the card picker
-- window (chooseCards); the NPC's picks are random. Deck order: first = bottom, last = top.
local function resolveZoneTargets(b, source, tp)
	local pool = {}
	for _, z in ipairs(tp.Zones) do
		local owner = z:sub(1, 5) == "Ally_" and source.owner or other(source.owner)
		local kind = ZONE_PARAM[z]
		if kind == "Deck" then
			for _, id in ipairs(b.decks[owner] or {}) do
				local card = b.cards[id]
				if card then
					table.insert(pool, card)
				end
			end
		else
			local list = inZone(b, owner, kind)
			if kind == "Hand" then
				table.sort(list, function(x, y)
					return (x.handSeq or 0) < (y.handSeq or 0)
				end)
			end
			for _, card in ipairs(list) do
				table.insert(pool, card)
			end
		end
	end
	local c = tp.Condition
	if type(c) == "table" then
		local kept = {}
		for _, card in ipairs(pool) do
			local d = card.def
			local ok = true
			if c.Fighter and cardType(d) ~= "Fighter" then
				ok = false
			end
			if c.NotFighter and cardType(d) == "Fighter" then
				ok = false
			end
			if c.Gear and not d.Gear then -- FIX (Kilnkin Outcast): "gear cards in your graveyard"
				ok = false
			end
			if c.Colored and studColor(d) == "Neutral" then
				ok = false
			end
			if c.NotRarity and d.Rarity == c.NotRarity then -- FIX (Secret_Purple2): "a non-token card in your baseplate"
				ok = false
			end
			if c.CostOrMore or c.CostOrLess then
				local n = 0
				for _, v in pairs(d.Cost or {}) do
					if type(v) == "number" then
						n = n + v
					end
				end
				if c.CostOrMore and n < c.CostOrMore then
					ok = false
				end
				if c.CostOrLess and n > c.CostOrLess then
					ok = false
				end
			end
			if c.Archetype and d.Archetype ~= c.Archetype then
				ok = false
			end
			if c.NotMatchesParameter == "Starter" then
				-- FIX (Fraying Pipes): "a non-starter card": StarterCard = true, or costs exactly 1-4 colourless and nothing else
				local isStarterCard = d.StarterCard == true
				if not isStarterCard and type(d.Cost) == "table" then
					local neutral = tonumber(d.Cost.Neutral) or 0
					isStarterCard = neutral >= 1 and neutral <= 4
					for color, amount in pairs(d.Cost) do
						if color ~= "Neutral" and (tonumber(amount) or 0) > 0 then
							isStarterCard = false
						end
					end
				end
				if isStarterCard then
					ok = false
				end
			end
			if c.HasntPassive and d[c.HasntPassive] then -- INJECT: "a fighter that isn't Zombified"
				ok = false
			end
			if c.HasDied ~= nil and (card.died == true) ~= c.HasDied then
				ok = false
			end
			if ok then
				table.insert(kept, card)
			end
		end
		pool = kept
		local top = tonumber(c.TopCard)
		if top then
			local last = {}
			for i = math.max(1, #pool - math.floor(top) + 1), #pool do
				table.insert(last, pool[i])
			end
			pool = last
		end
	end
	if c == "RandomLowestCost" then
		-- FIX (Necro Syndicates): "a card with the lowest total stud cost": one random card out of those tied for the lowest cost
		local best, ties = nil, {}
		for _, card in ipairs(pool) do
			local n = totalCost(card.def)
			if best == nil or n < best then
				best, ties = n, { card }
			elseif n == best then
				table.insert(ties, card)
			end
		end
		return ties[1] and { ties[math.random(#ties)] } or {}
	elseif c == "BottomCard" then
		return pool[1] and { pool[1] } or {}
	elseif c == "TopCard" then
		return pool[#pool] and { pool[#pool] } or {}
	elseif c == "All" then
		return pool
	end
	local want = math.max(1, math.floor(tonumber(tp.MaxTargets) or 1))
	local least = tp.MinTargets ~= nil and math.max(0, math.floor(tonumber(tp.MinTargets) or 0)) or 1
	least = math.min(least, want)
	return chooseCards(b, source, pool, zoneLabel(tp, least, want), least, want)
end

-- FIX: targets picked by an ability's TargetParameters (field zones only, see tpKind).
local function resolveParamTargets(b, source, tp, ctx)
	local pool = {}
	for _, z in ipairs(tp.Zones) do
		local owner = z == "Ally_Field" and source.owner or other(source.owner)
		for _, c in ipairs(fieldOf(b, owner)) do
			table.insert(pool, c) -- FIX (Dead Tree): TargetImmune fighters can be picked, the effect just skips them
		end
	end
	local cond = tp.Condition
	local out = {}
	if cond == "OtherCards" then
		for _, c in ipairs(pool) do
			if c ~= source then
				table.insert(out, c)
			end
		end
	elseif cond == "Rarities" then
		local set = {}
		for _, r in ipairs(tp.Modifier.Rarities) do
			set[r] = true
		end
		for _, c in ipairs(pool) do
			if set[c.def.Rarity] then
				table.insert(out, c)
			end
		end
	elseif cond == "Archetype" then
		local want = tp.SubModifier ~= false
		for _, c in ipairs(pool) do
			if (c.def.Archetype == tp.Modifier) == want then
				table.insert(out, c)
			end
		end
	elseif cond == "RandomCard" then
		local n = math.max(1, math.floor(tonumber(tp.Modifier) or 1))
		while #out < n and #pool > 0 do
			table.insert(out, table.remove(pool, math.random(#pool)))
		end
	elseif cond == "LowestStat" or cond == "HighestStat" then
		-- FIX (Lunar Impact): "each allied fighter with the lowest health". Every fighter tied for the extreme; dead (0 health) ones are ignored.
		local sign = cond == "LowestStat" and -1 or 1
		local best
		for _, c in ipairs(pool) do
			if c.zone == "Field" and (c.health or 0) > 0 then
				local v
				if tp.Modifier == "Cost" then
					v = totalCost({ Cost = effectiveCost(c) })
				elseif tp.Modifier == "Health" then
					v = c.health or 0
				else
					v = c.power or 0
				end
				v = v * sign
				if best == nil or v > best then
					best, out = v, { c }
				elseif v == best then
					table.insert(out, c)
				end
			end
		end
	elseif cond == "NotHealth" then
		-- FIX (The Ratcatcher): "all fighters with 250 or less health" (this card itself and dead fighters are left out)
		local limit = tonumber(tp.Modifier) or 0
		for _, c in ipairs(pool) do
			if c ~= source and c.zone == "Field" and not c.obliterated and (c.health or 0) > 0 and c.health <= limit then
				table.insert(out, c)
			end
		end
	elseif cond == "SizeClass" then
		-- FIX (Fluzard, Neme-shot): Gigant = 1500 or more total stats (health + power), Picant = 500 or less. Every matching fighter in the zone.
		for _, c in ipairs(pool) do
			if c.zone == "Field" and (c.health or 0) > 0 then
				local total = (c.health or 0) + (c.power or 0)
				if (tp.Modifier == "Gigant" and total >= 1500) or (tp.Modifier == "Picant" and total <= 500) then
					table.insert(out, c)
				end
			end
		end
	elseif cond == "EquippedGears" then
		-- FIX (Absentee Father, Xen ...): every fighter in the zone that carries at least one gear
		for _, c in ipairs(pool) do
			if c.zone == "Field" and c.gears and #c.gears > 0 then
				table.insert(out, c)
			end
		end
	elseif cond == "All" then
		out = pool
	else
		-- no condition: the effect says "choose a card"
		local picked = chooseTarget(b, source, pool, ctx)
		if picked then
			out = { picked }
		end
	end
	return out
end

local function resolveCardTargets(b, source, kind, ctx)
	if ctx and ctx.tp then
		return resolveParamTargets(b, source, ctx.tp, ctx)
	end
	if kind == "Self" or kind == "GearOwner" then
		return source.zone == "Field" and { source } or {}
	elseif kind == "Ally" then
		return fieldOf(b, source.owner)
	elseif kind == "Opponent" then
		return fieldOf(b, other(source.owner))
	elseif kind == "All" then
		return allFighters(b)
	elseif kind == "RandomOtherAllyField" then
		-- FIX: one random OTHER allied fighter still on the field (Ray: "Reset the Health of a random allied fighter")
		local pool = {}
		for _, c in ipairs(fieldOf(b, source.owner)) do
			if c ~= source and c.zone == "Field" and (c.health or 0) > 0 then
				table.insert(pool, c)
			end
		end
		print("[DEBUG] Ray pool size:", #pool)
		if #pool == 0 then
			return {}
		end
		return { pool[math.random(1, #pool)] }
	elseif kind == "AlliedArchetype" then
		local out = {}
		for _, c in ipairs(fieldOf(b, source.owner)) do
			if source.def.Archetype ~= nil and c.def.Archetype == source.def.Archetype then
				table.insert(out, c)
			end
		end
		return out
	elseif kind == "AlliedRare" then
		-- FIX (Bloxikin Horde): every allied fighter whose rarity is Rare (itself included). The kind was unknown, so the whole ability was skipped.
		local out = {}
		for _, c in ipairs(fieldOf(b, source.owner)) do
			if c.zone == "Field" and (c.health or 0) > 0 and c.def.Rarity == "Rare" then
				table.insert(out, c)
			end
		end
		return out
	elseif kind == "AllyToken" then
		-- FIX: every allied fighter that is a token (Token / TokenOmni passive, or a copy made inert by an effect)
		local out = {}
		for _, c in ipairs(fieldOf(b, source.owner)) do
			local d = c.def
			if d.Token or d.TokenOmni or (c.extra and (c.extra.Token or c.extra.TokenOmni)) then
				table.insert(out, c)
			end
		end
		return out
	elseif kind == "AlliedNotArchetype" then
		local out = {}
		for _, c in ipairs(fieldOf(b, source.owner)) do
			if source.def.Archetype == nil or c.def.Archetype ~= source.def.Archetype then
				table.insert(out, c)
			end
		end
		return out
	elseif kind == "LowestHealth" or kind == "LowestPower" or kind == "HighestHealth"
		or kind == "EnemyLowestHealth" or kind == "AlliedLowestPower" or kind == "AllyHighestPower"
		or kind == "LowestCost" or kind == "HighestCost" or kind == "EnemyLowestCost" or kind == "EnemyHighestCost"
		or kind == "AlliedLowestCost" or kind == "AlliedHighestCost" then
		-- FIX (SirMing et al.): "each fighter with the lowest health / lowest power / highest health". Every fighter tied for the
		-- extreme is hit (not a pick, so TargetImmune doesn't apply and no OnTarget fires). Fighters already at 0 health (killed
		-- earlier in the same ability, they stay on the field until processDeaths) are ignored, so "then each fighter with the
		-- lowest power" can't land on a fighter the first half just destroyed.
		-- "Cost" = the fighter's total stud cost right now (printed cost + IncreaseCost changes)
		local stat = kind:find("Health", 1, true) and "health" or (kind:find("Cost", 1, true) and "cost" or "power")
		local sign = kind:find("Lowest", 1, true) and -1 or 1
		local pool
		if kind:sub(1, 5) == "Enemy" then
			pool = fieldOf(b, other(source.owner))
		elseif kind:sub(1, 4) == "Ally" or kind:sub(1, 6) == "Allied" then
			pool = fieldOf(b, source.owner)
		else
			pool = allFighters(b)
		end
		local best, out = nil, {}
		for _, c in ipairs(pool) do
			if c.zone == "Field" and (c.health or 0) > 0 then
				local v = (stat == "cost" and totalCost({ Cost = effectiveCost(c) }) or (c[stat] or 0)) * sign
				if best == nil or v > best then
					best, out = v, { c }
				elseif v == best then
					table.insert(out, c)
				end
			end
		end
		return out
	elseif kind == "HighestPower" then
		-- FIX (Kariu et al.): "each fighter with highest power" = all fighters on the board tied for the top power (not a pick, so
		-- TargetImmune doesn't apply and no OnTarget fires)
		local best, out = nil, {}
		for _, c in ipairs(allFighters(b)) do
			if c.zone == "Field" then
				if best == nil or c.power > best then
					best, out = c.power, { c }
				elseif c.power == best then
					table.insert(out, c)
				end
			end
		end
		return out
	elseif kind == "Aggressor" or kind == "SummonedCard" then
		local o = ctx.other
		-- FIX (v11): "SummonedCard" = the fighter THIS ability just summoned (Rawblocky's Drawing ...), not ctx.other
		-- (which on OnAttackEnd is the card that was attacked, so Terrified/Fading landed on the wrong fighter or nothing).
		if kind == "SummonedCard" and ctx.lastSummoned ~= nil then
			o = ctx.lastSummoned
		end
		return (o and o.zone == "Field") and { o } or {}
	elseif kind == "Single" or kind == "SingleEnemy" or kind == "SingleAlly" or COST_KINDS[kind] then
		-- FIX: one ability = one pick. Every op of the same ability (e.g. Strengthen + Heal) shares the chosen target
		-- instead of asking / picking again for each op.
		local cache = ctx and ctx.singleCache
		if cache and cache[kind] then
			if cache[kind].zone == "Field" then
				return { cache[kind] }
			end
			-- FIX (Roundawsome vs Delete Tool): the picked fighter left the field in the middle of this ability (Roundawsome's
			-- OnTarget returns it to its owner's hand). The rest of the ability must FIZZLE; it used to fall through and
			-- pick a new target, so the Obliterate half of "Destroy, then obliterate" hit another fighter on the board.
			-- (A Destroy'd fighter stays on the Field at 0 health until processDeaths, so the normal Delete Tool flow is unaffected.)
			return {}
		end
		local pool = singleCandidates(b, source, kind)
		-- FIX (thePipFlip ...): TargetSubModifier "CustomModAlly OtherCard" = "another target fighter": the source can't pick itself
		local sub = ctx and ctx.spec and ctx.spec.TargetSubModifier
		if type(sub) == "string" and sub:find("OtherCard", 1, true) then
			local rest = {}
			for _, c in ipairs(pool) do
				if c ~= source then
					table.insert(rest, c)
				end
			end
			pool = rest
		end
		local unique = ctx and ctx.unique
		if unique then
			-- FIX (Mob Mentality): UniqueTargets - a card already picked by an earlier op of this ability can't be picked again
			local rest = {}
			for _, c in ipairs(pool) do
				if not unique[c] then
					table.insert(rest, c)
				end
			end
			pool = rest
		end
		local picked = chooseTarget(b, source, pool, ctx)
		if picked and unique then
			unique[picked] = true
		end
		if picked and cache then
			cache[kind] = picked
		end
		return picked and { picked } or {}
	end
	return {}
end

-- forward declarations
local fireTrigger, processDeaths, summonCard, broadcastSummon, attachGear, ownDef

-- GEAR: take one gear off a fighter and put it in its owner's graveyard (server zone + client). The client removes the gear
-- picture from the fighter and makes sure the gear card exists in the graveyard pile. The fighter's stat bonus is NOT touched here:
-- callers that keep the fighter on the field (DestroyGear) take the stats back themselves; a fighter that leaves the field loses them anyway.
local function sendGearToGrave(b, fighter, g)
	g.zone = "Graveyard"
	g.attachedTo = nil
	if g.grantedPassive and fighter.ownDef then -- e.g. Marked Mod: the passive it gave leaves with it
		fighter.def[g.grantedPassive] = nil
		Net.Send(b.player, "RemoveCardPassive", fighter.id, g.grantedPassive)
	end
	g.grantedPassive = nil
	Net.Send(b.player, "UnequipGear", fighter.id, g.id .. "_gear", clientSide(g.owner), fullInfo(g))
end

-- GEAR: a fighter that leaves the field (dies, is returned to the hand / deck, becomes a baseplate card ...) leaves its gear behind
-- in the graveyard. The only exception is Suspend: a suspended fighter keeps its gear because it comes back at the next End Step.
local function shedGears(b, fighter)
	local list = fighter.gears
	if not list or #list == 0 then
		return
	end
	fighter.gears = nil
	for _, g in ipairs(list) do
		sendGearToGrave(b, fighter, g)
	end
end

local function resolveName(def, key)
	local v = def[key]
	if type(v) == "string" then
		return v
	end
	return key
end

local function resolveVariantReference(source, name)
	if type(name) ~= "string" or not source or not source.def then
		return name
	end
	if source.def.Original == name and type(source.lib) == "string" then
		return source.lib
	end
	if source.def.Original then
		local target = DeckUtil.GetCard(name)
		local variants = target and target.AltCards
		if type(variants) == "table" then
			local variantName = variants[source.lib] and source.lib or source.def.Name
			if variants[variantName] and DeckUtil.GetCard(variantName) then
				return variantName
			end
		end
	end
	return name
end

local function giveCard(b, owner, name, ignoreAddBlock, defOverride)
	if (owner ~= "You" and owner ~= "Enemy") or not DeckUtil.GetCard(name) then
		return nil
	end
	local gd = DeckUtil.GetCard(name)
	if gd and gameplayDef(gd).AddBlock and not ignoreAddBlock then -- FIX: an explicit {"Add", "Name"} may add AddBlock cards (Copy Tool -> Move/Delete Tool)
		return nil -- PASSIVES: cards with AddBlock cannot be Added by copy/random effects
	end
	if #inZone(b, owner, "Hand") >= RULES.HandCap then
		return nil
	end
	local card = newCard(b, owner, name)
	if not card then
		return nil
	end
	if defOverride then
		-- INJECT: this one card gets its own def (e.g. the 500/300 Zombified copy) so the library entry is untouched
		local d = table.clone(card.def)
		for k, v in pairs(defOverride) do
			d[k] = v
		end
		card.def = d
		card.health, card.power = d.Health or 0, d.Power or 0
	end
	toHand(b, card)
	if b.fleetingNow then
		card.fleeting = true -- FIX: a card given by a fleeting effect is fleeting too
	end
	if owner == "You" then
		sendDraw(b, { card }, nil)
	else
		sendDraw(b, nil, { card })
	end
	-- PATCH: OnAllyPut / OnEnemyPut / OnAllySecondPut / OnEnemySecondPut: a card was added to a hand
	if (b.turnCount or 0) >= 1 and not b.ended then
		b.putTurn = b.putTurn or {}
		local first = b.putTurn[owner] ~= b.turnCount
		b.putTurn[owner] = b.turnCount
		local okp, errp = pcall(function()
			for _, c in ipairs(allFighters(b)) do
				if c.zone == "Field" and not b.ended then
					local mine = c.owner == owner
					fireTrigger(b, c, mine and "OnAllyPut" or "OnEnemyPut", { other = card })
					if first then
						fireTrigger(b, c, mine and "OnAllySecondPut" or "OnEnemySecondPut", { other = card })
					end
				end
			end
		end)
		if not okp then
			warn("[Battlehandlers] put triggers errored:", errp)
		end
	end
	return card
end

local function putInBaseplate(b, owner, name, extra, sourceId)
	local card = newCard(b, owner, name)
	if not card then
		return nil
	end
	card.zone = "Baseplate"
	card.extra = extra
	Net.Send(b.player, "AddToBaseplate", clientSide(owner), sourceId and { CardId = sourceId } or nil, fullInfo(card))
	return card
end

-- Crowd's Favour: the first time a side fills its board with fighters (FieldCap), a "Reminder: Crowd's Favour" card goes into
-- its Baseplate for the rest of the game (it is colourless, so it generates an extra {W} at the end of that side's turn)
-- and the crowd cheers. Only ever happens once per side (the player and the NPC both can get it).
checkCrowdsFavour = function(b, owner)
	if b.ended or not b.flags or b.flags[owner].CrowdsFavour then
		return
	end
	if #fieldOf(b, owner) < RULES.FieldCap then
		return
	end
	if not DeckUtil.GetCard("Crowd's Favour") then
		return
	end
	b.flags[owner].CrowdsFavour = true
	putInBaseplate(b, owner, "Crowd's Favour")
	pcall(Net.Send, b.player, "EnterCrowdsFavour", clientSide(owner))
end

VERBS = {}

local TARGETED_KINDS = { Single = true, SingleEnemy = true, SingleAlly = true, SingleSevenCostOrLess = true, AllySingleSevenCostOrLess = true, EnemySingleSevenCostOrLess = true }

-- PASSIVES: which immunity protects against which effect verb. OmniImmune protects against every verb except Obliterate
-- (a card's own effect on itself still works).
local VERB_IMMUNITY = {
	Damage = "DamageImmune", PierceDamage = "DamageImmune", DamageOverloaded = "DamageImmune",
	Heal = "HealImmune", BoostHealth = "HealImmune",
	Strengthen = "StrengthenImmune", TempStrengthen = "StrengthenImmune",
	Weaken = "WeakenImmune", TempWeaken = "WeakenImmune",
	SetHealth = "SetImmune", SetPower = "SetImmune", MultiplyHealth = "SetImmune", MultiplyPower = "SetImmune", Reset = "SetImmune",
	Swap = "SwapImmune",
	Transform = "TransformImmune",
	RandomTransform = "TransformImmune", -- FIX (Havaluvian Blackmarketeer): it is TransformImmune so its own "transform all allied fighters" skips it
	Return = "ReturnImmune",
	Steal = "StealImmune",
	SummonCopy = "CloneImmune",
	SummonEnemyCopy = "CloneImmune",
	Lock = "LockImmune",
	Unlock = "UnlockImmune",
	Suspend = "SuspendImmune",
	Destroy = "DestroyImmune",
	Obliterate = "ObliterateImmune",
	Inject = "InjectImmune", -- INJECT
}

local function immuneTo(source, t, verb)
	if not verb then
		return false
	end
	local key = VERB_IMMUNITY[verb]
	if key and t.def[key] then
		return true
	end
	if verb ~= "Obliterate" and t ~= source and t.def.OmniImmune then
		return true
	end
	return false
end

-- FIX (Bobaman1, Robloxian Superball et al.): cast animations that sweep a whole field shot by shot. Their damage ("deal N damage to all
-- fighters") now lands on each fighter when ITS shot hits, instead of everything at once after the whole sweep.
RULES.SweepAnims = { ShootAll = true, ShootAllMinigun = true, BigShootAll = true, SmallShootAll = true, MidSuperballEffectEnemy = true }
RULES.IsSweepDamage = function(source, op, tk)
	return tk == "All" and op[6] == nil and op[7] == nil and RULES.SweepAnims[source.def.EffectAnimation] == true
end
local function forCardTargets(b, source, tk, ctx, fn, anim)
	local hit = {}
	-- FIX (Dead Tree): a picked card that is TargetImmune is still "targeted" (so its OnTarget triggers fire),
	-- but the effect does nothing to it. Effects that don't pick a target (Self / Ally / Opponent / All ...) still affect it.
	local targeting = TARGETED_KINDS[tk] or tk == "CustomTarget" or (ctx ~= nil and ctx.tp ~= nil)
	-- FIX (iAsuka): a card's own EffectAnimation (a potion, ...) needs the picked fighter to be thrown at. For a targeted ability it is NOT
	-- sent when the card is cast any more (there was no target yet, so it errored and the arrow came up 0.6s late); the first op that
	-- picks a fighter plays it on that fighter instead (see runAbility: ctx.cardAnim).
	local cardAnimOnce = nil
	if not anim and (TARGETED_KINDS[tk] or COST_KINDS[tk]) and ctx and ctx.cardAnim and not ctx.cardAnimDone then
		anim = ctx.cardAnim
		cardAnimOnce = ctx
	end
	-- FIX (President Doge et al.): an effect that hits several fighters (mass buffs, sweeps ...) goes from RIGHT to LEFT along each field,
	-- not left to right. Fighters of one side stay together (the board is [yours][theirs]); only the order inside each side is reversed.
	local ordered = resolveCardTargets(b, source, tk, ctx)
	if #ordered > 1 then
		local flipped, run = {}, {}
		local function flushRun()
			for i = #run, 1, -1 do
				table.insert(flipped, run[i])
			end
			run = {}
		end
		for _, t in ipairs(ordered) do
			if #run > 0 and run[1].owner ~= t.owner then
				flushRun()
			end
			table.insert(run, t)
		end
		flushRun()
		ordered = flipped
	end
	if ctx and ctx.sweepOrder and #ordered > 1 then
		-- the sweep animation hits the caster's opponent's field first, then the caster's own field
		local foes, mine = {}, {}
		for _, t in ipairs(ordered) do
			table.insert(t.owner ~= source.owner and foes or mine, t)
		end
		ordered = {}
		for _, t in ipairs(foes) do table.insert(ordered, t) end
		for _, t in ipairs(mine) do table.insert(ordered, t) end
	end
	for _, t in ipairs(ordered) do
		if t.zone == "Field" then
			if targeting and t ~= source and t.def.TargetImmune then
				if anim and b.player and b.player.Parent then
					Net.Send(b.player, "PlayEffectCardAnimation", "", source.id, t.id, anim) -- thrown at it too, it just takes nothing
					if cardAnimOnce then
						cardAnimOnce.cardAnimDone, anim = true, nil
					end
				end
				table.insert(hit, t)
			elseif not immuneTo(source, t, b.verb) then
				if anim and b.player and b.player.Parent then
					Net.Send(b.player, "PlayEffectCardAnimation", "", source.id, t.id, anim)
					if cardAnimOnce then
						cardAnimOnce.cardAnimDone, anim = true, nil
					end
				end
				fn(t)
				table.insert(hit, t)
			end
		end
	end
	-- "Whenever an effect targets this card": cards that were picked by someone else's effect react
	if targeting and not b.ended then
		local fired = ctx and ctx.targetedFired -- once per card per ability, not once per op
		for _, t in ipairs(hit) do
			if t ~= source and not (fired and fired[t]) then
				if fired then
					fired[t] = true
				end
				fireTrigger(b, t, "OnTarget", { other = source })
				-- PATCH: OnTargetByEnemy / OnTargetByAlly
				fireTrigger(b, t, t.owner ~= source.owner and "OnTargetByEnemy" or "OnTargetByAlly", { other = source })
			end
		end
		-- PATCH: OnAllyTarget / OnEnemyTarget / OnFighterTarget: "whenever you / your opponent / a fighter targets"
		if #hit > 0 and not b.ended then
			local sourceIsFighter = cardType(source.def) == "Fighter"
			for _, c in ipairs(allFighters(b)) do
				if c.zone == "Field" and not b.ended then
					fireTrigger(b, c, c.owner == source.owner and "OnAllyTarget" or "OnEnemyTarget", { other = hit[1] })
					if sourceIsFighter then
						fireTrigger(b, c, "OnFighterTarget", { other = hit[1] })
					end
				end
			end
		end
	end
	return hit
end

VERBS.Damage = function(b, source, op, tk, ctx)
	local n = tonumber(op[2])
	local byTargetPower = op[2] == "TargetPower"
	if not byTargetPower and (not n or n <= 0) then
		return
	end
	local ids, healths, hurt = {}, {}, {}
	-- FIX (Mob Mentality / Necro Syndicates et al.): op[6] is the damage's own animation (e.g. "ThrowBottle"). It was never sent
	-- to the client, so the throw and its sounds never played. forCardTargets plays it once per picked fighter, including a
	-- TargetImmune one (Dead Tree): it is thrown at it, but the fighter takes no damage.
	local anim = type(op[6]) == "string" and op[6] ~= "" and op[6] or nil
	-- FIX (Excited Bouncer): its card data has the claw one slot later ({"Damage", 200, "All", nil, nil, nil, "BlissClaw"}), so op[6] was nil and
	-- the Bliss claw never played. A Bliss animation name in op[7] counts too.
	if not anim and type(op[7]) == "string" and op[7]:find("^Bliss") then
		anim = op[7]
	end
	local sweep = ctx ~= nil and RULES.IsSweepDamage(source, op, tk) and b.player ~= nil and b.player.Parent ~= nil
	if sweep then
		anim = source.def.EffectAnimation -- thrown at each fighter in turn (the client's sweep functions take a single target)
		ctx.sweepOrder = true
	end
	forCardTargets(b, source, tk, ctx, function(t)
		local dmg = effectDamageAmount(t, byTargetPower and t.power or n) -- DamageImmune / Moonward / Marked
		if dmg <= 0 then
			return
		end
		t.health = math.max(0, t.health - dmg)
		table.insert(ids, t.id)
		table.insert(healths, t.health)
		table.insert(hurt, t)
		if sweep then
			-- the client queue is still busy with this fighter's shot, so its damage number appears right when the shot hits
			Net.Send(b.player, "DamageCards", { t.id }, { t.health })
		end
	end, anim)
	if ctx then
		ctx.sweepOrder = nil
	end
	if #ids > 0 and not sweep then
		Net.Send(b.player, "DamageCards", ids, healths)
	end
	-- PATCH: OnEffectDamage / OnDamaged: "whenever this card is damaged by an effect"
	for _, t in ipairs(hurt) do
		if t.zone == "Field" and not b.ended then
			fireTrigger(b, t, "OnEffectDamage", { other = source })
			fireTrigger(b, t, "OnDamaged", { other = source })
		end
	end
end
VERBS.PierceDamage = VERBS.Damage

-- FIX (Shayph et al.): {"DamageOverloaded", amount, [target]}. Same as Damage, but whatever damage goes past a fighter's remaining
-- health is dealt to that fighter's owner as life loss (same rule as the Overload passive in fightCard).
VERBS.DamageOverloaded = function(b, source, op, tk, ctx)
	local n = tonumber(op[2])
	if not n or n <= 0 then
		return
	end
	local ids, healths, hurt = {}, {}, {}
	local excess = { You = 0, Enemy = 0 }
	forCardTargets(b, source, tk, ctx, function(t)
		local dmg = effectDamageAmount(t, n) -- DamageImmune / Moonward / Marked
		if dmg <= 0 then
			return
		end
		local before = t.health
		t.health = math.max(0, before - dmg)
		if before > 0 and dmg > before then
			excess[t.owner] = excess[t.owner] + (dmg - before)
		end
		table.insert(ids, t.id)
		table.insert(healths, t.health)
		table.insert(hurt, t)
	end)
	if #ids > 0 then
		Net.Send(b.player, "DamageCards", ids, healths)
	end
	for _, side in ipairs({ "You", "Enemy" }) do
		if excess[side] > 0 and not b.ended then
			changeLife(b, side, -excess[side], source.id)
		end
	end
	for _, t in ipairs(hurt) do
		if t.zone == "Field" and not b.ended then
			fireTrigger(b, t, "OnEffectDamage", { other = source })
			fireTrigger(b, t, "OnDamaged", { other = source })
		end
	end
end

VERBS.Heal = function(b, source, op, tk, ctx)
	local n = tonumber(op[2])
	if not n or n <= 0 then
		return
	end
	forCardTargets(b, source, tk, ctx, function(t)
		-- FIX: in this game "gain X health" (almost every card uses Heal for it) is NOT capped at the printed Health.
		-- The base Health is left alone, so stat resets still go back to the original.
		t.health = t.health + n
		Net.Send(b.player, "HealCard", t.id, t.health)
	end)
end

-- NEW: SetHealth / MultiplyHealth / MultiplyPower (fighters) and SetLife (faces).
VERBS.SetHealth = function(b, source, op, tk, ctx)
	local n = tonumber(op[2])
	if not n or n < 0 then
		return
	end
	n = math.floor(n)
	forCardTargets(b, source, tk, ctx, function(t)
		if n <= 0 and t.def.DestroyImmune then
			return
		end
		t.health = n
		t.maxHealth = math.max(t.maxHealth or t.def.Health or 0, n)
		Net.Send(b.player, "SetCardHealth", t.id, n)
	end)
end

-- FIX (Bereghost): {"Berezaa", n}: this card gains n health for each Green stud in the costs of its owner's fighters on the field
-- (itself included). Always acts on the source card, whatever the ability's Target says ("Ally" there is only for the SetHealth op).
VERBS.Berezaa = function(b, source, op, tk, ctx)
	local per = tonumber(op[2])
	if not per or per <= 0 or source.zone ~= "Field" then
		return
	end
	local studs = 0
	for _, f in ipairs(fieldOf(b, source.owner)) do
		local cost = effectiveCost(f)
		if type(cost) == "table" then
			studs = studs + (tonumber(cost.Green) or 0)
		end
	end
	local gain = studs * per
	if gain <= 0 then
		return
	end
	source.health = source.health + gain
	Net.Send(b.player, "SetCardHealth", source.id, source.health)
end

VERBS.MultiplyHealth = function(b, source, op, tk, ctx)
	local n = tonumber(op[2])
	if not n or n <= 0 then
		return
	end
	forCardTargets(b, source, tk, ctx, function(t)
		if t.health <= 0 then
			return
		end
		-- ASSUMED: rounds down but never kills (minimum 1)
		t.health = math.max(1, math.floor(t.health * n))
		t.maxHealth = math.max(t.maxHealth or t.def.Health or 0, t.health)
		Net.Send(b.player, "SetCardHealth", t.id, t.health)
	end)
end

VERBS.MultiplyPower = function(b, source, op, tk, ctx)
	local n = tonumber(op[2])
	if not n or n < 0 then
		return
	end
	forCardTargets(b, source, tk, ctx, function(t)
		if n < 1 and t.def.WeakenImmune then
			return
		end
		t.power = math.floor(t.power * n)
		Net.Send(b.player, "SetCardPower", t.id, t.power)
	end)
end

-- Sets a player's life. 0 or >= 1 = that exact number; ASSUMED: a fraction (0 < n < 1) = that share of current life.
VERBS.SetLife = function(b, source, op, tk)
	local n = tonumber(op[2])
	if not n or n < 0 then
		return
	end
	local who
	if tk == "All" then
		who = { "You", "Enemy" }
	elseif tk == "Opponent" or tk == "Enemy" or tk == "SingleEnemy" then
		who = { other(source.owner) }
	elseif tk == "Self" or tk == "Ally" or tk == "SingleAlly" then
		who = { source.owner }
	else
		return
	end
	for _, owner in ipairs(who) do
		local goal = n
		if n > 0 and n < 1 then
			goal = math.max(1, math.floor(b.life[owner] * n))
		end
		if changeLife(b, owner, math.floor(goal) - b.life[owner], source.id) then
			return
		end
	end
end

VERBS.Strengthen = function(b, source, op, tk, ctx)
	local n = tonumber(op[2])
	if not n or n <= 0 then
		return
	end
	forCardTargets(b, source, tk, ctx, function(t)
		t.power = t.power + n
		Net.Send(b.player, "StrengthenCard", t.id, t.power)
	end)
end

-- NEW: "gains X health" - current health can exceed the printed Health; the base Health is left alone (Heal stops at max, so it did nothing on a full-health card).
VERBS.BoostHealth = function(b, source, op, tk, ctx)
	local n = tonumber(op[2])
	if not n or n <= 0 then
		return
	end
	forCardTargets(b, source, tk, ctx, function(t)
		t.health = t.health + n -- may go above the printed Health, but the base (maxHealth) is NOT raised, so resets go back to the original
		Net.Send(b.player, "SetCardHealth", t.id, t.health)
	end)
end

VERBS.Weaken = function(b, source, op, tk, ctx)
	local n = tonumber(op[2])
	if not n or n <= 0 then
		return
	end
	forCardTargets(b, source, tk, ctx, function(t)
		if t.def.WeakenImmune then
			return
		end
		t.power = math.max(0, t.power - n)
		Net.Send(b.player, "WeakenCard", t.id, t.power)
	end)
end

VERBS.Destroy = function(b, source, op, tk, ctx)
	local anim = op[6]
	if anim == nil and source.def.EffectAnimation == "gaster" then
		anim = "gaster"
	end
	local hit = forCardTargets(b, source, tk, ctx, function(t)
		if t.def.DestroyImmune then
			return
		end
		t.health = 0
		Net.Send(b.player, "SetCardHealth", t.id, 0, anim == "gaster")
	end, anim)
	if anim == "gaster" and #hit > 0 then
		-- FIX: the client queue already holds the marker settle + the delete animation, so the server must NOT wait long here: the death
		-- messages have to reach the client right behind the animation, or they arrive after the card has already finished shrinking.
		wait(0.1)
	end
end

VERBS.Lock = function(b, source, op, tk, ctx)
	local n = tonumber(op[2]) or 1
	if n <= 0 then
		return
	end
	local raised = {}
	forCardTargets(b, source, tk, ctx, function(t)
		if t.def.LockImmune then
			return
		end
		local before = t.lockTurns
		-- FIX (SonozakiRaito): locks STACK. "Lock for 2 turns" on a fighter that already has 1 lock makes it 3 (it used to only raise the lock
		-- up to 2, i.e. +1). The 1 lock a fighter gets for attacking is not counted while its own attack is still resolving, so Icerain's
		-- "after this card attacks: lock it for 6 turns" is 6 in total, not 7.
		local base = math.max(0, before - (t.attackLockNow or 0))
		setLock(b, t, math.max(before, math.min(base + n, 9)))
		if t.lockTurns > before then
			table.insert(raised, t)
		end
	end)
	-- PATCH: OnLockIncrease / OnEffectLock: "whenever this card gains a lock (from an effect)"
	for _, t in ipairs(raised) do
		if t.zone == "Field" and not b.ended then
			fireTrigger(b, t, "OnLockIncrease", { other = source })
			fireTrigger(b, t, "OnEffectLock", { other = source })
		end
	end
end

-- FIX (Regular_Show): {"LockPulse", n, target, times}. Lock every target by n, fire its "gains a lock" triggers, then take exactly that
-- lock back off again, `times` times in a row. Only the triggers matter: when it is over every fighter has the locks it started with.
-- (The old 5x Lock/Unlock list didn't cancel out: Lock only raises a lock up to n, Unlock always lowers it, and LockImmune
-- fighters were still unlocked, so fighters that were already locked came out with fewer locks.)
VERBS.LockPulse = function(b, source, op, tk, ctx)
	local n = tonumber(op[2]) or 1
	local times = math.max(1, math.floor(tonumber(op[4]) or 1))
	if n <= 0 then
		return
	end
	local list = {}
	forCardTargets(b, source, tk, ctx, function(t)
		if not t.def.LockImmune then
			table.insert(list, t)
		end
	end)
	for _ = 1, times do
		if b.ended then
			break
		end
		local added = {}
		for _, t in ipairs(list) do
			if t.zone == "Field" then
				local before = t.lockTurns
				setLock(b, t, math.min(9, before + n))
				added[t] = t.lockTurns - before
			end
		end
		wait(0.15)
		for _, t in ipairs(list) do
			if added[t] and added[t] > 0 and t.zone == "Field" and not b.ended then
				fireTrigger(b, t, "OnLockIncrease", { other = source })
				fireTrigger(b, t, "OnEffectLock", { other = source })
			end
		end
		for _, t in ipairs(list) do
			local d = added[t]
			if d and d > 0 and t.lockTurns > 0 then
				setLock(b, t, t.lockTurns - d)
			end
		end
		wait(0.15)
	end
end

-- FIX (ajarbythedoor): {"ReplaceEffect", "Pet1"}: the targeted fighter loses ALL its abilities (its passives / keywords are not touched).
-- Works on a private copy of the definition, like GivePassive.
VERBS.ReplaceEffect = function(b, source, op, tk, ctx)
	if op[2] ~= "Pet1" then
		return
	end
	forCardTargets(b, source, tk, ctx, function(t)
		if type(t.def.Effect) == "table" then
			ownDef(t).Effect = nil
			t.extra = t.extra or {}
			t.extra.NoAbilities = true
			Net.Send(b.player, "ChangeCardDescription", t.id, "This card has no abilities.")
		end
	end)
end

-- PATCH: GivePassive {"GivePassive", "Overload"} / RemovePassive {"RemovePassive", "Dextrous"}
VERBS.GivePassive = function(b, source, op, tk, ctx)
	local name = op[2]
	if type(name) ~= "string" then
		return
	end
	forCardTargets(b, source, tk, ctx, function(t)
		ownDef(t)[name] = true
		Net.Send(b.player, "GiveCardPassive", t.id, name) -- FIX: show the passive icon (e.g. Fading on roros7) on the client
	end)
end

VERBS.RemovePassive = function(b, source, op, tk, ctx)
	local name = op[2]
	if type(name) ~= "string" then
		return
	end
	forCardTargets(b, source, tk, ctx, function(t)
		if t.def[name] then
			ownDef(t)[name] = nil
			Net.Send(b.player, "RemoveCardPassive", t.id, name) -- FIX: hide the passive icon on the client
		end
	end)
end

-- PATCH: Suspend (SuspendImmune is checked by forCardTargets). Zombified fighters are obliterated when they leave play.
VERBS.Suspend = function(b, source, op, tk, ctx)
	b.suspended = b.suspended or {}
	forCardTargets(b, source, tk, ctx, function(t)
		if t.zone ~= "Field" then
			return
		end
		if t.def.Zombified then
			t.obliterated = true
			t.health = 0 -- server side only (processDeaths picks it up); the client never shows an obliterated fighter at 0 health
			return
		end
		Net.Send(b.player, "SuspendCard", t.id) -- FIX: slides down off the screen (DiscardCard made enemy fighters just vanish like an obliterate)
		t.zone = "Suspended"
		table.insert(b.suspended, { card = t, owner = t.owner })
		syncFaces(b)
	end)
end

VERBS.Unlock = function(b, source, op, tk, ctx)
	local n = tonumber(op[2]) or 1
	forCardTargets(b, source, tk, ctx, function(t)
		if t.lockTurns > 0 then
			setLock(b, t, t.lockTurns - n)
		end
	end)
end
VERBS.ReplaceColor = function(b, source, op, tk, ctx)
	local color = op[2]
	if not STUD_COLORS[color] then
		return
	end
	local anim = (type(source.def.EffectAnimation) == "string" and source.def.EffectAnimation ~= "") and source.def.EffectAnimation or nil
	forCardTargets(b, source, tk, ctx, function(t)
		local d = ownDef(t)
		d.Color = color
		-- "Remove all inertia from it" (paint card text). Delete these two lines if you don't want it:
		d.Token, d.TokenOmni, d.TokenGenZone = nil, nil, nil
		if t.extra then t.extra.Token, t.extra.TokenOmni, t.extra.TokenGenZone = nil, nil, nil end
		Net.Send(b.player, "ChangeCardColor", t.id, color)
		print("[ReplaceColor] " .. tostring(t.def.Name) .. " -> " .. color)
	end, anim)
end
VERBS.ReplaceRarity = function(b, source, op, tk, ctx)
	local rarity = op[2]
	if type(rarity) ~= "string" then
		return
	end
	forCardTargets(b, source, tk, ctx, function(t)
		if t.def.Rarity ~= rarity then
			ownDef(t).Rarity = rarity
			print("[ReplaceRarity] " .. tostring(t.def.Name) .. " -> " .. rarity .. " (from " .. tostring(source.def.Name) .. ")")
			Net.Send(b.player, "ChangeCardRarity", t.id, rarity)
		end
	end)
end
VERBS.Draw = function(b, source, op, tk)
	if op[6] == "RayDeath" and b.player and b.player.Parent then
		Net.Send(b.player, "PlayEffectCardAnimation", "", source.id, false, "RayDeath")
	end
	local n = 1
	if op[2] ~= nil then
		n = tonumber(op[2])
	end
	if not n or n <= 0 then
		return
	end
	-- NPC HAND: both sides have a real hand now.
	local owners
	if tk == "All" then
		owners = { "You", "Enemy" }
	elseif tk == "Opponent" or tk == "Enemy" then
		owners = { other(source.owner) }
	else
		owners = { source.owner }
	end
	for _, o in ipairs(owners) do
		local drawnCards = drawFor(b, o, n)
		-- MetaData = { TokenDiscard = true }: the drawn cards are inert when discarded (SamsonXVI)
		local tokenDiscard = false
		for _, ab in ipairs(getAbilities(source.def)) do
			if type(ab.spec.MetaData) == "table" and ab.spec.MetaData.TokenDiscard then
				tokenDiscard = true
			end
		end
		if tokenDiscard then
			for _, c in ipairs(drawnCards) do
				c.extra = c.extra or {}
				c.extra.TokenDiscard = true
				if o == "You" then
					Net.Send(b.player, "ReplaceEffectCard", c.id, { TokenDiscard = true })
				end
			end
		end
	end
end

-- FIX: FleetingDraw: like Draw, but the drawn cards are fleeting.
VERBS.FleetingDraw = function(b, source, op, tk, ctx)
	local prev = b.fleetingNow
	b.fleetingNow = true
	local ok, err = pcall(VERBS.Draw, b, source, op, tk, ctx)
	b.fleetingNow = prev
	if not ok then
		error(err, 0)
	end
end

VERBS.SetPower = function(b, source, op, tk, ctx)
	local n = tonumber(op[2])
	if not n or n < 0 then
		return
	end
	forCardTargets(b, source, tk, ctx, function(t)
		t.power = n
		Net.Send(b.player, "SetCardPower", t.id, n)
	end)
end

VERBS.Swap = function(b, source, op, tk, ctx)
	forCardTargets(b, source, tk, ctx, function(t)
		t.health, t.power = t.power, t.health
		Net.Send(b.player, "SwapCardStats", t.id, t.health, t.power)
	end)
end

-- FIX: {"ExchangePower", 30} / {"ExchangeHealth", 30}: the source card swaps its Power (or Health) with each targeted fighter
-- ("Exchange this card's power with a target fighter"). Only the single-target form is supported; the two-target "Variable"
-- form (Haydoscale) is still skipped because it needs the EV picker.
VERBS.ExchangePower = function(b, source, op, tk, ctx)
	if source.zone ~= "Field" then
		return
	end
	forCardTargets(b, source, tk, ctx, function(t)
		if t ~= source then
			source.power, t.power = t.power, source.power
			Net.Send(b.player, "SetCardPower", source.id, source.power)
			Net.Send(b.player, "SetCardPower", t.id, t.power)
		end
	end)
end
VERBS.ExchangeHealth = function(b, source, op, tk, ctx)
	if source.zone ~= "Field" then
		return
	end
	forCardTargets(b, source, tk, ctx, function(t)
		if t ~= source then
			source.health, t.health = t.health, source.health
			Net.Send(b.player, "SetCardHealth", source.id, source.health)
			Net.Send(b.player, "SetCardHealth", t.id, t.health)
		end
	end)
end

-- FIX: Obliterate: the targeted fighters are removed from the game. No death effects run and they don't enter the graveyard.
VERBS.Obliterate = function(b, source, op, tk, ctx)
	local dying = {}
	local vanishing = {}
	forCardTargets(b, source, tk, ctx, function(t)
		-- FIX (Delete Tool): "Destroy, then obliterate". A fighter an earlier Destroy in this ability already took to 0 health must
		-- DIE first (death effects fire, it reaches the graveyard) and only then be obliterated. Marking it obliterated straight away
		-- made processDeaths skip all of its death effects. (A card obliterating itself keeps the old behaviour.)
		if t ~= source and t.health <= 0 and not t.obliterated and not t.spawning then
			t.obliterateAfterDeath = true -- processDeaths: death effects first, then the card is removed instead of entering the graveyard
			table.insert(dying, t)
			return
		end
		-- PASSIVES: ObliterateImmune is checked in forCardTargets (it used to wrongly check DestroyImmune here)
		t.obliterated = true
		-- FIX (Twinedhealer89): count the obliterate NOW. It used to be counted in processDeaths, i.e. after the whole ability, so
		-- "ObliterateCount before / after" inside one ability always saw 0. processDeaths skips cards flagged here.
		t.obliterateCounted = true
		VERBS.__noteObliterated(b, t.owner)
		t.health = 0 -- server side only: the client is NOT told (no SetCardHealth), so the fighter keeps its health during the Ban Hammer
		-- et al. animation and until it vanishes. The client's VanishCard waits for the card's animation to finish.
		table.insert(vanishing, t)
	end)
	if #dying > 0 and not b.ended then
		-- FIX (Delete Tool): the fighter used to go through the normal death (CardsDied: the client flew it into the graveyard pile)
		-- and was only then marked "Dead" on the server, so it stayed in the client's graveyard for the rest of the game.
		-- processDeaths now sees obliterateAfterDeath: death effects fire, then the client DISCARDS the card (it vanishes) and it
		-- never enters the graveyard on either side.
		processDeaths(b)
		for _, t in ipairs(dying) do
			t.obliterateAfterDeath = nil
		end
	end
end

-- FIX: TempStrengthen: +Power that wears off at the end of the card's owner's turn (see tickLocks).
VERBS.TempStrengthen = function(b, source, op, tk, ctx)
	local n = tonumber(op[2])
	if not n or n <= 0 then
		return
	end
	forCardTargets(b, source, tk, ctx, function(t)
		t.power = t.power + n
		t.tempPower = (t.tempPower or 0) + n
		Net.Send(b.player, "StrengthenCard", t.id, t.power)
	end)
end

-- FIX (v10): TempWeaken: -Power that comes back at the end of the card's owner's turn (see tickLocks).
-- Only the Power that was really taken away is given back (Power can't go below 0).
VERBS.TempWeaken = function(b, source, op, tk, ctx)
	local n = tonumber(op[2])
	if not n or n <= 0 then
		return
	end
	forCardTargets(b, source, tk, ctx, function(t)
		local taken = math.min(n, t.power)
		if taken <= 0 then
			return
		end
		t.power = t.power - taken
		t.tempWeak = (t.tempWeak or 0) + taken
		Net.Send(b.player, "WeakenCard", t.id, t.power)
	end)
end

-- FIX (v10): StrengthenHand / HealHand / ArchetypeHandStrengthen / ArchetypeHandHeal: every fighter in a hand gains Power or Health.
-- Target Ally / Self = your hand, Opponent = theirs. The Archetype versions only touch fighters of the casting card's own Archetype.
-- The hand card keeps the new stats when it is cast. The client is only told about your own hand (the enemy's cards are face-down there).
do
	local function buffHand(b, source, op, tk, stat, archetypeOnly)
		local n = tonumber(op[2])
		if not n or n <= 0 then
			return
		end
		local archetype = source.def.Archetype
		if archetypeOnly and not archetype then
			return
		end
		local owner = (tk == "Opponent") and other(source.owner) or source.owner
		for _, c in ipairs(inZone(b, owner, "Hand")) do
			if cardType(c.def) == "Fighter" and (not archetypeOnly or c.def.Archetype == archetype) then
				if stat == "power" then
					c.power = c.power + n
					if c.owner == "You" then
						Net.Send(b.player, "StrengthenCard", c.id, c.power)
					end
				else
					c.health = c.health + n
					if c.owner == "You" then
						Net.Send(b.player, "HealCard", c.id, c.health)
					end
				end
			end
		end
	end
	VERBS.StrengthenHand = function(b, source, op, tk)
		buffHand(b, source, op, tk, "power", false)
	end
	VERBS.HealHand = function(b, source, op, tk)
		buffHand(b, source, op, tk, "health", false)
	end
	VERBS.ArchetypeHandStrengthen = function(b, source, op, tk)
		buffHand(b, source, op, tk, "power", true)
	end
	VERBS.ArchetypeHandHeal = function(b, source, op, tk)
		buffHand(b, source, op, tk, "health", true)
	end
end

-- FIX (v11): AddCopy: the source's owner gets a fresh copy of each targeted fighter in their hand (nothing if the hand is full or the card has AddBlock).
VERBS.AddCopy = function(b, source, op, tk, ctx)
	forCardTargets(b, source, tk, ctx, function(t)
		giveCard(b, source.owner, t.lib)
	end)
end

-- INJECT. "Destroy a non-Zombified fighter. If you do, give its controller a 500/300 Zombified copy of it that costs {W}{W}."
--   * a Zombified fighter is left alone: it is not destroyed and no copy is made
--   * a DestroyImmune fighter is not destroyed, but its controller still gets the copy
--   * InjectImmune / OmniImmune fighters can't be injected at all (VERB_IMMUNITY)
-- The copy's stats / cost come from the ability's MetaData (Health, Power, Cost, Zombified), with the usual 500/300 {W}{W} as default.
-- Triggers: OnInjected on the injected card, then OnAllyInject / OnEnemyInject on every fighter ("whenever you / your opponent inject a card").
local INJECT_DEFAULT = { Health = 500, Power = 300, Cost = { Neutral = 2 }, Zombified = true }
local function injectOverride(op, ctx)
	local md = op.MetaData or (ctx and ctx.spec and ctx.spec.MetaData)
	local o = {}
	for k, v in pairs(INJECT_DEFAULT) do
		o[k] = (type(md) == "table" and md[k] ~= nil) and md[k] or v
	end
	o.Cost = table.clone(o.Cost)
	return o
end
local function fireInjectTriggers(b, source, injected)
	for _, t in ipairs(injected) do
		if b.ended then
			return
		end
		if t.zone == "Field" then
			fireTrigger(b, t, "OnInjected", { other = source })
		end
		for _, c in ipairs(allFighters(b)) do
			if c.zone == "Field" and not b.ended then
				fireTrigger(b, c, c.owner == source.owner and "OnAllyInject" or "OnEnemyInject", { other = t })
			end
		end
	end
end
VERBS.Inject = function(b, source, op, tk, ctx)
	local injected = {}
	local override = injectOverride(op, ctx)
	local anim = type(op[7]) == "string" and op[7] or "SingleInject"
	forCardTargets(b, source, tk, ctx, function(t)
		if t.zone ~= "Field" or t.def.Zombified or cardType(t.def) ~= "Fighter" or t.health <= 0 then
			return
		end
		local did = false
		local copy = giveCard(b, t.owner, t.lib, true, override)
		if copy then
			did = true
		end
		if not immuneTo(source, t, "Destroy") then
			t.health = 0
			Net.Send(b.player, "SetCardHealth", t.id, 0)
			did = true
		end
		if did then
			table.insert(injected, t)
		end
	end, anim)
	fireInjectTriggers(b, source, injected)
end

-- INJECT: {"InjectHand", n | "Variable", "Ally"}: inject the n leftmost fighter cards of the owner's hand. Each one goes to the graveyard
-- and its owner gets the Zombified copy. Zombified cards and actions are skipped. "Variable" = the ability's effect variable.
VERBS.InjectHand = function(b, source, op, tk, ctx)
	local n = op[2] == "Variable" and (ctx and ctx.ev or 0) or tonumber(op[2]) or 0
	n = math.floor(n)
	if n <= 0 then
		return
	end
	local who = (tk == "Opponent") and other(source.owner) or source.owner
	local hand = inZone(b, who, "Hand")
	table.sort(hand, function(x, y)
		return x.handSeq < y.handSeq
	end)
	local override = injectOverride(op, ctx)
	local picked = {}
	for i = 1, math.min(n, #hand) do -- "the leftmost half of your hand": the first n cards, whatever they are
		table.insert(picked, hand[i])
	end
	local injected = {}
	for _, c in ipairs(picked) do
		if b.ended then
			break
		end
		if c.zone == "Hand" and not c.def.Zombified and cardType(c.def) == "Fighter" and not immuneTo(source, c, "Inject") then
			local lib = c.lib
			c.zone = "Graveyard"
			Net.Send(b.player, "MoveToGraveyard", { [c.owner] = { c.id } })
			giveCard(b, c.owner, lib, true, override)
			table.insert(injected, c)
		end
	end
	sendAffordable(b)
	-- the injected cards are no longer on the field, so only the "whenever you inject" triggers can fire
	for _, c in ipairs(injected) do
		if b.ended then
			break
		end
		for _, f in ipairs(allFighters(b)) do
			if f.zone == "Field" and not b.ended then
				fireTrigger(b, f, f.owner == source.owner and "OnAllyInject" or "OnEnemyInject", { other = c })
			end
		end
	end
end

-- FIX (v10): {"ShuffleDeck", 30, "Ally" | "Opponent"}: shuffle a deck (the number is only an animation delay).
VERBS.ShuffleDeck = function(b, source, op, tk)
	local who = (tk == "Opponent") and other(source.owner) or source.owner
	local deck = b.decks[who]
	if deck then
		shuffle(deck)
	end
end

-- FIX (v10): {"RandomEquipGear", {"Gear A", "Gear B", ...}, target}: every targeted fighter gets one of the listed gears, picked at random.
VERBS.RandomEquipGear = function(b, source, op, tk, ctx)
	local names = {}
	for _, n in ipairs(op[2]) do
		local name = resolveName(source.def, n)
		local d = DeckUtil.GetCard(name)
		if d and d.Gear then
			table.insert(names, name)
		end
	end
	if #names == 0 then
		return
	end
	forCardTargets(b, source, tk, ctx, function(t)
		local g = newCard(b, t.owner, names[math.random(#names)])
		if g then
			attachGear(b, t, g)
		end
	end)
end

-- FIX: SummonCopy: the source's owner summons a copy of each targeted fighter. A copy of yourself keeps your current stats.
-- copyGuard stops a copy's own "summon a copy" / "whenever you cast X: copy it" effect from copying forever.
VERBS.SummonCopy = function(b, source, op, tk, ctx)
	b.copyGuard = b.copyGuard or {}
	-- FIX: "Summon an inert copy": the ability's MetaData = { TokenOmni = true } was never read, so the copy was a normal card.
	local copyExtra
	for _, ab in ipairs(getAbilities(source.def)) do
		local md = ab.spec.MetaData
		if type(md) == "table" and (md.TokenOmni or md.Token) and type(ab.spec.Power) == "table" then
			for _, p in ipairs(ab.spec.Power) do
				if type(p) == "table" and p[1] == "SummonCopy" then
					copyExtra = { TokenOmni = true }
				end
			end
		end
	end
	-- FIX (Floofy_Bonez): MetaData = { Terrified = true, Unlock = 999 } was never read: the copy must be Terrified (obliterated during its
	-- owner's end step) and enter unlocked.
	local extra = copyExtra and { TokenOmni = true } or nil
	local mdc = ctx and ctx.spec and ctx.spec.MetaData
	if type(mdc) == "table" and (mdc.Terrified or mdc.Unlock or mdc.Zombified) then
		extra = extra or {}
		extra.Terrified = mdc.Terrified and true or nil
		extra.Unlock = tonumber(mdc.Unlock)
		extra.Zombified = mdc.Zombified and true or nil -- FIX (Vonderland): "except it's zombified" was never read
	end
	forCardTargets(b, source, tk, ctx, function(t)
		if b.copyGuard[t.lib] then
			return
		end
		b.copyGuard[t.lib] = true
		local ok, copy = pcall(summonCard, b, source.owner, t.lib, source, extra)
		b.copyGuard[t.lib] = nil
		if not ok then
			error(copy, 0)
		end
		if copy and tk == "Self" and copy.zone == "Field" then
			copy.health, copy.power = t.health, t.power
			copy.maxHealth = math.max(t.maxHealth or 0, t.health)
			Net.Send(b.player, "SetCardHealth", copy.id, copy.health)
			Net.Send(b.player, "SetCardPower", copy.id, copy.power)
		end
	end)
end

-- FIX (Incredibly Friendly and Helpful Devil): {"SummonEnemyCopy", 30, "Single"}: YOUR OPPONENT summons a copy of the targeted fighter
-- (the copy enters their field, with its printed stats).
VERBS.SummonEnemyCopy = function(b, source, op, tk, ctx)
	b.copyGuard = b.copyGuard or {}
	local who = other(source.owner)
	forCardTargets(b, source, tk, ctx, function(t)
		if b.copyGuard[t.lib] then
			return
		end
		b.copyGuard[t.lib] = true
		local ok, err = pcall(summonCard, b, who, t.lib, source)
		b.copyGuard[t.lib] = nil
		if not ok then
			error(err, 0)
		end
	end)
end

-- FIX (Ehj236): {"LastDeath"}: summon a copy of the allied fighter that just died (the OnAllyDeath trigger passes it as ctx.other).
VERBS.LastDeath = function(b, source, op, tk, ctx)
	local dead = ctx and ctx.other
	if not dead or dead == source or not dead.lib or dead.owner ~= source.owner then
		return
	end
	b.copyGuard = b.copyGuard or {}
	if b.copyGuard[dead.lib] then
		return
	end
	b.copyGuard[dead.lib] = true
	local ok, err = pcall(summonCard, b, source.owner, dead.lib, source)
	b.copyGuard[dead.lib] = nil
	if not ok then
		error(err, 0)
	end
end

-- FIX (SomaticMizuSan): the hand cards picked by the ability's ZoneTargetParameters (ctx.zt) get the cost changes of the
-- named "MultiSelectOperation<Name>" ability. Only IncreaseCost sub-ops are handled.
VERBS.MultiSelectOperation = function(b, source, op, tk, ctx)
	-- FIX (The Ratcatcher): field-targeted form. { "MultiSelectOperation", "Destroy", "CustomTarget" } with TargetParameters on the field
	-- runs the named "MultiSelectOperation<Name>" ability once per matching fighter, with that fighter as the "Aggressor":
	-- AlterEV remembers its name, EquipGear "Variable" attaches a copy of it to this card, Obliterate removes it.
	if ctx and ctx.tp and ctx.tp.Condition == "NotHealth" then
		local want = "MultiSelectOperation" .. tostring(op[2])
		local sub
		for _, ab in ipairs(getAbilities(source.def)) do
			if ab.trigger == want and type(ab.spec.Power) == "table" then
				sub = ab.spec
				break
			end
		end
		if not sub then
			return
		end
		for _, t in ipairs(resolveParamTargets(b, source, ctx.tp, ctx)) do
			if b.ended then
				break
			end
			if t.zone == "Field" and not t.obliterated and not t.def.TargetImmune then
				local c2 = {}
				for k, v in pairs(ctx) do
					c2[k] = v
				end
				c2.tp, c2.zt, c2.singleCache = nil, nil, nil
				c2.other, c2.choicePicked, c2.evCardName = t, t, t.lib
				for _, sop in ipairs(sub.Power) do
					local fn = type(sop) == "table" and sop[1] ~= "AlterEV" and VERBS[sop[1]]
					if fn then
						local sk = (type(sop[3]) == "string" and sop[3]) or sub.Target or "Self"
						local prev = b.verb
						b.verb = sop[1]
						local ok, err = pcall(fn, b, source, sop, sk, c2)
						b.verb = prev
						if not ok then
							warn("[Battlehandlers] MultiSelectOperation errored:", err)
						end
					end
				end
			end
		end
		return
	end
	local picked = ctx and ctx.zt
	if type(picked) ~= "table" or #picked == 0 then
		return
	end
	local want = "MultiSelectOperation" .. tostring(op[2])
	for _, ab in ipairs(getAbilities(source.def)) do
		if ab.trigger == want and type(ab.spec.Power) == "table" then
			for _, sub in ipairs(ab.spec.Power) do
				if type(sub) == "table" and sub[1] == "IncreaseCost" then
					local prev = b.verb
					b.verb = "IncreaseCost"
					local ok, err = pcall(VERBS.IncreaseCost, b, source, sub, "CustomZoneTarget", ctx)
					b.verb = prev
					if not ok then
						warn("[Battlehandlers] MultiSelectOperation errored:", err)
					end
				end
			end
		end
	end
end

-- FIX (Rochas313): {"SetArchetype", "Tree"}: the targeted fighters become that archetype.
VERBS.SetArchetype = function(b, source, op, tk, ctx)
	if type(op[2]) ~= "string" then
		return
	end
	forCardTargets(b, source, tk, ctx, function(t)
		ownDef(t).Archetype = op[2]
		Net.Send(b.player, "ChangeCardArchetype", t.id, op[2]) -- FIX (Rochas313): show the new group on the client
	end)
end

-- FIX: DeckAdd: put a card into a deck. At the top if the card's text says "top of", otherwise shuffled in.
VERBS.DeckAdd = function(b, source, op, tk)
	local who = source.owner
	if op[3] == "Opponent" or (op[3] == nil and tk == "Opponent") then
		who = other(who)
	end
	local card = newCard(b, who, resolveName(source.def, op[2]))
	if not card then
		return
	end
	card.zone = "Deck"
	local deck = b.decks[who]
	local desc = type(source.def.Effect) == "table" and tostring(source.def.Effect.Description or "") or ""
	local top = desc:lower():find("top of", 1, true) ~= nil
	table.insert(deck, top and (#deck + 1) or math.random(#deck + 1), card.id)
	Net.Send(b.player, "SetDeckAmount", who, #deck)
end

-- FIX: RandomTutorfor: a random matching card from your deck goes to your hand. The spec is a card name, or words:
-- rarity / colour / Fighter / Action / an archetype ("Sinister Fighter", "Rare Yellow", "YelloworNotClr Rageborne").
VERBS.RandomTutorfor = function(b, source, op)
	if type(op[2]) ~= "string" then
		return
	end
	local who = source.owner
	local spec = resolveName(source.def, op[2])
	local exact = DeckUtil.GetCard(spec) and baseKey(spec) or nil
	local function matches(c)
		if exact then
			return baseKey(c.lib) == exact
		end
		for word in spec:gmatch("%S+") do
			local d = c.def
			if word == "Token" then
				if not (d.Rarity == "Token" or d.Token or d.TokenOmni or d.TokenDiscard or d.TokenGenZone) then return false end
			elseif word == "YelloworNotClr" then
				if d.Color == "Yellow" then return false end
			elseif word == "HasPassiveorStation" or word == "HasPassiveOrStation" then
				-- FIX (General's Firerate Boost): "cards with Station" - the word used to be read as an archetype, so nothing ever matched
				if not d.Station then return false end
			elseif RARITY_WORDS[word] then
				if d.Rarity ~= word then return false end
			elseif COLOR_WORDS[word] then
				if d.Color ~= word then return false end
			elseif word == "Fighter" then
				if cardType(d) ~= "Fighter" then return false end
			elseif word == "Action" or word == "Effect" then
				if cardType(d) ~= "Effect" then return false end
			elseif d.Archetype ~= word then
				return false
			end
		end
		return true
	end
	if #inZone(b, who, "Hand") >= RULES.HandCap then
		return
	end
	local deck = b.decks[who]
	local picks = {}
	for i, id in ipairs(deck) do
		local c = b.cards[id]
		if c and matches(c) then
			table.insert(picks, i)
		end
	end
	if #picks == 0 then
		return
	end
	local i = picks[math.random(#picks)]
	local c = b.cards[deck[i]]
	table.remove(deck, i)
	toHand(b, c)
	if who == "You" then
		sendDraw(b, { c }, nil)
	else
		sendDraw(b, nil, { c })
	end
end

-- FIX: Transform: the targeted fighters turn into the card named by this card's "Transformant" (or the given name),
-- with that card's printed stats.
VERBS.Transform = function(b, source, op, tk, ctx)
	local name = resolveVariantReference(source, resolveName(source.def, op[2]))
	local newdef = DeckUtil.GetCard(name)
	if not newdef then
		return
	end
	newdef = gameplayDef(newdef)
	if cardType(newdef) ~= "Fighter" then
		return
	end
	-- Kathara Refugees (and its variants): no in-place flip. Each targeted fighter vanishes (no death effects, no graveyard, not counted
	-- as obliterated) and a fresh copy is summoned in its place with the normal summon animation + sound. The copies enter on the right
	-- of the field in the order the originals stood (leftmost original -> leftmost new copy) and keep the old fighter's lock state.
	if source.lib == "Kathara Refugees" or source.def.Original == "Kathara Refugees" or source.def.Name == "Kathara Refugees" then
		local picked = {}
		forCardTargets(b, source, tk, ctx, function(t)
			table.insert(picked, t)
		end)
		table.sort(picked, function(a, c)
			return (a.fieldSeq or a.n) < (c.fieldSeq or c.n)
		end)
		local locks = {}
		for _, t in ipairs(picked) do
			locks[t] = t.lockTurns or 0
			t.zone = "Dead" -- off the field for good: processDeaths ignores it, it can't be targeted or trigger anything
			shedGears(b, t)
			Net.Send(b.player, "VanishCard", t.id)
		end
		if #picked > 0 then
			wait(0.4) -- let the old cards disappear before the new ones appear
		end
		for _, t in ipairs(picked) do
			if b.ended then
				return
			end
			local c = summonCard(b, t.owner, name, source)
			if c then
				setLock(b, c, locks[t])
			end
		end
		return
	end
	forCardTargets(b, source, tk, ctx, function(t)
		t.lib = name
		t.def = newdef
		t.levelEV = nil -- FIX: a transformed card starts from its new card's own level
		t.descOverride = nil
		t.health = newdef.Health or 0
		t.maxHealth = t.health
		t.power = newdef.Power or 0
		t.tempPower = nil
		t.tempWeak = nil
		Net.Send(b.player, "FlipCard", t.id, fullInfo(t))
	end)
end

-- FIX: Reset: the targeted fighters go back to their printed Health and Power.
VERBS.Reset = function(b, source, op, tk, ctx)
	forCardTargets(b, source, tk, ctx, function(t)
		local h = tonumber(t.def.Health) or t.health
		local p = tonumber(t.def.Power) or t.power
		t.health = h
		t.maxHealth = h
		t.power = p
		t.tempWeak = nil
		Net.Send(b.player, "SetCardHealth", t.id, h)
		Net.Send(b.player, "SetCardPower", t.id, p)
	end)
end

-- FIX: Return: the targeted fighters go back to their owner's hand with fresh stats (they can be cast again).
-- If the owner's hand is full the card stays where it is.
VERBS.Return = function(b, source, op, tk, ctx)
	local moved = false
	local returned = {}
	forCardTargets(b, source, tk, ctx, function(t)
		if t.def.Zombified then
			-- PASSIVES: Zombified fighters are obliterated when they leave play for any reason
			t.obliterated = true
			t.health = 0 -- server side only; the client keeps showing its health until it vanishes
			return
		end
		if t.owner == "You" and #inZone(b, "You", "Hand") >= RULES.HandCap then
			return
		end
		if t.lockTurns and t.lockTurns > 0 then
			setLock(b, t, 0)
		end
		local wasGhost = t.ghostDef ~= nil
		if wasGhost then
			-- FIX (Havaluvian Blackmarketeer): a "ghost" (fighter turned into an action) KEEPS the Health and Power it has on the field
			-- when it goes back to the hand, so it can be cast again as that fighter. Its def stays the stats-bearing ghost def (the
			-- action's identity plus Health / Power), refreshed to the current stats; ghostDef stays so it can be returned again.
			local d = table.clone(t.def)
			d.Health = math.max(1, t.health)
			d.Power = t.power
			t.def = d
		end
		-- Any other action that has stats on the board keeps them too (actions have no printed stats, so the current ones are used).
		local h = tonumber(t.def.Health) or t.health
		local p = tonumber(t.def.Power) or t.power
		t.health = h
		t.maxHealth = h
		t.power = p
		t.tempWeak = nil
		shedGears(b, t) -- GEAR: changing zones removes it (to the graveyard)
		Net.Send(b.player, "SetCardHealth", t.id, h)
		Net.Send(b.player, "SetCardPower", t.id, p)
		toHand(b, t)
		if wasGhost then
			Net.Send(b.player, "FlipCard", t.id, fullInfo(t))
		end
		Net.Send(b.player, "ReturnCard", clientSide(t.owner), t.id)
		moved = true
		table.insert(returned, t)
	end)
	if moved then
		syncFaces(b)
		-- FIX (Mechromancer Flufflefunz): OnReturn ("When this card is returned to its hand") was never fired
		for _, t in ipairs(returned) do
			if not b.ended then
				fireTrigger(b, t, "OnReturn", {})
			end
		end
	end
end

-- "Generate": the targeted fighters generate studs now, as if it were the end of their owner's turn.
VERBS.Generate = function(b, source, op, tk, ctx)
	if tk == "CustomTarget" and ctx and ctx.graveCopy then
		local gc = ctx.graveCopy
		ctx.graveCopy = nil
		if not inertInPlay(gc) then
			for _ = 1, math.min(tonumber(op[2]) or 1, 10) do
				addStuds(b, gc.owner, studColor(gc.def), 1, gc.id)
			end
		end
		return
	end
	local n = math.min(tonumber(op[2]) or 1, 10)
	-- FIX (General's Firerate Boost): "All gear on your terrain generate": every gear (stationed cards included) on your terrain makes its stud
	local tpz = ctx and ctx.spec and ctx.spec.TargetParameters
	if tk == "CustomTarget" and type(tpz) == "table" and type(tpz.Zones) == "table" and tpz.Zones[1] == "Ally_Terrain" then
		local terrain = b.terrain and b.terrain[source.owner]
		for _, g in ipairs({ table.unpack((terrain and terrain.gears) or {}) }) do
			if b.ended then
				return
			end
			for _ = 1, n do
				addStuds(b, source.owner, studColor(g.def), 1, terrain.id)
			end
		end
		return
	end
	forCardTargets(b, source, tk, ctx, function(t)
		if not inertInPlay(t) then
			for _ = 1, n do
				addStuds(b, t.owner, studColor(t.def), 1, t.id)
			end
		end
	end)
end

-- Search your deck for a named card and put it in your hand.
VERBS.Tutorfor = function(b, source, op, tk, ctx)
	if type(op[2]) ~= "string" then
		return
	end
	local who = source.owner
	local name = resolveName(source.def, op[2])
	if op[2] == "Variable" then
		name = ctx and ctx.evCardName -- FIX (marbleycake): "search your deck for a copy of it" = the card AlterEV remembered
		if type(name) ~= "string" then
			return
		end
	end
	local deck = b.decks[who]
	for i = #deck, 1, -1 do
		local c = b.cards[deck[i]]
		if c and baseKey(c.lib) == baseKey(name) then
			if #inZone(b, who, "Hand") >= RULES.HandCap then
				return
			end
			table.remove(deck, i)
			toHand(b, c)
			if who == "You" then
				sendDraw(b, { c }, nil)
			else
				sendDraw(b, nil, { c })
			end
			return
		end
	end
end

-- {"Red", 1} etc: gain (or, if negative, lose) studs of that colour. A third entry of "Opponent" targets them.
for color in pairs(STUD_COLORS) do
	VERBS[color] = function(b, source, op, tk)
		local n = tonumber(op[2])
		if not n or n == 0 then
			return
		end
		-- "Your opponent gains 6{W}": the target can sit on the op itself or on the ability (Target = "Opponent").
		-- FIX (Terry Sinister): "All players gain {W}{W}" (Target = "All") only ever gave the studs to the card's owner.
		local owners = { source.owner }
		if op[3] == "Opponent" or (op[3] == nil and tk == "Opponent") then
			owners = { other(source.owner) }
		elseif op[3] == "All" or (op[3] == nil and tk == "All") then
			owners = { source.owner, other(source.owner) }
		end
		n = math.floor(n)
		for _, who in ipairs(owners) do
			local amount = n
			if amount < 0 then
				amount = -math.min(-amount, b.studs[who][color] or 0)
			end
			if amount ~= 0 then
				addStuds(b, who, color, amount, source.id)
				if b.ended then
					return
				end
			end
		end
	end
end

-- "Cost" is life you pay (negative = you gain life).
VERBS.Cost = function(b, source, op)
	local n = tonumber(op[2])
	if not n or n == 0 then
		return
	end
	changeLife(b, source.owner, -n, source.id)
end

-- "Inflict" is life your opponent loses, unless it explicitly points back at you.
VERBS.Inflict = function(b, source, op, tk)
	local n = tonumber(op[2])
	if not n or n == 0 then
		return
	end
	local explicit = type(op[3]) == "string" and op[3] or nil
	local target = explicit or tk
	if target == "All" then -- PATCH (Daisy et al.): "All players" hits both players
		changeLife(b, source.owner, -n, source.id)
		if not b.ended then
			changeLife(b, other(source.owner), -n, source.id)
		end
		return
	end
	local who = other(source.owner)
	if target == "Self" or target == "Ally" then
		who = source.owner
	end
	changeLife(b, who, -n, source.id)
end
VERBS.Add = function(b, source, op, tk, ctx)
	-- FIX (BEAR / Wire Puzzle): "Give your opponent a ..." (Target = "Opponent") returned here and never gave anything. Named adds now go
	-- into the OPPONENT's hand. (Variable / choice adds below still only ever go to the caster.)
	if tk == "Opponent" then
		if type(op[2]) ~= "string" or op[2] == "Variable" then
			return
		end
		local given = giveCard(b, other(source.owner), resolveVariantReference(source, resolveName(source.def, op[2])), true)
		-- FIX (BEAR / Wire Puzzle): a card you GIVE your opponent is face-up in their hand (opponent hand cards are otherwise sent as hidden stubs)
		if given and b.player and b.player.Parent then
			Net.Send(b.player, "RevealHand", { fullInfo(given) })
		end
		return
	end
	if op[2] == "Variable" and ctx and ctx.evGearName then return end -- FIX (Absentee Father): the random gear is cast straight away by ForceCast, not put in the hand
	if op[2] == "Variable" then
		local picked = ctx and ctx.choicePicked
		if picked then
			ctx.choicePicked = nil
			giveCard(b, source.owner, picked.lib)
		end
		return
	end
	if type(op[2]) ~= "string" then return end
	-- FIX (2Hex "remove {W} from its cost"): MetaData.Cost on an Add is the cost the given card gets (Moonleak {W}{W} -> {W}).
	local md = ctx and ctx.spec and ctx.spec.MetaData
	local override
	if type(md) == "table" and type(md.Cost) == "table" then
		override = { Cost = table.clone(md.Cost) }
	end
	giveCard(b, source.owner, resolveVariantReference(source, resolveName(source.def, op[2])), true, override) -- FIX: named Add ignores AddBlock
end

VERBS.Summon = function(b, source, op, tk, ctx)
	if type(op[2]) ~= "string" then
		return
	end
	local owner = (tk == "Opponent") and other(source.owner) or source.owner
	local extra
	local md = ctx and ctx.spec and ctx.spec.MetaData -- PATCH (Extant Archaeopteryx): MetaData = { Health = "Variable", Power = "Variable" }
	if type(md) == "table" and (md.Health == "Variable" or md.Power == "Variable") then
		local ev = math.max(0, math.floor(tonumber(ctx.ev) or 0))
		extra = { SetHealth = (md.Health == "Variable") and ev or nil, SetPower = (md.Power == "Variable") and ev or nil }
	end
	-- FIX (Zombified Chimera summoner): MetaData = { Health = 250, Power = 750 } gives the stats to a summoned card whose library entry
	-- is 0/0 (it would otherwise be treated as a spell and never enter the field); MetaData.Terrified makes it terrified.
	local sname = resolveVariantReference(source, resolveName(source.def, op[2]))
	if type(md) == "table" then
		local sd = DeckUtil.GetCard(sname)
		if sd and (tonumber(sd.Health) or 0) <= 0 and not extra and tonumber(md.Health) and tonumber(md.Health) > 0 then
			extra = { SetHealth = tonumber(md.Health), SetPower = tonumber(md.Power) }
		end
		if md.Terrified then
			extra = extra or {}
			extra.Terrified = true
		end
	end
	local c = summonCard(b, owner, sname, source, extra)
	if c and extra and (extra.SetHealth ~= nil or extra.SetPower ~= nil) then -- PATCH (Extant Archaeopteryx): the 0/0 token now gains its Health and Power
		wait(0.35)
		c.spawning = nil
		if (extra.SetHealth or 0) > 0 then
			c.health = extra.SetHealth
			Net.Send(b.player, "SetCardHealth", c.id, c.health)
		end
		if (extra.SetPower or 0) > 0 then
			c.power = extra.SetPower
			Net.Send(b.player, "StrengthenCard", c.id, c.power)
		end
	end
	if ctx then ctx.lastSummoned = c or false end -- FIX (v11)
end
-- FIX (Pawesome Party et al.): {"RepeatingSummon", { name, count }, target, ...}. Summons `count` copies of `name` (name may be a
-- def key such as "Summonant"; count may be "Variable" = the card's EV). The 4th..6th entries are client visuals (e.g. "BlissTriggerGreen").
VERBS.RepeatingSummon = function(b, source, op, tk, ctx)
	local spec = op[2]
	if type(spec) ~= "table" or type(spec[1]) ~= "string" then
		return
	end
	local count = spec[2]
	if count == "Variable" then
		count = ctx and ctx.ev
	end
	count = math.floor(tonumber(count) or 0)
	if count <= 0 then
		return
	end
	local who = (op[3] == "Opponent" or (type(op[3]) ~= "string" and tk == "Opponent")) and other(source.owner) or source.owner
	local name = resolveName(source.def, spec[1])
	for _ = 1, count do
		if b.ended then
			break
		end
		summonCard(b, who, name, source)
	end
end
VERBS.SummonWithEffect = function(b, source, op, tk, ctx)
	if type(op[2]) ~= "string" then
		return
	end
	local owner = (tk == "Opponent") and other(source.owner) or source.owner
	local c = summonCard(b, owner, resolveName(source.def, op[2]), source, nil, true)
	if ctx then ctx.lastSummoned = c or false end -- FIX (v11): false = summon failed (field full), so SummonedCard targets nothing
end

-- FIX: MoveZone. {"MoveZone", {mode, from, to, ...}}: mode EffectTarget = the cards picked by the ability's (Zone)TargetParameters,
-- BottomCard / TopCard = that end of the deck or graveyard. Cards are never moved by id (the client already knows them):
-- a fresh copy is created at the destination and the old one is retired. Moving into the graveyard from the deck is server-side only.
local function moveCardTo(b, source, c, tz, tside)
	local from = c.zone
	if from ~= "Deck" and from ~= "Graveyard" then
		return
	end
	local destOwner = tside == "Opponent" and other(source.owner) or source.owner
	local function leave()
		if from == "Deck" then
			local deck = b.decks[c.owner]
			for i = #deck, 1, -1 do
				if deck[i] == c.id then
					table.remove(deck, i)
					break
				end
			end
			Net.Send(b.player, "SetDeckAmount", c.owner, #deck)
		end
	end
	if tz == "Nil" then
		leave()
		c.zone = "Dead"
		VERBS.__noteObliterated(b, c.owner)
	elseif tz == "GraveZone" then
		if from == "Graveyard" then
			return
		end
		leave()
		c.zone = "Graveyard"
		if from == "Deck" then
			c.milled = true -- SEANCE: milled cards can't be seanced
		end
	elseif tz == "Hand" then
		if #inZone(b, destOwner, "Hand") >= RULES.HandCap then
			return
		end
		if from == "Deck" and c.owner == destOwner then
			leave()
			toHand(b, c)
			if destOwner == "You" then
				sendDraw(b, { c }, nil)
			else
				sendDraw(b, nil, { c })
			end
		else
			local n = giveCard(b, destOwner, c.lib)
			if n then
				leave()
				c.zone = "Dead"
				if from == "Graveyard" then
					Net.Send(b.player, "ScrubFromGrave", c.id)
				end
			end
		end
	elseif tz == "Field" then
		local n = summonCard(b, destOwner, c.lib, source)
		if n then
			leave()
			c.zone = "Dead"
		end
	elseif tz == "GenZone" then
		local n = putInBaseplate(b, destOwner, c.lib, nil, source.id)
		if n then
			leave()
			c.zone = "Dead"
		end
	end
end

-- SEANCE: a fighter from the graveyard is put into play as an unlocked, zombified 100/100 fighter that has Terrified
-- (it obliterates itself at its owner's next end step). Only fighters that died or were cast can be seanced (not milled ones).
-- The "NOrLower" part is a total-stud-cost limit; values above 20 (e.g. "200OrLower") are treated as no limit.
local function seanceMove(b, source, op)
	local a = op[2]
	local _, fside = parseZoneName(a[2])
	local _, tside = parseZoneName(a[3])
	local limit = tonumber(a[1]:match("^(%d+)OrLower"))
	local owner = fside == "Opponent" and other(source.owner) or source.owner
	local dest = tside == "Opponent" and other(source.owner) or source.owner
	if #fieldOf(b, dest) >= RULES.FieldCap then
		return
	end
	local pool = {}
	for _, c in ipairs(inZone(b, owner, "Graveyard")) do
		if cardType(c.def) == "Fighter" and not c.milled and not c.def.SeanceImmune then
			local ok = true
			if limit and limit <= 20 then
				local total = 0
				for _, amount in pairs(c.def.Cost or {}) do
					total = total + (tonumber(amount) or 0)
				end
				ok = total <= limit
			end
			if ok then
				table.insert(pool, c)
			end
		end
	end
	if #pool == 0 then
		return
	end
	local picked = chooseCards(b, source, pool, "a card from your Graveyard to seance", 1, 1)[1]
	if not picked or b.ended then
		return
	end
	local n = summonCard(b, dest, picked.lib, source, { Seance = true })
	if n then
		picked.zone = "Dead"
	end
end

VERBS.MoveZone = function(b, source, op, tk, ctx)
	local a = op[2]
	if type(a) ~= "table" then
		return
	end
	if op[7] == "Seance" and type(a[1]) == "string" and a[1]:match("^%d+OrLower") then
		return seanceMove(b, source, op)
	end
	local fz, fside = parseZoneName(a[2])
	local tz, tside = parseZoneName(a[3])
	-- FIX (Funeral Eulogist): "Recur an allied ranked card, except it's fading" / "destroy a ranked card in your deck". A ranked card is one that has a
	-- Rank. You pick which one; with no ranked card there it does nothing. MetaData = { Fading = true } makes the recurred copy fading.
	if a[1] == "Ranked" then
		local owner = fside == "Opponent" and other(source.owner) or source.owner
		local pool = {}
		if fz == "Deck" then
			for _, id in ipairs(b.decks[owner] or {}) do
				local c = b.cards[id]
				if c and (tonumber(c.def.Rank) or 0) > 0 then
					table.insert(pool, c)
				end
			end
		else
			for _, c in ipairs(inZone(b, owner, "Graveyard")) do
				if (tonumber(c.def.Rank) or 0) > 0 then
					table.insert(pool, c)
				end
			end
		end
		if #pool == 0 or b.ended then
			return
		end
		local picked = chooseCards(b, source, pool, fz == "Deck" and "a ranked card from your Deck" or "a ranked card from your Graveyard", 1, 1)[1]
		if not picked or b.ended then
			return
		end
		if tz == "Hand" and fz == "GraveZone" then
			local md = op.MetaData or (ctx and ctx.spec and ctx.spec.MetaData)
			local n = giveCard(b, tside == "Opponent" and other(source.owner) or source.owner, picked.lib)
			if n then
				picked.zone = "Dead"
				Net.Send(b.player, "ScrubFromGrave", picked.id)
				if type(md) == "table" and md.Fading then
					n.extra = n.extra or {}
					n.extra.Fading = true
				end
			end
		else
			moveCardTo(b, source, picked, tz, tside)
		end
		return
	end
	if fz == "GraveZone" and (tz == "Nil" or tz == "Hand") and type(a[1]) == "string" and DeckUtil.GetCard(a[1]) then
		local owner = fside == "Opponent" and other(source.owner) or source.owner
		local graveyard = inZone(b, owner, "Graveyard")
		if tz == "Hand" and op[3] == "Self" and source.owner == owner and source.zone == "Graveyard" and table.find(graveyard, source)
			and (source.lib == a[1] or baseKey(source.lib) == a[1] or source.def.Name == a[1] or source.def.Original == a[1]) then
			moveCardTo(b, source, source, tz, tside)
			return
		end
		local maxCount = math.max(1, math.floor(tonumber(a[6]) or 1))
		local moved = 0
		for _, c in ipairs(graveyard) do
			if b.ended or moved >= maxCount then
				break
			end
			if c.lib == a[1] or baseKey(c.lib) == a[1] or c.def.Name == a[1] or c.def.Original == a[1] then
				local before = c.zone
				moveCardTo(b, source, c, tz, tside)
				if c.zone ~= before then
					moved = moved + 1
				end
			end
		end
		return
	end
	-- FIX (Astarossa Van Buren): inject one random fighter from the graveyard that costs the effect variable or fewer total studs: its owner
	-- gets the Zombified copy (stats / cost from the ability's MetaData) in hand; the original stays in the graveyard.
	if a[1] == "VariableOrLower" and fz == "GraveZone" and tz == "Hand" then
		local limit = ctx.ev or 0
		local owner = fside == "Opponent" and other(source.owner) or source.owner
		local pool = {}
		for _, c in ipairs(inZone(b, owner, "Graveyard")) do
			if cardType(c.def) == "Fighter" and not c.milled and not c.def.Zombified and totalCost(c.def) <= limit and not immuneTo(source, c, "Inject") then
				table.insert(pool, c)
			end
		end
		if #pool > 0 then
			local pick = pool[math.random(#pool)]
			giveCard(b, owner, pick.lib, true, injectOverride(op, ctx))
			fireInjectTriggers(b, source, { pick })
		end
		return
	end
	-- FIX (Overseer Godhand): recur every fighter in the graveyard whose printed health is the effect variable (this card's health) or lower.
	-- a[6] is the most cards it may recur. Milled cards (never cast / never died) can't be recurred.
	if a[1] == "Fighter_VariableOrLowerHealth" then
		local limit = ctx.ev or 0
		local owner = fside == "Opponent" and other(source.owner) or source.owner
		local maxCount = tonumber(a[6]) or 99
		local picks = {}
		for _, c in ipairs(inZone(b, owner, "Graveyard")) do
			if cardType(c.def) == "Fighter" and not c.milled and (tonumber(c.def.Health) or 0) <= limit then
				table.insert(picks, c)
			end
		end
		for i, c in ipairs(picks) do
			if i > maxCount or b.ended then
				break
			end
			moveCardTo(b, source, c, tz, tside)
		end
		return
	end
	-- FIX (Yuéliáng / Hou Yi): {"<card name>", "<zone>_Ally", "Field_Ally"} = search that zone for the named card and summon the first match.
	if tz == "Field" and type(a[1]) == "string" and a[1] ~= "EffectTarget" and a[1] ~= "Target" and a[1] ~= "BottomCard" and a[1] ~= "TopCard" and DeckUtil.GetCard(a[1]) then
		local zn = ({ Hand = "Hand", Deck = "Deck", GraveZone = "Graveyard", GenZone = "Baseplate" })[fz]
		if zn then
			local owner = fside == "Opponent" and other(source.owner) or source.owner
			local found
			for _, c in ipairs(inZone(b, owner, zn)) do
				if c ~= source and (c.lib == a[1] or baseKey(c.lib) == a[1] or c.def.Name == a[1]) then
					found = c
					break
				end
			end
			if found and not b.ended then
				local destOwner = tside == "Opponent" and other(source.owner) or source.owner
				if summonCard(b, destOwner, found.lib, source) then
					if zn == "Deck" then
						local deck = b.decks[found.owner]
						for i = #deck, 1, -1 do
							if deck[i] == found.id then
								table.remove(deck, i)
								break
							end
						end
						Net.Send(b.player, "SetDeckAmount", found.owner, #deck)
					end
					found.zone = "Dead"
					if zn == "Hand" or zn == "Baseplate" then
						Net.Send(b.player, "DiscardCard", found.id)
					end
				end
			end
			return
		end
	end
	-- FIX (Secret_Purple2): the picked baseplate cards are obliterated (they vanish; no graveyard, no death effects)
	if a[1] == "Variable" and fz == "GenZone" and tz == "Nil" then
		for _, c in ipairs(ctx.zt or {}) do
			if c.zone == "Baseplate" then
				c.zone = "Dead"
				VERBS.__noteObliterated(b, c.owner)
				Net.Send(b.player, "DiscardCard", c.id) -- the client drops the baseplate card
			end
		end
		return
	end
	-- INJECT: the picked baseplate fighters go to the graveyard and their owner gets the Zombified copy in hand (see VERBS.Inject)
	if a[1] == "EffectTarget" and fz == "GenZone" and tz == "Hand" then
		local override = injectOverride(op, ctx)
		local injected = {}
		for _, c in ipairs(ctx.zt or {}) do
			if b.ended then
				break
			end
			if c.zone == "Baseplate" and not c.def.Zombified and cardType(c.def) == "Fighter" and not immuneTo(source, c, "Inject") then
				c.zone = "Graveyard"
				Net.Send(b.player, "MoveToGraveyard", { [c.owner] = { c.id } })
				giveCard(b, c.owner, c.lib, true, override)
				table.insert(injected, c)
			end
		end
		fireInjectTriggers(b, source, injected)
		return
	end
	-- FIX (Glaggling Gunman): copy the targeted fighter (the ability's Single/SingleEnemy pick, shared with the Damage op) into the graveyard.
	-- The original stays on the field, so the Damage op that follows still hits it.
	if fz == "Field" and a[1] == "EffectTarget" and tz == "GraveZone" then
		local destOwner = tside == "Opponent" and other(source.owner) or source.owner
		for _, c in ipairs(resolveCardTargets(b, source, tk, ctx)) do
			if b.ended then
				break
			end
			local copy = newCard(b, destOwner, c.lib)
			if copy then
				copy.zone = "Graveyard"
				Net.Send(b.player, "AddToGraveyard", clientSide(destOwner), nil, fullInfo(copy))
			end
		end
		return
	end
	-- FIX (Ancient Egg): {"EffectTarget", "GraveZone_Ally", "Nil", ...}, "Self" with no zone picker = obliterate THIS card out of the graveyard
	if a[1] == "EffectTarget" and fz == "GraveZone" and tz == "Nil" and op[3] == "Self" and ctx.zt == nil and not ctx.ztLazy then
		if source.zone == "Graveyard" then
			moveCardTo(b, source, source, "Nil", nil)
		end
		return
	end
	-- FIX (Vonderland): {"EffectTarget", "GraveZone_Ally", "Hand_Ally", ...}, "Self" with no zone picker = recur THIS card from the graveyard
	-- into the hand. With nothing picked it moved nothing, so "Recur this card" never happened.
	if a[1] == "EffectTarget" and fz == "GraveZone" and tz == "Hand" and op[3] == "Self" and ctx.zt == nil and not ctx.ztLazy then
		if source.zone == "Graveyard" and not source.milled and not b.ended then
			moveCardTo(b, source, source, "Hand", tside)
		end
		return
	end
	local cards = {}
	if a[1] == "EffectTarget" then
		if ctx.zt == nil and ctx.ztLazy then
			ctx.zt = resolveZoneTargets(b, source, ctx.ztLazy)
		end
		for _, c in ipairs(ctx.zt or {}) do
			table.insert(cards, c)
		end
	elseif a[1] == "Target" then
		if ctx.picked then
			cards = { ctx.picked }
			ctx.picked = nil
		end
	else
		local owner = fside == "Opponent" and other(source.owner) or source.owner
		local pool = {}
		if fz == "Deck" then
			for _, id in ipairs(b.decks[owner] or {}) do
				local c = b.cards[id]
				if c then
					table.insert(pool, c)
				end
			end
		else
			pool = inZone(b, owner, "Graveyard")
		end
		local pick = (a[1] == "BottomCard") and pool[1] or pool[#pool]
		if pick then
			cards = { pick }
		end
	end
	ctx.lastMovedCard = nil
	for _, c in ipairs(cards) do
		if b.ended then
			break
		end
		moveCardTo(b, source, c, tz, tside)
		ctx.lastMovedCard = c -- FIX (Eisenhower World Ablaze): "that card" for the CostColors that follows
	end
end

-- FIX: nothing ever read a card's SummonAnimation / SummonedAnimation / DeathAnimation, so Doge / Korblox / Ninja / Noob / Police / Meeboid ... never
-- played their entrance or death animation and sound. They are ordinary client effects (SoundEffects / SummonEffects / MiscEffects), played the
-- same way as an EffectAnimation. key = the def field to play; prefer = a field that wins when the card has it (SummonedAnimation for effect
-- summons). A name the client doesn't know only makes it warn "Unimplemented action effect", nothing else.
VERBS.__cardAnim = function(b, card, key, prefer)
	local def = card.def
	local name = prefer and def[prefer]
	if type(name) ~= "string" or name == "" then
		name = def[key]
	end
	if type(name) ~= "string" or name == "" or not (b.player and b.player.Parent) then
		return
	end
	Net.Send(b.player, "PlayEffectCardAnimation", clientSide(card.owner), card.id, false, name)
end

-- FIX: an obliterated FIGHTER used to be sent DiscardCard, which drops it down off the field. Obliterate is just a harder Destroy as far
-- as the board goes: the fighter flies onto the graveyard pile like any dead card (CardsDied) and the client then quietly removes it from
-- the pile again (ScrubFromGrave), because server side it is gone (zone "Dead"), not in the graveyard.
VERBS.__sendObliteratedToGrave = function(b, c)
	-- FIX: an obliterated fighter never goes near the graveyard (not even to be scrubbed from it again): it just vanishes from the board
	Net.Send(b.player, "VanishCard", c.id)
end

-- FIX: GraveDestroy: the picked graveyard cards are obliterated (they can't be seanced or recurred any more).
VERBS.__noteObliterated = function(b, owner)
	b.obliterateTotal = b.obliterateTotal or { You = 0, Enemy = 0 }
	if b.obliterateStamp ~= b.turnCount then
		b.obliterateStamp = b.turnCount
		b.obliterateTurn = { You = 0, Enemy = 0 }
	end
	b.obliterateTotal[owner] = b.obliterateTotal[owner] + 1
	b.obliterateTurn[owner] = b.obliterateTurn[owner] + 1
end
-- FIX (Bliss, Necro Syndicates): "4 allied fighters have died in a single one of your turns" (and a PLURRAL card in your starting deck):
-- you're in Bliss for the rest of the game. A Bliss token goes into your baseplate and the client plays the Bliss animation + sounds.
-- Called once per fighter that dies; the side that reached 4 is remembered in b.blissReady and entered after the deaths are processed.
VERBS.__blissDeath = function(b, owner)
	if not (b.plurral and b.plurral[owner]) or b.turnOwner ~= owner or (b.flags[owner] and b.flags[owner].Bliss) then
		return
	end
	if b.blissStamp ~= b.turnCount then
		b.blissStamp = b.turnCount
		b.blissDeaths = { You = 0, Enemy = 0 }
	end
	b.blissDeaths[owner] = b.blissDeaths[owner] + 1
	if b.blissDeaths[owner] >= 4 then
		b.blissReady = owner
	end
end
VERBS.__enterBliss = function(b, owner)
	b.blissReady = nil
	if b.ended or not b.flags or b.flags[owner].Bliss then
		return
	end
	b.flags[owner].Bliss = true
	if DeckUtil.GetCard("Bliss") then
		putInBaseplate(b, owner, "Bliss")
	end
	pcall(Net.Send, b.player, "EnterBliss", clientSide(owner))
end
VERBS.__obliterated = function(b, owner)
	if b.obliterateStamp ~= b.turnCount then
		b.obliterateStamp = b.turnCount
		b.obliterateTurn = { You = 0, Enemy = 0 }
	end
	return (b.obliterateTotal and b.obliterateTotal[owner]) or 0, (b.obliterateTurn and b.obliterateTurn[owner]) or 0
end
VERBS.GraveDestroy = function(b, source, op, tk, ctx)
	for _, c in ipairs(ctx.zt or {}) do
		if c.zone == "Graveyard" then
			VERBS.__noteObliterated(b, c.owner)
		end
	end
	-- RANSACK: count the picked cards and fire the ransack triggers before they are obliterated
	do
		local picked = {}
		for _, c in ipairs(ctx.zt or {}) do
			if c.zone == "Graveyard" then
				table.insert(picked, c)
			end
		end
		ctx.ransackCount = #picked
		-- FIX: tell the client to play the ransack slash animation + sound
		do
			local perSide = { You = 0, Enemy = 0 }
			for _, c in ipairs(picked) do
				perSide[c.owner] = (perSide[c.owner] or 0) + 1
			end
			for owner, n in pairs(perSide) do
				if n > 0 then
					Net.Send(b.player, "Ransack", clientSide(owner), n)
				end
			end
		end
		for _, c in ipairs(picked) do
			if b.ended then
				break
			end
			fireTrigger(b, c, "OnRansacked", {})
			for _, f in ipairs(fieldOf(b, source.owner)) do
				if f.zone == "Field" then
					fireTrigger(b, f, "OnAllyRansack", { other = c })
				end
			end
		end
	end
	for _, c in ipairs(ctx.zt or {}) do
		if b.ended then
			break
		end
		if c.zone == "Graveyard" then
			moveCardTo(b, source, c, "Nil", nil)
		end
	end
end

-- FIX: RandomTransform {"RandomTransform", "Fighter", target}: every targeted fighter turns into a random fighter (fresh stats).
VERBS.RandomTransform = function(b, source, op, tk, ctx)
	if op[2] == "Lunar" then
		-- FIX (Havaluvian Blackmarketeer): "Transform all allied fighters into Blue or Red actions" (CustomReminder "Havaluvian Ghosts":
		-- "An action with stats manifests into a fighter"). Each target takes the identity of a random Blue / Red Lunar action but keeps its
		-- current Health and Power, so it stays on the board as a "ghost". The real action is remembered in t.ghostDef: if the ghost is
		-- returned to its owner's hand it turns back into that action (see VERBS.Return). ASSUMED: this is how the ghosts should behave.
		local pool = poolFor({ lunar = true, kind = "Effect", colors = { Blue = true, Red = true } })
		if #pool == 0 then
			return
		end
		forCardTargets(b, source, tk, ctx, function(t)
			local name = pool[math.random(#pool)]
			local actionDef = DeckUtil.GetCard(name)
			if not actionDef then
				return
			end
			actionDef = gameplayDef(actionDef)
			local ghost = {}
			for k, v in pairs(actionDef) do
				ghost[k] = v
			end
			ghost.Health = math.max(1, t.health) -- stats of the fighter it replaces (cardType needs Health > 0 to keep it on the field)
			ghost.Power = t.power
			t.ghostDef = actionDef
			t.lib = name
			t.def = ghost
			t.maxHealth = ghost.Health
			t.tempPower = nil
			t.tempWeak = nil
			Net.Send(b.player, "FlipCard", t.id, fullInfo(t))
		end)
		return
	end
	local pool = getFighterPool()
	if #pool == 0 then
		return
	end
	forCardTargets(b, source, tk, ctx, function(t)
		local name = pool[math.random(#pool)]
		local newdef = DeckUtil.GetCard(name)
		if not newdef then
			return
		end
		newdef = gameplayDef(newdef)
		t.lib = name
		t.def = newdef
		t.health = newdef.Health or 0
		t.maxHealth = t.health
		t.power = newdef.Power or 0
		t.tempPower = nil
		t.tempWeak = nil
		Net.Send(b.player, "FlipCard", t.id, fullInfo(t))
	end)
end

-- FIX: IncreaseCost. op[2] = { amount, colour, mode, cap }: that colour of the card's cost goes up (or, if negative, down) by
-- amount, never below 0. mode "CapCost" with a cap stops a reduction going below cap (or an increase going above it).
-- The change is stored on the card (card.costMod), is used when the card is cast, and the client card is updated.
VERBS.IncreaseCost = function(b, source, op, tk, ctx)
	local a = op[2]
	local amount, color = tonumber(a[1]), a[2]
	local cap = (a[3] == "CapCost") and tonumber(a[4]) or nil
	local targets = {}
	if tk == "Self" then
		targets = { source }
	elseif tk == "CustomZoneTarget" or (tk == "CustomTarget" and ctx.zt) then
		targets = ctx.zt or {}
	else
		forCardTargets(b, source, tk, ctx, function(t)
			table.insert(targets, t)
		end)
	end
	local changed = false
	for _, t in ipairs(targets) do
		if type(t.def.Cost) == "table" and (t.zone == "Hand" or t.zone == "Field" or t.zone == "Deck") then
			local base = tonumber(t.def.Cost[color]) or 0
			local now = base + ((t.costMod and t.costMod[color]) or 0)
			local new = now + amount
			if cap then
				if amount < 0 then
					new = math.max(new, math.min(cap, now))
				else
					new = math.min(new, math.max(cap, now))
				end
			end
			new = math.max(new, 0)
			t.costMod = t.costMod or {}
			t.costMod[color] = new - base
			changed = true
			Net.Send(b.player, "ChangeCardCost", t.id, effectiveCost(t))
		end
	end
	if changed then
		sendAffordable(b)
	end
end

-- {"RandomSummon", "Fighter", "Opponent"}: summon a random fighter for a side.
-- FIX (v11): {"RandomSummon", { "A", "B", "C" }} summons one of THOSE cards (Revel of the Pits' Cheering Demons, Cat Cafe ...).
-- It used to ignore the list and summon a random fighter from the whole library.
local function randomSummonPool(op, ctx)
	-- FIX (Twinedhealer89): "Variable Fighter" = a random fighter of the colour AlterEV saved (nothing if no colour was saved)
	if op[2] == "Variable Fighter" then
		local col = ctx and ctx.evColor
		local names = {}
		if col then
			for _, n in ipairs(getFighterPool()) do
				local d = DeckUtil.GetCard(n)
				if d and d.Color == col and d.Original == nil then
					table.insert(names, n)
				end
			end
		end
		return names
	end
	if type(op[2]) == "table" then
		local names = {}
		for _, n in ipairs(op[2]) do
			if type(n) == "string" and DeckUtil.GetCard(n) then
				table.insert(names, n)
			end
		end
		return names
	end
	return getFighterPool()
end
VERBS.RandomSummon = function(b, source, op, tk, ctx)
	local pool = randomSummonPool(op, ctx)
	if #pool == 0 then
		return
	end
	local owner = (tk == "Opponent") and other(source.owner) or source.owner
	local c = summonCard(b, owner, pool[math.random(#pool)], source)
	if ctx then ctx.lastSummoned = c or false end
end
VERBS.RandomSummonWithEffect = function(b, source, op, tk, ctx)
	local pool = randomSummonPool(op, ctx)
	if #pool == 0 then
		return
	end
	local owner = (tk == "Opponent") and other(source.owner) or source.owner
	local c = summonCard(b, owner, pool[math.random(#pool)], source, nil, true)
	if ctx then ctx.lastSummoned = c or false end
end

-- {"RandomAdd", "Common"}: put a random card of that kind in your hand.
VERBS.RandomAdd = function(b, source, op, tk, ctx)
	local owner = (tk == "Opponent") and other(source.owner) or source.owner
	if op[2] == "Fighter Variable" then
		-- FIX (Peaspod): a random fighter card of the archetype saved by AlterEV (nothing if the target had no group)
		local arch = ctx and ctx.evArchetype
		if type(arch) ~= "string" then
			return
		end
		local pool = {}
		for _, n in ipairs(poolFor({ kind = "Fighter", archetype = arch })) do
			local nd = DeckUtil.GetCard(n)
			if nd and not gameplayDef(nd).RandomAddBlock and not gameplayDef(nd).AddBlock then
				table.insert(pool, n)
			end
		end
		if #pool > 0 then
			giveCard(b, owner, pool[math.random(#pool)])
		end
		return
	end
	if type(op[2]) == "table" then
		-- FIX: explicit list of card names: give one of them at random (ignoring names that aren't in the library)
		local names = {}
		for _, n in ipairs(op[2]) do
			local nd = type(n) == "string" and DeckUtil.GetCard(n)
			if nd and not gameplayDef(nd).RandomAddBlock then -- PASSIVES: RandomAddBlock
				table.insert(names, n)
			end
		end
		if #names > 0 then
			giveCard(b, owner, names[math.random(#names)])
		end
		return
	end
	local f = parsePoolSpec(op[2])
	if not f then
		return
	end
	local pool = {}
	for _, n in ipairs(poolFor(f)) do
		local nd = DeckUtil.GetCard(n)
		if nd and not gameplayDef(nd).RandomAddBlock and not gameplayDef(nd).AddBlock then -- PASSIVES: RandomAddBlock / AddBlock
			table.insert(pool, n)
		end
	end
	if #pool > 0 then
		giveCard(b, owner, pool[math.random(#pool)])
	end
end

-- FIX (v10): {"RepeatingAdd", { "Card name or def key", count }, "Ally"}: give yourself `count` copies of a card (count may be "Variable" = the
-- card's EffectVariable). Stops early when your hand is full. Same shape as RepeatingSummon.
VERBS.RepeatingAdd = function(b, source, op, tk, ctx)
	local spec = op[2]
	if tk == "Opponent" or type(spec) ~= "table" or type(spec[1]) ~= "string" then
		return
	end
	local count = spec[2]
	if count == "Variable" then
		count = ctx and ctx.ev
	end
	count = math.min(math.floor(tonumber(count) or 0), RULES.HandCap)
	local name = resolveName(source.def, spec[1])
	for _ = 1, count do
		if b.ended or not giveCard(b, source.owner, name) then
			break
		end
	end
end

-- FIX (v10): {"RepeatingRandomAdd", { {"Card A", "Card B"} | "pool spec / archetype" | "Card name", count }, "Ally"}: `count` times, give yourself a
-- random one of those cards (every time a fresh random pick). Uses RandomAdd for lists and pool specs.
VERBS.RepeatingRandomAdd = function(b, source, op, tk, ctx)
	local spec = op[2]
	if type(spec) ~= "table" then
		return
	end
	local count = spec[2]
	if count == "Variable" then
		count = ctx and ctx.ev
	end
	count = math.min(math.floor(tonumber(count) or 0), RULES.HandCap)
	local owner = (tk == "Opponent") and other(source.owner) or source.owner
	local single
	if type(spec[1]) == "string" and parsePoolSpec(spec[1]) == nil then
		single = resolveName(source.def, spec[1]) -- not a pool spec: it names one card
		if not DeckUtil.GetCard(single) then
			return
		end
	end
	for _ = 1, count do
		if b.ended then
			break
		end
		if single then
			if not giveCard(b, owner, single) then
				break
			end
		else
			VERBS.RandomAdd(b, source, { "RandomAdd", spec[1] }, tk)
		end
	end
end

VERBS.AddGenZone = function(b, source, op, tk)
	local arg = op[2]
	local key, count = arg, 1
	if type(arg) == "table" then
		key, count = arg[1], tonumber(arg[2]) or 1
	end
	if type(key) ~= "string" then
		return
	end
	local name = resolveVariantReference(source, resolveName(source.def, key))
	if not DeckUtil.GetCard(name) then
		return
	end
	local extra
	for _, ab in ipairs(getAbilities(source.def)) do
		local md = ab.spec.MetaData
		if type(md) == "table" and md.TokenGenZone then
			extra = { TokenGenZone = true }
		end
	end
	local owner = (tk == "Opponent") and other(source.owner) or source.owner
	for _ = 1, math.min(count, 50) do -- FIX: was capped at 3, so cards that put 10 into the baseplate only put 3
		putInBaseplate(b, owner, name, extra, source.id)
	end
end

-- NEW: GraveAdd. {"GraveAdd", "GraveAddant"} (optionally with a third "Ally" / "Opponent"): a fresh copy of the card named by the
-- source's GraveAddant (e.g. Fashionable Citizen: "When this card dies: put 2 copies of it into your graveyard") is put straight
-- into that side's graveyard. The client is told with AddToGraveyard so the card exists there and the graveyard count updates.
VERBS.GraveAdd = function(b, source, op, tk, ctx)
	if op[2] == "Variable" then
		local vname = ctx and ctx.evCardName
		local vowner = (tk == "Opponent") and other(source.owner) or source.owner
		local vcard = vname and newCard(b, vowner, vname)
		if not vcard then
			return
		end
		vcard.zone = "Graveyard"
		Net.Send(b.player, "AddToGraveyard", clientSide(vowner), nil, fullInfo(vcard))
		ctx.graveCopy = vcard
		return
	end
	if type(op[2]) ~= "string" then
		return
	end
	local name = resolveName(source.def, op[2])
	local owner = (tk == "Opponent") and other(source.owner) or source.owner
	local card = newCard(b, owner, name)
	if not card then
		return
	end
	card.zone = "Graveyard"
	Net.Send(b.player, "AddToGraveyard", clientSide(owner), nil, fullInfo(card))
end

-- FIX: {"RandomGraveAdd", "MonoOnlyorRedCost Red Fighter"}: a random card from that pool goes into the graveyard.
VERBS.RandomGraveAdd = function(b, source, op, tk)
	local owner = (tk == "Opponent") and other(source.owner) or source.owner
	local name
	if type(op[2]) == "table" then
		local names = {}
		for _, n in ipairs(op[2]) do
			if type(n) == "string" and DeckUtil.GetCard(n) then
				table.insert(names, n)
			end
		end
		if #names > 0 then
			name = names[math.random(#names)]
		end
	else
		local f = parsePoolSpec(op[2])
		if f then
			local pool = poolFor(f)
			if #pool > 0 then
				name = pool[math.random(#pool)]
			end
		end
	end
	if not name then
		return
	end
	local card = newCard(b, owner, name)
	if not card then
		return
	end
	card.zone = "Graveyard"
	Net.Send(b.player, "AddToGraveyard", clientSide(owner), nil, fullInfo(card))
end

-- {"SetNeutral", 2, "Opponent"}: set a colour's studs to an exact amount.f
for color in pairs(STUD_COLORS) do
	VERBS["Set" .. color] = function(b, source, op, tk)
		local n = tonumber(op[2])
		if not n or n < 0 then
			return
		end
		local who = source.owner
		if op[3] == "Opponent" or (op[3] == nil and tk == "Opponent") then
			who = other(who)
		end
		local delta = math.floor(n) - (b.studs[who][color] or 0)
		if delta ~= 0 then
			addStuds(b, who, color, delta, source.id)
		end
	end
end

-- Number of cards a side has in a zone (used by the effect variable).
local function zoneCount(b, owner, zone)
	if zone == "Deck" then
		return #b.decks[owner]
	end
	return #inZone(b, owner, zone)
end

VERBS.CreateChoices = function(b, source, op, tk, ctx)
	ctx.choices, ctx.choicePicked = nil, nil
	if type(op[2]) == "table" then
		-- FIX (Eyedeeuhs Djinn): CreateAllAsChoices - every listed card is a choice
		local all = {}
		for _, libName in ipairs(op[2]) do
			local c = newCard(b, source.owner, libName)
			if c then
				c.zone = "Choice"
				table.insert(all, c)
			end
		end
		ctx.choices = all
		ctx.choiceLabel = (type(op[2][1]) == "string" and op[2][1]:find(" Stud$")) and "a colour" or nil
		return
	end
	local names = choicePool(op[2])
	if #names == 0 then return end
	local e = source.def.Effect
	local n = math.max(1, math.floor((type(e) == "table" and tonumber(e.AmountOfTargets)) or 2))
	local choices = {}
	for _, libName in ipairs(randomPicks(names, n)) do
		local c = newCard(b, source.owner, libName)
		if c then c.zone = "Choice"; table.insert(choices, c) end
	end
	ctx.choices = choices
end

VERBS.AlterEV = function(b, source, op, tk, ctx)
	do
		local a1 = op[2]
		-- FIX (Kathara Sojourner): EV = the health of the targeted fighter (shares the ability's single pick, so it is the fighter the
		-- Swap just changed: this reads the health AFTER the swap)
		if type(a1) == "table" and (a1[1] == "Set" or a1[1] == "Add") and a1[2] == "Target" and a1[3] == "Health" and (op[3] == "Single" or op[3] == "SingleAlly" or op[3] == "SingleEnemy") then
			local hp
			forCardTargets(b, source, tk, ctx, function(t)
				if hp == nil then
					hp = tonumber(t.health) or 0
				end
			end)
			hp = hp or 0
			ctx.ev = (a1[1] == "Set") and hp or ((ctx.ev or 0) + hp)
			return
		end
		-- FIX (Twinedhealer89): remember the colour of the targeted fighter; RandomSummon(WithEffect) "Variable Fighter" reads it
		if type(a1) == "table" and a1[1] == "Save" and a1[2] == "Target" and a1[3] == "Color" then
			ctx.evColor = nil
			forCardTargets(b, source, tk, ctx, function(t)
				if ctx.evColor == nil then
					ctx.evColor = t.def.Color
				end
			end)
			return
		end
		if type(a1) == "table" and a1[1] == "Load" and a1[2] == "Target" and a1[3] == "Color" then
			return -- the colour stays in ctx.evColor for the follow-up (OnEVCheckPass shares ctx with the ability that saved it)
		end
		-- FIX (Twinedhealer89): EV += / -= the obliterate counter (the Set form already existed)
		if type(a1) == "table" and (a1[1] == "Add" or a1[1] == "Subtract") and a1[2] == "Playertable" and (a1[3] == "TotalObliterateCount" or a1[3] == "ObliterateCount") then
			local total, turn = VERBS.__obliterated(b, source.owner)
			local v = (a1[3] == "TotalObliterateCount") and total or turn
			ctx.ev = (a1[1] == "Add") and ((ctx.ev or 0) + v) or ((ctx.ev or 0) - v)
			return
		end
		-- FIX (Absentee Father): remember a random name from the list (the "Variable" of the following Add / ForceCast ops)
		if type(a1) == "table" and a1[1] == "SetRandomTableValue" and type(a1[3]) == "table" and #a1[3] > 0 then
			ctx.evGearName = a1[3][math.random(#a1[3])]
			return
		end
		-- FIX (Eisenhower World Ablaze et al.): EV = how many colours (Neutral is colourless) are in the stud cost of a card:
		-- the cast card (Aggressor), the card MoveZone just moved (CustomTarget) or this card.
		if type(a1) == "table" and a1[1] == "Set" and a1[2] == "Target" and a1[3] == "CostColors" then
			local t
			if op[3] == "Aggressor" then
				t = ctx.other
			elseif op[3] == "CustomTarget" then
				t = ctx.lastMovedCard or (ctx.zt and ctx.zt[1])
			else
				t = source
			end
			local n = 0
			if t then
				local cost = t.costMod and effectiveCost(t) or t.def.Cost or {}
				for color, amt in pairs(cost) do
					if color ~= "Neutral" and type(amt) == "number" and amt > 0 then
						n = n + 1
					end
				end
			end
			ctx.ev = n
			return
		end
		-- FIX (Astarossa Van Buren): EV = total stud cost of the card that triggered this ability (the cast card)
		if type(a1) == "table" and a1[1] == "Set" and a1[2] == "Target" and a1[3] == "Cost" and op[3] == "Aggressor" then
			ctx.ev = ctx.other and totalCost(ctx.other.def) or 0
			return
		end
		-- FIX (Eisenhower, World Ablaze): EV = the total stud cost (Neutral included) of the card MoveZone just moved ("that card")
		if type(a1) == "table" and a1[1] == "Set" and a1[2] == "Target" and a1[3] == "Cost" and op[3] == "CustomTarget" then
			local t = ctx.lastMovedCard or (ctx.zt and ctx.zt[1])
			ctx.ev = t and totalCost({ Cost = t.costMod and effectiveCost(t) or t.def.Cost }) or 0
			return
		end
		-- FIX (Peaspod): remember the archetype ("group") of the fighter the ability targets; RandomAdd "Fighter Variable" reads it
		if type(a1) == "table" and a1[1] == "Set" and a1[2] == "Target" and a1[3] == "Archetype" and (op[3] == nil or op[3] == "GearOwner") then
			ctx.evArchetype = nil
			forCardTargets(b, source, tk, ctx, function(t)
				if ctx.evArchetype == nil and type(t.def.Archetype) == "string" then
					ctx.evArchetype = t.def.Archetype
				end
			end)
			return
		end
		-- FIX (Kilnkin Behemoth / Wheeler / Heart / Sergeant): number of gears on the fighter. These used to fall through to the zone-count code
		-- at the bottom, which read the "Target" part as a zone and always set the value to 0.
		if type(a1) == "table" and a1[1] == "Set" and a1[2] == "Target" and (a1[3] == "EquippedGearCount" or a1[3] == "SpecificEquippedGearCount") then
			local holder = (op[3] == "Aggressor" and ctx.other) or source
			if op[3] == "AllyTerrain" then
				holder = (b.terrain and b.terrain[source.owner]) or { gears = {} }
			end
			local n = 0
			for _, g in ipairs(holder.gears or {}) do
				if a1[3] == "EquippedGearCount" or g.lib == a1[4] or g.def.Name == a1[4] or g.def.Original == a1[4] then
					n = n + 1
				end
			end
			ctx.ev = n
			return
		end
		-- FIX (Overseers): EV = the casting card's current health. Set replaces the EV, Add adds to it.
		if type(a1) == "table" and (a1[1] == "Set" or a1[1] == "Add") and a1[2] == "Target" and a1[3] == "Health" and (op[3] == nil or op[3] == "Self") then
			local hp = tonumber(source.health) or 0
			ctx.ev = (a1[1] == "Set") and hp or ((ctx.ev or 0) + hp)
			return
		end
		-- FIX (Cheshire): {"Save"/"Load", "EffectVariable", "nil", "<slot>"}: remember / recall the EV (the follow-up check overwrites it)
		if type(a1) == "table" and a1[1] == "Save" and a1[2] == "EffectVariable" then
			ctx.savedEV = ctx.savedEV or {}
			ctx.savedEV[a1[4]] = ctx.ev or 0
			return
		end
		if type(a1) == "table" and a1[1] == "Load" and (a1[2] == "EffectVariable" or a1[2] == "Math") then -- FIX (Eisenhower World Ablaze): the Math form
			ctx.ev = (ctx.savedEV and ctx.savedEV[a1[4]]) or 0
			return
		end
		-- FIX (Kilnkin Sergeant): Save / Load a fighter between the ability and its OnEVCheckPass follow-up (they share ctx)
		if type(a1) == "table" and a1[1] == "Save" and a1[3] == "CardInstance" then
			ctx.saved = ctx.saved or {}
			ctx.saved[a1[4]] = (op[3] == "Aggressor") and ctx.other or source
			return
		end
		if type(a1) == "table" and a1[1] == "Load" and a1[3] == "CardInstance" then
			ctx.loadedCard = ctx.saved and ctx.saved[a1[4]] or nil
			return
		end
		-- FIX (Kilnkin Swimmer): 1 if its owner has cast that card type this turn
		if type(a1) == "table" and (a1[1] == "Set" or a1[1] == "Add") and a1[2] == "Playertable" and CAST_EV_KINDS[a1[3]] ~= nil then
			local t = b.castTypes and b.castTypes[source.owner]
			local v = (t and t[CAST_EV_KINDS[a1[3]]]) and 1 or 0
			ctx.ev = (a1[1] == "Set") and v or ((ctx.ev or 0) + v)
			return
		end
		-- FIX (Regent of Warped Mud): cards before the blessed space the cast card came from = its 0-based card space
		if type(a1) == "table" and a1[1] == "Set" and a1[2] == "Target" and a1[3] == "Power" and op[3] == "Self" then
			ctx.ev = source.power or 0
			return
		end
		if type(a1) == "table" and a1[1] == "Set" and a1[2] == "Target" and a1[3] == "HandOrigin" and op[3] == nil then
			ctx.ev = tonumber((ctx.other or source).handOrigin) or 0
			return
		end
		if type(a1) == "table" and a1[1] == "Set" and a1[2] == "Target" and a1[3] == "Power" and op[3] == nil then
			ctx.ev = (ctx.other or source).power or 0
			return
		end
		-- FIX: number of blessings the ability's owner has in their hand
		if type(a1) == "table" and a1[1] == "Set" and a1[2] == "Playertable" and a1[3] == "ModifiedHandSlots" then
			ctx.ev = VERBS.__blessCount(b, source.owner)
			return
		end
		if type(a1) == "table" and a1[1] == "Set" and a1[2] == "Playertable" and a1[3] == "Bliss" then
			ctx.ev = (b.flags[source.owner] and b.flags[source.owner].Bliss) and 1 or 0 -- FIX (Necro Syndicates)
			return
		end
		if type(a1) == "table" and a1[1] == "Set" and a1[2] == "Playertable" and a1[3] == "ExtantDeathCount" then
			ctx.ev = (b.extantDied and b.extantDied[source.owner]) or 0 -- PATCH (Extant Archaeopteryx)
			return
		end
		if type(a1) == "table" and a1[1] == "Gate" then
			ctx.ev = ((ctx.ev or 0) > a1[3]) and 1 or 0
			return
		end
		if type(a1) == "table" and a1[1] == "Cap" then
			ctx.ev = math.min(ctx.ev or 0, a1[3])
			return
		end
		if type(a1) == "table" and a1[1] == "Set" and a1[2] == "Playertable" and (a1[3] == "TotalObliterateCount" or a1[3] == "ObliterateCount") then
			local total, turn = VERBS.__obliterated(b, source.owner)
			ctx.ev = (a1[3] == "TotalObliterateCount") and total or turn
			return
		end
	end
	do
		local a0 = op[2]
		if type(a0) == "table" and a0[1] == "ResetRansack" then
			ctx.ransackCount = 0
			ctx.ev = 0
			return
		end
		if type(a0) == "table" and a0[3] == "RansackCount" then
			ctx.ev = ctx.ransackCount or 0
			return
		end
	end
	local a = op[2]
	if type(a) == "table" and a[1] == "Set" and a[2] == "Target" and (a[3] == "CardIndex" or a[3] == "CardIndexOriginal") and op[3] == "Aggressor" then
		ctx.evCardName = ctx.other and ctx.other.lib or nil
		if a[3] == "CardIndexOriginal" and ctx.evCardName then
			ctx.evCardName = baseKey(ctx.evCardName) -- FIX (marbleycake)
		end
		return
	end
	if type(a) == "table" and a[1] == "Set" and a[2] == "Target" and a[3] == "CardIndex" and op[3] == "CustomZoneTarget" then
		local picked = ctx.zt and ctx.zt[1]
		ctx.evCardName = picked and picked.lib or nil -- nil when nothing was picked (empty baseplate): the GraveAdd ops then do nothing
		return
	end
	if type(a) == "table" and a[1] == "Set" and a[2] == "Target" and a[3] == "IsMarked" and op[3] == "Aggressor" then
		local o = ctx.other -- the fighter this card is attacking
		ctx.ev = (o and o.def.Marked) and 1 or 0
		return
	end
	local pickSrc = a[2] == "Target" and PICK_SOURCES[op[3]]
	if pickSrc and pickSrc.choice then
		local choices = ctx.choices or {}
		local picked = chooseCards(b, source, choices, ctx.choiceLabel or "a Shiny", 1, 1)[1]
		ctx.choicePicked = picked
		ctx.choiceLabel = nil
		if a[3] == "Color" then
			ctx.evColor = picked and picked.def.Color or nil -- FIX (Eyedeeuhs Djinn): the colour of the picked stud card
		end
		for _, c in ipairs(choices) do
			if c ~= picked then b.cards[c.id] = nil end
		end
		ctx.choices = nil
		return
	end
	if pickSrc then
		local owner = pickSrc.mine and source.owner or other(source.owner)
		local pool = {}
		if pickSrc.zone == "Deck" then
			for _, id in ipairs(b.decks[owner] or {}) do
				if b.cards[id] then
					table.insert(pool, b.cards[id])
				end
			end
		else
			pool = inZone(b, owner, "Graveyard")
		end
		local label
		if pickSrc.zone == "Deck" then
			label = pickSrc.mine and "a card from your Deck" or "a card from the enemy's Deck"
		else
			label = "a card from your Graveyard"
		end
		ctx.picked = chooseCards(b, source, pool, label, 1, 1)[1]
		return
	end
	local value
	if a[2] == "Math" then
		value = a[3]
	else
		local zone, side = tostring(a[2]):match("^(%a+)_(%a+)$")
		local who = (side == "Ally") and source.owner or other(source.owner)
		if a[3] == "Rarity" then
			-- FIX (Bloxikin Horde): {"Set"/"Add", "<Zone>_Ally", "Rarity", "Rare"} = number of cards of that rarity in the zone
			value = 0
			local rc = {}
			if zone == "Deck" then
				for _, id in ipairs(b.decks[who] or {}) do
					if b.cards[id] then
						table.insert(rc, b.cards[id])
					end
				end
			else
				rc = inZone(b, who, EV_ZONES[zone])
			end
			for _, c in ipairs(rc) do
				if c.def.Rarity == a[4] then
					value = value + 1
				end
			end
		elseif zone == "GenZone" and STUD_COLORS[a[3]] == true then
			-- FIX (PlatinumFalls): {"Set", "GenZone_Ally", "<Colour>", "Nil"} = number of baseplate cards of that colour
			value = 0
			for _, c in ipairs(inZone(b, who, "Baseplate")) do
				if c.def.Color == a[3] then
					value = value + 1
				end
			end
		elseif zone == "Field" and STUD_COLORS[a[3]] == true then
			-- FIX (wish_z): {"Set", "Field_Ally", "<Colour>", "Nil"} = number of living fighters of that colour on that field.
			-- The validator rejected this op, so the whole ability never ran.
			value = 0
			for _, c in ipairs(inZone(b, who, "Field")) do
				if (c.health or 0) > 0 and c.def.Color == a[3] then
					value = value + 1
				end
			end
		elseif a[3] ~= "All" then
			value = 0
			local cards = {}
			if zone == "Deck" then
				for _, id in ipairs(b.decks[who] or {}) do
					if b.cards[id] then
						table.insert(cards, b.cards[id])
					end
				end
			else
				cards = inZone(b, who, EV_ZONES[zone])
			end
			for _, c in ipairs(cards) do
				local matches = a[3] == "Action" and cardType(c.def) == "Effect"
				if not matches then
					matches = c.lib == a[3] or baseKey(c.lib) == a[3] or c.def.Name == a[3] or c.def.Original == a[3]
				end
				if matches then
					value = value + 1
				end
			end
		else
			value = zoneCount(b, who, EV_ZONES[zone])
		end
	end
	local ev = ctx.ev or 0
	if a[1] == "Set" then
		ev = value
	elseif a[1] == "Add" then
		ev = ev + value
	elseif a[1] == "Subtract" then
		ev = ev - value
	elseif a[1] == "Multiply" then
		ev = ev * value
	elseif a[1] == "Divide" and value ~= 0 then
		ev = ev / value
	end
	ctx.ev = ev
end

-- The checks don't stop the ability; they pick which follow-up (OnEVCheckPass / OnEVCheckFail) runs after it.
VERBS.EVGreaterValueCheck = function(b, source, op, tk, ctx)
	local th = op[2]
	ctx.evSuffix = nil
	if type(th) == "table" then
		ctx.evSuffix, th = th[2], th[1] -- FIX: named branch, e.g. { 0, "InBliss" } -> OnEVCheckPassInBliss / OnEVCheckFailInBliss
	end
	if ctx.evSuffix ~= nil and STUD_COLORS[ctx.evSuffix] == true then
		-- FIX (PlatinumFalls): several colour checks in ONE ability each fire their own OnEVCheckPass<Colour> follow-up afterwards
		-- (before, only the last check survived, so only Yellow could ever fire)
		if (ctx.ev or 0) > th then
			ctx.evMulti = ctx.evMulti or {}
			table.insert(ctx.evMulti, ctx.evSuffix)
		end
		ctx.evSuffix = nil
		ctx.evResult = nil
		return
	end
	ctx.evResult = (ctx.ev or 0) > th
end
VERBS.EVExactValueCheck = function(b, source, op, tk, ctx)
	local th = op[2]
	ctx.evSuffix = nil
	if type(th) == "table" then
		ctx.evSuffix, th = th[2], th[1]
	end
	-- FIX (Perfected Immortality): several named checks in ONE ability each fire their own OnEVCheckPass<Name> follow-up
	if ctx.evSuffix == "Luckytux" or ctx.evSuffix == "Icytea" then
		if (ctx.ev or 0) == th then
			ctx.evMulti = ctx.evMulti or {}
			table.insert(ctx.evMulti, ctx.evSuffix)
		end
		ctx.evSuffix = nil
		ctx.evResult = nil
		return
	end
	if type(th) == "string" and type(ctx.evSuffix) == "string" and ctx.evSuffix:sub(1, 6) == "Select" then
		-- FIX (Eyedeeuhs Djinn): several colour checks in ONE ability, each firing its own OnEVCheckPassSelect<Colour>
		if ctx.evColor == th then
			ctx.evMulti = ctx.evMulti or {}
			table.insert(ctx.evMulti, ctx.evSuffix)
		end
		ctx.evSuffix = nil
		ctx.evResult = nil
		return
	end
	if type(th) == "string" then
		ctx.evResult = (ctx.evArchetype == th) -- FIX (Rochas313 / Nosoi): archetype check (nil archetype never matches)
		return
	end
	ctx.evResult = (ctx.ev or 0) == th
end

-- FIX (Eyedeeuhs Djinn): {"PaySetCost", { { Red = 3 }, "Red" }}: pay those studs if you have them; if you did, the card's OnPayCost<Colour> ability fires.
VERBS.PaySetCost = function(b, source, op, tk, ctx)
	local spec = op[2]
	local pool = b.studs and b.studs[source.owner]
	if type(spec) ~= "table" or type(spec[1]) ~= "table" or not pool then
		return
	end
	for color, n in pairs(spec[1]) do
		if type(n) == "number" and (pool[color] or 0) < n then
			return
		end
	end
	for color, n in pairs(spec[1]) do
		if type(n) == "number" and n > 0 then
			addStuds(b, source.owner, color, -n, source.id)
		end
	end
	sendAffordable(b)
	if type(spec[2]) == "string" and not b.ended then
		fireTrigger(b, source, "OnPayCost" .. spec[2], {})
	end
end

-- FIX (Eyedeeuhs Djinn): {"Yellow", 1} etc. = the ability's owner gains that many studs of the colour.
for _, studColourName in ipairs({ "Red", "Blue", "Green", "Yellow" }) do
	VERBS[studColourName] = function(b, source, op, tk)
		local n = math.floor(tonumber(op[2]) or 0)
		if n <= 0 then
			return
		end
		local who = (tk == "Opponent" or tk == "Enemy") and other(source.owner) or source.owner
		addStuds(b, who, studColourName, n, source.id)
		sendAffordable(b)
	end
end

-- Destroy the oldest (leftmost) or newest (rightmost) card in a hand. Only the player has a hand to lose cards from.
VERBS.SpecificDiscard = function(b, source, op)
	local mode = op[3]
	local right = mode:find("Right") ~= nil
	local victim
	if mode:sub(1, 6) == "Allied" then
		victim = source.owner
	elseif mode:sub(1, 5) == "Enemy" then
		victim = other(source.owner)
	else
		victim = "You"
	end
	if b.noHandDestroy and b.noHandDestroy[victim] then
		return -- FIX (Solstice the Demonseeker)
	end
	for _ = 1, math.floor(op[2]) do
		local hand = inZone(b, victim, "Hand")
		if #hand == 0 then
			return
		end
		table.sort(hand, function(x, y)
			return x.handSeq < y.handSeq
		end)
		local card = right and hand[#hand] or hand[1]
		card.zone = "Graveyard"
		Net.Send(b.player, "MoveToGraveyard", { [victim] = { card.id } })
		sendAffordable(b)
	end
end

-- Shuffle random cards from a list into the owner's deck.
VERBS.RandomDeckAdd = function(b, source, op, tk)
	local owner = (tk == "Opponent") and other(source.owner) or source.owner
	local list = op[2]
	if type(list) == "string" then
		local f = parsePoolSpec(list)
		list = f and poolFor(f) or {}
		if #list == 0 then return end
	end
	local name = resolveName(source.def, list[math.random(#list)])
	local card = newCard(b, owner, name)
	if not card then
		return
	end
	card.zone = "Deck"
	local deck = b.decks[owner]
	table.insert(deck, math.random(#deck + 1), card.id)
	Net.Send(b.player, "SetDeckAmount", owner, #deck)
end

-- Cards from this point on can't be cast as actions for the rest of the owner's turn.
VERBS.BypassAction = function(b, source)
	b.noActions[source.owner] = true
end

-- {"EquipGear", "Gear Name", [target]}: attach a fresh copy of that gear to each targeted fighter.
VERBS.EquipGear = function(b, source, op, tk, ctx)
	local gearName = op[2]
	if gearName == "Variable" then
		local picked = ctx and ctx.choicePicked
		if not picked then return end
		gearName = picked.lib
	else
		gearName = resolveName(source.def, gearName)
	end
	forCardTargets(b, source, tk, ctx, function(t)
		local g = newCard(b, t.owner, gearName)
		if g then
			attachGear(b, t, g)
		end
	end)
end

-- FIX (Absentee Father, Xen ...): {"TargetAddStrengthenBonus" | "TargetAddHealthBonus", n, "CustomTarget"}: every gear on the targeted
-- fighters gains +n Power / +n Health. The holder gets the bonus now, and the gear remembers it so DestroyGear takes it away again.
VERBS.__gearBonus = function(b, source, op, tk, ctx, stat)
	local n = math.floor(tonumber(op[2]) or 0)
	if n == 0 then
		return
	end
	forCardTargets(b, source, tk, ctx, function(t)
		for _, g in ipairs(t.gears or {}) do
			local gd = ownDef(g)
			if stat == "Power" then
				gd.AddPower = (tonumber(gd.AddPower) or 0) + n
				t.power = math.max(0, t.power + n)
				Net.Send(b.player, "AddPowerCard", g.id .. "_gear", gd.AddPower)
			else
				gd.AddHealth = (tonumber(gd.AddHealth) or 0) + n
				t.health = t.health + n
				Net.Send(b.player, "AddHealthCard", g.id .. "_gear", gd.AddHealth)
			end
		end
		if t.gears and #t.gears > 0 then
			if stat == "Power" then
				Net.Send(b.player, "StrengthenCard", t.id, t.power)
			else
				Net.Send(b.player, "SetCardHealth", t.id, t.health)
			end
		end
	end)
end
VERBS.TargetAddHealthBonus = function(b, source, op, tk, ctx)
	VERBS.__gearBonus(b, source, op, tk, ctx, "Health")
end

-- FIX (Absentee Father): {"ForceCast", {"Variable"}}: cast the gear named by the earlier SetRandomTableValue for free. You pick which allied fighter it goes on.
VERBS.ForceCast = function(b, source, op, tk, ctx)
	local name = ctx and ctx.evGearName
	if ctx then
		ctx.evGearName = nil
	end
	if not name or not DeckUtil.GetCard(name) then
		return
	end
	local pool = {}
	for _, c in ipairs(fieldOf(b, source.owner)) do
		if c.zone == "Field" and not c.died then
			table.insert(pool, c)
		end
	end
	local t = chooseTarget(b, source, pool)
	if not t then
		return
	end
	local g = newCard(b, source.owner, name)
	if g then
		attachGear(b, t, g)
	end
end

-- FIX (Absentee Father): {"TargetAddStrengthenBonus", n, "CustomTarget"} with Condition "EquippedGears": every allied gear gets +n Power (the holder gains it too)
VERBS.TargetAddStrengthenBonus = function(b, source, op, tk, ctx)
	local n = tonumber(op[2]) or 0
	if n == 0 then
		return
	end
	for _, f in ipairs(fieldOf(b, source.owner)) do
		for _, g in ipairs(f.gears or {}) do
			local d = ownDef(g)
			d.AddPower = (tonumber(d.AddPower) or 0) + n
			f.power = f.power + n
			Net.Send(b.player, "StrengthenCard", f.id, f.power)
			-- FIX (Absentee Father): the gear icon itself shows the new +N bonus (client keeps gear under id .. "_gear")
			Net.Send(b.player, "AddPowerCard", g.id .. "_gear", d.AddPower)
		end
	end
end

-- {"DestroyGear", 1 | "All" | "Gear Name", [target]}: remove gear (stat bonuses go with it).
VERBS.DestroyGear = function(b, source, op, tk, ctx)
	forCardTargets(b, source, tk, ctx, function(t)
		local left = t.gears
		if not left or #left == 0 then
			return
		end
		local want = op[2]
		local kept, count = {}, 0
		for _, g in ipairs(left) do
			local kill = (want == "All") or (type(want) == "number" and count < want) or (type(want) == "string" and (g.lib == want or g.def.Name == want))
			if kill then
				count = count + 1
				sendGearToGrave(b, t, g)
				local ap, ah = tonumber(g.def.AddPower) or 0, tonumber(g.def.AddHealth) or 0
				if ap ~= 0 then
					t.power = math.max(0, t.power - ap)
					Net.Send(b.player, "SetCardPower", t.id, t.power)
				end
				if ah ~= 0 then
					t.health = math.max(1, t.health - ah)
					Net.Send(b.player, "SetCardHealth", t.id, t.health)
				end
			else
				table.insert(kept, g)
			end
		end
		t.gears = kept
	end)
end

-- FIX (Kilnkin Sergeant): {"RandomMoveGear", {"Variable", "Flaw", true}, "Self"}: move a random gear with that name from the targeted fighter
-- onto the fighter an earlier {"AlterEV", {"Load", "Target", "CardInstance", slot}} loaded (ctx.loadedCard). The gear is not destroyed: it never
-- visits the graveyard (UnequipGear is sent WITHOUT card info so the client doesn't add it to the pile), the old holder gets its stat bonus
-- back and the new holder gets it through attachGear.
VERBS.RandomMoveGear = function(b, source, op, tk, ctx)
	local want = type(op[2]) == "table" and op[2][2] or nil
	local dest = ctx and ctx.loadedCard
	if type(want) ~= "string" or not dest or dest.zone ~= "Field" then
		return
	end
	forCardTargets(b, source, tk, ctx, function(holder)
		if holder == dest or not holder.gears then
			return
		end
		local candidates = {}
		for i, g in ipairs(holder.gears) do
			if g.lib == want or g.def.Name == want or g.def.Original == want then
				table.insert(candidates, i)
			end
		end
		if #candidates == 0 then
			return
		end
		local g = table.remove(holder.gears, candidates[math.random(#candidates)])
		if g.grantedPassive and holder.ownDef then
			holder.def[g.grantedPassive] = nil
			Net.Send(b.player, "RemoveCardPassive", holder.id, g.grantedPassive)
		end
		g.grantedPassive = nil
		g.attachedTo = nil
		Net.Send(b.player, "UnequipGear", holder.id, g.id .. "_gear", clientSide(g.owner)) -- no info: not a trip to the graveyard
		local ap, ah = tonumber(g.def.AddPower) or 0, tonumber(g.def.AddHealth) or 0
		if ap ~= 0 then
			holder.power = math.max(0, holder.power - ap)
			Net.Send(b.player, "SetCardPower", holder.id, holder.power)
		end
		if ah ~= 0 then
			holder.health = math.max(1, holder.health - ah)
			Net.Send(b.player, "SetCardHealth", holder.id, holder.health)
		end
		attachGear(b, dest, g)
	end)
end

-- Can't attack / can't cast fighters for the rest of the owner's turn (Hallow's Treats).
-- FIX (Eisenhower, the Alchemist): the ability's Target decides WHO is restricted. It always hit the card's owner, so Eisenhower's
-- "whenever the opponent casts a fighter: they can't attack" (Target = "Opponent") stopped his own controller from attacking instead.
VERBS.BypassAttack = function(b, source, op, tk)
	local who = (tk == "Opponent" or tk == "Enemy") and other(source.owner) or source.owner
	b.noAttack[who] = true
end
VERBS.BypassSummon = function(b, source, op, tk)
	local who = (tk == "Opponent" or tk == "Enemy") and other(source.owner) or source.owner
	b.noSummon[who] = true
end

-- {"CheckHealth", {min, max}}: destroy the targeted fighters whose Health is in that range.
VERBS.CheckHealth = function(b, source, op, tk, ctx)
	local lo, hi = op[2][1], op[2][2]
	forCardTargets(b, source, tk, ctx, function(t)
		if t.health >= lo and t.health <= hi and not t.def.DestroyImmune then
			t.health = 0
			Net.Send(b.player, "SetCardHealth", t.id, 0)
		end
	end)
end

-- Playertable flag set by The Ultra Gate while it is in play (Ultra fighters need it to be cast).
VERBS.BypassUltra = function(b, source, op)
	b.flags[source.owner].BypassUltra = tonumber(op[2]) or 0
end

-- {"CheckPower", {min, max}}: destroy the targeted fighters whose Power is in that range.
VERBS.CheckPower = function(b, source, op, tk, ctx)
	local lo, hi = op[2][1], op[2][2]
	forCardTargets(b, source, tk, ctx, function(t)
		if t.power >= lo and t.power <= hi and not t.def.DestroyImmune then
			t.health = 0
			Net.Send(b.player, "SetCardHealth", t.id, 0)
		end
	end)
end

-- Melee cast animations (hammer / crowbar / bat / harbinger) release the client queue at the moment of the hit themselves
-- (see PlayEffectCardAnimation on the client), so the server must not add its own delay for them.
RULES.IsMeleeAnim = function(name)
	if type(name) ~= "string" then
		return false
	end

	for _, size in ipairs({ "Small", "Mid", "Large" }) do
		if string.sub(name, 1, #size) == size then
			local rest = string.sub(name, #size + 1)

			for _, kind in ipairs({ "Hammer", "Crowbar", "Bat", "Harbinger" }) do
				if string.sub(rest, 1, #kind) == kind then
					return true
				end
			end
		end
	end

	return false
end

-- BLESSINGS helpers: defined once at load (they used to be defined inside runAbility, so PlaceCard crashed until an ability had run)
-- BLESSINGS: slots are 0-based hand positions (oldest card = slot 0) and stay put as cards leave the hand.
VERBS.__blessSlotOf = function(b, card)
	local hand = inZone(b, card.owner, "Hand")
	table.sort(hand, function(x, y)
		return x.handSeq < y.handSeq
	end)
	for i, c in ipairs(hand) do
		if c == card then
			return i - 1
		end
	end
	return nil
end
VERBS.__blessSet = function(b, owner, slot, name)
	b.bless = b.bless or { You = {}, Enemy = {} }
	b.bless[owner][slot] = name
	Net.Send(b.player, "ChangeHandSlot", clientSide(owner), { slot }, name or "NoBlessing")
end
VERBS.__blessApplyCast = function(b, card)
	local name = card.castBless
	card.castBless = nil
	if name == "EldritchBless" and not card.def.StrengthenImmune then
		card.power = card.power + 150
		Net.Send(b.player, "StrengthenCard", card.id, card.power)
	end
end
-- FIX: number of blessings a player has in their hand ("if you have 3 or more blessings")
VERBS.__blessCount = function(b, owner)
	local n = 0
	local have = b.bless and b.bless[owner]
	if have then
		for sl = 0, RULES.HandCap - 1 do
			if have[sl] ~= nil then
				n = n + 1
			end
		end
	end
	return n
end
-- FIX: is this card sitting in a blessed card space of its owner's hand?
VERBS.__blessInSlot = function(b, card)
	if card.zone ~= "Hand" then
		return false
	end
	local slot = VERBS.__blessSlotOf(b, card)
	local have = b.bless and b.bless[card.owner]
	return slot ~= nil and have ~= nil and have[slot] ~= nil
end
-- FIX: which card space a hand card sits on and which blessing is on it (no side effects). Remembers the space as card.handOrigin.
VERBS.__blessPeek = function(b, card)
	local slot = VERBS.__blessSlotOf(b, card)
	card.handOrigin = slot
	local have = b.bless and b.bless[card.owner]
	local name = nil
	if slot ~= nil and have ~= nil then
		name = have[slot]
	end
	return slot, name
end
-- FIX: the card is cast / discarded from that space: use the blessing up (castModified = "cast from a blessed card space")
VERBS.__blessUse = function(b, card, slot, name)
	card.handOrigin = slot
	if name ~= nil and slot ~= nil then
		card.castBless = name
		card.castModified = true
		VERBS.__blessSet(b, card.owner, slot, nil)
	else
		card.castBless = nil
		card.castModified = nil
	end
end
-- FIX (Solstice the Demonseeker): "Until your next end step, card effects can't destroy cards in your hand."
VERBS.BypassHandDestroy = function(b, source)
	b.noHandDestroy = b.noHandDestroy or {}
	b.noHandDestroy[source.owner] = true
end
-- FIX (Knockdown, Herrus the Omniscient): {"RemoveHandModifiers", 30, "Self" | "Me" | "Him" | "Opponent" | "All"}: remove every blessing from a hand
VERBS.RemoveHandModifiers = function(b, source, op, tk)
	local side = (type(op[3]) == "string" and op[3]) or tk or "Self"
	local owners
	if side == "Him" or side == "Opponent" or side == "Enemy" then
		owners = { other(source.owner) }
	elseif side == "All" then
		owners = { source.owner, other(source.owner) }
	else
		owners = { source.owner }
	end
	b.bless = b.bless or { You = {}, Enemy = {} }
	for _, owner in ipairs(owners) do
		local slots = {}
		for sl in pairs(b.bless[owner]) do
			table.insert(slots, sl)
		end
		for _, sl in ipairs(slots) do
			VERBS.__blessSet(b, owner, sl, nil)
		end
	end
end
VERBS.AddHandModifier = function(b, source, op, tk, ctx)
	local name = op[2]
	if type(name) ~= "string" then
		return
	end
	local target = (type(op[3]) == "string" and op[3]) or tk or "Self"
	local owner = source.owner
	if target:find("Enemy") or target == "Opponent" then
		owner = other(owner)
	end
	b.bless = b.bless or { You = {}, Enemy = {} }
	local have = b.bless[owner]
	local hand = inZone(b, owner, "Hand")
	table.sort(hand, function(x, y)
		return x.handSeq < y.handSeq
	end)
	local md = op.MetaData or (ctx and ctx.spec and ctx.spec.MetaData)
	local slots = {}
	if type(md) == "table" and type(md.SlotTargets) == "table" then
		for _, sl in ipairs(md.SlotTargets) do
			if type(sl) == "number" then
				table.insert(slots, math.floor(sl))
			end
		end
	elseif target == "AdjacentHandAggressor" then
		-- FIX (Saros Aligner): the card spaces right next to the one the cast card came from
		local agg = ctx and ctx.other
		local origin = agg and tonumber(agg.handOrigin)
		if origin then
			for _, sl in ipairs({ origin - 1, origin + 1 }) do
				if sl >= 0 then
					table.insert(slots, sl)
				end
			end
		end
	elseif target == "Me" then
		-- FIX (Haydoscale): "each card space in your hand"
		for sl = 0, RULES.HandCap - 1 do
			table.insert(slots, sl)
		end
	elseif target == "Self" and tonumber(source.handOrigin) ~= nil then
		-- FIX (Regent of Warped Mud, Moonlit Fauna, Apogee Visionary ...): "the card space this was cast from"
		table.insert(slots, math.floor(source.handOrigin))
	elseif not target:find("Random") and target:find("Hand") then
		for i = 1, #hand do
			table.insert(slots, i - 1)
		end
	else
		local free, prio = {}, {}
		for i, c in ipairs(hand) do
			if have[i - 1] == nil then
				table.insert(free, i - 1)
				if cardType(c.def) == "Fighter" then
					table.insert(prio, i - 1)
				end
			end
		end
		local pool = (target:find("Prio") and #prio > 0) and prio or free
		if #pool > 0 then
			table.insert(slots, pool[math.random(#pool)])
		end
	end
	for _, sl in ipairs(slots) do
		if sl >= 0 and sl < RULES.HandCap then
			VERBS.__blessSet(b, owner, sl, name)
		end
	end
end

-- FIX (Great Beastbreaker et al.): does the card's text say "Whenever you cast a ..." (and not "another ...")? Then it counts ITSELF being cast
-- when it fits the rest of the condition (the Archetype / Color / Rarity filters below still apply to it, like for Basic Bee). It used to take a
-- per-card SelfTrigger flag, which only Basic Bee had, and the old single-effect card format never copied that flag into the ability spec anyway.
-- (Kept on VERBS: the file is at Luau's local limit.)
VERBS.__castsItself = function(card)
	local text = type(card.def.Effect) == "table" and card.def.Effect.Description
	if type(text) ~= "string" then
		return false
	end
	for line in text:lower():gmatch("[^\n]+") do
		if line:find("whenever you cast", 1, true) and not line:find("another", 1, true) and not line:find("other ", 1, true) then
			return true
		end
	end
	return false
end

local function runAbility(b, card, ab, ctx)
	local spec = ab.spec
	-- FIX (Basic Bee): on a card's own cast (see broadcastSummon) only its OnAllySummon abilities flagged SelfTrigger fire. Follow-ups of the
	-- same ability (OnEVCheckPass ...) reuse this ctx and must still run, hence the trigger check.
	-- FIX (Great Beastbreaker et al.): ... or whose text says "Whenever you cast a ..." (see VERBS.__castsItself).
	if ctx.selfTrigger and ab.trigger == "OnAllySummon" and not spec.SelfTrigger and not VERBS.__castsItself(card) then
		return
	end
	-- FIX (Satyr Nourisher et al.): "On|Other|..." triggers mean "whenever you cast ANOTHER fighter": never on the card's own cast. They are
	-- aliases of OnAllySummon (see TRIGGER_ALIASES), so the check above (which compares the ability's own trigger name) never saw them.
	if ab.trigger:find("^On|Other|") and ctx.other == card then
		return
	end
	local ops = runnableOps(spec)
	if not ops then
		if ab.trigger == "OnAllySummonSupercede" then
			warn("[DEBUG PixelFlame] ability skipped: runnableOps rejected it (" .. tostring(card.lib) .. ")")
		end
		return
	end
	-- FIX (Themediamogul99 / Captain Doge): "Whenever you CAST a ...": a fighter that an effect summoned wasn't cast, so it doesn't trigger these
	-- (the Doge it summons used to trigger the card again, without end). Cards whose text says "summon" still react to effect summons.
	if (ab.trigger == "OnAllySummon" or ab.trigger == "OnEnemySummon" or ab.trigger == "OnAnySummon") and ctx.other and ctx.other.effectSummoned then
		local text = type(card.def.Effect) == "table" and card.def.Effect.Description
		if type(text) == "string" and text:lower():find("whenever you cast", 1, true) then
			return
		end
	end
	-- "Whenever you cast an Ultra fighter": only react to the right kind of card
	if spec.Archetype and ctx.other and ctx.other.def.Archetype ~= spec.Archetype then
		return
	end
	-- FIX (Robotic Mob et al.): spec.SizeClass = "whenever you cast a fighter with total stats 1500 or more (Gigant) / 500 or less (Picant)".
	-- It was never checked, so the card reacted to every fighter cast.
	if spec.SizeClass and ctx.other and type(ab.trigger) == "string" and ab.trigger:find("Summon", 1, true) then
		local o = ctx.other
		local total = (tonumber(o.health) or 0) + (tonumber(o.power) or 0)
		if spec.SizeClass == "Gigant" and total < 1500 then
			return
		elseif spec.SizeClass == "Picant" and total > 500 then
			return
		end
	end
	-- FIX (Astarossa Van Buren et al.): spec.Zombified = "whenever a ZOMBIFIED fighter is cast / dies": ignore every other card
	if spec.Zombified and ctx.other and not ctx.other.def.Zombified then
		return
	end
	-- FIX (Astarossa Van Buren): a card with both OnAllySummon and OnAllyCast abilities (cast an action OR a fighter) used to fire twice for a
	-- fighter, because OnAllyCast is also broadcast for fighters. Fighters are covered by the OnAllySummon ability, so skip the cast one.
	if ab.trigger == "OnAllyCast" and ctx.other and cardType(ctx.other.def) == "Fighter" then
		for _, other_ab in ipairs(getAbilities(card.def)) do
			if other_ab.trigger == "OnAllySummon" then
				return
			end
		end
	end
	-- FIX (Shikisai Denki et al.): "Whenever you cast a GREEN card": the spec's Color filters the other card's colour (it was ignored, so every cast triggered)
	if spec.Color and ctx.other and ctx.other.def.Color ~= spec.Color then
		return
	end
	-- FIX (Biggs, Liquidated et al.): "Whenever you cast a TOKEN action": the spec's Rarity filters the other card (it was ignored, so Biggs reacted to every cast)
	if spec.Rarity and ctx.other and ctx.other.def.Rarity ~= spec.Rarity then
		return
	end
	-- FIX (PassTheToiletPaper et al.): "OnCast" means "whenever an ACTION is cast". It is reached through the OnAllyCast / OnEnemyCast
	-- aliases, which also fire for fighters, terrain and gear, so only let it through for actions.
	if ctx.other and not actionCastAllowsType(card.def, ab.trigger, ctx.other.def) then
		return
	end
	-- FIX (ajarbythedoor): "Whenever a fighter that is INERT IN ALL ZONES dies": the ability carries TokenOmni = true as its condition, which was
	-- never read, so it fired for every death. The fighter that died has to be inert in all zones.
	if spec.TokenOmni == true and type(ab.trigger) == "string" and ab.trigger:find("Death$") then
		local o = ctx.other
		if not (o and (o.def.TokenOmni or (o.extra and o.extra.TokenOmni))) then
			return
		end
	end
	if spec.EffectRequirement and not reqMet(b, card, spec.EffectRequirement) then
		if ab.trigger == "OnAllySummonSupercede" then
			warn("[DEBUG PixelFlame] requirement not met")
		end
		return
	end
	if b.depth >= RULES.MaxEffectDepth then
		return
	end
	if not limitOk(b, card, ab.trigger, spec) then
		return
	end
	b.depth = b.depth + 1
	-- FIX (Nosoi et al.): a gear's ability blips the GEAR icon, not the fighter it is attached to (the client keeps gear under id .. "_gear").
	-- NoBlip is honoured for gear abilities and (see below) for the fighter's own abilities.
	local gearSrc = ctx.evGear
	if gearSrc and gearSrc.attachedTo == card then
		if not spec.NoBlip then
			Net.Send(b.player, "CardEffectTriggered", gearSrc.id .. "_gear")
		end
	else
		gearSrc = nil
		-- FIX (Basic Bee, Arte71 ...): NoBlip marks bookkeeping abilities (EV checks / EV sets that only prepare the real effect); they flashed the
		-- card on every end step / cast for nothing. NoBlip is now honoured for the fighter's own abilities too, not only gear abilities.
		if not spec.NoBlip then
			Net.Send(b.player, "CardEffectTriggered", card.id)
		end
	end
	-- FIX (iAsuka): an ability that asks for a target (Single / SingleEnemy / SingleAlly ...) throws the card's EffectAnimation at the fighter that
	-- gets picked, so it is not played here (it had no target to land on, which errored, and it made the target arrow wait for the delay below).
	local deferEffectAnim = false
	local ownAnim = card.def.EffectAnimation
	if type(ownAnim) == "string" and ownAnim ~= "" and not ownAnim:find("^MidPaintball") then
		for _, o in ipairs(ops) do
			local k = (type(o[3]) == "string" and o[3]) or spec.Target or "Self"
			if TARGETED_KINDS[k] or COST_KINDS[k] then
				deferEffectAnim = true
				break
			end
		end
	end
	local prevCardAnim, prevCardAnimDone = ctx.cardAnim, ctx.cardAnimDone
	ctx.cardAnim, ctx.cardAnimDone = nil, nil
	if deferEffectAnim and not ab.trigger:find("^OnEVCheck") and type(card.def.EffectAnimation) == "string" and card.def.EffectAnimation ~= "" and not card.def.EffectAnimation:find("^MidPaintball") then
		local alreadyPlayed = ctx.effectAnimationsPlayed and ctx.effectAnimationsPlayed[card.def.EffectAnimation]
		if ab.trigger == "OnSummon" then
			alreadyPlayed = card.summonAnimDone
			card.summonAnimDone = true
		elseif ctx.effectAnimationsPlayed then
			ctx.effectAnimationsPlayed[card.def.EffectAnimation] = true
		end
		if not alreadyPlayed then
			ctx.cardAnim = card.def.EffectAnimation
		end
	end
	-- NEW: the card's own EffectAnimation (e.g. HyperVoxel's MidHammerEffectAll) plays once, when it is cast.
	-- (target is sent as false, not nil: the client queue unpacks the argument list and a nil hole would truncate it)
	-- FIX (Bobaman1): a sweep animation whose "damage to all" is dealt fighter by fighter (VERBS.Damage) is not played up front any more
	local perTargetSweep = false
	if RULES.SweepAnims[card.def.EffectAnimation] then
		for _, abx in ipairs(getAbilities(card.def)) do
			if type(abx.spec.Power) == "table" then
				for _, o in ipairs(abx.spec.Power) do
					if type(o) == "table" and (o[1] == "Damage" or o[1] == "PierceDamage") and RULES.IsSweepDamage(card, o, o[3]) then
						perTargetSweep = true
					end
				end
			end
		end
	end
	if perTargetSweep then
		card.summonAnimDone = true
	end
	if not deferEffectAnim and not perTargetSweep and ab.trigger == "OnSummon" and not card.summonAnimDone and type(card.def.EffectAnimation) == "string" and card.def.EffectAnimation ~= "" and not card.def.EffectAnimation:find("^MidPaintball") then
		card.summonAnimDone = true
		Net.Send(b.player, "PlayEffectCardAnimation", "", card.id, false, card.def.EffectAnimation)
		-- FIX (Bobaman1, Robloxian Superball): these cast animations only hit ONE field (side "" = the enemy's). A card whose damage hits ALL
		-- fighters now plays it over your own field as well.
		if card.def.EffectAnimation:find("ShootAll$") or card.def.EffectAnimation == "MidSuperballEffectEnemy" then
			local hitsAll = false
			for _, abx in ipairs(getAbilities(card.def)) do
				if type(abx.spec.Power) == "table" then
					for _, o in ipairs(abx.spec.Power) do
						if type(o) == "table" and (o[1] == "Damage" or o[1] == "DamageOverloaded" or o[1] == "PierceDamage") and o[3] == "All" then
							hitsAll = true
						end
					end
				end
			end
			if hitsAll then
				Net.Send(b.player, "PlayEffectCardAnimation", "Enemy", card.id, false, card.def.EffectAnimation)
			end
		end
		if not RULES.IsMeleeAnim(card.def.EffectAnimation) then
			wait(RULES.EffectAnimDelay) -- FIX: let the hit land before the damage numbers appear (melee ones sync on the client)
		end
	end
	local effectAnimation = card.def.EffectAnimation
	local playedAnimations = ctx.effectAnimationsPlayed
	if not deferEffectAnim and not perTargetSweep and ab.trigger ~= "OnSummon" and not ab.trigger:find("^OnEVCheck") and type(effectAnimation) == "string" and effectAnimation ~= "" and not (playedAnimations and playedAnimations[effectAnimation]) then
		if playedAnimations then
			playedAnimations[effectAnimation] = true
		end
		Net.Send(b.player, "PlayEffectCardAnimation", clientSide(card.owner), card.id, false, effectAnimation)
		if not RULES.IsMeleeAnim(effectAnimation) then
			wait(RULES.EffectAnimDelay)
		end
	end
	local specialAnimation = card.def.SpecialEffectAnimation
	if not ab.trigger:find("^OnEVCheck") and type(specialAnimation) == "string" and specialAnimation ~= "" and specialAnimation ~= effectAnimation and not (playedAnimations and playedAnimations[specialAnimation]) then
		if playedAnimations then
			playedAnimations[specialAnimation] = true
		end
		Net.Send(b.player, "PlayEffectCardAnimation", clientSide(card.owner), card.id, false, specialAnimation)
		if not RULES.IsMeleeAnim(specialAnimation) then
			wait(RULES.EffectAnimDelay)
		end
	end
	if not ab.trigger:find("^OnEVCheck") then -- FIX: also the named branches (OnEVCheckPassInBliss ...)
		ctx.evMulti = nil
		-- FIX (Biggs, Liquidated et al.): level-up cards (they carry a ReplaceDescriptionant) keep their EV between triggers; it used to be reset to
		-- the printed EffectVariable every time, so "levels up" never got past level 2 and the max-level transform never happened.
		if card.levelEV ~= nil and card.def.ReplaceDescriptionant then
			ctx.ev = card.levelEV
		else
			ctx.ev = tonumber(card.def.EffectVariable) or 0
		end
	end
	ctx.evResult = nil
	ctx.evSuffix = nil
	ctx.spec = spec
	local zp = spec.ZoneTargetParameters
	local prevTrigger = ctx.trigger
	ctx.trigger = ab.trigger
	if not zp and spec.TargetParameters and tpKind(spec.TargetParameters) == "zone" then
		zp = spec.TargetParameters
	end
	-- FIX (Necro Syndicates): RandomLowestCost is picked when the MoveZone op runs (not up front), so a card an earlier op of the same
	-- ability just put into the graveyard ("Destroy the bottom card of your deck, then recur ...") can be picked.
	-- FIX (Fraying Pipes): "Reveal your opponent's hand and select a card in it": the reveal has to happen BEFORE the picker opens
	ctx.revealedEarly = nil
	if zp and ops[1] and ops[1][1] == "RevealHand" then
		pcall(VERBS.RevealHand, b, card)
		ctx.revealedEarly = true
	end
	if zp and zp.Condition == "RandomLowestCost" then
		ctx.zt, ctx.ztLazy = nil, zp
	else
		ctx.zt, ctx.ztLazy = zp and resolveZoneTargets(b, card, zp) or nil, nil
	end
	-- FIX: fleeting. EffectFleeting (e.g. "Draw a fleeting card") or MetaData.Fleeting (e.g. "Give yourself a fleeting action")
	-- makes every card this ability draws or gives to the hand fleeting. Saved / restored because abilities nest.
	local prevFleeting = b.fleetingNow
	local fleetingAbility = spec.EffectFleeting == true or (type(spec.MetaData) == "table" and spec.MetaData.Fleeting == true)
	b.fleetingNow = fleetingAbility or nil
	ctx.singleCache = {}
	ctx.targetedFired = {}
	ctx.unique = spec.UniqueTargets and {} or nil
	-- FIX (Zombified Chimera summoner): a named follow-up (OnEVCheckPassHealthGain: "it gains 500 health") runs as its own ability on the same ctx;
	-- clearing lastSummoned here made its "SummonedCard" target nothing. Follow-ups now keep the card the previous branch summoned.
	if not ab.trigger:find("^OnEVCheck") then
		ctx.lastSummoned = nil -- FIX (v11)
	end
	local pendingUnlock = false
	for opIndex, op in ipairs(ops) do
		if b.ended then
			break
		end
		if op[1] == "RevealHand" and ctx.revealedEarly then
			ctx.revealedEarly = nil -- already shown before the picker (see above)
			continue
		end
		local tk = (type(op[3]) == "string" and op[3]) or spec.Target or "Self"
		ctx.tp = ((type(op[3]) ~= "string" or op[3] == "CustomTarget") and spec.TargetParameters and tpKind(spec.TargetParameters) == "field") and spec.TargetParameters or nil
		if op[1] == "Lock" and pendingUnlock then
			wait(0.18)
			pendingUnlock = false
		end
		-- FIX: BlissCutAllies was never used by any card, so it never played. Cheshire's in-Bliss branch (Overloaded damage to every other fighter,
		-- both fields) now plays it; a card that names its own animation keeps it.
		if op[1] == "DamageOverloaded" and op[6] == nil and ab.trigger == "OnEVCheckPassInBliss" and ctx.tp and type(ctx.tp.Zones) == "table"
			and table.find(ctx.tp.Zones, "Ally_Field") and table.find(ctx.tp.Zones, "Enemy_Field") then
			local copy = {}
			for k, v in pairs(op) do
				copy[k] = v
			end
			copy[6] = "BlissCutAllies"
			op = copy
		end
		local prevVerb = b.verb
		b.verb = op[1] -- PASSIVES: forCardTargets reads this to apply the immunities
		if ctx.unique then
			ctx.singleCache = {} -- UniqueTargets: every op picks its own target
		end
		if op[2] == "Variable" and (CARD_VERBS[op[1]] or op[1] == "Draw" or op[1] == "Cost" or op[1] == "StrengthenHand" or op[1] == "HealHand" or op[1] == "ArchetypeHandStrengthen" or op[1] == "ArchetypeHandHeal") then -- FIX: Draw / Cost "Variable" (Explore The Depths, Perigee Visionary) never got the effect variable
			local copy = {}
			for k, v in pairs(op) do
				copy[k] = v
			end
			copy[2] = ctx.ev or 0
			op = copy
		end
		-- FIX (Bliss): op[6] = "BlissTrigger*" is the magenta / green / red / orange Bliss icon + sound that plays on the card when its Bliss
		-- effect happens. Only Damage, ReplaceColor and Inject sent their op[6] before; Draw / Heal / Destroy / SummonCopy ... never did.
		-- (Damage's "BlissClaw" still plays per target through forCardTargets.)
		if type(op[6]) == "string" and (op[6]:find("^BlissTrigger") or op[6] == "BlissCutAllies") and b.player and b.player.Parent
			and op[1] ~= "Damage" and op[1] ~= "PierceDamage" and op[1] ~= "ReplaceColor" and op[1] ~= "Inject" then
			-- BlissCutAllies sweeps across a whole field: its first argument says which one ("" = yours, "Enemy" = the opponent's)
			local side = ""
			if op[6] == "BlissCutAllies" then
				local tOwner = (tk == "Opponent" or tk == "Enemy" or tk == "SingleEnemy") and other(card.owner) or card.owner
				side = (tOwner == "You") and "" or "Enemy"
			end
			Net.Send(b.player, "PlayEffectCardAnimation", side, card.id, false, op[6])
			-- FIX: a sweep that hits both fields (Ally_Field + Enemy_Field) cuts across the other field as well
			if op[6] == "BlissCutAllies" and ctx.tp and type(ctx.tp.Zones) == "table" and table.find(ctx.tp.Zones, "Ally_Field") and table.find(ctx.tp.Zones, "Enemy_Field") then
				Net.Send(b.player, "PlayEffectCardAnimation", (side == "") and "Enemy" or "", card.id, false, op[6])
			end
		end
		local ok, err = pcall(VERBS[op[1]], b, card, op, tk, ctx)
		b.verb = prevVerb
		ctx.tp = nil
		if not ok then
			warn("[Battlehandlers] effect '" .. tostring(op[1]) .. "' on " .. tostring(card.lib) .. " errored: " .. tostring(err))
		elseif op[1] == "Unlock" then
			pendingUnlock = true
		end
		b.fleetingNow = fleetingAbility or nil -- a nested ability may have changed it
		-- FIX (Great Beastbreaker et al.): "Deal N damage to that fighter and M damage to a target fighter". If the damage to the fighter that was just
		-- cast kills it, it dies RIGHT THERE (death effects, graveyard) before the next op picks its target. It used to sit on the board at 0 health
		-- until the whole ability was over, so the second half could still pick it. Only for damage to the cast fighter (Aggressor / SummonedCard):
		-- a "Destroy, then obliterate" on one picked fighter (Delete Tool) relies on the picked fighter staying on the board until the end.
		if ok and not b.ended and (op[1] == "Damage" or op[1] == "PierceDamage" or op[1] == "DamageOverloaded") and (tk == "Aggressor" or tk == "SummonedCard") then
			for laterIndex = opIndex + 1, #ops do
				local laterOp = ops[laterIndex]
				local laterKind = (type(laterOp[3]) == "string" and laterOp[3]) or spec.Target or "Self"
				if TARGETED_KINDS[laterKind] or COST_KINDS[laterKind] then
					processDeaths(b)
					break
				end
			end
		end
	end
	ctx.singleCache = nil
	ctx.targetedFired = nil
	ctx.unique = nil
	ctx.cardAnim, ctx.cardAnimDone = prevCardAnim, prevCardAnimDone
	if card.def.ReplaceDescriptionant and not ab.trigger:find("^OnEVCheck") then
		card.levelEV = ctx.ev -- FIX (Biggs, Liquidated et al.): remember the level
	end
	if ctx.evResult == nil then
		ctx.lastSummoned = nil -- FIX (v11); kept while a follow-up branch is still to fire (cleared after it, below)
	end
	b.fleetingNow = prevFleeting
	ctx.zt = nil
	ctx.ztLazy = nil
	ctx.evGear = gearSrc -- (a nested trigger may have changed it) the follow-up belongs to whoever ran this ability
	local checked = ctx.evResult
	local evSuffix = ctx.evSuffix
	local multi = ctx.evMulti
	ctx.evMulti = nil
	ctx.evResult = nil
	ctx.evSuffix = nil
	if checked ~= nil and not b.ended then
		fireTrigger(b, card, (checked and "OnEVCheckPass" or "OnEVCheckFail") .. (evSuffix or ""), ctx)
		if ctx.evResult == nil then
			ctx.lastSummoned = nil -- the whole chain is done
		end
	end
	if multi and not b.ended then
		for _, colour in ipairs(multi) do
			if b.ended then
				break
			end
			fireTrigger(b, card, "OnEVCheckPass" .. colour, ctx)
		end
		ctx.lastSummoned = nil
	end
	ctx.trigger = prevTrigger
	b.depth = b.depth - 1
end

-- PATCH: one engine event can run abilities written under a sibling trigger name
local TRIGGER_ALIASES = {
	OnSummon = { OnSummonOrEnd = true },
	OnEnd = { OnSummonOrEnd = true },
	OnAllyCast = { OnCast = true },
	OnAllySummon = { ["On|Other|AllySummon"] = true },
	OnAnySummon = { ["On|Other|AnySummon"] = true },
	OnEnemyCast = { OnCast = true },
}
local function triggerMatches(abTrigger, fired)
	if abTrigger == fired then
		return true
	end
	local a = TRIGGER_ALIASES[fired]
	return a ~= nil and a[abTrigger] == true
end

fireTrigger = function(b, card, trigger, ctx)
	if b.ended then
		return
	end
	ctx = ctx or {}
	-- Nested triggers get their own animation-dedupe scope; restore the caller's scope afterward.
	local previousEffectAnimations = ctx.effectAnimationsPlayed
	ctx.effectAnimationsPlayed = {}
	-- FIX (Rochas313 / Nosoi): an OnEVCheckPass/Fail follow-up belongs to whoever ran the check. Before, a fighter's own failed check (Rochas'
	-- "5+ Nosoi?") also fired the OnEVCheckFail of every attached gear, so the Nosoi dealt their end-step damage the moment they were equipped.
	local isCheck = trigger:find("^OnEVCheck") ~= nil
	local origin = ctx.evGear -- the gear whose ability ran the check (nil = the fighter's own ability)
	for _, ab in ipairs(getAbilities(card.def)) do
		-- FIX (Ancient Egg): DontTriggerInField = this ability only runs from another zone (the graveyard)
		if triggerMatches(ab.trigger, trigger) and not (ab.spec.DontTriggerInField and card.zone == "Field") and not (isCheck and origin ~= nil) then
			if not isCheck then
				ctx.evGear = nil
			end
			runAbility(b, card, ab, ctx)
		end
	end
	-- GEAR: abilities of gear attached to this fighter fire on the same triggers (OnSummon is the gear's own "when attached")
	if card.gears and trigger ~= "OnSummon" then
		for _, g in ipairs({ table.unpack(card.gears) }) do
			if not isCheck or g == origin then
				for _, ab in ipairs(getAbilities(g.def)) do
					if triggerMatches(ab.trigger, trigger) and not b.ended then
						if not isCheck then
							ctx.evGear = g
						end
						runAbility(b, card, ab, ctx)
					end
				end
			end
		end
	end
	ctx.effectAnimationsPlayed = previousEffectAnimations
end
-- Attach a gear card to a fighter: stats, client visual, and the gear's "when attached" (OnSummon) abilities.
attachGear = function(b, fighter, gear)
	gear.zone = "Gear"
	gear.attachedTo = fighter
	fighter.gears = fighter.gears or {}
	table.insert(fighter.gears, gear)
	local info = fullInfo(gear)
	info.CardId = gear.id .. "_gear" -- the client keeps the hand/stage card under the real id
	Net.Send(b.player, "EquipGear", fighter.id, info)
	if type(gear.def.GrantsPassive) == "string" then
		if not fighter.def[gear.def.GrantsPassive] then
			gear.grantedPassive = gear.def.GrantsPassive -- only passives the gear really added are taken off again
		end
		ownDef(fighter)[gear.def.GrantsPassive] = true -- e.g. Marked Mod -> Marked
		Net.Send(b.player, "GiveCardPassive", fighter.id, gear.def.GrantsPassive) -- FIX: show the passive icon on the fighter (only GivePassive did before)
	end
	local ap = tonumber(gear.def.AddPower) or 0
	if ap ~= 0 then
		fighter.power = math.max(0, fighter.power + ap)
		Net.Send(b.player, "StrengthenCard", fighter.id, fighter.power)
	end
	local ah = tonumber(gear.def.AddHealth) or 0
	if ah ~= 0 then
		fighter.health = fighter.health + ah -- like "gain health": may exceed the printed Health, base stays the same
		Net.Send(b.player, "SetCardHealth", fighter.id, fighter.health)
	end
	local gearSummonCtx = { effectAnimationsPlayed = {} }
	for _, ab in ipairs(getAbilities(gear.def)) do
		if ab.trigger == "OnSummon" and not b.ended then
			runAbility(b, fighter, ab, gearSummonCtx)
		end
	end
	if not b.ended then
		fireTrigger(b, fighter, "OnEquipGear", { other = gear }) -- FIX (Rochas313)
	end
end

-- FIX: a summoned card is NOT cast: its own "when this card is cast" (OnSummon) effect and cast animation only run when
-- withEffect is true (the SummonWithEffect / RandomSummonWithEffect verbs). Plain Summon / RepeatingSummon / RandomSummon /
-- MoveZone-to-field / Seance just put the fighter on the field. ("Whenever a fighter is summoned" triggers still fire.)
summonCard = function(b, owner, name, source, extra, withEffect)
	-- FIX (Twinedhealer89): an obliterated fighter is still zone "Field" (at 0 health) until processDeaths, so it kept its slot and the
	-- replacement summon failed on a full board. Obliterated fighters no longer count towards the cap.
	local used = 0
	for _, fc in ipairs(fieldOf(b, owner)) do
		if not fc.obliterated then
			used = used + 1
		end
	end
	if used >= RULES.FieldCap then
		return nil
	end
	local card = newCard(b, owner, name)
	if not card then
		return nil
	end
	card.extra = extra -- FIX: optional per-card flags, e.g. { TokenOmni = true } for an inert copy
	-- FIX (Themediamogul99 / Captain Doge): a fighter put onto the field by an effect was not CAST. "Whenever you cast a ..." cards must
	-- not react to it (see runAbility), or a card that summons a Doge whenever you cast a Doge triggers itself forever.
	-- ("Trigger effects as though it was cast", withEffect, still counts as a cast.)
	card.effectSummoned = (source ~= nil and not withEffect) or nil
	if extra and (extra.SetHealth or extra.SetPower) then -- PATCH (Extant Archaeopteryx): the token spawns 0/0 and GAINS its stats (see VERBS.Summon)
		local d = {}
		for k, v in pairs(card.def) do
			d[k] = v
		end
		d.Health = math.max(1, extra.SetHealth or tonumber(d.Health) or 0) -- own copy: cardType() needs Health > 0 or it is treated as a spell
		d.Power = extra.SetPower or d.Power
		card.def = d
		card.health, card.power = 0, 0
		card.spawning = true -- processDeaths ignores it until the stats have been gained
	end
	if cardType(card.def) ~= "Fighter" then
		card.zone = "Graveyard"
		return nil
	end
	local seanced = extra and extra.Seance
	if seanced then
		-- SEANCE: this one card becomes a zombified, Terrified 100/100 (own copy of the def so the library entry is untouched)
		local d = {}
		for k, v in pairs(card.def) do
			d[k] = v
		end
		d.Health, d.Power, d.Zombified, d.Terrified = 100, 100, true, true
		card.def = d
		card.health, card.power = 100, 100
	end
	if extra and extra.Terrified and not seanced then
		-- FIX (Floofy_Bonez): "except it's terrified": own copy of the def (the library entry is shared) with the Terrified passive
		local d = {}
		for k, v in pairs(card.def) do
			d[k] = v
		end
		d.Terrified = true
		card.def = d
	end
	if extra and extra.Zombified and not seanced then
		-- FIX (Vonderland): own copy of the def (library entry is shared) with the Zombified passive
		local d = {}
		for k, v in pairs(card.def) do
			d[k] = v
		end
		d.Zombified = true
		card.def = d
	end
	card.zone = "Field"
	b.fieldCounter = (b.fieldCounter or 0) + 1
	card.fieldSeq = b.fieldCounter
	card.summonedTurn = b.turnCount
	faceLeaves(b, owner)
	Net.Send(b.player, "SummonCard", clientSide(owner), source and { CardId = source.id } or nil, fullInfo(card))
	-- FIX: a fighter summoned terrified (Lay Siege to Sadness, Dance the Pain Away, Seance ...) entered with the passive but without its icon;
	-- only GivePassive told the client to draw it. Send the same message here (the client skips an icon that is already there).
	if card.def.Terrified then
		Net.Send(b.player, "GiveCardPassive", card.id, "Terrified")
	end
	if extra and extra.Zombified and not seanced then
		Net.Send(b.player, "GiveCardPassive", card.id, "Zombified") -- FIX (Vonderland): show the Zombified icon
	end
	VERBS.__cardAnim(b, card, "SummonAnimation", "SummonedAnimation") -- FIX: a summoned fighter's entrance animation + sound (see VERBS.__cardAnim)
	setLock(b, card, (seanced or (extra and (extra.Unlock or 0) > 0)) and 0 or entryLock(b, card)) -- FIX (Floofy_Bonez): "unlocked"
	syncFaces(b)
	checkCrowdsFavour(b, owner)
	-- FIX (Stoneware Stranger / Grinner "3 Flaws."): OnAnyTrigger = what a fighter has as soon as it is on the field (it used to fire
	-- for terrains only, so a fighter never entered with its gear). Per-ability TotalTriggerLimit / EffectRequirement still apply.
	fireTrigger(b, card, "OnAnyTrigger", {})
	if withEffect then
		fireTrigger(b, card, "OnSummon", {})
	end
	broadcastSummon(b, card)
	-- FIX: "Whenever you seance a card" (Lawyer of Last Moments ...): OnAllySeance / OnEnemySeance were never fired.
	-- The seancer is the owner of the card that caused it (source), not necessarily the owner of the raised fighter.
	if seanced and not b.ended then
		local seancer = (source and source.owner) or owner
		for _, c in ipairs(allFighters(b)) do
			if c ~= card and c.zone == "Field" then
				fireTrigger(b, c, c.owner == seancer and "OnAllySeance" or "OnEnemySeance", { other = card })
			end
		end
	end
	return card
end

broadcastSummon = function(b, newcard)
	for _, c in ipairs(allFighters(b)) do
		if c ~= newcard and c.zone == "Field" then
			if c.owner == newcard.owner then
				fireTrigger(b, c, "OnAllySummon", { other = newcard })
			else
				fireTrigger(b, c, "OnEnemySummon", { other = newcard })
			end
			fireTrigger(b, c, "OnAnySummon", { other = newcard }) -- PATCH: whenever any fighter is summoned
		end
	end
	if not b.ended and not isStealthy(newcard) then -- STATION: stationed cards on the terrains hear summons too
		VERBS.__fireStation(b, newcard.owner, "OnAllySummon", { other = newcard })
		VERBS.__fireStation(b, other(newcard.owner), "OnEnemySummon", { other = newcard })
	end
	-- FIX (Basic Bee): "whenever you cast a Bee fighter" counts the card itself (spec.SelfTrigger), unless it has Stealth / Stormless
	if newcard.zone == "Field" and not b.ended and not isStealthy(newcard) then
		fireTrigger(b, newcard, "OnAllySummon", { other = newcard, selfTrigger = true })
	end
end

----------------------------------------------------------------------- PATCH: triggers / passives added from the wiki PDF
-- Life triggers: OnLifeLoss / OnHealthLoss / OnLifeGain / OnHealthGain fire on the fighters of the player whose life changed;
-- OnEnemyHealthLoss / OnEnemyLifeGain / OnEnemyHealthGain on the other player's fighters.
local LIFE_TRIGGERS = {
	Loss = { ally = { "OnLifeLoss", "OnHealthLoss" }, enemy = { "OnEnemyHealthLoss" } },
	Gain = { ally = { "OnLifeGain", "OnHealthGain" }, enemy = { "OnEnemyLifeGain", "OnEnemyHealthGain" } },
}
onLifeChanged = function(b, owner, actual)
	if b.ended or actual == 0 or (b.turnCount or 0) < 1 then
		return
	end
	local set = LIFE_TRIGGERS[actual < 0 and "Loss" or "Gain"]
	b.busy = b.busy + 1
	local ok, err = pcall(function()
		if actual < 0 then
			VERBS.__stationLoss(b, owner) -- STATION: destroy the oldest stationed card
		end
		for _, c in ipairs(allFighters(b)) do
			if c.zone == "Field" and not b.ended then
				for _, trig in ipairs(c.owner == owner and set.ally or set.enemy) do
					fireTrigger(b, c, trig, {})
				end
			end
		end
		processDeaths(b)
	end)
	b.busy = b.busy - 1
	if not ok then
		warn("[Battlehandlers] life triggers errored:", err)
	end
end

-- Draw triggers: OnDrawn on the drawn card itself, OnAllyDraw / OnEnemyDraw / OnAnyDraw on the fighters in play.
onCardsDrawn = function(b, owner, cards)
	if b.ended or #cards == 0 or (b.turnCount or 0) < 1 then
		return
	end
	b.busy = b.busy + 1
	local ok, err = pcall(function()
		for _, card in ipairs(cards) do
			if b.ended then
				break
			end
			fireTrigger(b, card, "OnDrawn", {})
			for _, c in ipairs(allFighters(b)) do
				if c.zone == "Field" and not b.ended then
					fireTrigger(b, c, c.owner == owner and "OnAllyDraw" or "OnEnemyDraw", { other = card })
					fireTrigger(b, c, "OnAnyDraw", { other = card })
				end
			end
		end
		processDeaths(b)
	end)
	b.busy = b.busy - 1
	if not ok then
		warn("[Battlehandlers] draw triggers errored:", err)
	end
end

-- Rageborne / Rage (wiki): discard 3 cards in a turn while you control a Rageborne fighter = enter Rage (one more stack).
-- Each turn your first attack with a Rageborne fighter deals 200 extra damage per stack. A turn in which you did not
-- enter Rage removes all your stacks (checked in endStepPassives).
local function countRageStacks(b, owner)
	local count = 0
	for _, card in ipairs(inZone(b, owner, "Baseplate")) do
		if baseKey(card.lib) == "RageIndicator" then
			count = count + 1
		end
	end
	return count
end

local function clearRageStacks(b, owner)
	local cards = inZone(b, owner, "Baseplate")
	for _, card in ipairs(cards) do
		if baseKey(card.lib) == "RageIndicator" then
			card.zone = "Gone"
			Net.Send(b.player, "DiscardCard", card.id)
		end
	end
end

local function enterRage(b, owner)
	b.rage = b.rage or { You = 0, Enemy = 0 }
	b.rageTurn = b.rageTurn or {}
	putInBaseplate(b, owner, "RageIndicator")
	b.rage[owner] = countRageStacks(b, owner)
	b.rageTurn[owner] = b.turnCount
	pcall(Net.Send, b.player, "EnterRage", clientSide(owner))
	for _, c in ipairs(allFighters(b)) do
		if c.zone == "Field" and c.owner == owner and not b.ended then
			fireTrigger(b, c, "OnRageGain", {})
		end
	end
	b.rage[owner] = countRageStacks(b, owner)
end

local function rageBonus(b, atk)
	b.rage = b.rage or { You = 0, Enemy = 0 }
	b.rageUsed = b.rageUsed or {}
	local stacks = countRageStacks(b, atk.owner)
	b.rage[atk.owner] = stacks
	if stacks <= 0 or not atk.def.Rageborne or b.rageUsed[atk.owner] == b.turnCount then
		return 0
	end
	b.rageUsed[atk.owner] = b.turnCount
	return 200 * stacks
end

-- Liberate (wiki): the first time each turn one of your fighters attacks and destroys a fighter, every Liberate card in your
-- graveyard is recurred (if the hand has room). A Liberated card becomes Fading and inert in all zones.
local function liberateGraveyard(b, owner)
	b.liberateTurn = b.liberateTurn or {}
	if b.liberateTurn[owner] == b.turnCount then
		return
	end
	b.liberateTurn[owner] = b.turnCount
	for _, c in ipairs(inZone(b, owner, "Graveyard")) do
		if c.def.Liberate and cardType(c.def) == "Fighter" and #inZone(b, owner, "Hand") < RULES.HandCap then
			local n = giveCard(b, owner, c.lib)
			if n then
				c.zone = "Dead"
				n.extra = { TokenOmni = true, Fading = true }
			end
		end
	end
end

-- Suspend (wiki): suspended fighters leave the field and come back unlocked, under their old controller, at the next End Step.
local function releaseSuspended(b)
	local list = b.suspended
	if not list or #list == 0 then
		return
	end
	b.suspended = {}
	for _, e in ipairs(list) do
		local t = e.card
		if t.zone == "Suspended" then
			if #fieldOf(b, e.owner) >= RULES.FieldCap then
				t.zone = "Dead"
				shedGears(b, t) -- GEAR: the fighter is lost for good, its gear goes to the graveyard
			else
				t.owner = e.owner
				t.zone = "Field"
				b.fieldCounter = (b.fieldCounter or 0) + 1 -- FIX: rightmost, never a stale (low) entry number
				t.fieldSeq = b.fieldCounter
				t.lockTurns = 0
				faceLeaves(b, e.owner)
				Net.Send(b.player, "SummonCard", clientSide(e.owner), nil, fullInfo(t))
				-- GEAR: a suspended fighter keeps its gear; the client made a fresh card for it, so the gear pictures are put back
				for _, g in ipairs(t.gears or {}) do
					local ginfo = fullInfo(g)
					ginfo.CardId = g.id .. "_gear"
					Net.Send(b.player, "EquipGear", t.id, ginfo)
				end
				syncFaces(b)
				checkCrowdsFavour(b, e.owner)
			end
		end
	end
end

-- GivePassive / RemovePassive work on a private copy of the card's definition (the library entry is shared by every card).
ownDef = function(t)
	if not t.ownDef then
		local d = {}
		for k, v in pairs(t.def) do
			d[k] = v
		end
		t.def = d
		t.ownDef = true
	end
	return t.def
end


-- FIX: Steal: each targeted fighter of the other side moves to the caster's field with its current stats (and gear) and keeps
-- the lock it had when it was stolen. The client drops the old card and gets a fresh summon of the same card id. It is not
-- "cast", so no OnSummon effects fire. Does nothing if the caster's field is full.
VERBS.Steal = function(b, source, op, tk, ctx)
	local newOwner = source.owner
	forCardTargets(b, source, tk, ctx, function(t)
		if t.owner == newOwner or t.zone ~= "Field" then
			return
		end
		if #fieldOf(b, newOwner) >= RULES.FieldCap then
			return
		end
		Net.Send(b.player, "DiscardCard", t.id)
		t.owner = newOwner
		faceLeaves(b, newOwner)
		-- shown unlocked first, then the lock it already had is applied again (the same order a normal summon uses)
		local lock = t.lockTurns
		t.lockTurns = 0
		Net.Send(b.player, "SummonCard", clientSide(newOwner), { CardId = source.id }, fullInfo(t))
		setLock(b, t, lock)
		syncFaces(b)
		checkCrowdsFavour(b, newOwner)
	end)
end

-- FIX: {"SummonGenZone", "GenZoneSummonant"}: summon ONE copy of the card named by the source's key (a def key such as
-- GenZoneSummonant = "Hellish Infurniture") FROM the owner's baseplate. The baseplate card itself moves to the field, so it
-- keeps its current stats. Like any summon it is not cast (no OnSummon effect). Nothing happens if there is no such card in
-- the baseplate or the field is full. Targeting "Opponent" uses the opponent's baseplate and field.
VERBS.SummonGenZone = function(b, source, op, tk)
	if type(op[2]) ~= "string" then
		return
	end
	local owner = (tk == "Opponent") and other(source.owner) or source.owner
	if #fieldOf(b, owner) >= RULES.FieldCap then
		return
	end
	local want = resolveVariantReference(source, resolveName(source.def, op[2]))
	local pick
	for _, c in ipairs(inZone(b, owner, "Baseplate")) do
		if c.lib == want and (not pick or c.n < pick.n) then
			pick = c
		end
	end
	if not pick then
		local base = baseKey(want)
		for _, c in ipairs(inZone(b, owner, "Baseplate")) do
			if baseKey(c.lib) == base and (not pick or c.n < pick.n) then
				pick = c
			end
		end
	end
	if not pick or cardType(pick.def) ~= "Fighter" then
		return
	end
	Net.Send(b.player, "DiscardCard", pick.id) -- the client drops the baseplate card and gets a fresh summon of the same id
	pick.zone = "Field"
	b.fieldCounter = (b.fieldCounter or 0) + 1 -- FIX: rightmost, never a stale (low) entry number
	pick.fieldSeq = b.fieldCounter
	pick.summonedTurn = b.turnCount
	pick.lockTurns = 0
	faceLeaves(b, owner)
	Net.Send(b.player, "SummonCard", clientSide(owner), { CardId = source.id }, fullInfo(pick))
	setLock(b, pick, entryLock(b, pick))
	syncFaces(b)
	checkCrowdsFavour(b, owner)
	broadcastSummon(b, pick)
end

-- Anything on a field with 0 health dies: tell the client, then run death triggers (which can kill more).
processDeaths = function(b)
	for _ = 1, 12 do
		if b.ended then
			return
		end
		local dead = {}
		for _, owner in ipairs({ "You", "Enemy" }) do
			for _, c in ipairs(fieldOf(b, owner)) do
				if c.health <= 0 and not c.spawning then
					table.insert(dead, c)
				end
			end
		end
		if #dead == 0 then
			syncFaces(b)
			return
		end
		-- FIX: death effects first, THEN the graveyard. The card used to be moved to the Graveyard and the client told it had
		-- died (CardsDied -> it flew to the graveyard) BEFORE its OnDeath effects ran, so the effect fired from a card that had
		-- already left the board. Now the card stays on the board (client side) while its OnDeath / OnAllyDeath / OnEnemyDeath /
		-- OnAnyDeath effects play; server side it sits in the temporary zone "Dying" (not on the field: it can't be targeted or
		-- trigger things, same as before, and it is not in the Graveyard yet, so a death effect can't pick it from there). Only
		-- afterwards does it enter the Graveyard and CardsDied is sent.
		for _, c in ipairs(dead) do
			-- PASSIVES: Fading fighters trigger no death effects and never reach the graveyard (they vanish like an obliterated card)
			if c.obliterated and not c.obliterateCounted then
				VERBS.__noteObliterated(b, c.owner)
			end
			if (c.def.Fading or (c.extra and c.extra.Fading)) and not c.obliterated then
				c.faded = true
			end
			if c.obliterated or c.faded then
				c.zone = "Dead"
			else
				c.zone = "Dying"
				c.died = true
				VERBS.__blissDeath(b, c.owner)
				if c.def.Archetype == "Extant" then -- PATCH (Extant Archaeopteryx): count Extant deaths since each player's last end step
					b.extantDied = b.extantDied or { You = 0, Enemy = 0 }
					b.extantDied.You = b.extantDied.You + 1
					b.extantDied.Enemy = b.extantDied.Enemy + 1
				end
			end
		end
		for _, c in ipairs(dead) do
			if c.obliterated or c.faded then
				if c.obliterated then
					VERBS.__sendObliteratedToGrave(b, c) -- FIX: goes to the graveyard like a destroy, no dropping off the field
				else
					Net.Send(b.player, "DiscardCard", c.id) -- Fading fighters still just vanish
				end
				shedGears(b, c) -- GEAR: the fighter vanishes, its gear goes to the graveyard
				continue
			end
			-- pcall: if a death effect errors, the card still has to leave the board (it would stay on screen forever)
			local okd, errd = pcall(function()
				fireTrigger(b, c, "OnDeath", {})
				for _, o in ipairs(allFighters(b)) do
					if o.owner == c.owner then
						fireTrigger(b, o, "OnAllyDeath", { other = c })
					else
						fireTrigger(b, o, "OnEnemyDeath", { other = c })
					end
					fireTrigger(b, o, "OnAnyDeath", { other = c })
				end
			end)
			if not okd then
				warn("[Battlehandlers] death effects errored:", errd)
			end
			-- PATCH: Continued - on death a copy of this fighter is attached as a gear to another allied fighter
			if c.def.Continued and not b.ended then
				local okc, errc = pcall(function()
					for _, ally in ipairs(fieldOf(b, c.owner)) do
						if ally ~= c and ally.health > 0 and ally.zone == "Field" then
							local g = newCard(b, c.owner, c.lib)
							if g then
								local gd = {}
								for k, v in pairs(c.def) do
									gd[k] = v
								end
								gd.Gear, gd.Continued = true, nil
								gd.AddPower, gd.AddHealth = tonumber(c.def.Power) or 0, tonumber(c.def.Health) or 0
								g.def = gd
								attachGear(b, ally, g)
							end
							break
						end
					end
				end)
				if not okc then
					warn("[Battlehandlers] Continued errored:", errc)
				end
			end
			-- GEAR: death effects are done (gear abilities could still fire above), now the gear leaves the fighter for the graveyard.
			-- It is its own card there; it does not stay attached to the fighter in the graveyard.
			shedGears(b, c)
			VERBS.__cardAnim(b, c, "DeathAnimation") -- FIX: the card's death animation + sound, then it leaves the board
			if c.def.Zombified or c.obliterateAfterDeath then
				-- PASSIVES: Zombified fighters still trigger their death effects, then are obliterated instead of staying in the graveyard
				-- (Delete Tool uses the same path: "destroy, then obliterate")
				c.zone = "Dead"
				if c.obliterateAfterDeath then
					VERBS.__noteObliterated(b, c.owner)
				end
				VERBS.__sendObliteratedToGrave(b, c) -- FIX: same animation as a destroy (was DiscardCard: the card lowered itself off the field)
			else
				c.zone = "Graveyard"
				Net.Send(b.player, "CardsDied", { c.id })
			end
		end
		-- FIX (Bliss): the 4th allied death of a turn puts that side in Bliss (after the deaths have played out)
		if b.blissReady and not b.ended then
			VERBS.__enterBliss(b, b.blissReady)
		end
		if b.ended then
			return
		end
	end
end

VERBS.RevealHand = function(b, source)
	local hand = inZone(b, other(source.owner), "Hand")
	table.sort(hand, function(a, c)
		return a.handSeq < c.handSeq
	end)
	local revealed = {}
	for _, card in ipairs(hand) do
		table.insert(revealed, fullInfo(card))
	end
	Net.Send(b.player, "RevealHand", revealed)
end

-- FIX (Kilnkin Swimmer): "When you've cast 3 or more card types each turn". b.castTypes[owner][kind] = true once that owner has cast a card of
-- that kind this turn (reset at the start of every turn). The Swimmer reads it through {"AlterEV", {"Set"/"Add", "Playertable", "Cast*"}}.
local function noteCast(b, card, kind)
	if not card or (kind ~= "Effect" and kind ~= "Gear" and kind ~= "Terrain" and kind ~= "Fighter") then
		return
	end
	b.castTypes = b.castTypes or { You = {}, Enemy = {} }
	b.castTypes[card.owner] = b.castTypes[card.owner] or {}
	b.castTypes[card.owner][kind] = true
end

-- Abilities written under OnAnyTrigger that look at the cast-type counters ("Playertable" CastAction / CastGear / ...). OnAnyTrigger only
-- fires when a fighter enters the field, so after every cast they are re-evaluated for that player's fighters. runAbility is called directly
-- (not fireTrigger) so the fighters' attached gear doesn't re-fire its own OnAnyTrigger abilities each time.
local function usesCastCounters(spec)
	if type(spec.Power) ~= "table" then
		return false
	end
	for _, op in ipairs(spec.Power) do
		if type(op) == "table" and op[1] == "AlterEV" and type(op[2]) == "table" and op[2][2] == "Playertable" and CAST_EV_KINDS[op[2][3]] ~= nil then
			return true
		end
	end
	return false
end
local function recheckCastAbilities(b, owner)
	for _, c in ipairs(fieldOf(b, owner)) do
		if b.ended then
			return
		end
		if c.zone == "Field" then
			local ctx = { effectAnimationsPlayed = {} }
			for _, ab in ipairs(getAbilities(c.def)) do
				if ab.trigger == "OnAnyTrigger" and usesCastCounters(ab.spec) and not b.ended then
					runAbility(b, c, ab, ctx)
				end
			end
		end
	end
end

-- FIX (PixelFlame): "OnAllySummonSupercede" = "whenever you cast a fighter ... this effect triggers before any other cast effects".
-- It was never fired. Called right AFTER the cast fighter enters the field (before its own OnSummon / any other cast effect), so the new fighter counts: PixelFlame + the fighter you just cast = 2.
-- (Kept on VERBS: the file is at Luau's local limit.)
VERBS.__fireSupercede = function(b, newcard)
	if b.ended or isStealthy(newcard) then
		return
	end
	local list = {}
	for _, c in ipairs(allFighters(b)) do
		if c.zone == "Field" then
			table.insert(list, c)
		end
	end
	for _, c in ipairs(list) do
		if b.ended then
			return
		end
		if c.zone == "Field" then
			-- the same family of "before all other cast effects" triggers as the normal summon ones (PixelFlame, Pits of Wipma's
			-- Hellfire, Build Up, Temporal Halo, Cat Saint Yiberi ...)
			if c.owner == newcard.owner then
				fireTrigger(b, c, "OnAllySummonSupercede", { other = newcard })
			elseif c ~= newcard then
				fireTrigger(b, c, "OnEnemySummonSupercede", { other = newcard })
			end
			if not b.ended and c.zone == "Field" then
				fireTrigger(b, c, "OnAnySummonSupercede", { other = newcard })
			end
		end
	end
end

-- Whenever a card is cast, the other fighters on the field react.
local function broadcastCast(b, cast)
	for _, c in ipairs(allFighters(b)) do
		if c ~= cast and c.zone == "Field" then
			if c.owner == cast.owner then
				fireTrigger(b, c, "OnAllyCast", { other = cast })
				fireTrigger(b, c, "OnAnyAllyCast", { other = cast }) -- FIX: was never fired
			else
				fireTrigger(b, c, "OnEnemyCast", { other = cast })
				fireTrigger(b, c, "OnAnyEnemyCast", { other = cast }) -- PATCH
			end
			fireTrigger(b, c, "OnAnyCast", { other = cast }) -- PATCH
		end
	end
end

-- FIX: OnAllyTerrainCast / OnEnemyTerrainCast / OnAllyCastGear / OnEnemyCastGear were never fired (about 90 cards).
-- Only the kind of card is checked, filters such as "a World of Wood terrain" are not modelled.
local function broadcastCastKind(b, cast, kind)
	local suffix = kind == "Terrain" and "TerrainCast" or "CastGear"
	for _, c in ipairs(allFighters(b)) do
		if c ~= cast and c.zone == "Field" then
			fireTrigger(b, c, (c.owner == cast.owner and "OnAlly" or "OnEnemy") .. suffix, { other = cast })
		end
	end
end

-- FIX (Saros Aligner, Haydoscale, Pieperson50, Xuanwu ...): "Whenever you cast a card that uses up a blessing" was never fired.
-- A fighter cast from a blessed card space fires OnAllySummonModified on your other fighters; any other card fires OnAllyCastModified.
-- Cards that only have the Summon variant (their text says "a card", e.g. Haydoscale) also react to non-fighter casts.
local function broadcastModifiedCast(b, cast, kind)
	for _, c in ipairs(allFighters(b)) do
		if c ~= cast and c.zone == "Field" and c.owner == cast.owner and not b.ended then
			local trig = "OnAllySummonModified"
			if kind ~= "Fighter" then
				for _, ab in ipairs(getAbilities(c.def)) do
					if ab.trigger == "OnAllyCastModified" then
						trig = "OnAllyCastModified"
						break
					end
				end
			end
			fireTrigger(b, c, trig, { other = cast })
		end
	end
end

-- FIX (Farseeker Guardsman): "During your end step, if this card is in your hand in a blessed card space: It gains 200 Power."
-- fireForOwner only visits the field, so hand cards with an OnEnd + InModifiedSlot ability are handled here.
local function fireHandEnd(b, owner)
	for _, c in ipairs(inZone(b, owner, "Hand")) do
		if cardType(c.def) == "Fighter" then
			for _, ab in ipairs(getAbilities(c.def)) do
				local spec = ab.spec
				local req = spec.EffectRequirement
				if ab.trigger == "OnEnd" and type(req) == "table" and req[5] == "InModifiedSlot" and VERBS.__blessInSlot(b, c) and reqMet(b, c, req) then
					for _, op in ipairs(type(spec.Power) == "table" and spec.Power or {}) do
						if type(op) == "table" and op[1] == "Strengthen" and tonumber(op[2]) then
							c.power = c.power + tonumber(op[2])
							if owner == "You" then
								Net.Send(b.player, "StrengthenCard", c.id, c.power)
							end
						end
					end
				end
			end
		end
	end
end

-- Show a spell on the effect stage (returns false if the card has no effect text to show).
local function showSpell(b, card)
	local e = card.def.Effect
	if type(e) ~= "table" or type(e.Description) ~= "string" then
		return false
	end
	Net.Send(b.player, "PlayEffectCard", clientSide(card.owner), card.id, fullInfo(card))
	return true
end

-- Fire a trigger on every fighter an owner controls (start / end of turn).
local function fireForOwner(b, owner, triggers)
	for _, c in ipairs(fieldOf(b, owner)) do
		if c.zone == "Field" then
			for _, trigger in ipairs(triggers) do
				fireTrigger(b, c, trigger, {})
			end
		end
	end
	processDeaths(b)
end

-- FIX: start/end of a turn also fires the "enemy" and "any" variants on the OTHER side's fighters
-- (OnEnemyStart, OnEnemyEnd, OnAnyStart, OnAnyEnd were never fired before).
local function fireTurnEdge(b, owner, edge)
	if edge == "Start" then
		fireForOwner(b, owner, { "OnStart", "OnAllyStart", "OnAnyStart" })
		for _, side in ipairs({ "You", "Enemy" }) do
			local t = b.terrain and b.terrain[side]
			if t and t.zone == "Terrain" and not b.ended then
				if side == owner then
					fireTrigger(b, t, "OnStart", { turnSide = owner })
				else
					local ctx = { turnSide = owner, effectAnimationsPlayed = {} }
					for _, ab in ipairs(getAbilities(t.def)) do
						if ab.trigger == "OnStart" and ab.spec.Target == "CurrentTurn" then
							runAbility(b, t, ab, ctx)
						end
					end
				end
			end
		end
		if not b.ended then
			fireForOwner(b, other(owner), { "OnEnemyStart", "OnAnyStart" })
		end
	else
		fireForOwner(b, owner, { "OnEnd", "OnAnyEnd" })
		VERBS.__fireStation(b, owner, "OnEnd", {}) -- STATION (Sin ...)
		-- FIX (Ancient Egg): cards with TriggerInGraveZone fire their OnEnd from the graveyard (fireForOwner only visits the field)
		for _, gc in ipairs(inZone(b, owner, "Graveyard")) do
			if b.ended then
				break
			end
			if gc.def.TriggerInGraveZone and gc.zone == "Graveyard" then
				fireTrigger(b, gc, "OnEnd", {})
			end
		end
		processDeaths(b)
		if not b.ended then
			fireForOwner(b, other(owner), { "OnEnemyEnd", "OnAnyEnd" })
		end
		-- FIX: BypassHandDestroy (Solstice the Demonseeker) lasts until its owner's next end step
		if b.noHandDestroy then
			b.noHandDestroy[owner] = nil
		end
		if not b.ended then
			fireHandEnd(b, owner)
		end
	end
end

------------------------------------------------------------------------ combat

-- attacker fights a card (damage is dealt to both at once)
local function fightCard(b, atk, def)
	local atkTakes = def.power
	if atk.def.CounterAttackBlock or def.def.CounterBlock then
		atkTakes = 0 -- the defender doesn't fight back
	end
	-- PASSIVES: Marked cards take 100 extra combat damage (only when they actually get hit)
	local defTakes = atk.power
	if defTakes > 0 and def.def.Marked then
		defTakes = defTakes + 100
	end
	if atkTakes > 0 and atk.def.Marked then
		atkTakes = atkTakes + 100
	end
	local defBefore = def.health
	local atkHealth = math.max(0, atk.health - atkTakes)
	local defHealth = math.max(0, def.health - defTakes)
	Net.Send(b.player, "AttackCard", { atk.id, def.id }, { atkHealth, defHealth }, { defTakes, atkTakes }, atkTakes > 0)
	atk.health, def.health = atkHealth, defHealth
	-- PASSIVES: Overload - a fighter that kills a fighter with more damage than its health deals the excess to the
	-- defender's owner as effect damage.
	if atk.def.Overload and defHealth <= 0 and defTakes > defBefore and not b.ended then
		changeLife(b, def.owner, -(defTakes - defBefore), atk.id)
	end
end

-- attacker hits a player's face. targetOwner is whose face is hit ("You" or "Enemy").
local function hitFace(b, atk, targetOwner)
	local damage = atk.power
	local lifeBefore = b.life[targetOwner]
	local newLife = math.max(0, b.life[targetOwner] - damage)
	b.life[targetOwner] = newLife
	Net.Send(b.player, "AttackFace", targetOwner, atk.id, damage, newLife, nil, nil)
	local ended = checkLife(b)
	if not ended and onLifeChanged then
		onLifeChanged(b, targetOwner, newLife - lifeBefore)
	end
	return ended
end

-- A full attack on a fighter, with attack triggers.
local function attackFighter(b, atk, target)
	fireTrigger(b, atk, "OnAttack", { other = target })
	for _, o in ipairs(allFighters(b)) do
		fireTrigger(b, o, "OnAnyAttack", { other = atk }) -- FIX (Rochas313)
		-- FIX (Soldier / AWG): "whenever you attack" (OnAllyAttack) and "whenever an enemy attacks" (OnEnemyAttack) were never fired,
		-- so every card using them did nothing. ctx.other = the attacking fighter (the "Aggressor").
		fireTrigger(b, o, o.owner == atk.owner and "OnAllyAttack" or "OnEnemyAttack", { other = atk })
	end
	VERBS.__fireStation(b, atk.owner, "OnAllyAttack", { other = atk }) -- STATION (Soldier ...)
	VERBS.__fireStation(b, other(atk.owner), "OnEnemyAttack", { other = atk })
	processDeaths(b)
	if b.ended or atk.zone ~= "Field" or target.zone ~= "Field" then
		return
	end
	-- FIX: OnAttacked (the defender reacts before damage) was never fired
	fireTrigger(b, target, "OnAttacked", { other = atk })
	processDeaths(b)
	if b.ended or atk.zone ~= "Field" or target.zone ~= "Field" then
		return
	end
	local rageExtra = rageBonus(b, atk) -- PATCH: Rageborne
	atk.power = atk.power + rageExtra
	fightCard(b, atk, target)
	atk.power = atk.power - rageExtra
	-- FIX: damage is dealt to both at once, so the attacker can die in the same exchange (a trade). Its "attacks and destroys"
	-- effects (Happy Clown: 2 cards each + a stud) must fire BEFORE the deaths are processed, while it is still on the field.
	-- They used to run after processDeaths and were skipped whenever the attacker had died.
	if target.health <= 0 then
		fireTrigger(b, atk, "OnAttackDestroy", { other = target })
		-- FIX (Outlaw / AWG): OnAllyAttackDestroy / OnEnemyAttackDestroy were never fired. ctx.other = the attacker.
		for _, o in ipairs(allFighters(b)) do
			fireTrigger(b, o, o.owner == atk.owner and "OnAllyAttackDestroy" or "OnEnemyAttackDestroy", { other = atk })
		end
		VERBS.__fireStation(b, atk.owner, "OnAllyAttackDestroy", { other = atk })
		VERBS.__fireStation(b, other(atk.owner), "OnEnemyAttackDestroy", { other = atk })
		fireTrigger(b, atk, "OnDestroy", { other = target })
		liberateGraveyard(b, atk.owner) -- PATCH: Liberate
	end
	processDeaths(b)
	if b.ended or atk.zone ~= "Field" then
		return
	end
	fireTrigger(b, atk, "OnAttackEnd", { other = target })
	processDeaths(b)
end

-- A full attack on a face. Returns true if the battle ended.
local function attackPlayerFace(b, atk, targetOwner)
	fireTrigger(b, atk, "OnAttack", {})
	for _, o in ipairs(allFighters(b)) do
		fireTrigger(b, o, "OnAnyAttack", { other = atk }) -- FIX (Rochas313)
		-- FIX (Soldier / AWG): "whenever you attack" (OnAllyAttack) and "whenever an enemy attacks" (OnEnemyAttack) were never fired,
		-- so every card using them did nothing. ctx.other = the attacking fighter (the "Aggressor").
		fireTrigger(b, o, o.owner == atk.owner and "OnAllyAttack" or "OnEnemyAttack", { other = atk })
	end
	VERBS.__fireStation(b, atk.owner, "OnAllyAttack", { other = atk }) -- STATION (Soldier ...)
	VERBS.__fireStation(b, other(atk.owner), "OnEnemyAttack", { other = atk })
	processDeaths(b)
	if b.ended or atk.zone ~= "Field" then
		return b.ended
	end
	fireTrigger(b, atk, "OnStrike", {}) -- PATCH: resolve direct-strike effects before damage
	processDeaths(b)
	if b.ended or atk.zone ~= "Field" then
		return b.ended
	end
	local rageExtra = rageBonus(b, atk) -- PATCH: Rageborne
	atk.power = atk.power + rageExtra
	local faceEnded = hitFace(b, atk, targetOwner)
	atk.power = atk.power - rageExtra
	if faceEnded then
		return true
	end
	fireTrigger(b, atk, "OnAttackEnd", {})
	processDeaths(b)
	return b.ended
end

-- Terrain: one per player. Casting a new one sends the old one to the graveyard (its "removed" effects run).
local function removeTerrain(b, owner)
	local old = b.terrain[owner]
	if not old then
		return
	end
	b.terrain[owner] = nil
	fireTrigger(b, old, "OnRemoved", {})
	fireTrigger(b, old, "OnDeath", {})
	old.zone = "Graveyard"
	if old.gears and #old.gears > 0 then -- STATION: stationed cards leave with the terrain
		shedGears(b, old)
	end
	Net.Send(b.player, "MoveToGraveyard", { [owner] = { old.id } })
end

local function placeTerrain(b, card, fresh)
	removeTerrain(b, card.owner)
	card.zone = "Terrain"
	b.terrain[card.owner] = card
	-- fresh = the card was created by an effect (Station's The Bank), so the client has no copy of it yet: 4th arg true makes the client build it
	-- (without it Battle:3584 "attempt to index nil with 'MoveTo'")
	Net.Send(b.player, "PlaceTerrainCard", card.owner == "You" and "" or "Enemy", card.id, fullInfo(card), fresh == true, true)
end

-- STATION (Awesome Weapons Guys): "When cast, attach a copy of this card to your terrain. If you have no terrain, put 'The Bank' into your
-- terrain slot. Destroy the oldest stationed card on your terrain whenever you lose life."
-- The copy sits in terrain.gears (stationed = true) and keeps its own abilities, which run with the COPY as their source (so "Add" / limits
-- / "Self" work per copy) when the matching trigger is fired for that side via VERBS.__fireStation.
-- (Kept on VERBS: the file is at Luau's local limit.)
VERBS.__station = function(b, card)
	local owner = card.owner
	if b.ended or not card.def.Station then
		return
	end
	local terrain = b.terrain[owner]
	if not terrain or terrain.zone ~= "Terrain" then
		local bank = newCard(b, owner, "The Bank-WTD")
		if not bank then
			return
		end
		placeTerrain(b, bank, true)
		fireTrigger(b, bank, "OnAnyTrigger", {})
		terrain = bank
	end
	local copy = newCard(b, owner, card.lib)
	if not copy then
		return
	end
	copy.zone = "Gear"
	copy.attachedTo = terrain
	copy.stationed = true
	terrain.gears = terrain.gears or {}
	table.insert(terrain.gears, copy) -- oldest first
	local info = fullInfo(copy)
	info.CardId = copy.id .. "_gear"
	Net.Send(b.player, "EquipGear", terrain.id, info)
end

-- lose life: the oldest stationed card on that player's terrain is destroyed
VERBS.__stationLoss = function(b, owner)
	local t = b.terrain and b.terrain[owner]
	if not t or not t.gears then
		return
	end
	for i, g in ipairs(t.gears) do
		if g.stationed then
			table.remove(t.gears, i)
			sendGearToGrave(b, t, g)
			return
		end
	end
end

-- fire `trigger` on the stationed cards of `side`'s terrain
VERBS.__fireStation = function(b, side, trigger, ctx)
	local t = b.terrain and b.terrain[side]
	if b.ended or not t or t.zone ~= "Terrain" or not t.gears then
		return
	end
	ctx = ctx or {}
	for _, g in ipairs({ table.unpack(t.gears) }) do
		if g.stationed and g.attachedTo == t and not b.ended then
			for _, ab in ipairs(getAbilities(g.def)) do
				if triggerMatches(ab.trigger, trigger) then
					ctx.effectAnimationsPlayed = {}
					if not ab.spec.NoBlip then
						Net.Send(b.player, "CardEffectTriggered", g.id .. "_gear")
					end
					runAbility(b, g, ab, ctx)
				end
			end
		end
	end
end

-- FIX: which side(s) a verb with target `tk` hits, for verbs that act on a player rather than on fighters
local function sideOwners(b, source, tk)
	if tk == "Opponent" or tk == "Enemy" then
		return { other(source.owner) }
	elseif tk == "All" then
		return { source.owner, other(source.owner) }
	elseif tk == "CurrentTurn" then
		return { b.turnOwner or source.owner }
	end
	return { source.owner }
end

-- FIX: DestroyTerrain: "Destroy their terrain." (19 cards) - the terrain goes to the graveyard, its removed effects run
VERBS.DestroyTerrain = function(b, source, op, tk)
	for _, owner in ipairs(sideOwners(b, source, tk)) do
		removeTerrain(b, owner)
	end
end

-- Animate the selected terrain in place as its Terrariant. This is not a death or a
-- terrain removal: the same card enters the fighter row and gets the animate trigger.
VERBS.AnimateTerrain = function(b, source, op, tk)
	if op[2] ~= nil then
		return
	end
	for _, owner in ipairs(sideOwners(b, source, tk)) do
		local terrain = b.terrain[owner]
		if not terrain or terrain.def.AnimateImmune or #fieldOf(b, owner) >= RULES.FieldCap then
			continue
		end

		local name = resolveName(terrain.def, "Terrariant")
		if name == "Terrariant" then
			continue
		end
		name = resolveVariantReference(terrain, name)
		local def = DeckUtil.GetCard(name)
		if not def then
			continue
		end
		def = gameplayDef(def)
		if cardType(def) ~= "Fighter" then
			continue
		end

		local forcedStats = terrain.def.ForceTerrarianStatline
		if type(forcedStats) == "table" then
			local copy = {}
			for key, value in pairs(def) do
				copy[key] = value
			end
			copy.Health = tonumber(forcedStats[1]) or copy.Health
			copy.Power = tonumber(forcedStats[2]) or copy.Power
			def = copy
		end

		b.terrain[owner] = nil
		terrain.lib = name
		terrain.def = def
		terrain.zone = "Field"
		terrain.health = tonumber(def.Health) or 0
		terrain.power = tonumber(def.Power) or 0
		terrain.maxHealth = terrain.health
		terrain.tempPower = nil
		terrain.tempWeak = nil
		terrain.summonedTurn = b.turnCount
		faceLeaves(b, owner)
		Net.Send(b.player, "FlipCard", terrain.id, fullInfo(terrain))
		Net.Send(b.player, "MoveToField", { [owner] = { terrain.id } })
		VERBS.__cardAnim(b, terrain, "SummonAnimation", "SummonedAnimation")
		setLock(b, terrain, entryLock(b, terrain))
		syncFaces(b)
		checkCrowdsFavour(b, owner)
		fireTrigger(b, terrain, "OnAnyTrigger", {})
		if not b.ended and terrain.zone == "Field" then
			fireTrigger(b, terrain, "OnAnimateSummon", {})
		end
		if not b.ended and terrain.zone == "Field" then
			broadcastSummon(b, terrain)
			processDeaths(b)
		end
	end
end

-- FIX: GenZoneDiscard {colour, n}: n < 0 destroys up to |n| baseplate cards of that colour; n == 0 together with the card's
-- GenZoneDiscardObliterate flag obliterates all of them (they vanish instead of entering the graveyard). Other forms do nothing.
VERBS.GenZoneDiscard = function(b, source, op, tk)
	local arg = op[2]
	if type(arg) ~= "table" then
		return
	end
	local color, n = arg[1], tonumber(arg[2])
	if type(color) ~= "string" or not STUD_COLORS[color] or not n then
		return
	end
	local obliterate = false
	for _, ab in ipairs(getAbilities(source.def)) do
		if ab.spec.GenZoneDiscardObliterate then
			obliterate = true
		end
	end
	if n > 0 or (n == 0 and not obliterate and color == "Neutral") then
		return
	end
	local limit = n < 0 and -n or math.huge
	for _, owner in ipairs(sideOwners(b, source, tk)) do
		local removed = 0
		for _, c in ipairs(inZone(b, owner, "Baseplate")) do
			if removed >= limit then
				break
			end
			if studColor(c.def) == color then
				removed = removed + 1
				if obliterate then
					c.zone = "Gone"
					Net.Send(b.player, "DiscardCard", c.id)
				else
					c.zone = "Graveyard"
					Net.Send(b.player, "MoveToGraveyard", { [owner] = { c.id } })
				end
			end
		end
	end
end

-- FIX: SetFatigueImmune (raid bosses): drawing from an empty deck no longer hurts that side
VERBS.SetFatigueImmune = function(b, source, op, tk)
	b.fatigueImmune = b.fatigueImmune or {}
	for _, owner in ipairs(sideOwners(b, source, tk)) do
		b.fatigueImmune[owner] = true
	end
end

-- Right-click on a hand card.
--   First discard of the turn, coloured card (not inert)  -> enters the Baseplate and gives a stud of its colour
--   Every later discard                                    -> Graveyard, and still gives a stud (colourless if the
--                                                             card is colourless) unless the card is inert when discarded
local function discardFromHand(b, card)
	-- FIX (Average Bird Watcher): "When you discard this card from a blessed space" (OnModifiedDiscard) was never fired.
	-- Only a card with that ability uses the blessing up when it is discarded, so other cards behave as before.
	local modifiedDiscard = false
	for _, ab in ipairs(getAbilities(card.def)) do
		if ab.trigger == "OnModifiedDiscard" then
			local slot, bname = VERBS.__blessPeek(b, card)
			if bname ~= nil then
				modifiedDiscard = true
				VERBS.__blessUse(b, card, slot, bname)
			end
			break
		end
	end
	local color = studColor(card.def)
	local firstSlot = RULES.BaseplatesPerTurn <= 0 or b.baseplated < RULES.BaseplatesPerTurn + (b.extraBaseplates or 0)
	local gives = not inertWhenDiscarded(card)
	if gives and firstSlot and color ~= "Neutral" and not inertInBaseplate(card) then
		b.baseplated = b.baseplated + 1
		card.zone = "Baseplate"
		Net.Send(b.player, "MoveToBaseplate", { You = { card.id } })
		addStuds(b, "You", color, 1, card.id)
		if RULES.BaseplatesPerTurn > 0 and b.baseplated >= RULES.BaseplatesPerTurn + (b.extraBaseplates or 0) then
			-- the baseplate is full for this turn: show a lock on it until the player's next turn
			Net.Send(b.player, "SetBaseplateLocked", true)
		end
	else
		card.zone = "Graveyard"
		Net.Send(b.player, "MoveToGraveyard", { You = { card.id } })
		if gives then
			addStuds(b, "You", color, 1, card.id)
		end
	end
	-- PATCH: Rage - discarding your third card in a turn while you control a Rageborne fighter
	b.discardsThisTurn = (b.discardsThisTurn or 0) + 1
	if b.discardsThisTurn == 3 then
		for _, c in ipairs(fieldOf(b, "You")) do
			if c.def.Rageborne and c.zone == "Field" then
				enterRage(b, "You")
				break
			end
		end
	end
	-- FIX: OnAllyDiscard / OnEnemyDiscard were never fired
	b.busy = b.busy + 1
	local okd, errd = pcall(function()
		fireTrigger(b, card, "OnDiscarded", {}) -- PATCH
		if modifiedDiscard and not b.ended then
			fireTrigger(b, card, "OnModifiedDiscard", {})
		end
		for _, c in ipairs(allFighters(b)) do
			if c.zone == "Field" and c ~= card then
				fireTrigger(b, c, "OnAnyDiscard", { other = card }) -- PATCH
				fireTrigger(b, c, c.owner == "You" and "OnAllyDiscard" or "OnEnemyDiscard", { other = card })
			end
		end
		-- FIX (Wire Puzzle): cards with TriggerInHand ("Whenever you discard a card: ...") react to discards from inside the hand.
		if not b.ended then
			for _, hc in ipairs(inZone(b, "You", "Hand")) do
				if hc ~= card and hc.def.TriggerInHand then
					fireTrigger(b, hc, "OnAllyDiscard", { other = card })
				end
			end
		end
		-- FIX (Disaster Survival): terrain is not a fighter, so it never heard about discards. It reacts to them like a fighter does.
		for _, side in ipairs({ "You", "Enemy" }) do
			local terrain = b.terrain and b.terrain[side]
			if terrain and terrain.zone == "Terrain" and not b.ended then
				fireTrigger(b, terrain, "OnAnyDiscard", { other = card })
				fireTrigger(b, terrain, side == "You" and "OnAllyDiscard" or "OnEnemyDiscard", { other = card })
			end
		end
		-- FIX (Lookout / AWG): "When you've discarded 3 or more cards this turn" is an OnAnyTrigger ability with a DiscardCount requirement.
		-- OnAnyTrigger only fires when a card enters play, so it never saw the discard that made the requirement true. Check it after each discard.
		if not b.ended then
			VERBS.__recheckDiscard(b)
		end
		processDeaths(b)
	end)
	b.busy = b.busy - 1
	if not okd then
		warn("[Battlehandlers] discard triggers errored:", errd)
	end
	sendAffordable(b)
	return true
end

-- Re-evaluates your OnAnyTrigger abilities that look at the discard counter (fighters on the field and stationed cards on your terrain).
-- runAbility is called directly (not fireTrigger) so attached gear doesn't re-fire its own OnAnyTrigger abilities each time.
VERBS.__recheckDiscard = function(b)
	local function usesDiscard(spec)
		if not spec.EffectRequirement then
			return false
		end
		for _, q in ipairs(reqList(spec.EffectRequirement)) do
			if q[1] == "Playertable" and q[5] == "DiscardCount" then
				return true
			end
		end
		return false
	end
	for _, c in ipairs(fieldOf(b, "You")) do
		if b.ended then
			return
		end
		if c.zone == "Field" then
			for _, ab in ipairs(getAbilities(c.def)) do
				if ab.trigger == "OnAnyTrigger" and usesDiscard(ab.spec) and not b.ended and c.zone == "Field" then
					runAbility(b, c, ab, { effectAnimationsPlayed = {} })
				end
			end
		end
	end
	-- STATION: the stationed copies on your terrain
	local t = b.terrain and b.terrain.You
	if t and t.gears and not b.ended then
		for _, g in ipairs({ table.unpack(t.gears) }) do
			if g.stationed and g.attachedTo == t then
				for _, ab in ipairs(getAbilities(g.def)) do
					if ab.trigger == "OnAnyTrigger" and usesDiscard(ab.spec) and not b.ended then
						runAbility(b, g, ab, { effectAnimationsPlayed = {} })
					end
				end
			end
		end
	end
end

-- FIX (NooberTuber et al.): {"DiscardLimit", n[, "Ally" | "CurrentTurn"]} = "you may baseplate n more card(s) this turn". It raises this turn's
-- baseplate limit (reset at the start of your turn) and takes the lock off the baseplate if you had filled it.
-- Only the player baseplates, so it does nothing for the opponent's cards; "CurrentTurn" only counts on your own turn.
VERBS.DiscardLimit = function(b, source, op, tk)
	local n = math.floor(tonumber(op[2]) or 0)
	if n <= 0 or source.owner ~= "You" or tk == "Opponent" then
		return
	end
	if op[3] == "CurrentTurn" and b.turnOwner ~= "You" then
		return
	end
	b.extraBaseplates = (b.extraBaseplates or 0) + n
	if RULES.BaseplatesPerTurn > 0 and b.baseplated < RULES.BaseplatesPerTurn + b.extraBaseplates then
		Net.Send(b.player, "SetBaseplateLocked", false)
	end
end

-- NEW: Ban. {"Ban", n[, "Opponent"]}: the target player loses n life; at 0 they lose the game (checkLife does that).
VERBS.Ban = function(b, source, op, tk)
	local n = tonumber(op[2])
	if not n or n <= 0 then
		return
	end
	local who = (tk == "Opponent") and other(source.owner) or source.owner
	changeLife(b, who, -n, source.id)
end

-- NEW: GraveZoneDiscard. {"GraveZoneDiscard", {colour, n}[, "Opponent"]}: graveyard cards of that colour are obliterated
-- (n == 0: all of them; n < 0: the most recent |n|). They count as obliterated, so the obliterate counters and
-- "for every 5 cards obliterated" variables see them.
VERBS.GraveZoneDiscard = function(b, source, op, tk)
	local arg = op[2]
	local color, n = arg[1], tonumber(arg[2])
	if not n or n > 0 then
		return
	end
	local limit = (n < 0) and -n or math.huge
	local side = (type(op[3]) == "string" and op[3]) or tk
	for _, owner in ipairs(sideOwners(b, source, side)) do
		local grave = inZone(b, owner, "Graveyard")
		local removed = 0
		for i = #grave, 1, -1 do
			if removed >= limit or b.ended then
				break
			end
			local c = grave[i]
			if studColor(c.def) == color then
				removed = removed + 1
				VERBS.__noteObliterated(b, c.owner)
				moveCardTo(b, source, c, "Nil", nil)
			end
		end
	end
end

-- NEW: MoveGenZone. The targeted fighters leave the field and become baseplate cards of their owner: they generate a stud of their
-- colour at the end of the turn like any baseplate card. Stats and lock reset like Return; Zombified fighters are obliterated instead.
VERBS.MoveGenZone = function(b, source, op, tk, ctx)
	local moved = false
	forCardTargets(b, source, tk, ctx, function(t)
		if t.zone ~= "Field" then
			return
		end
		if t.def.Zombified then
			t.obliterated = true
			t.health = 0 -- server side only; the client keeps showing its health until it vanishes
			return
		end
		if t.lockTurns and t.lockTurns > 0 then
			setLock(b, t, 0)
		end
		local h = tonumber(t.def.Health) or t.health
		local p = tonumber(t.def.Power) or t.power
		t.health = h
		t.maxHealth = h
		t.power = p
		t.tempWeak = nil
		shedGears(b, t) -- GEAR: changing zones removes it (to the graveyard)
		Net.Send(b.player, "SetCardHealth", t.id, h)
		Net.Send(b.player, "SetCardPower", t.id, p)
		t.zone = "Baseplate"
		Net.Send(b.player, "MoveToBaseplate", { [t.owner == "Enemy" and "Enemy" or "You"] = { t.id } })
		moved = true
	end)
	if moved then
		syncFaces(b)
	end
end

-- NEW: ForceTrigger. {"ForceTrigger", "OnEnd"}: every fighter on that side fires the named trigger now
-- (the junkyard cards that "trigger all allied end step effects at the start of your turn"). Not re-entrant.
VERBS.ForceTrigger = function(b, source, op, tk)
	local trig = op[2]
	if type(trig) ~= "string" or b.forcingTrigger then
		return
	end
	local owner = (tk == "Opponent") and other(source.owner) or source.owner
	local list = {}
	for _, c in ipairs(fieldOf(b, owner)) do
		table.insert(list, c)
	end
	b.forcingTrigger = true
	for _, c in ipairs(list) do
		if b.ended then
			break
		end
		if c.zone == "Field" then
			local ok, err = pcall(fireTrigger, b, c, trig, {})
			if not ok then
				warn("[Battlehandlers] ForceTrigger errored:", err)
			end
		end
	end
	b.forcingTrigger = nil
end

-- NEW: TransformWithRarity behaves like Transform (these are the NICCO / Pendleton transforms).
VERBS.TransformWithRarity = VERBS.Transform
SPECIAL_CHECKS.TransformWithRarity = SPECIAL_CHECKS.Transform
-- NEW (easy verbs): they act on fighters, so the target kind must be a fighter target; the stat ones also need a number
for _, v in ipairs({ "ResetHealth", "BumpHealth", "BumpPower", "SetHealthModulo", "SetPowerModulo" }) do
	SPECIAL_CHECKS[v] = function(op, tk)
		return CARD_TARGETS[tk] == true and (v == "ResetHealth" or tonumber(op[2]) ~= nil)
	end
end
SPECIAL_CHECKS.Oblierate = SPECIAL_CHECKS.Obliterate

-- NEW: SetCost. {"SetCost", { n, "Colour" }, "Self"}: sets the cost of the card. When n is 0 the whole cost becomes 0
-- (ASSUMED from the card text "set its cost to zero studs"); otherwise only that colour is set.
VERBS.SetCost = function(b, source, op, tk, ctx)
	local a = op[2]
	local n, color = tonumber(a[1]), a[2]
	local targets = (tk == "CustomZoneTarget") and (ctx.zt or {}) or { source }
	local changed = false
	for _, t in ipairs(targets) do
		if type(t.def.Cost) == "table" and (t.zone == "Hand" or t.zone == "Field" or t.zone == "Deck") then
			t.costMod = t.costMod or {}
			if n == 0 then
				for col in pairs(STUD_COLORS) do
					t.costMod[col] = -(tonumber(t.def.Cost[col]) or 0)
				end
			else
				t.costMod[color] = math.max(n, 0) - (tonumber(t.def.Cost[color]) or 0)
			end
			changed = true
			Net.Send(b.player, "ChangeCardCost", t.id, effectiveCost(t))
		end
	end
	if changed then
		sendAffordable(b)
	end
end

-- NEW: StrengthenTargetInHand / HealTargetInHand: the fighters picked in a zone window (that are still in a hand) gain Power / Health.
for verb, stat in pairs({ StrengthenTargetInHand = "power", HealTargetInHand = "health" }) do
	VERBS[verb] = function(b, source, op, tk, ctx)
		local n = tonumber(op[2])
		if not n or n <= 0 then
			return
		end
		for _, c in ipairs(ctx.zt or {}) do
			if c.zone == "Hand" and cardType(c.def) == "Fighter" then
				if stat == "power" then
					c.power = c.power + n
					if c.owner == "You" then
						Net.Send(b.player, "StrengthenCard", c.id, c.power)
					end
				else
					c.health = c.health + n
					if c.owner == "You" then
						Net.Send(b.player, "HealCard", c.id, c.health)
					end
				end
			end
		end
	end
end

-- NEW: RemoveDeck. {"RemoveDeck", n}: obliterate the top n cards of a deck (999 = the whole deck).
VERBS.RemoveDeck = function(b, source, op, tk)
	local n = tonumber(op[2])
	if not n or n <= 0 then
		return
	end
	local owner = (tk == "Opponent") and other(source.owner) or source.owner
	local deck = b.decks[owner]
	for _ = 1, math.min(n, #deck) do
		local id = table.remove(deck)
		local c = b.cards[id]
		if c then
			c.zone = "Nil"
			VERBS.__noteObliterated(b, owner)
		end
	end
	Net.Send(b.player, "SetDeckAmount", owner, #deck)
end
-- first-50 audit: Bored Mo "copy your opponent's deck"
VERBS.CopyOpponentDeck = function(b, source, op, tk)
	local owner = source.owner
	local theirs, mine = b.decks[other(owner)], b.decks[owner]
	if not theirs or not mine then return end
	local libs = {}
	for _, id in ipairs(theirs) do
		local c = b.cards[id]
		if c then table.insert(libs, c.lib) end
	end
	for _, lib in ipairs(libs) do
		local card = newCard(b, owner, lib)
		if card then
			card.zone = "Deck"
			table.insert(mine, math.random(#mine + 1), card.id)
		end
	end
	Net.Send(b.player, "SetDeckAmount", owner, #mine)
end
-- first-50 audit: Mo's Dungeon "that player gives themselves a copy of a card in their opponent's deck"
VERBS.DrawFromOpponent = function(b, source, op, tk, ctx)
	local who = (ctx and ctx.turnSide) or b.turnOwner or source.owner
	local theirs = b.decks[other(who)]
	if not theirs or #theirs == 0 then return end
	for _ = 1, math.max(1, math.floor(tonumber(op[2]) or 1)) do
		local c = b.cards[theirs[math.random(#theirs)]]
		if c then giveCard(b, who, c.lib) end
	end
end
-- first-50 audit: APlayerOfGames "gains Power equal to that fighter's Power"
VERBS.AddFighterPower = function(b, source, op, tk, ctx)
	local o = ctx and ctx.other
	local n = o and tonumber(o.power)
	if not n or n <= 0 or source.zone ~= "Field" then return end
	source.power = source.power + n * (tonumber(op[2]) or 1)
	Net.Send(b.player, "StrengthenCard", source.id, source.power)
end
-- NEW (easy verbs). Added without any new top-level locals (the file is at Luau's local limit).
-- {"SetCastRestriction", { { "NOTHING" }, text }, "Ally" | "Opponent"}: that side can't cast actions or fighters for the rest of its turn.
-- ASSUMED: the other forms ("AllyLeftMostCard", "Ranked") are not enforced; they do nothing.
VERBS.SetCastRestriction = function(b, source, op, tk)
	local a = op[2]
	if type(a) ~= "table" or type(a[1]) ~= "table" or a[1][1] ~= "NOTHING" then
		return
	end
	local owner = (tk == "Opponent") and other(source.owner) or source.owner
	b.noActions[owner] = true
	b.noSummon[owner] = true
end
-- {"ResetHealth"}: the targeted fighters' Health goes back to its printed value.
VERBS.ResetHealth = function(b, source, op, tk, ctx)
	print("[DEBUG] ResetHealth fired from", source.lib, "target kind", tk)
	forCardTargets(b, source, tk, ctx, function(t)
		local h = tonumber(t.def.Health) or t.health
		t.health = h
		t.maxHealth = h
		Net.Send(b.player, "SetCardHealth", t.id, h)
	end)
end
-- {"BumpHealth", n} / {"BumpPower", n}: "reset its lost stats": raise the stat to n if it is lower (never lowers it).
VERBS.BumpHealth = function(b, source, op, tk, ctx)
	local n = tonumber(op[2])
	if not n then
		return
	end
	forCardTargets(b, source, tk, ctx, function(t)
		if t.health < n then
			t.health = n
			t.maxHealth = math.max(t.maxHealth or 0, n)
			Net.Send(b.player, "SetCardHealth", t.id, n)
		end
	end)
end
VERBS.BumpPower = function(b, source, op, tk, ctx)
	local n = tonumber(op[2])
	if not n then
		return
	end
	forCardTargets(b, source, tk, ctx, function(t)
		if t.power < n then
			t.power = n
			Net.Send(b.player, "SetCardPower", t.id, n)
		end
	end)
end
-- {"SetHealthModulo", n} / {"SetPowerModulo", n}: round the stat down to a multiple of n. ASSUMED: Health never drops below 1 (never kills).
VERBS.SetHealthModulo = function(b, source, op, tk, ctx)
	local n = tonumber(op[2])
	if not n or n <= 0 then
		return
	end
	forCardTargets(b, source, tk, ctx, function(t)
		if t.health > 0 then
			t.health = math.max(1, math.floor(t.health / n) * n)
			Net.Send(b.player, "SetCardHealth", t.id, t.health)
		end
	end)
end
VERBS.SetPowerModulo = function(b, source, op, tk, ctx)
	local n = tonumber(op[2])
	if not n or n <= 0 then
		return
	end
	forCardTargets(b, source, tk, ctx, function(t)
		t.power = math.floor(t.power / n) * n
		Net.Send(b.player, "SetCardPower", t.id, t.power)
	end)
end
-- {"MultiplyVariable", n}: the effect variable is multiplied by n (Night Creak: "damage for each allied Nightmare").
VERBS.MultiplyVariable = function(b, source, op, tk, ctx)
	local n = tonumber(op[2])
	if n and ctx then
		ctx.ev = (ctx.ev or 0) * n
	end
end
-- {"StrengthenGrave", n, "Ally"} / {"HealGrave", n, "Ally"}: every fighter card in that graveyard gains n Power / Health.
-- NOTE: recurring creates a fresh copy, so this only changes the stats the graveyard card itself carries; its job is to stop
-- the whole ability (e.g. the "recur an allied card" part) from being skipped.
VERBS.__graveBuff = function(b, source, op, tk, field)
	local n = tonumber(op[2])
	if not n then
		return
	end
	local owner = (tk == "Opponent") and other(source.owner) or source.owner
	for _, c in ipairs(inZone(b, owner, "Graveyard")) do
		if cardType(c.def) == "Fighter" then
			c[field] = (c[field] or 0) + n
		end
	end
end
VERBS.StrengthenGrave = function(b, source, op, tk)
	VERBS.__graveBuff(b, source, op, tk, "power")
end
VERBS.HealGrave = function(b, source, op, tk)
	VERBS.__graveBuff(b, source, op, tk, "health")
end
-- {"EndTurn", ...}: the player's turn ends as soon as the card that is being cast has finished resolving (see the cast handler).
VERBS.EndTurn = function(b, source)
	if b.turnOwner == "You" then
		b.endTurnPending = true
	end
end
-- "Oblierate" is a typo in NecroSyndicates' card data; it means Obliterate.
VERBS.Oblierate = function(...)
	return VERBS.Obliterate(...)
end
-- FIX (Biggs, Liquidated): {"ReplaceDescription", "ReplaceDescriptionant", "Self"}: the card's effect text becomes the named field of its def
-- ("Level Variable. (Max 25) ..."), with "Variable" replaced by the current effect variable (the level). It was a no-op, so the card kept
-- saying "Level 1" however often it levelled up.
-- FIX (marbleycake): {"ReplaceCardArt", {"Variable"}, "Self"}: the card's art becomes the first id of its ReplaceCardArtant list.
VERBS.ReplaceCardArt = function(b, source, op)
	local list = source.def.ReplaceCardArtant
	local id = type(list) == "table" and tonumber(list[1])
	if id and op[3] == "Self" and b.player and b.player.Parent then
		Net.Send(b.player, "ChangeCardArt", source.id, id)
	end
end

VERBS.ReplaceDescription = function(b, source, op, tk, ctx)
	local text = type(op[2]) == "string" and source.def[op[2]]
	if type(text) ~= "string" then
		return
	end
	local level = tostring(math.floor(tonumber(ctx and ctx.ev) or 0))
	text = text:gsub("Variable", level)
	source.descOverride = text
	if b.player and b.player.Parent then
		Net.Send(b.player, "ChangeCardDescription", source.id, text)
	end
end

-- FIX: visual / information-only verbs do nothing on the server.
for _, v in ipairs({ "RevealCard", "PlayBossAnimation", "DelayClient", "ChangeMusic", "NOTHING", "ReplaceBio", "RevealTopDeck", "ChangeMusicNoFade", "ChangeMusicSpeed", "NPCSpeech", "EnemySpeech", "SetBattleTimer", "ReplaceAttackEffect", "AllowRaidRewards", "ClearChoices", "NyarlQuips", "JohnTimer", "AddSpecialWinQuest", "DisableBypassLifeLoss", "RunJournalistCameraEffect", "TeammateDraw" }) do
	VERBS[v] = function() end
end

-- FIX: RandomDiscard / ArchetypeDiscard: up to n cards (random ones, or of one archetype) leave a hand for the graveyard.
-- An effect discard gives no studs and doesn't use the turn's baseplate slot. Both sides have a hand.
local function effectDiscard(b, source, op, tk, archetype)
	local side = (type(op[3]) == "string" and op[3]) or tk
	local owners = {}
	if side == "All" then
		owners = { source.owner, other(source.owner) }
	elseif side == "Opponent" or side == "Enemy" then
		owners = { other(source.owner) }
	else
		owners = { source.owner }
	end
	local n = math.max(0, math.floor(tonumber(op[2]) or 1))
	do
		-- FIX (Solstice the Demonseeker): card effects can't destroy cards in a protected hand
		local kept = {}
		for _, o in ipairs(owners) do
			if not (b.noHandDestroy and b.noHandDestroy[o]) then
				table.insert(kept, o)
			end
		end
		owners = kept
	end
	for _, owner in ipairs(owners) do
		do
			local hand = {}
			for _, c in ipairs(inZone(b, owner, "Hand")) do
				if not archetype or c.def.Archetype == archetype then
					table.insert(hand, c)
				end
			end
			for i = #hand, 2, -1 do
				local j = math.random(i)
				hand[i], hand[j] = hand[j], hand[i]
			end
			-- FIX: EffectRandomDiscardShuffle ("shuffle your hand into your deck"): the cards go back into the deck instead
			-- (on top if the text says "on top of", else at random places); the client just drops them from the hand.
			local e = source.def.Effect
			local shuffle = type(e) == "table" and e.EffectRandomDiscardShuffle == true
			local top = shuffle and tostring(e.Description or ""):lower():find("on top of", 1, true) ~= nil
			local deck = b.decks[owner]
			for i = 1, math.min(n, #hand) do
				if shuffle and deck then
					hand[i].zone = "Deck"
					hand[i].fleeting = nil
					hand[i].gears = nil -- stats are kept as they were; gear is not
					table.insert(deck, top and (#deck + 1) or math.random(#deck + 1), hand[i].id)
					Net.Send(b.player, "DiscardCard", hand[i].id)
				else
					hand[i].zone = "Graveyard"
					Net.Send(b.player, "MoveToGraveyard", { [owner] = { hand[i].id } })
				end
			end
			if shuffle and deck then
				Net.Send(b.player, "SetDeckAmount", owner, #deck)
			end
		end
	end
	sendAffordable(b)
end
VERBS.RandomDiscard = function(b, source, op, tk)
	effectDiscard(b, source, op, tk, nil)
end
VERBS.ArchetypeDiscard = function(b, source, op, tk)
	effectDiscard(b, source, op, tk, op[4])
end

-- Run fn on its own thread while blocking further player actions (targeting yields this thread).
local function runBusy(b, fn)
	b.busy = b.busy + 1
	task.spawn(function()
		local ok, err = pcall(fn)
		if not ok then
			warn("[Battlehandlers] action errored:", err)
		end
		b.busy = b.busy - 1
		if not b.ended then
			sendAffordable(b)
		end
	end)
end

local function startPlayerTurn(b)
	if b.ended then
		return
	end
	b.turnOwner = "You"
	b.turnCount = b.turnCount + 1
	b.castTypes = { You = {}, Enemy = {} } -- FIX (Kilnkin Swimmer): card types cast "this turn"
	b.playerTurns = b.playerTurns + 1
	b.baseplated = 0
	b.extraBaseplates = 0 -- FIX (DiscardLimit): extra baseplate slots only last for one turn
	b.discardsThisTurn = 0 -- PATCH: Rage counts discards per turn
	b.noActions.You = nil
	b.noAttack.You = nil
	b.noSummon.You = nil
	b.turnId = b.turnId + 1
	Net.Send(b.player, "SetBaseplateLocked", false)

	if b.turnCount > 1 or RULES.DrawOnFirstTurn then
		local drawnNow = drawCards(b, "You", 1)
		sendDraw(b, drawnNow, nil)
		if onCardsDrawn then
			onCardsDrawn(b, "You", drawnNow)
		end
	end

	Net.Send(b.player, "SetTurns", b.turnCount, b.playerTurns - 1)
	Net.Send(b.player, "YourTurn", b.testMode and -1 or RULES.TurnTime, b.turnCount) -- PATCH (Test Mode): -1 = no timer (client shows infinity)
	sendAffordable(b)

	-- start-of-turn effects (after YourTurn, so the client accepts target selection)
	b.busy = b.busy + 1
	local ok, err = pcall(fireTurnEdge, b, "You", "Start")
	if not ok then
		warn("[Battlehandlers] start of turn errored:", err)
	end
	b.busy = b.busy - 1
	sendAffordable(b)

	-- turn timer: when it runs out the turn ends by itself
	if b.testMode then -- PATCH (Test Mode): no turn timer
		return
	end
	local turnId = b.turnId
	task.delay(RULES.TurnTime, function()
		if b.ended or b.turnId ~= turnId or b.turnOwner ~= "You" then
			return
		end
		BattleHandlers._forceEndTurn(b)
	end)
end

-- PASSIVES at the end step of `owner`: Terrified fighters are obliterated, Decaying fighters take 200 damage (100 with Moonward),
-- Regenerating fighters gain 100 health.
-- FIX (Absentee Father mods): a gear that grants a passive (Decaying / Regen / Terrified Mod) now blips its own icon when that
-- passive fires at the end step, like Rochas' gears do (their abilities go through runAbility, passives don't).
VERBS.__blipPassiveGear = function(b, fighter, passive) -- (a VERBS field, not a local: the file is at Luau's local limit)
	for _, g in ipairs(fighter.gears or {}) do
		local gp = g.def.GrantsPassive
		if gp == passive or (passive == "Regen" and gp == "Regenerating") then
			Net.Send(b.player, "CardEffectTriggered", g.id .. "_gear")
		end
	end
end

local function endStepPassives(b, owner)
	if b.extantDied then b.extantDied[owner] = 0 end -- PATCH (Extant Archaeopteryx): "since your last end step"
	-- PATCH: a turn without entering Rage removes all Rage stacks
	b.rage = b.rage or { You = 0, Enemy = 0 }
	if countRageStacks(b, owner) > 0 and not (b.rageTurn and b.rageTurn[owner] == b.turnCount) then
		b.rage[owner] = 0
		clearRageStacks(b, owner)
	end
	releaseSuspended(b) -- PATCH: Suspend
	local hurtIds, hurtHealths = {}, {}
	for _, c in ipairs(fieldOf(b, owner)) do
		if c.zone == "Field" and c.health > 0 then
			if c.def.Terrified then
				VERBS.__blipPassiveGear(b, c, "Terrified")
				c.obliterated = true
				c.health = 0 -- server side only; the client keeps showing its health until it vanishes
			else
				if c.def.Decaying then
					local dmg = effectDamageAmount(c, 200)
					if dmg > 0 then
						VERBS.__blipPassiveGear(b, c, "Decaying")
						c.health = math.max(0, c.health - dmg)
						table.insert(hurtIds, c.id)
						table.insert(hurtHealths, c.health)
					end
				end
				if (c.def.Regenerating or c.def.Regen) and c.health > 0 and not c.def.HealImmune then -- FIX: cards and the Regenerating Mod say "Regen" (GivePassive / GrantsPassive), the engine only read "Regenerating"
					VERBS.__blipPassiveGear(b, c, "Regen")
					c.health = c.health + 100
					Net.Send(b.player, "HealCard", c.id, c.health)
				end
			end
		end
	end
	if #hurtIds > 0 then
		Net.Send(b.player, "DamageCards", hurtIds, hurtHealths)
	end
	processDeaths(b)
end

local function pickEnemyTarget(b, atk)
	local targets = fieldOf(b, "You")
	if atk.def.Unstoppable and not atk.def.FaceBlock and math.random() < 0.5 then
		return nil -- PASSIVES: Unstoppable fighters may go straight for the face
	end
	if hasDefender(b, "You") then
		local guards = {}
		for _, c in ipairs(targets) do
			if isDefender(c) then
				table.insert(guards, c)
			end
		end
		targets = guards
	end
	if #targets == 0 then
		return nil -- no fighters to hit: the face is open
	end
	return targets[math.random(#targets)]
end

-- NPC HAND: the NPC casts ONE card per turn from its hand: a random fighter (if there is room) or action.
local function enemyUniqueBlocked(b, card)
	if cardType(card.def) == "Fighter" and card.def.Unique then
		for _, f in ipairs(fieldOf(b, "Enemy")) do
			if f.def.Unique and baseKey(f.lib) == baseKey(card.lib) then
				return true
			end
		end
	end
	return false
end

local function pickEnemyPlay(b)
	local options = {}
	for _, c in ipairs(inZone(b, "Enemy", "Hand")) do
		local kind = playKind(c)
		if kind == "Fighter" then
			if not b.noSummon.Enemy and #fieldOf(b, "Enemy") < RULES.FieldCap and not enemyUniqueBlocked(b, c) then
				table.insert(options, c)
			end
		elseif kind == "Effect" then
			if not b.noActions.Enemy then
				table.insert(options, c)
			end
		end
	end
	if #options == 0 then
		return nil
	end
	return options[math.random(#options)]
end

-- PATCH (Test Mode): the end of the enemy's turn, shared by the normal turn and the passive test-mode turn
local function finishEnemyTurn(b)
	-- end of the enemy's turn
	resetColouredStuds(b, "Enemy") -- before the end step, so studs it generates (Acolytes ...) are kept
	-- FIX (v16): fleeting cards in the NPC's hand vanish BEFORE its end step, so cards the end step gives it
	-- (Ravenshield's fleeting Nascent Stud ...) survive until its next end step - same order as the player's side.
	for _, c in ipairs(inZone(b, "Enemy", "Hand")) do
		if c.fleeting or c.def.Fleeting then
			c.zone = "Graveyard" -- FIX: fleeting cards go to the graveyard, they are not obliterated
			c.fleeting = nil
			Net.Send(b.player, "MoveToGraveyard", { [c.owner] = { c.id } })
		end
	end
	fireTurnEdge(b, "Enemy", "End")
	if b.ended then
		return
	end
	endStepPassives(b, "Enemy")
	if b.ended then
		return
	end
	tickLocks(b, "Enemy")
	generateStuds(b, "Enemy")

	Net.Send(b.player, "TheirTurnEnd", {})
	wait(RULES.EnemyActionDelay)
	startPlayerTurn(b)
end

local function runEnemyTurn(b)
	if b.ended then
		return
	end
	b.turnOwner = "Enemy"
	b.noActions.Enemy = nil
	b.noAttack.Enemy = nil
	b.noSummon.Enemy = nil
	b.turnCount = b.turnCount + 1
	b.castTypes = { You = {}, Enemy = {} } -- FIX (Kilnkin Swimmer)
	Net.Send(b.player, "SetTurns", b.turnCount, b.playerTurns - 1)
	Net.Send(b.player, "TheirTurn", b.testMode and -1 or 30, b.turnCount) -- PATCH (Test Mode): -1 = no timer
	wait(RULES.EnemyActionDelay)

	fireTurnEdge(b, "Enemy", "Start")

	if b.testMode then -- PATCH (Test Mode): the NPC does nothing itself, but every step/phase still runs (start + end triggers fire)
		if b.ended then
			return
		end
		finishEnemyTurn(b)
		return
	end

	-- NPC HAND: draw one card (like the player: not on the very first turn of the battle), then cast one card from the hand
	if b.turnCount > 1 or RULES.DrawOnFirstTurn then
		drawFor(b, "Enemy", 1)
	end
	refillEnemyDeck(b)
	Net.Send(b.player, "SetDeckAmount", "Enemy", #b.decks.Enemy)
	-- NPC HAND: gear and terrain can't be cast by the NPC, so they are thrown away instead of clogging its hand
	do
		local junk = {}
		for _, c in ipairs(inZone(b, "Enemy", "Hand")) do
			local kind = cardType(c.def)
			if kind == "Gear" or kind == "Terrain" then
				c.zone = "Graveyard"
				table.insert(junk, c.id)
			end
		end
		if #junk > 0 then
			Net.Send(b.player, "MoveToGraveyard", { Enemy = junk })
			wait(RULES.EnemyActionDelay)
		end
	end
	local drawn = pickEnemyPlay(b)
	if drawn then
		wait(RULES.EnemyActionDelay)
		local kind = playKind(drawn)
		local eslot, ebname = VERBS.__blessPeek(b, drawn) -- FIX: the NPC's casts use up blessings too
		local shown = false
		if kind == "Effect" then
			drawn.zone = "Graveyard"
			shown = showSpell(b, drawn)
		end
		if not shown then
			Net.Send(b.player, "FlipCard", drawn.id, fullInfo(drawn))
		end
		-- PASSIVES: Unique - the enemy can't cast a second copy of a Unique fighter it already has on its field
		local uniqueBlocked = enemyUniqueBlocked(b, drawn)
		if kind == "Fighter" and not uniqueBlocked and #fieldOf(b, "Enemy") < RULES.FieldCap then
			faceLeaves(b, "Enemy")
			VERBS.__blessUse(b, drawn, eslot, ebname)
			Net.Send(b.player, "MoveToField", { Enemy = { drawn.id } })
			noteCast(b, drawn, "Fighter") -- FIX (Kilnkin Swimmer)
			enterField(b, drawn)
			VERBS.__fireSupercede(b, drawn) -- FIX (PixelFlame): OnAllySummonSupercede
			VERBS.__cardAnim(b, drawn, "SummonAnimation") -- FIX: the card's cast animation + sound
			castPassives(b, drawn) -- PASSIVES: Dominant / Prosperous
			VERBS.__blessApplyCast(b, drawn)
			fireTrigger(b, drawn, "OnSummon", {})
			if drawn.zone == "Field" and not b.ended then
				fireTrigger(b, drawn, drawn.castModified and "OnSummonModified" or "OnSummonNotModified", {})
			end
			if not isStealthy(drawn) then -- PASSIVES: Stealth / Stormless
				broadcastSummon(b, drawn)
				broadcastCast(b, drawn)
				if drawn.castModified and not b.ended then
					broadcastModifiedCast(b, drawn, "Fighter")
				end
			end
			if not b.ended then
				recheckCastAbilities(b, "Enemy") -- FIX (Kilnkin Swimmer)
			end
			processDeaths(b)
		else
			drawn.zone = "Graveyard"
			if shown then
				wait(RULES.EnemyActionDelay)
			else
				Net.Send(b.player, "MoveToGraveyard", { Enemy = { drawn.id } })
			end
			if kind == "Effect" then
				VERBS.__blessUse(b, drawn, eslot, ebname)
				noteCast(b, drawn, "Effect") -- FIX (Kilnkin Swimmer)
				if not isStealthy(drawn) then
					broadcastCast(b, drawn)
					if drawn.castModified and not b.ended then
						broadcastModifiedCast(b, drawn, "Effect")
					end
				end
				fireTrigger(b, drawn, "OnSummon", {})
				if not b.ended then
					recheckCastAbilities(b, "Enemy") -- FIX (Kilnkin Swimmer)
				end
			end
			if shown then
				Net.Send(b.player, "DestroyEffectCard", "Enemy", drawn.id)
			end
			processDeaths(b)
		end
		wait(RULES.EnemyActionDelay)
	end
	if b.ended then
		return
	end

	-- every fighter that can attack swings once
	for _, atk in ipairs(b.noAttack.Enemy and {} or fieldOf(b, "Enemy")) do
		if b.ended then
			return
		end
		-- PASSIVES: Dextrous / Super Dextrous fighters can swing again after a free (unlocked) attack
		for _ = 1, 1 + freeAttacks(atk) do
			if b.ended then
				return
			end
			if not (atk.zone == "Field" and atk.health > 0 and atk.lockTurns <= 0 and not atk.def.AttackBlock) then
				break
			end
			local target = pickEnemyTarget(b, atk)
			if not target and atk.def.FaceBlock then
				break -- PASSIVES: FaceBlock fighters can't hit the face, so with no fighter to attack they do nothing
			end
			attackLock(b, atk) -- (the enemy's fighters are never shown locked; this only counts the swings)
			if target then
				attackFighter(b, atk, target)
			elseif attackPlayerFace(b, atk, "You") then
				return
			end
			wait(RULES.EnemyActionDelay)
		end
	end
	if b.ended then
		return
	end

	finishEnemyTurn(b)
end

-- FIX: fleeting cards still in the hand when the player's turn ends are destroyed (the client slides them out of the hand).
-- FIX: they go to the Graveyard (they used to vanish / get obliterated) and give no stud.
local function expireFleeting(b)
	local any = false
	for _, c in ipairs(inZone(b, "You", "Hand")) do
		if c.fleeting or c.def.Fleeting then -- PASSIVES: Fleeting is also a printed passive
			c.zone = "Graveyard"
			c.fleeting = nil
			any = true
			Net.Send(b.player, "MoveToGraveyard", { [c.owner] = { c.id } })
		end
	end
	if any then
		sendAffordable(b)
	end
end

-- End the player's turn: end-of-turn effects, locks count down, studs generate, then the opponent plays.
-- Used by the End Turn button and by the turn timer.
local function endPlayerTurn(b)
	b.endTurnPending = nil
	b.endTurnRequested = nil
	b.busy = b.busy + 1 -- blocks further player actions straight away
	task.spawn(function()
		local ok, err = pcall(function()
			expireFleeting(b)
			resetColouredStuds(b, "You") -- before the end step, so studs it generates (Acolytes ...) are kept
			fireTurnEdge(b, "You", "End")
			if b.ended then
				return
			end
			endStepPassives(b, "You")
			if b.ended then
				return
			end
			tickLocks(b, "You")
			generateStuds(b, "You")
			b.turnOwner = "Enemy"
			Net.Send(b.player, "YourTurnEnd", {})
			b.busy = b.busy - 1
			runEnemyTurn(b)
		end)
		if not ok then
			warn("[Battlehandlers] end of turn errored:", err)
			if not b.ended then
				b.busy = 0
				startPlayerTurn(b) -- never leave the player stuck
			end
		end
	end)
end

local function resolvePendingForTurnEnd(b)
	local pending = b.pending
	if not pending then
		return
	end
	b.pending = nil
	task.spawn(pending.co, pending.fallback and pending.fallback() or nil)
end

local function requestEndPlayerTurn(b)
	if b.ended or b.turnOwner ~= "You" or b.endTurnRequested then
		return
	end
	b.endTurnRequested = true
	resolvePendingForTurnEnd(b)
	local turnId = b.turnId
	task.spawn(function()
		local waited = 0
		while b.busy > 0 and waited < 15 and not b.ended and b.turnId == turnId do
			task.wait(0.25)
			waited = waited + 0.25
		end
		if b.ended or b.turnId ~= turnId or b.turnOwner ~= "You" then
			b.endTurnRequested = nil
			return
		end
		if b.busy > 0 then
			b.busy = 0
		end
		endPlayerTurn(b)
	end)
end

-- End-turn and timeout fallback resolves a pending choice with its source only when the source is a legal target.
function BattleHandlers._forceEndTurn(b)
	if b.ended or b.turnOwner ~= "You" then
		return
	end
	if b.endTurnRequested then
		return
	end
	b.endTurnRequested = true
	alert(b.player, "Time's up! Your turn has ended.")
	resolvePendingForTurnEnd(b)
	local turnId = b.turnId
	local waited = 0
	while b.busy > 0 and waited < 15 and not b.ended and b.turnId == turnId do
		task.wait(0.25)
		waited = waited + 0.25
	end
	if b.ended or b.turnId ~= turnId or b.turnOwner ~= "You" then
		b.endTurnRequested = nil
		return
	end
	b.busy = 0
	endPlayerTurn(b)
end

-------------------------------------------------------------------- start up

local function buildPlayerDeck(d)
	local names = {}
	local deck = DeckUtil.GetDeck(d, d.currentDeckSlot)
	for card, count in pairs(deck) do
		if DeckUtil.GetCard(card) then
			for _ = 1, count do
				table.insert(names, card)
			end
		end
	end
	if #names == 0 then
		-- empty deck: give a random one so the fight can still be tested
		local pool = getFighterPool()
		for _ = 1, RULES.EnemyDeckSize do
			if #pool > 0 then
				table.insert(names, pool[math.random(#pool)])
			end
		end
	end
	shuffle(names)
	return names
end

local function buildEnemyDeck()
	local names = {}
	local pool = getEnemyPool()
	for _ = 1, RULES.EnemyDeckSize do
		if #pool > 0 then
			table.insert(names, pool[math.random(#pool)])
		end
	end
	return names
end

-- FIX (v17): STARTER MULLIGAN. Each side draws two opening hands, keeps the better one and shuffles the other back.
-- A starter is a card with StarterCard = true, or one that costs exactly 1-4 colourless and nothing else.
-- Hand priority (best first): 2 starters, 1 starter, 3 starters, 4+ starters, 0 starters. Same priority: the hand whose
-- starters have the higher total icon cost wins (still equal: the first hand is kept).
local function isStarter(card)
	local def = card.def
	if def.StarterCard == true then
		return true
	end
	local cost = def.Cost
	if type(cost) ~= "table" then
		return false
	end
	local neutral = tonumber(cost.Neutral) or 0
	if neutral < 1 or neutral > 4 then
		return false
	end
	for color, amount in pairs(cost) do
		if color ~= "Neutral" and (tonumber(amount) or 0) > 0 then
			return false
		end
	end
	return true
end

local function scoreStartingHand(b, ids)
	local count, total = 0, 0
	for _, id in ipairs(ids) do
		local card = b.cards[id]
		if card and isStarter(card) then
			count = count + 1
			for _, amount in pairs(card.def.Cost or {}) do
				if type(amount) == "number" then
					total = total + amount
				end
			end
		end
	end
	local rank
	if count == 2 then
		rank = 1
	elseif count == 1 then
		rank = 2
	elseif count == 3 then
		rank = 3
	elseif count >= 4 then
		rank = 4
	else
		rank = 5
	end
	return rank, total
end

local function drawStartingHand(b, owner)
	local deck = b.decks[owner]
	local function takeHand()
		local ids = {}
		for _ = 1, RULES.StartingHand do
			if #deck == 0 then
				break
			end
			table.insert(ids, table.remove(deck))
		end
		return ids
	end
	local handA = takeHand()
	local handB = takeHand()
	local keep, discard = handA, handB
	if #handB == RULES.StartingHand then
		local rankA, totalA = scoreStartingHand(b, handA)
		local rankB, totalB = scoreStartingHand(b, handB)
		if rankB < rankA or (rankB == rankA and totalB > totalA) then
			keep, discard = handB, handA
		end
	end
	for _, id in ipairs(discard) do
		table.insert(deck, id)
	end
	shuffle(deck)
	local cards = {}
	for _, id in ipairs(keep) do
		local card = b.cards[id]
		if card then
			toHand(b, card)
			table.insert(cards, card)
		end
	end
	return cards
end

local function beginBattle(b, playerInfo, enemyInfo, opts)
	local player = b.player
	b.faceInfo = { You = playerInfo, Enemy = enemyInfo }
	Net.Send(player, "StartBattleQuick", playerInfo, enemyInfo, b.id, opts)
	-- Give the client a moment to finish StartBattleQuick (it yields during transitions and only then stores the
	-- battle id), otherwise its "ReadyToStartTurn" reply can carry a stale id and be ignored.
	task.wait(1.5)
	Net.Send(player, "ClientIsReady") -- the client answers with "ReadyToStartTurn" once it has built the battle UI

	local t = os.clock()
	while not b.ready and not b.ended and player.Parent and os.clock() - t < 10 do
		task.wait(0.1)
	end
	if b.ended or not player.Parent then
		return
	end

	-- The two player "face" cards sit in the field rows. They are hidden until revealed, but still take up a slot
	-- in the centred layout, which is what pushed every field half a card to the right.
	Net.Send(player, "RevealFace", "Enemy", b.life.Enemy)
	Net.Send(player, "RevealFace", "", b.life.You)
	Net.Send(player, "EnableForfeit")
	b.faceShown = { You = true, Enemy = true }

	-- who goes first
	local first = RULES.FirstPlayer
	if first ~= "You" and first ~= "Enemy" then
		first = (math.random(2) == 1) and "You" or "Enemy"
	end
	b.first = first

	-- each player starts with 2 stud cards in their baseplate and colourless studs (4 going first, 6 going second)
	local studName = findStudCard()
	for _, owner in ipairs({ "You", "Enemy" }) do
		if studName then
			for _ = 1, RULES.StartingBaseplateCards do
				putInBaseplate(b, owner, studName)
				wait(0.15)
			end
		end
		local amount = (owner == first) and RULES.StartingStudsFirst or RULES.StartingStudsSecond
		addStuds(b, owner, "Neutral", amount)
	end

	refillEnemyDeck(b)
	sendDraw(b, drawStartingHand(b, "You"), nil) -- FIX (v17): starter mulligan
	if b.testMode then -- PATCH (Test Mode): start with a Copy Tool (GFT3). giveCard blocks AddBlock cards, so build it directly
		local tool = newCard(b, "You", "GFT3")
		if tool then
			toHand(b, tool)
			sendDraw(b, { tool }, nil)
		end
	end
	wait(0.5)
	-- NPC HAND: the NPC draws the same starting hand (face down) but only casts one card per turn
	sendDraw(b, nil, drawStartingHand(b, "Enemy")) -- FIX (v17): starter mulligan
	refillEnemyDeck(b)
	Net.Send(b.player, "SetDeckAmount", "Enemy", #b.decks.Enemy)
	wait(0.5)
	if first == "You" then
		startPlayerTurn(b)
	else
		runEnemyTurn(b)
	end
end

local function leaveBattle(b)
	if b and not b.ended then
		b.ended = true
		if byPlayer[b.player] == b then
			byPlayer[b.player] = nil
		end
		local pending = b.pending
		if pending then
			b.pending = nil
			task.spawn(pending.co, nil)
		end
	end
end

-------------------------------------------------------------------- handlers

function BattleHandlers.Init(Network, PlayerData)
	Net = Network
	PlayerDataModule = PlayerData

	local function getBattle(player, battleId)
		local b = byPlayer[player]
		if b and not b.ended and type(battleId) == "string" and b.id == battleId then
			return b
		end
		return nil
	end

	local function myTurn(b)
		return b.turnOwner == "You" and not b.ended and b.busy == 0
	end

	Network.On("RequestBattle", function(player, req)
		if type(req) ~= "table" or type(req.Duelist) ~= "string" then
			return
		end
		if byPlayer[player] then
			return
		end

		local function fail(message)
			alert(player, message)
			Network.Send(player, "SilentlyLeaveBattle")
		end

		local d = PlayerData.Wait(player, 15)
		if not d then
			return fail("Your data isn't loaded yet. Try again in a moment.")
		end
		if not DeckUtil.LibraryAvailable() or #getEnemyPool() == 0 then
			return fail("The card library could not be loaded.")
		end

		local b = {
			id = HttpService:GenerateGUID(false),
			player = player,
			counter = 0,
			cards = {},
			decks = { You = {}, Enemy = {} },
			life = { You = RULES.StartingLife, Enemy = RULES.StartingLife },
			studs = { You = {}, Enemy = {} }, -- spendable studs per colour
			turnCount = 0,
			playerTurns = 0,
			turnOwner = "None",
			faceShown = {},
			first = "You",
			baseplated = 0, -- cards sent to the baseplate this turn
			handCounter = 0,
			flags = { You = {}, Enemy = {} }, -- playertable flags set by effects (BypassUltra...)
			noAttack = {},
			noSummon = {},
			noActions = {}, -- [owner] = true: can't cast actions for the rest of that owner's turn
			terrain = {}, -- [owner] = the terrain card in play
			turnId = 0, -- changes every turn; the turn timer checks it
			busy = 0, -- > 0 while an action / effect is resolving
			depth = 0,
			ready = false,
			ended = false,
		}
		b.decks.You = createCards(b, "You", buildPlayerDeck(d))
		b.decks.Enemy = createCards(b, "Enemy", buildEnemyDeck())
		do -- PATCH: remember whether the player's starting deck satisfies Gladiator's restriction
			local seen, dupes, glads = {}, false, 0
			for _, id in ipairs(b.decks.You) do
				local c = b.cards[id]
				if seen[c.lib] then
					dupes = true
				end
				seen[c.lib] = true
				if c.def.Gladiator then
					glads = glads + 1
				end
			end
			b.gladiatorOk = { You = glads <= 2 and not dupes, Enemy = true }
		end
		do -- FIX (Bliss): you can only enter Bliss with at least one PLURRAL card in your starting deck
			b.plurral = { You = false, Enemy = false }
			for _, side in ipairs({ "You", "Enemy" }) do
				for _, id in ipairs(b.decks[side]) do
					local d = b.cards[id] and b.cards[id].def
					if d and (d.Logo == "Plurral" or (type(d.SearchTerms) == "string" and d.SearchTerms:find("PLURRAL", 1, true))) then
						b.plurral[side] = true
						break
					end
				end
			end
		end
		byPlayer[player] = b
		b.testMode = type(req.ExtraData) == "table" and req.ExtraData.Mode == "Test" -- PATCH (Test Mode)

		local visualName = type(req.Name) == "string" and req.Name ~= "" and req.Name or req.Duelist
		local enemyName = visualName
		if enemyName == player.Name then
			enemyName = enemyName .. " (NPC)"
		end

		local playerInfo = { Name = player.Name, VisualName = player.DisplayName, userId = player.UserId }
		local enemyInfo = { Name = enemyName, VisualName = visualName, userId = -1 }
		local opts = {
			Puzzle = false,
			StartingLife = RULES.StartingLife,
			FieldCap = RULES.FieldCap,
			HandCap = RULES.HandCap,
			StageCap = RULES.StageCap,
		}
		if type(req.ExtraData) == "table" and type(req.ExtraData.CustomBack) == "string" then
			opts.CustomBack = req.ExtraData.CustomBack
		end

		task.spawn(function()
			local ok, err = pcall(beginBattle, b, playerInfo, enemyInfo, opts)
			if not ok then
				warn("[Battlehandlers] battle setup errored:", err)
			end
		end)
	end)

	Network.On("ReadyToStartTurn", function(player, battleId)
		local b = getBattle(player, battleId)
		if b then
			b.ready = true
		end
	end)

	Network.On("ReadyToTarget", function() end)

	-- The client picked a target for an effect that asked for one.
	Network.On("SetTarget", function(player, battleId, targetId)
		local b = getBattle(player, battleId)
		local pending = b and b.pending
		if not pending then
			return false
		end
		if pending.zone then
			-- card picker window: a list of card ids (a single id is accepted too), min..max of them, each offered, no repeats
			if type(targetId) == "string" then
				targetId = { targetId }
			end
			if type(targetId) ~= "table" or #targetId > pending.max then
				return false
			end
			local picks, seen = {}, {}
			for i = 1, #targetId do
				local id = targetId[i]
				local card = type(id) == "string" and pending.set[id] or nil
				if not card or seen[id] then
					return false
				end
				seen[id] = true
				table.insert(picks, card)
			end
			if #picks < pending.min then
				return false
			end
			b.pending = nil
			task.spawn(pending.co, picks)
			return true
		end
		if type(targetId) ~= "string" then
			return false
		end
		local card = pending.set[targetId]
		if not card or card.zone ~= "Field" then
			return false
		end
		b.pending = nil
		task.spawn(pending.co, card)
		return true
	end)

	-- Hand card -> baseplate (the client sends this on drag to the baseplate). Same rule as discarding.
	Network.On("BaseplateCard", function(player, battleId, cardId)
		local b = getBattle(player, battleId)
		if not b or not myTurn(b) or type(cardId) ~= "string" then
			return false
		end
		local card = b.cards[cardId]
		if not card or card.owner ~= "You" or card.zone ~= "Hand" then
			return false
		end
		if RULES.BaseplatesPerTurn > 0 and b.baseplated >= RULES.BaseplatesPerTurn + (b.extraBaseplates or 0) then
			alert(player, "You've already baseplated this turn.")
			return false
		end
		return discardFromHand(b, card)
	end)

	-- Hand card -> cast. Fighters go to the field, spells are paid for and sent to the graveyard; effects run.
	Network.On("PlaceCard", function(player, battleId, cardId, replaceLeftmost)
		local b = getBattle(player, battleId)
		if not b or not myTurn(b) or type(cardId) ~= "string" then
			return false
		end
		if replaceLeftmost ~= nil and type(replaceLeftmost) ~= "boolean" then
			return false
		end
		local card = b.cards[cardId]
		if not card or card.owner ~= "You" or card.zone ~= "Hand" then
			return false
		end

		local kind = playKind(card)
		if kind == "Gear" and #singleCandidates(b, card, "SingleAlly") == 0 then
			alert(player, "You need a fighter to attach this to.")
			return false
		end
		if kind == "Fighter" and #fieldOf(b, "You") >= RULES.FieldCap and not replaceLeftmost then
			alert(player, "Your field is full.")
			return false
		end
		if kind == "Effect" and b.noActions.You then
			alert(player, "You can't cast actions for the rest of this turn.")
			return false
		end
		if kind == "Fighter" and b.noSummon.You then
			alert(player, "You can't cast fighters for the rest of this turn.")
			return false
		end
		-- PASSIVES: Unique - only one copy on your field; a Unique action can't be cast while you have a Unique fighter
		if card.def.Unique then
			for _, f in ipairs(fieldOf(b, "You")) do
				if f.def.Unique and (kind == "Effect" or baseKey(f.lib) == baseKey(card.lib)) then
					alert(player, "Only one Unique card can be on the field.")
					return false
				end
			end
		end
		local met, why = requirementMet(b, card)
		if not met then
			alert(player, why)
			return false
		end

		if RULES.AltCostCheck then
			card.altCost = RULES.AltCostCheck(b, card) -- FIX (Blood Moon Seeker)
		end
		local ok, pay, missing = planPayment(b.studs.You, effectiveCost(card))
		if not ok then
			Network.Send(player, "MissingIcons", missing)
			return false
		end
		if kind == "Fighter" and replaceLeftmost then
			-- FIX (casting onto a full board): settle anything that already died (a fighter that just swung and traded) BEFORE counting,
			-- and only count / pick fighters that are really alive. A fighter at 0 health that was still waiting to be cleared used to
			-- keep the board "full" and could be picked as the leftmost, so a healthy fighter got obliterated for nothing.
			processDeaths(b)
			if b.ended then
				return false
			end
			local field = {}
			for _, f in ipairs(fieldOf(b, "You")) do
				if (f.health or 0) > 0 and not f.obliterated then
					table.insert(field, f)
				end
			end
			if #field >= RULES.FieldCap then
				local leftmost = field[1]
				if not leftmost then
					return false
				end
				-- FIX: casting onto a full board OBLITERATES the leftmost fighter: it just vanishes. It used to have its health set to 0 (with the
				-- red health-loss number), so it DIED: death effects fired, it went to the graveyard and "whenever a fighter dies" cards reacted.
				-- Same handling as the Obliterate verb: marked obliterated, health change shown without the damage number, no death effects.
				leftmost.obliterated = true
				leftmost.health = 0 -- server side only; the client keeps showing its health until it vanishes
				processDeaths(b)
				if b.ended then
					return false
				end
				if #fieldOf(b, "You") >= RULES.FieldCap then
					alert(player, "Your field is still full.")
					return false
				end
			end
		end
		for color, amount in pairs(pay) do
			addStuds(b, "You", color, -amount, card.id)
		end

		-- FIX (Saros Aligner et al.): EVERY card cast from a blessed card space uses the blessing up (it used to be fighters only),
		-- and the card remembers the space it came from (card.handOrigin) for "the card space this was cast from" / adjacent spaces.
		do
			local bslot, bname = VERBS.__blessPeek(b, card)
			VERBS.__blessUse(b, card, bslot, bname)
		end
		noteCast(b, card, kind) -- FIX (Kilnkin Swimmer): counts as a cast type for this turn before anything reacts to it

		if kind == "Fighter" then
			faceLeaves(b, "You")
			Network.Send(player, "MoveToField", { You = { card.id } })
			enterField(b, card)
			-- FIX (PixelFlame): effects that trigger before the fighter's other cast effects (OnAllySummonSupercede)
			b.busy = b.busy + 1
			local okS, errS = pcall(VERBS.__fireSupercede, b, card)
			b.busy = b.busy - 1
			if not okS then
				warn("[Battlehandlers] supercede errored:", errS)
			end
			if b.ended then
				return false
			end
			VERBS.__cardAnim(b, card, "SummonAnimation") -- FIX: the card's cast animation + sound
			if card.def.Charge or card.def.Haste or (RULES.ChargeReqCheck and RULES.ChargeReqCheck(b, card)) then
				Network.Send(player, "ChargeCard", card.id)
			end
		elseif kind == "Terrain" then
			placeTerrain(b, card)
		else
			card.zone = "Graveyard"
		end
		local shown = false
		if kind == "Effect" or kind == "Gear" then
			shown = showSpell(b, card)
			if not shown then
				Network.Send(player, "MoveToGraveyard", { You = { card.id } })
			end
		end
		sendAffordable(b)

		runBusy(b, function()
			if kind == "Gear" then
				local tgt = chooseTarget(b, card, singleCandidates(b, card, "SingleAlly"))
				if tgt and tgt.zone == "Field" then
					attachGear(b, tgt, card)
				end
			else
				if kind == "Fighter" then
					castPassives(b, card) -- PASSIVES: Dominant / Prosperous / Sociable
					VERBS.__blessApplyCast(b, card)
				end
				if kind == "Fighter" then
					fireTrigger(b, card, "OnAnyTrigger", {}) -- FIX (Stoneware Stranger / Grinner): enters with its flaws
				end
				fireTrigger(b, card, "OnSummon", {})
				if kind == "Fighter" and card.def.Station and not b.ended then
					VERBS.__station(b, card) -- STATION: attach a copy to your terrain
				end
				-- "When this card is cast from a blessed card space: ..." (Palus Dredger etc.)
				-- FIX: and "When this card is cast, if it wasn't cast from a blessed card space: ..." (Apogee Visionary: OnSummonNotModified)
				if kind == "Fighter" and card.zone == "Field" and not b.ended then
					fireTrigger(b, card, card.castModified and "OnSummonModified" or "OnSummonNotModified", {})
				end
				if kind == "Effect" then
					processDeaths(b)
				end
			end
			if kind == "Terrain" then
				fireTrigger(b, card, "OnAnyTrigger", {}) -- e.g. The Ultra Gate turns BypassUltra on as soon as it is in play
			end
			-- PASSIVES: Stealth / Stormless - casting this card doesn't trigger other cards' "whenever you cast" effects
			if not isStealthy(card) then
				if kind == "Fighter" then
					broadcastSummon(b, card)
				end
				broadcastCast(b, card)
				if kind == "Terrain" or kind == "Gear" then
					broadcastCastKind(b, card, kind)
				end
				-- FIX: "Whenever you cast a card that uses up a blessing" (OnAllySummonModified / OnAllyCastModified)
				if card.castModified and not b.ended then
					broadcastModifiedCast(b, card, kind)
				end
			end
			if not b.ended then
				recheckCastAbilities(b, "You") -- FIX (Kilnkin Swimmer): the cast types changed, check "3 or more types" again
			end
			if shown then
				Network.Send(player, "DestroyEffectCard", "", card.id)
			end
			processDeaths(b)
			-- NEW: {"EndTurn"} used by the card that was just cast
			if b.endTurnPending then
				b.endTurnPending = nil
				if not b.ended and b.turnOwner == "You" then
					endPlayerTurn(b)
				end
			end
		end)
		return true
	end)

	-- Right-click on a hand card (see discardFromHand for the baseplate / graveyard rules)
	Network.On("DiscardCard", function(player, battleId, cardId)
		local b = getBattle(player, battleId)
		if not b or not myTurn(b) or type(cardId) ~= "string" then
			return false
		end
		local card = b.cards[cardId]
		if not card or card.owner ~= "You" or card.zone ~= "Hand" then
			return false
		end
		if card.def.DiscardBlock or card.def.Undiscardable then
			return false
		end
		return discardFromHand(b, card)
	end)

	-- Field card attacks a fighter:  PlayCard(battleId, attackerId, targetId)
	Network.On("PlayCard", function(player, battleId, attackerId, targetId)
		local b = getBattle(player, battleId)
		if not b or not myTurn(b) or type(attackerId) ~= "string" or type(targetId) ~= "string" then
			return false
		end
		local atk, def = b.cards[attackerId], b.cards[targetId]
		if not atk or not def then
			return false
		end
		if atk.owner ~= "You" or atk.zone ~= "Field" or atk.lockTurns > 0 or atk.def.AttackBlock or b.noAttack.You then
			return false
		end
		if def.owner ~= "Enemy" or def.zone ~= "Field" then
			return false
		end
		if not isDefender(def) and hasDefender(b, "Enemy") then
			alert(player, "Attack the Defender first.")
			return false
		end
		local lock = attackLock(b, atk) -- PASSIVES: Dextrous / Super Dextrous attack again without being locked
		atk.lockTurns = lock
		atk.attackLockNow = lock -- the attack's own lock, not counted by VERBS.Lock while the attack resolves
		runBusy(b, function()
			attackFighter(b, atk, def)
			atk.attackLockNow = nil
			-- FIX (Icerain): send the lock the card has NOW. An OnAttackEnd "Lock 6" (Icerain) raises it above the attack's own 1,
			-- and this used to resend the stale 1, so the client showed a single lock.
			if lock > 0 and not b.ended and atk.zone == "Field" and atk.lockTurns > 0 then
				Network.Send(player, "Freeze", atk.id, atk.lockTurns)
			end
		end)
		return true
	end)

	-- Field card attacks the face:  AttackFace(battleId, attackerId)
	Network.On("AttackFace", function(player, battleId, attackerId)
		local b = getBattle(player, battleId)
		if not b or not myTurn(b) or type(attackerId) ~= "string" then
			return false
		end
		local atk = b.cards[attackerId]
		if not atk or atk.owner ~= "You" or atk.zone ~= "Field" or atk.lockTurns > 0 or atk.def.AttackBlock or b.noAttack.You then
			return false
		end
		if atk.def.FaceBlock then -- PASSIVES: FaceBlock fighters can attack fighters, but not the opponent
			alert(player, "This fighter can't attack the opponent directly.")
			return false
		end
		if RULES.FaceNeedsEmptyField and #fieldOf(b, "Enemy") > 0 and not atk.def.Unstoppable then -- PASSIVES: Unstoppable
			alert(player, "Destroy the enemy fighters first.")
			return false
		end
		local lock = attackLock(b, atk)
		atk.lockTurns = lock
		atk.attackLockNow = lock
		runBusy(b, function()
			-- FIX (Icerain): same as the fighter attack, send the card's current lock, not the stale attack lock
			local faceEnded = attackPlayerFace(b, atk, "Enemy")
			atk.attackLockNow = nil
			if not faceEnded and lock > 0 and atk.zone == "Field" and atk.lockTurns > 0 then
				Network.Send(player, "Freeze", atk.id, atk.lockTurns)
			end
		end)
		return true
	end)

	Network.On("EndTurn", function(player, battleId)
		local b = getBattle(player, battleId)
		-- FIX: while a target is being asked for the cast is still running (b.busy > 0), so myTurn() refused the click and the turn never
		-- ended. A pending choice is allowed through: requestEndPlayerTurn resolves it (self if legal, else it fizzles) and then ends the turn.
		if not b or b.turnOwner ~= "You" or b.ended or (b.busy ~= 0 and not b.pending) then
			return false
		end
		requestEndPlayerTurn(b)
		return true
	end)

	Network.On("Forfeit", function(player, battleId)
		local b = getBattle(player, battleId)
		if b then
			endBattle(b, "Defeat", "Forfeit")
		end
	end)

	-- Queries the client makes while playing
	Network.On("GetField", function(player, battleId)
		local b = getBattle(player, battleId)
		local out = {}
		if b then
			for _, c in ipairs(fieldOf(b, "You")) do
				out[c.id] = true
			end
		end
		return out
	end)

	Network.On("GetBattleRules", function(player, battleId)
		return {
			FieldCap = RULES.FieldCap,
			HandCap = RULES.HandCap,
			StageCap = RULES.StageCap,
			StartingLife = RULES.StartingLife,
		}
	end)

	Network.On("ClientGetCardType", function(player, battleId, cardId)
		local b = getBattle(player, battleId)
		local card = b and type(cardId) == "string" and b.cards[cardId]
		return card and playKind(card) or nil
	end)

	Network.On("GetBattleTurnCount", function(player, battleId)
		local b = getBattle(player, battleId)
		return b and b.playerTurns or 0
	end)

	Network.On("GetPlayerDiscardCount", function()
		return 0
	end)

	-- Deck viewer: your remaining deck, cheapest first
	Network.On("FetchDeck", function(player, battleId)
		local b = getBattle(player, battleId)
		local out = {}
		if b then
			for _, id in ipairs(b.decks.You) do
				table.insert(out, fullInfo(b.cards[id]))
			end
			local function totalCost(info)
				local n = 0
				for _, v in pairs(info.Cost or {}) do
					if type(v) == "number" then
						n = n + v
					end
				end
				return n
			end
			table.sort(out, function(a, c)
				return totalCost(a) < totalCost(c)
			end)
		end
		return out
	end)

	Network.On("GetOtherHand", function()
		return {}
	end)

	Players.PlayerRemoving:Connect(function(player)
		leaveBattle(byPlayer[player])
		byPlayer[player] = nil
	end)
end

return BattleHandlers