Config = {}

Config.Invincible = true -- Is the ped going to be invincible?
Config.Frozen = true -- Is the ped frozen in place?
Config.Stoic = true -- Will the ped react to events around them?
Config.FadeIn = true -- Will the ped fade in and out based on the distance. (Looks a lot better.)
Config.DistanceSpawn = 20.0 -- Distance before spawning/despawning the ped. (GTA Units.)

Config.MinusOne = true -- Leave this enabled if your coordinates grabber does not -1 from the player coords.

Config.GenderNumbers = { -- No reason to touch these.
	['male'] = 4,
	['female'] = 5
}

Config.PedList = {
	-- AIRLINES
	{
		model = `a_m_y_business_02`,
		coords = vector4(110.97, -1090.61, 29.3, 23.99),
		gender = 'male'
	},
	{
		model = `ig_pilot`,
		coords = vector4(1725.6, 3300.79, 41.22, 277.31),
		gender = 'male'
	}
}
