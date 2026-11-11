



local sleeveComponent = require(script.SleeveComponent)
local sleevesController = require(script.SleevesController)
local sleevesViewModel = require(script.SleevesViewModel)

return {
	Components = { Sleeve = sleeveComponent },
	Controller = sleevesController,
	ViewModel = sleevesViewModel,
	UI = script.base.MenuLayout
}
