

-- Original SourceAssetId: https://assetdelivery.roblox.com/v1/asset/?id=65574227

-- ! Source from the asset above; the game may have edited it since.

print("Loaded")
stuff = script.Parent.Cart:GetChildren()
for i=1,#stuff do
	if stuff[i].Name ~= "Engine" then
	if stuff[i].className == "Part" then
	if stuff[i].BrickColor == BrickColor.new(194) then stuff[i].Name = "Part1"
	else
	stuff[i].Name = "Part2"
	end
	end
	end
	end
c = script.Parent.Cart:clone()


function onChildAdded(item)
print("Adding...")
if item.Name == "Cart" then script.Parent.CarValue.Value = script.Parent.CarValue.Value + 1
end
end


function onChildRemoved(item)
print("Subtracting...")
if item.Name == "Cart" then script.Parent.CarValue.Value = script.Parent.CarValue.Value - 1
if script.Parent.CarValue.Value < 1 then --No more cars... wut?
script.Parent.Rail.Velocity = Vector3.new(0,0,0)
cc = c:clone()
cc.Parent = script.Parent
cc:makeJoints()

things = cc:GetChildren()
for i=1,#things do
if things[i].className == "Part" or things[i].className == "Seat" then
if things[i].Name == "Part1" or things[i].Name == "Engine" then things[i].BrickColor = script.Parent.CartColor1.Value
elseif things[i].Name == "Part2" then things[i].BrickColor = script.Parent.CartColor2.Value end
end
end
end
end
end

script.Parent.ChildAdded:connect(onChildAdded)
script.Parent.ChildRemoved:connect(onChildRemoved)