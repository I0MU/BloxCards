

-- Original SourceAssetId: https://assetdelivery.roblox.com/v1/asset/?id=5947408306

-- ! Source from the asset above; the game may have edited it since.

seat = script.Parent
function added(child)
	if (child.className=="Weld") then
		human = child.part1.Parent:FindFirstChild("Humanoid")
		if human ~= nil then
			anim = human:LoadAnimation(seat.sitanim)
			anim:Play()
		end
	 end
end

function removed(child2)
	if anim ~= nil then
		anim:Stop()
		anim:Remove()
	end
end

seat.ChildAdded:connect(added)
seat.ChildRemoved:connect(removed)