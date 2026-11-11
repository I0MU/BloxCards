





local module: {[any]: any} = {
	sleeves = {},
	prettysleeves = require(game.ReplicatedStorage.Sleeves)
}

for _, v in pairs(module.prettysleeves) do
	for k, iterValue in pairs(v) do
		module.sleeves[k] = iterValue
	end
end

print("Finished loading " .. script.Name)

return module
