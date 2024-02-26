print("^2Jim^7-^2JobGarage ^7v^41^7.^44^7.^43 ^7- ^2Job Garage Script by ^1Jimathy^7")

Loc = {}

--[[	LIST OF POSSIBLE VEHICLE MODIFIERS   ]]--
-- Using these will change how each vehicle spawns
-- This can be used for making sure the vehicles comes out exactly how you want it to

-- CustomName = "Police Car", this will show a custom override name for your vehicles so you don't need to add them to your vehicles.lua
-- rank = { 2, 4 }, -- This specifes which grades can see it, and only these grades
-- grade = 4, -- This specifies the lowest grade and above that can see the vehicle
-- colors = { 136, 137 }, -- This is the colour index id of the vehicle, Primary and Secondary in that order
-- bulletproof = true, -- This determines if the tyres are bullet proof (don't ask me why, I was asked to add this)
-- livery = 1, -- This sets the livery id of the vehicle, (most mod menus would number them or have them in number order) 0 = stock
-- extras = { 1, 5 }, -- This enables the selected extras on the vehicle
-- performance = "max", this sets the stats to max if available
-- performance = { 2, 3, 3, 2, 4, true }, -- This allows more specific settings for each upgrade level, in order: engine, brakes, suspension, transmission, armour, turbo
-- trunkItems = { }, -- Use this to add items to the trunk of the vehicle when it is spawned

-- ANY VEHICLE, BOATS, POLICE CARS, EMS VEHICLES OR EVEN PLANES CAN BE ADDED.

Config = {
	Debug = false,  -- Enable to use debug features
	Lan = "en",

	Core = "qb-core",
	Menu = "qb",
	Notify = "qb",

	Fuel = "LegacyFuel", -- Set this to your fuel script folder

	CarDespawn = true, -- Sends the vehicle to hell (removal animation)

	DistCheck = false, -- Require the vehicle to be near by to remove it

	Locations = {
		{ 	zoneEnable = true,
			job = "mechanic",
			garage = {
				spawn = vector4(-185.25, -1291.05, 31.3, 177.84),  -- Where the car will spawn
				out = vec4(-177.1, -1282.25, 31.3, 179.01),	-- Where the parking stand is
				list = {
					["cheburek"] = {
						colors = { 136, 137 },
						grade = 4,
						livery = 5,
						bulletproof = true,
						extras = { 1, 4 },
					},
					["f450c"] = { },
					["f550rbc"] = { },
				},
			},
		},
		{ 	zoneEnable = true,
			job = "burgershot",
			garage = {
				spawn = vector4(-1169.49, -897.87, 13.88, 28.5),  -- Where the car will spawn
				out = vector4(-1165.6, -899.11, 14.08, 30.36),	-- Where the parking stand is
				list = {
					["faggio"] = {},
				},
			},
		},
		{ 	zoneEnable = true,
		job = "uwu",
		garage = {
				spawn = vector4(-560.47, -1103.02, 22.18, 178.72),  -- Where the car will spawn
				out = vector4(-555.47, -1099.52, 22.13, 91.56),	-- Where the parking stand is
				list = {
					["primo"] = {
						colors = { 49 },
					},
				},
			},
		},
		{ 	zoneEnable = true,
			job = "ambulance",
			garage = {
				spawn = vector4(317.25, -573.78, 28.8, 252.57),
				out = vector4(317.93, -582.11, 28.8, 347.77),
				list = {
					["Ambulance_Dodge_RAM"] = {
						CustomName = "Ambulance Dodge RAM"
					},
					["ambulance1"] = {
						CustomName = "Ambulance Mercedes"
					},
					["amrvan"] = {
						CustomName = "Ambulance Van"
					},
				},
			},
		},
	},
}
