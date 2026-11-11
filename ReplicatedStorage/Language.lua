



local t1: {[any]: any} = {
	"It's Your Opponent's Turn.",
	"It's Their Turn.",
	"It's Your Enemy's Turn!",
	"Opponent's Turn Has Started!",
	"Their Turn!",
	"It's The Opponent's Turn!"
}
local t2: {[any]: any} = {
	"It's Your Turn! Make It Count.",
	"It's Your Turn!",
	"Turn Start!",
	"Your Turn Has Started!",
	"Your Turn!",
	"It's Your Turn!"
}
local t3: {[any]: any} = {
	"Loading...",
	"Loading some more...",
	"Loading an extra amount to trigger you...",
	"Assembling all the Shedletsky cards...",
	"Nerfing red...",
	"Banning 1x1x1x1...",
	"Missing.No...",
	"What could possibly go wrong...",
	"FLEENTSTONEZ...",
	"Capturing the Stalker...",
	"Making a sacrefice for titano...",
	"Playing a good game...",
	"Making IcyTea a Developer...",
	"Playing Kaijuro...",
	"Modifying holographic patterns...",
	"Fishing...",
	"Going fast...",
	"Going slow...",
	"When will this stop loading...",
	"[insert nerf here]...",
	"... ...",
	"Making the 9001th tycoon...",
	"Stealing memes...",
	"Adding dantdm...",
	"Removing uber noob...",
	"You expected Bloxcards but it was me! LOADING...",
	"Making the game p2w...",
	"Acussing this game for being a undertale rip off...",
	"Building a great wall...",
	"Hailing redlciff...",
	"Doing chores...",
	"!?!",
	"lOADING...",
	"HEY MEEBOIDS! KEEP YOUR FILTHY HANDS OFF THOSE CARDS...",
	"Meet George Jetson...",
	"Dinkleberg...",
	"Making it FREE...",
	"Making everything FREE...",
	"Praising Mitpaul for being such a handsome card maker...",
	"Cleaning the beach...",
	"Making the blimps groovy...",
	"Playing a better game...",
	"Fixing trading..."
}

return {
	TheirTurn = function()
		local randomNumber = math.random(#t1)
		local v5 = t1[randomNumber]
		local color3 = Color3.fromRGB(164, 49, 49)

		return { v5, color3, false }
	end,
	YourTurn = function()
		local randomNumber = math.random(#t2)
		local v8 = t2[randomNumber]
		local color3 = Color3.fromRGB(0, 89, 197)

		return { v8, color3, true }
	end,
	Loading = function()
		local randomNumber = math.random(#t3)

		return t3[randomNumber]
	end
}
