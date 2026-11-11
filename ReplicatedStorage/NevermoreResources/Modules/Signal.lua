



return {
	new = function()
		local bindableEvent = Instance.new("BindableEvent")
		local u2 = nil
		local u3 = nil

		return {
			fire = function(_, ...)
				u2 = { ... }
				u3 = select("#", ...)
				bindableEvent:Fire()
			end,
			connect = function(_, p3)
				if not p3 then
					error("connect(nil)", 2)
				end

				return bindableEvent.Event:connect(function()
					p3(unpack(u2, 1, u3))
				end)
			end,
			wait = function(_)
				bindableEvent.Event:wait()
				assert(u2, "Missing arg data, likely due to :TweenSize/Position corrupting threadrefs.")

				return unpack(u2, 1, u3)
			end,
			Destroy = function(_)
				bindableEvent:Destroy()
				u2 = nil
				u3 = nil
				bindableEvent = nil
			end
		}
	end
}
