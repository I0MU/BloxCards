



local replicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")
local promise = require(replicatedStorage.Promise)
local animation = require(replicatedStorage.Animation)
local allFaceAssets = require(script.AllFaceAssets)
local scriptPhysicalFace = script.PhysicalFace
local LocalPlayer = game.Players.LocalPlayer

local function GetFaceAsset(p1)
	if not allFaceAssets[p1] then
		warn("No face asset: " .. p1)
	end

	return allFaceAssets[p1]
end

local u8 = nil

return {
	CreateFace = function(parent, p3, p4)
		local head = parent:FindFirstChild("Head")

		if not head then
			warn("No head")

			return
		end

		local faceFrontAttachment = head:FindFirstChild("FaceFrontAttachment")

		if not faceFrontAttachment then
			warn("No face attach")

			return
		end

		local clone = scriptPhysicalFace:Clone()

		clone.RestingEyes.Changed:Connect(function(p5)
			for iterFirst, iterSecond in clone.FaceGui.Frame.Eyes:GetChildren() do
				if iterSecond.ImageTransparency == 0 then
					iterSecond.ImageTransparency = 0.999

					break
				end
			end

			clone.FaceGui.Frame.Eyes[p5].ImageTransparency = 0
		end)
		clone.RestingMouth.Changed:Connect(function(p6)
			for iterFirst, iterSecond in clone.FaceGui.Frame.Mouth:GetChildren() do
				if iterSecond.ImageTransparency == 0 then
					iterSecond.ImageTransparency = 0.999

					break
				end
			end

			clone.FaceGui.Frame.Mouth[p6].ImageTransparency = 0
		end)

		for _, v in pairs(p3) do
			local imageLabel: ImageLabel = Instance.new("ImageLabel")

			imageLabel.BackgroundTransparency = 1
			imageLabel.Size = UDim2.fromScale(1, 1)

			if not allFaceAssets[v] then
				warn("No face asset: " .. v)
			end

			imageLabel.Image = allFaceAssets[v]
			imageLabel.Visible = true
			imageLabel.ImageTransparency = 0.999
			imageLabel.Name = v
			imageLabel.Parent = clone.FaceGui.Frame.Eyes
		end

		for _, v in pairs(p4) do
			local imageLabel2: ImageLabel = Instance.new("ImageLabel")

			imageLabel2.BackgroundTransparency = 1
			imageLabel2.Size = UDim2.fromScale(1, 1)

			if not allFaceAssets[v] then
				warn("No face asset: " .. v)
			end

			imageLabel2.Image = allFaceAssets[v]
			imageLabel2.Visible = true
			imageLabel2.ImageTransparency = 0.999
			imageLabel2.Name = v
			imageLabel2.Parent = clone.FaceGui.Frame.Mouth
		end

		clone.Parent = parent
		clone.RigidConstraint.Attachment0 = faceFrontAttachment
		clone.RigidConstraint.Attachment1 = clone.Attachment

		return clone
	end,
	ChangeEyes = function(p7, value)
		local physicalFace = p7:FindFirstChild("PhysicalFace")

		if not physicalFace then
			warn("No face")

			return
		end

		physicalFace.RestingEyes.Value = value

		for iterFirst, iterSecond in physicalFace.FaceGui.Frame.Eyes:GetChildren() do
			if iterSecond.ImageTransparency == 0 then
				iterSecond.ImageTransparency = 0.999

				break
			end
		end

		physicalFace.FaceGui.Frame.Eyes[value].ImageTransparency = 0
	end,
	ChangeMouth = function(p9, value)
		local physicalFace = p9:FindFirstChild("PhysicalFace")

		if not physicalFace then
			warn("No face")

			return
		end

		physicalFace.RestingMouth.Value = value

		for iterFirst, iterSecond in physicalFace.FaceGui.Frame.Mouth:GetChildren() do
			if iterSecond.ImageTransparency == 0 then
				iterSecond.ImageTransparency = 0.999

				break
			end
		end

		physicalFace.FaceGui.Frame.Mouth[value].ImageTransparency = 0
	end,
	BlinkFace = function(p11, p12, p13)
		local physicalFace = p11:FindFirstChild("PhysicalFace")

		if not physicalFace then
			warn("No face")

			return
		end

		local EyesPosition = physicalFace.FaceGui.Frame.Eyes.Position
		local MouthPosition = physicalFace.FaceGui.Frame.Mouth.Position

		if u8 then
			u8:cancel()
		end

		for iterFirst, iterSecond in physicalFace.FaceGui.Frame.Eyes:GetChildren() do
			if iterSecond.ImageTransparency == 0 then
				iterSecond.ImageTransparency = 0.999

				break
			end
		end

		physicalFace.FaceGui.Frame.Eyes.eye_closed.ImageTransparency = 0
		u8 = promise.new(function()
			local animationAnimateAsync = animation.AnimateAsync
			local eyes = physicalFace.FaceGui.Frame.Eyes
			local v48 = physicalFace.FaceGui.Frame.Eyes.Position
			local v49 = UDim2.fromScale(0, 0.05)

			animationAnimateAsync(eyes, { Position = v48 + v49 }, 0.1, "In", "Quint")

			local animationAnimate = animation.Animate
			local mouth = physicalFace.FaceGui.Frame.Mouth

			v48 = physicalFace.FaceGui.Frame.Mouth.Position
			v49 = UDim2.fromScale(0, 0.05)
			animationAnimate(mouth, { Position = v48 - v49 }, 0.1, "In", "Quint")

			if p12 then
				physicalFace.RestingEyes.Value = p12
			end

			for iterFirst, iterSecond in physicalFace.FaceGui.Frame.Eyes:GetChildren() do
				if iterSecond.ImageTransparency == 0 then
					iterSecond.ImageTransparency = 0.999

					break
				end
			end

			physicalFace.FaceGui.Frame.Eyes[physicalFace.RestingEyes.Value].ImageTransparency = 0

			if p13 then
				physicalFace.RestingMouth.Value = p13
			end

			animation.AnimateAsync(physicalFace.FaceGui.Frame.Eyes, { Position = EyesPosition }, 0.3, "Out", "Quint")
			animation.Animate(physicalFace.FaceGui.Frame.Mouth, { Position = MouthPosition }, 0.3, "Out", "Quint")
		end):finally(function()
			if not physicalFace or not physicalFace.Parent then
				return
			end

			physicalFace.FaceGui.Frame.Eyes.Position = EyesPosition
			physicalFace.FaceGui.Frame.Mouth.Position = MouthPosition
			u8 = nil
		end)
	end
}
