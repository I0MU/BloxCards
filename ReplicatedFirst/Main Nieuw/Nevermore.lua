




require(script.Parent.FakeMouse)
require(script.Parent.FakeTopBar)

local LocalPlayer = game.Players.LocalPlayer

LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("VisGui")

local uDim2New = UDim2.new

LocalPlayer:GetMouse()

local replicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")

game:GetService("Players")

local loadLibrary = require(replicatedStorage:WaitForChild("NevermoreEngine")).LoadLibrary

loadLibrary("qSystems")

local v5 = loadLibrary("PaperRipple")
local v6 = loadLibrary("ScrollingFrame")
local v7 = loadLibrary("os")

print("Finished loading " .. script.Name)

return { PaperRipple = v5, ScrollingFrame = v6, os = v7 }
