



local runService: RunService = game:GetService("RunService")

game:GetService("GroupService")
game:GetService("Players")

if not runService:IsStudio() then
	local v2 = ("🍍 Running TopbarPlus %* by ForeverHD"):format((require(script.Parent.VERSION)))

	print(v2)
end

return {}
