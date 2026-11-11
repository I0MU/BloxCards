



local v1 = game:GetService("ReplicatedFirst")["Main Nieuw"]
local sleevesViewModel = require(script.Parent.SleevesViewModel)
local network = require(v1.Network)
local sleeveComponent = require(script.Parent.SleeveComponent)
local tagComponent = require(script.Parent.TagComponent)
local menuLayout: Instance = script.Parent:WaitForChild("base"):WaitForChild("MenuLayout")
local module: {[any]: any} = {}

module.__index = module

function module._loadingAction(p1, p2)
	if p2 == nil then
		return
	end

	p1.Model.loading = true

	if p1._initialDraw then
		p1:Draw()
	end

	table.insert(p1._tasks, task.defer(function()
		pcall(p2)
		task.defer(function()
			p1:_postLoad()
		end)
	end))
end
function module._postLoad(p3)
	local t2: {[any]: any} = {}

	for _, v in ipairs(p3._tasks) do
		if coroutine.status(v) ~= "dead" then
			table.insert(t2, v)
		end
	end

	p3._tasks = t2

	if #p3._tasks == 0 then
		p3.Model.loading = false

		if p3._initialDraw then
			p3:Draw()
		end
	end
end
function module.FilterTags(p4, p5, p6)
	local u20 = p6 or "union"

	if not p5 or #p5 < 1 then
		p5 = p4.Model.tags
		u20 = "union"
	end

	p4:_loadingAction(function()
		local v62 = table.concat(p5, ", ")

		print("[SleevesController] Performing search for tags '" .. v62 .. "'...")

		local ok, result = pcall(function()
			return network.InvokeServer("SearchSleevesByTag", p5, u20)
		end)

		if not ok or result == nil then
			warn("[SleevesController] uh oh FilterTags didnt work")
		end

		p4.Model.search = result
	end)
end
local function debounce(p7, p8, p9)
	local v24 = p8()

	if v24 ~= nil and coroutine.status(v24) ~= "dead" then
		task.cancel(v24)
	end

	return task.delay(p9, p7)
end
function module.ToggleTag(p10, p11, p12)
	local v28 = table.find(p10.Model.tagFilters, p11)

	if v28 and p12 ~= true then
		table.remove(p10.Model.tagFilters, v28)
	end

	if not v28 or p12 == true then
		table.insert(p10.Model.tagFilters, p11)
	end

	p10:Draw()

	local function v29()
		return p10._debounceSearch
	end

	local _debounceSearch = p10._debounceSearch

	if _debounceSearch ~= nil and coroutine.status(_debounceSearch) ~= "dead" then
		task.cancel(_debounceSearch)
	end

	p10._debounceSearch = task.delay(0.1, function()
		p10:HandleCompoundSearch()
	end)
end
function module.HandleSearch(p13, p14)
	p13.Model.searchTerm = p14
	p13:_loadingAction(function()
		print("[SleevesController] Performing search for term '" .. p14 .. "'...")

		local ok, result = pcall(function()
			return network.InvokeServer("SearchSleevesByTerm", p14)
		end)

		if not ok or result == nil then
			warn("[SleevesController] uh oh HandleSearch didnt work")
		end

		p13.Model.search = result
	end)
end
function module.HandleCompoundSearch(p15)
	if p15.Model.searchTerm == nil or p15.Model.searchTerm == "" then
		p15:FilterTags(p15.Model.tagFilters)

		return
	end

	if p15.Model.tagFilters and not (#p15.Model.tagFilters < 1) then
		p15:_loadingAction(function()
			local searchTerm = p15.Model.searchTerm
			local v68 = table.concat(p15.Model.tagFilters, ", ")

			print("[SleevesController] Performing compound search for term '" .. searchTerm .. ";' tags '" .. v68 .. "'...")

			local ok, result = pcall(function()
				return network.InvokeServer("SearchSleeves", p15.Model.tagFilters, p15.Model.searchTerm, "intersection")
			end)

			if not ok or result == nil then
				warn("[SleevesController] uh oh HandleCompoundSearch didnt work")
			end

			p15.Model.search = result
		end)

		return
	end

	p15:HandleSearch(p15.Model.searchTerm)
end
function module.new(p16)
	local t3: {[any]: any} = {
		_initialDraw = false,
		_tasks = {},
		_prev = table.freeze({}),
		_tagUi = {},
		_bgButtonHandler = p16 and p16.handleToBackgrounds,
		Model = sleevesViewModel.new()
	}

	setmetatable(t3, module)

	return t3
end
function module.Setup(p17)
	p17._sleeves = {}
	p17._layout = menuLayout:Clone()
	p17._holder = p17._layout:FindFirstChild("SleeveGrid"):FindFirstChild("Scroller")
	p17._initialDraw = true
	p17:_loadingAction(function()
		local ok, result = pcall(function()
			return network.InvokeServer("GetSleeveTags")
		end)

		if not ok then
			warn("[SleevesController] uh oh GetSleeveTags didnt work")
		else
			local function onChange(p18, p19)
				p17:ToggleTag(p18.tagName, p19)
			end

			p17.Model.tags = result or {}
			task.spawn(function()
				local sideBar = p17._layout:FindFirstChild("SideBar")

				for _, v in ipairs(p17.Model.tags) do
					local v82 = tagComponent.new({ state = false, tagName = v, onChange = onChange })

					v82.Physical.Parent = sideBar
					p17._tagUi[v] = v82
				end
			end)
			p17:FilterTags(p17.Model.tags, "union")
		end

		local v74 = p17._layout.SideBar["!Search"]

		v74:GetPropertyChangedSignal("Text"):Connect(function()
			local function v83()
				return p17._debounceSearch
			end

			local _debounceSearch = p17._debounceSearch

			if _debounceSearch ~= nil and coroutine.status(_debounceSearch) ~= "dead" then
				task.cancel(_debounceSearch)
			end

			p17._debounceSearch = task.delay(1, function()
				p17.Model.searchTerm = v74.Text
				p17:HandleCompoundSearch()
			end)
		end)

		local toBackgrounds = p17._layout.ToBackgrounds

		local function v76()
			if typeof(p17._bgButtonHandler) == "function" then
				p17._bgButtonHandler()
			end
		end

		toBackgrounds.MouseButton1Click:Connect(v76)
		toBackgrounds.TouchTap:Connect(v76)
	end)
end
local function _arrEqual(p20, p21)
	if p20 == nil ~= (p21 == nil) then
		return false
	end

	if #p20 ~= #p21 then
		return false
	end

	for _, v in ipairs(p20) do
		if not table.find(p21, v) then
			return false
		end
	end

	return true
end
local function merge(p22, p23)
	local t4: {[any]: any} = {}

	for k, v in pairs(p22) do
		t4[k] = v
	end

	for k, v in pairs(p23) do
		t4[k] = v
	end

	return t4
end
function module.Update(p24, p25)
	p24.Model = merge(p24.Model, p25)
	p24:Draw()

	return p24.Model
end
function module.Draw(p26)
	if not p26._initialDraw then
		warn("[SleevesController] Draw was called before Setup! please run setup first!")

		return
	end

	if p26._prev.loading ~= p26.Model.loading then
		p26._layout.Loading.Visible = p26.Model.loading
	end

	if p26.Model.search and p26.Model.search.matches then
		p26._holder:Destroy()
		p26._holder = menuLayout:FindFirstChild("SleeveGrid"):FindFirstChild("Scroller"):Clone()
		p26._holder.Parent = p26._layout.SleeveGrid
		p26._sleeves = {}

		local t5: {[any]: any} = {}

		for i, v in ipairs(p26.Model.search.matches) do
			if t5[v.Id] == nil then
				t5[v.Id] = true
				table.insert(p26._sleeves, sleeveComponent.new({ data = v, idx = i, owned = v.Owned }, p26._holder))
			end
		end

		p26._layout.NoResults.Visible = #p26.Model.search.matches == 0
	end

	local tableFreeze = table.freeze
	local searchTerm = p26.Model.searchTerm
	local v56 = table.clone(p26.Model.tagFilters)

	p26._prev = tableFreeze({
		searchTerm = searchTerm,
		tagFilters = v56,
		activeId = p26.Model.activeId,
		loading = p26.Model.loading
	})
end
function module.Mount(p27, parent)
	if not p27._initialDraw then
		p27:Setup()
	end

	p27._layout.Parent = parent
end
function module.Destroy(p29)
	p29._layout:Destroy()

	for _, v in ipairs(p29._tasks) do
		task.cancel(v)
	end

	task.cancel(p29._debounceSearch)
	table.clear(p29.Model)
end

return module
