Config = Config or {}

-- Side of the screen where you want the ui to be on. Can either be "left" or "right"
Config.Side = "right"

Config.MaxJobs = 20
Config.IgnoredJobs = {
	["unemployed"] = true,
}

Config.DenyDuty = {
	["ambulance"] = false,
	["police"] = false,
	["mechanic"] = true,
	["tuners"] = true,
	["lsc"] = true,
	["burgershot"] = true,
	["uwu"] = true,
	["weedshop"] = true,
	["carsales"] = true,
}

Config.WhitelistJobs = {
	["police"] = true,
	["ambulance"] = true,
	["mechanic"] = true,
	["lsc"] = true,
	["burgershot"] = true,
	["tuners"] = true,
	["uwu"] = true,
	["judge"] = true,
	["lawyer"] = true,
	["carsales"] = true,
	["weedshop"] = true,
}

Config.Descriptions = {
	["police"] = "Shoot some criminals or maybe be a good cop and arrest them",
	["ambulance"] = "Fix the bullet holes",
	["mechanic"] = "Fix the bullet holes",
	["lsc"] = "Fix the bullet holes",
	["tow"] = "Pickup the tow truck and steal some vehicles",
	["taxi"] = "Pickup people around the city and drive them to their destination",
	["bus"] = "Pickup multiple people around the city and drive them to their destination",
	["realestate"] = "Sell houses or something",
	["cardealer"] = "Sell cars or something",
	["judge"] = "Decide if people are guilty",
	["lawyer"] = "Help the good or the bad",
	["reporter"] = "Lowkey useless",
	["trucker"] = "Drive a truck",
	["garbage"] = "Drive a garbage truck",
	["vineyard"] = "Get them vines",
	["hotdog"] = "Sell them glizzys",
	["uwu"] = "Uwuuuu",
	["tuners"] = "Fix them cars",
	["burgershot"] = "Flip my burger",
	["electrical"] = "Fix them poles",
	["carsales"] = "Car resales",
	["weedshop"] = "Sell that zaza",
}

-- Change the icons to any free font awesome icon, also add other jobs your server might have to the list
-- List: https://fontawesome.com/search?o=r&s=solid
Config.FontAwesomeIcons = {
	["police"] = "fa-solid fa-handcuffs",
	["ambulance"] = "fa-solid fa-user-doctor",
	["mechanic"] = "fa-solid fa-wrench",
	["lsc"] = "fa-solid fa-wrench",
	["tow"] = "fa-solid fa-truck-tow",
	["taxi"] = "fa-solid fa-taxi",
	["bus"] = "fa-solid fa-bus",
	["realestate"] = "fa-solid fa-sign-hanging",
	["cardealer"] = "fa-solid fa-cards",
	["judge"] = "fa-solid fa-gave",
	["lawyer"] = "fa-solid fa-gavel",
	["reporter"] = "fa-solid fa-microphone",
	["trucker"] = "fa-solid fa-truck-front",
	["garbage"] = "fa-solid fa-trash-can",
	["vineyard"] = "fa-solid fa-wine-bottle",
	["hotdog"] = "fa-solid fa-hotdog",
	["electrical"] = "fa-solid fa-bolt",
	["tuners"] = "fa-solid fa-wrench",
	["uwu"] = "fa-solid fa-cookie",
	["burgershot"] = "fa-solid fa-hotdog",
	["carsales"] = "fa-solid fa-cards",
	["weedshop"] = "fa-solid fa-pagelines",
}
