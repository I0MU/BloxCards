



local tweenService: TweenService = game:GetService("TweenService")
local buildingPart = script.Parent.Objects.BuildingPart
local cameraPart = script.Parent.CameraPart
local u4: boolean = false
local t1: {[any]: any} = {}

return {
	OnAddedParticles = function(_, _)
	end,
	ResetBattleBack = function()
		u4 = false

		for _, v in pairs(t1) do
			v:Cancel()
			v:Destroy()
		end
	end,
	StartBattleBack = function()
		u4 = true

		local function movePart(p3, p4, p5)
			local tweenInfo = TweenInfo.new(p5, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0)
			local v15: Tween = tweenService:Create(p3, tweenInfo, { Position = p4 })

			t1[p3.Name] = v15
			v15:Play()
			v15.Completed:Connect(function()
				p3:Destroy()
			end)
		end

		task.spawn(function()
			while u4 do
				local function movePart(p6, p7, p8)
					local tweenInfo = TweenInfo.new(p8, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0)
					local v38: Tween = tweenService:Create(p6, tweenInfo, { Position = p7 })

					v38:Play()
					v38.Completed:Connect(function()
						p6:Destroy()
					end)
				end

				local cameraPartPosition = cameraPart.Position
				local t2: {[any]: any} = {}
				local t3: {[any]: any} = {}

				while u4 do
					for i = -13, 13 do
						table.insert(t2, i)
					end

					for _ = 1, 5 do
						local randomNumber = math.random(#t2)
						local v23 = table.remove(t2, randomNumber)
						local n1 = cameraPartPosition.X + v23 * 6 + 80
						local n2 = cameraPartPosition.Y + 110
						local n3 = cameraPartPosition.Z + v23 * 6 - 80
						local vector3 = Vector3.new(n1, n2, n3)
						local text: string = tostring(vector3)

						if not t3[text] then
							local clone = buildingPart:Clone()

							clone.Parent = game.Workspace.Battleback

							local randomNumber2 = math.random()

							clone.Size = Vector3.new(6, 9 * (randomNumber2 * 2 + 2), 6)

							local randomNumber3 = math.random(1, 3)

							if randomNumber3 == 1 then
								clone.Color = Color3.new(1, 0.4, 0.8)
							elseif randomNumber3 == 2 then
								clone.Color = Color3.new(0.6666666666666666, 0, 0.6666666666666666)
							elseif randomNumber3 == 3 then
								clone.Color = Color3.new(0.8313725490196079, 0.5647058823529412, 0.7411764705882353)
							end

							local vector32 = Vector3.new(0, clone.Size.Y / 2, 0)
							local v33 = clone.CFrame:VectorToWorldSpace(vector32)

							clone.Position = Vector3.new(n1, n2, n3) + v33
							t3[text] = true
							movePart(clone, clone.Position + Vector3.new(-57.5, -161, 57.5), 38.333333333333336)
						end
					end

					task.wait(2)
					t3 = {}
				end
			end
		end)
	end
}
