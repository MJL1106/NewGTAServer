Config = {}
Config.DiscordLogs = true -- Set webhook in server.lua Line 1

Config.VehicleDisplays = { --Simple vehicle spawner that allows you to display cars that are on sale in your webstore
	{
		blips = {
			enabled = false,
			pos = vector3(44.5147, -873.9191, 28.7612),
			sprite = 272,
			color = 2,
			scale = 0.85,
			shortRange = true,
			name = "Paid Vehicle Displays",
		},
		vehicles = {
			{model = "zentorno", pos = vector4(44.5147, -873.9191, 29.7612, 350.9439)}
		}
	},
}

Config.Packages = {
	["Tier 1 Coin"] = { -- Exact package name from tebex
		Items = {
			{
				name = "tier1", -- Item or account name depending on type specified below
				amount = 1, -- Amount of item or money
				type = "item" -- Four types: account, item, or weapon and car
			},
		},
	},
	
	["Tier 2 Coin"] = { -- Exact package name from tebex
		Items = {
			{
				name = "tier2", -- Item or account name depending on type specified below
				amount = 1, -- Amount of item or money
				type = "item" -- Four types: account, item, or weapon and car
			},
		},
	},
	["Tier 3 Coin"] = { -- Exact package name from tebex
		Items = {
			{
				name = "tier3", -- Item or account name depending on type specified below
				amount = 1, -- Amount of item or money
				type = "item" -- Four types: account, item, or weapon and car
			},
		},
	},
	["Tier 4 Coin"] = { -- Exact package name from tebex
		Items = {
			{
				name = "tier4", -- Item or account name depending on type specified below
				amount = 1, -- Amount of item or money
				type = "item" -- Four types: account, item, or weapon and car
			},
		},
	},
	["Fresh Car"] = { -- Exact package name from tebex
		Items = {
			{
				name = "freshcar", -- Item or account name depending on type specified below
				amount = 1, -- Amount of item or money
				type = "item" -- Four types: account, item, or weapon and car
			},
		},
	},
	["Business Coin"] = { -- Exact package name from tebex
		Items = {
			{
				name = "businesscoin", -- Item or account name depending on type specified below
				amount = 1, -- Amount of item or money
				type = "item" -- Four types: account, item, or weapon and car
			},
		},
	},
	["Ottos Coin"] = { -- Exact package name from tebex
		Items = {
			{
				name = "ottoscoin", -- Item or account name depending on type specified below
				amount = 1, -- Amount of item or money
				type = "item" -- Four types: account, item, or weapon and car
			},
		},
	},
	["White Widow Coin"] = { -- Exact package name from tebex
		Items = {
			{
				name = "whitewidowcoin", -- Item or account name depending on type specified below
				amount = 1, -- Amount of item or money
				type = "item" -- Four types: account, item, or weapon and car
			},
		},
	},
}