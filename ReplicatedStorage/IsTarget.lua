



local t1: {[any]: any} = {
	"Single",
	"Target",
	"SingleAlly",
	"SingleEnemy",
	"TargetAlly",
	"TargetEnemy"
}

return function(p1)
	for _, v in pairs(t1) do
		if p1 == v then
			return true
		end
	end

	return false
end
