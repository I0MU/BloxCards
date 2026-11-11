



local module: {[any]: any} = {}
local u2 = nil
local tweenService: TweenService = game:GetService("TweenService")

setmetatable(module, {
	__index = function(_, p2)
		if typeof(tweenService[p2]) == "function" then
			return function(...)
				return tweenService[p2](tweenService, ...)
			end
		end

		return tweenService[p2]
	end
})

local function ToEnum(p3, p4)
	if typeof(p3) == Enum then
		return p3
	end

	if p4[p3] then
		return p4[p3]
	end

	error()
end
function module.Create(_, p6, p7, p8, p9, p10, p11, p12, p13)
	local v18
	local v19
	local v20
	local typeName
	local v22
	local v23
	local typeName2
	local v25
	local v26
	local v27
	local v28
	local typeName3
	local v30

	if u2 then
		p8 = u2
	end

	v18 = tweenService

	if p11 then
		v19 = TweenInfo.new
		v20 = Enum.EasingStyle
		typeName = typeof(p10)

		if typeName == Enum then
			v22 = p10
		else
			if v20[p10] then
				v22 = v20[p10]
			else
				error()
				v22 = nil
			end
		end

		v23 = Enum.EasingDirection
		typeName2 = typeof(p9)

		if typeName2 == Enum then
			v25 = p9
		else
			if v23[p9] then
				v25 = v23[p9]
			else
				error()
				v25 = nil
			end
		end

		v26 = v19(p8, v22, v25, p11, p12, p13)

		if not v26 then
			v27 = TweenInfo.new
			v28 = Enum.EasingStyle
			typeName3 = typeof(p10)

			if typeName3 == Enum then
				v30 = p10
			else
				if v28[p10] then
					v30 = v28[p10]
				else
					error()
					v30 = nil
				end
			end

			v26 = v27(p8, v30, ToEnum(p9, Enum.EasingDirection))
		end
	else
		v27 = TweenInfo.new
		v28 = Enum.EasingStyle
		typeName3 = typeof(p10)

		if typeName3 == Enum then
			v30 = p10
		else
			if v28[p10] then
				v30 = v28[p10]
			else
				error()
				v30 = nil
			end
		end

		v26 = v27(p8, v30, ToEnum(p9, Enum.EasingDirection))
	end

	return v18:Create(p6, v26, p7)
end
function module.Interrupt()
	warn("Interrupt called")
end
function module.Tween(_, ...)
	local v32 = module:Create(...)

	v32:Play()

	return v32
end
function module.AnimateAsync(...)
	return module:Tween(...)
end
function module.Animate(...)
	local v33 = module:Tween(...)

	v33.Completed:Wait()

	return v33
end
function module.SetGlobalTweenTimer(p15)
	u2 = p15
end

return module
