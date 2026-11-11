



local color3 = Color3.fromRGB(255, 241, 171)
local color32 = Color3.fromRGB(0, 0, 0)

return {
	Default = {},
	Act1 = {
		Brightness = 3,
		EnvironmentSpecularScale = 0,
		ShadowSoftness = 0,
		ExposureCompensation = -0.75,
		TimeOfDay = "14:42:00",
		Ambient = color3
	},
	Midnight = {
		Brightness = 0,
		EnvironmentSpecularScale = 0,
		ShadowSoftness = 0,
		ExposureCompensation = -0.75,
		TimeOfDay = "0:00:00",
		Ambient = color32
	}
}
