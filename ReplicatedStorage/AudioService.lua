



local LocalPlayer = game.Players.LocalPlayer
local devSong = game.ReplicatedStorage:FindFirstChild("DevSong")
local audio = game.ReplicatedStorage.Audio
local allSongs = require(audio.AllSongs)
local audioEffects = audio.Effects
local animation = require(game.ReplicatedStorage.Animation)
local currentsong = nil
local u8: boolean = true
local s1 = "Lobby"
local userInputService: UserInputService = game:GetService("UserInputService")

local function FindFXIdName(p2)
	if p2 == nil then
		return
	end

	if type(p2) == "number" then
		return "rbxassetid://" .. p2
	end

	local foundChild = audioEffects:FindFirstChild(p2, true)

	if not foundChild then
		local text: string = tostring(p2)

		warn("[AudioService] SFX not found:", text)

		return FindFXIdName(nil)
	end

	if foundChild:IsA("Folder") then
		local children = foundChild:GetChildren()
		local randomNumber = math.random(#children)
		local v27 = children[randomNumber]

		if not v27.SoundId or v27.SoundId == "" then
			warn("[AudioService] SFX missing:", v27:GetFullName())
		end

		return v27.SoundId, v27.Name, v27
	end

	if foundChild:IsA("Sound") then
		if not foundChild.SoundId or foundChild.SoundId == "" then
			warn("[AudioService] SFX missing SoundId:", foundChild:GetFullName())
		end

		return foundChild.SoundId, foundChild.Name, foundChild
	end
end
local function FindSongIdName(p3)
	if p3 == nil then
		return "rbxassetid://"
	end

	if type(p3) == "number" then
		return "rbxassetid://" .. p3
	end

	local v29 = allSongs[p3]

	if not v29 then
		for _, v in pairs(allSongs) do
			for _, iterValue in pairs(v) do
				if p3 == iterValue.Name then
					return iterValue.SoundId, iterValue.Name
				end
			end
		end

		return FindSongIdName("Lobby")
	end

	local randomNumber = math.random(#v29)
	local v35 = v29[randomNumber]

	return v35.SoundId, v35.Name
end

local sound: Sound = Instance.new("Sound", LocalPlayer)

local module: {[any]: any} = {
	ToggleMusicEnabled = function()
		u8 = not u8

		return u8
	end,
	SetLobbyTheme = function(p1)
		s1 = p1
	end
}

local function changeSong(p4, p5)
	if devSong and devSong.Enabled.Value then
		p4 = devSong.Value
	end

	if p4 == "Lobby" then
		p4 = s1
	end

	local soundId, v40 = FindSongIdName(p4)

	if not soundId or soundId == "rbxassetid://" then
		local text: string = tostring(p4)
		local text2: string = tostring(v40)

		warn("[AudioService] Song missing asset ID:", text, "resolvedName:", text2)
	end

	local v43 = p5 and p5.Steps or 30
	local sound2: Sound = Instance.new("Sound", LocalPlayer)

	sound2.Name = v40 or "Silence"
	sound2.Looped = true
	sound2.SoundId = soundId
	sound2.TimePosition = (not p5 or not p5.TimePosition) and sound.TimePosition or p5.TimePosition
	sound2.Volume = 0

	if p5 and p5.PlaybackSpeed then
		sound2.PlaybackSpeed = p5.PlaybackSpeed or 1
	end

	sound2.SoundGroup = game:GetService("SoundService").MusicGroup
	sound2:Play()

	if p4 and p4 ~= module.currentsong then
		currentsong = module.currentsong
	end

	module.currentsong = p4 or "Silence"

	local n1 = 0.5

	if p5 and p5.Volume then
		n1 = p5.Volume
	end

	if p5 and p5.SkipFade then
		sound2.Volume = n1
		sound.Volume = 0
	else
		local n2 = v43 * 4 / 60

		animation.AnimateAsync(sound2, { Volume = n1 }, n2, "Out", "Quad")
		animation.Animate(sound, { Volume = 0 }, n2 / 1.3, "In", "Quad")
	end

	sound:Destroy()
	sound = sound2

	if p4 == "Battle" then
		sound.DidLoop:connect(function(_, p7)
			if module.currentsong == "Battle" and p7 == 3 then
				changeSong("Battle", p5)
			end
		end)
	end

	if p4 == "DeckBuilder" then
		sound.DidLoop:connect(function(_, p9)
			if module.currentsong == "DeckBuilder" and p9 == 3 then
				changeSong("DeckBuilder", p5)
			end
		end)
	end

	print("Changed song to", v40, "(" .. (module.currentsong or "Silence") .. ")")
end

module.ChangeSong = changeSong

function module.MuteSongs(p10)
	if p10 == true then
		game:GetService("SoundService").MusicGroup.Volume = 0
	elseif p10 == false then
		game:GetService("SoundService").MusicGroup.Volume = 0.5
	end
end

local n1 = 0.5

function module.DimSongs(p11)
	if game:GetService("RunService"):IsServer() then
		return
	end

	if game:GetService("SoundService").MusicGroup.Volume == 0 then
		return
	end

	n1 = game:GetService("SoundService").MusicGroup.Volume

	local animationAnimateAsync = animation.AnimateAsync
	local soundService: SoundService = game:GetService("SoundService")

	animationAnimateAsync(soundService.MusicGroup, { Volume = p11 or 0.01 }, 0.5, "Out", "Quint")
end
function module.UndimSongs()
	if game:GetService("RunService"):IsServer() then
		return
	end

	if game:GetService("SoundService").MusicGroup.Volume == 0 then
		return
	end

	local animationAnimateAsync = animation.AnimateAsync
	local soundService: SoundService = game:GetService("SoundService")

	animationAnimateAsync(soundService.MusicGroup, { Volume = n1 or 0.5 }, 0.5, "Out", "Quint")
end
function module.PlaySound(p12, p13)
	if game:GetService("RunService"):IsServer() then
		return
	end

	if not p12 then
		return
	end

	local v55 = nil
	local v56

	if type(p12) == "string" then
		local v57, v58, v59 = FindFXIdName(p12)

		v56 = v57
		p12 = v58
		v55 = v59

		if not p12 then
			return
		end
	else
		v56 = "rbxassetid://" .. p12
	end

	if not v56 or v56 == "" then
		local text: string = tostring(p12)

		warn("[AudioService] PlaySound missing:", text)
	end

	local volume = p13 and p13.Volume or v55 and v55.Volume or 1
	local playbackSpeed = p13 and p13.PlaybackSpeed or v55 and v55.PlaybackSpeed or 1
	local sound3: Sound = Instance.new("Sound", LocalPlayer)

	sound3.Name = p12
	sound3.Looped = false
	sound3.SoundId = v56
	sound3.SoundGroup = game:GetService("SoundService").VolumeGroup
	sound3.Volume = volume
	sound3.PlaybackSpeed = playbackSpeed

	local v64 = sound3.TimeLength

	if v64 == 0 and v55 then
		v64 = v55.TimeLength
	end

	if v55 and #v55:GetChildren() > 0 then
		for _, v in pairs(v55:GetChildren()) do
			local clone = v:Clone()

			clone.Parent = sound3
		end
	end

	if p13 then
		for k, v in pairs(p13) do
			sound3[k] = v
		end
	end

	sound3:Play()
	task.delay(1, function()
		if sound3 and not sound3.IsLoaded then
			warn("[AudioService] Sound failed to load (moderated or bad id):", sound3.Name, sound3.SoundId)
		end
	end)
	game.Debris:AddItem(sound3, v64 + 3)
end
function module.StopSound(p14)
	if LocalPlayer:FindFirstChild(p14) then
		LocalPlayer:FindFirstChild(p14):Stop()

		return
	end

	warn("[AudioService] Cannot find sound:", p14)
end
function Revert()
	if currentsong then
		changeSong(currentsong)
		userInputService.ModalEnabled = false
	end
end

module.Revert = Revert

local CurrentCamera: Camera = workspace.CurrentCamera
local utils = require(game.ReplicatedStorage.Utils)
local utilsClamp = utils.Clamp
local utilsLerp = utils.Lerp
local water: Sound = Instance.new("Sound", LocalPlayer)

water.Name = "Water"
water.Looped = true
water.SoundId = "rbxassetid://9084169187"
water.Volume = 0
water:Play()
CurrentCamera.Changed:connect(function()
	local absoluteValue = math.abs(70 - CurrentCamera.CFrame.p.Y)
	local v72 = utilsClamp(10, 60, absoluteValue)

	v72 = utilsClamp(0, 1, 1 - (v72 - 10) * 1 / 50)

	if CurrentCamera.CFrame.p.Y < 150 then
		v72 = 0
	end

	water.Volume = utilsLerp(water.Volume, v72, 0.1)
end)

return module
