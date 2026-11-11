



local replicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")

require(replicatedStorage.SearchShared)

return {
	new = function()
		return {
			loading = false,
			tagFilters = {},
			tags = {}
		}
	end
}
