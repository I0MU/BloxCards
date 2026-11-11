

-- Original SourceAssetId: https://assetdelivery.roblox.com/v1/asset/?id=65574227

-- ! Source from the asset above; the game may have edited it since.

timer = 0
debounce = false

function SeatWeldAdded() 
if debounce == true then return end
debounce = true

g=script.Parent:GetChildren() 
for i=1,#g do 
if g[i].className == "Seat" then 
g[i].Reflectance = 0
end 
end 

wait(4)

engine = script.Parent.Engine
clone = script.Parent:clone()
script.Parent.Parent.Rail.Velocity = script.Parent.Parent.Piece.CFrame.lookVector * 10
script.Parent.Parent.Piece.Velocity = script.Parent.Parent.Piece.CFrame.lookVector * 10


g = script.Parent:GetChildren()
for i=1,#g do
if g[i].className ~= "Script" then
g[i].Anchored = false
end
end

script.Parent.Engine.Velocity = script.Parent.Parent.Piece.CFrame.lookVector * 10
--[[while true do
wait(1)
timer = timer + 1
if timer > 10 and script.Parent.Parent.CarValue.Value < 1 then break
end
end
script.Parent.Parent.Rail.Velocity = Vector3.new(0,0,0)
clone.Parent = script.Parent.Parent
clone:makeJoints()]]--
end



g=script.Parent:GetChildren() 
for i=1,#g do 
if g[i].className == "Seat" then 
connection = g[i].ChildAdded:connect(SeatWeldAdded) 
end 
end 
