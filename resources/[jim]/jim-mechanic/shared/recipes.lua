Crafting = {
	Nos = {
		Header = Loc[Config.Lan]["crafting"].toolheader,
		Anims = { animDict = "mini@repair", anim = "fixing_a_ped",},
		Recipes = {
			{ ["nos"] = { ["noscan"] = 1, },
				["amount"] = 1, ["job"] = {			
					["tuners"] = 2,	}
			},
			{ ["noscan"] = { ["steel"] = 1, },
				["amount"] = 1, ["job"] = {			
					["tuners"] = 2,	}
			},
			{ ["noscolour"] = { ["plastic"] = 1, },
				["amount"] = 1, ["job"] = {			
					["tuners"] = 2,	}
			},
			{ ["racingtablet"] = { ["plastic"] = 1, },
			["amount"] = 1,["job"] = {			
			["tuners"] = 4,	}
			},
		}
	},
	Repairs = {
		Header = Loc[Config.Lan]["crafting"].repairheader,
		Anims = { animDict = "mini@repair", anim = "fixing_a_ped",},
		Recipes = {
			{ ["mechanic_tools"] = { ["iron"] = 1, },
				["amount"] = 1,
			},
			{ ["ducttape"] = { ["plastic"] = 1, },
				["amount"] = 1,
			},
			{ ["newoil"] = { ["plastic"] = 1, },
				["amount"] = 1,
			},
			{ ["sparkplugs"] = { ["metalscrap"] = 1, },
				["amount"] = 1,
			},
			{ ["carbattery"] = { ["metalscrap"] = 1, ["plastic"] = 1 },
				["amount"] = 1,
			},
			{ ["axleparts"] = { ["steel"] = 1, },
				["amount"] = 1,
			},
			{ ["sparetire"] = { ["rubber"] = 1, },
				["amount"] = 1,
			},
		},
	},
	Tools = {
		Header = Loc[Config.Lan]["crafting"].toolheader,
		Anims = { animDict = "mini@repair", anim = "fixing_a_ped",},
		Recipes = {
			{ ["toolbox"] = {
				["iron"] = 3,
				["steel"] = 1,
				["plastic"] = 1,
			},
				["amount"] = 1,
			},
			{ ["paintcan"] = { ["aluminum"] = 1, },
				["amount"] = 1,
			},

			{ ["tint_supplies"] = { ["iron"] = 1, },
				["amount"] = 1,
			},
			{ ["underglow_controller"] = { ["iron"] = 1, },
				["amount"] = 1,
			},
			{ ["cleaningkit"] = { ["rubber"] = 1, },
				["amount"] = 1,
			},
			{ ["advancedrepairkit"] = { ["iron"] = 10, ["steel"] = 5, },
			["amount"] = 1, ["job"] = {			
				["tuners"] = 3,["mechanic"] = 3,["lsc"] = 3,	}
			},
			{ ["racekit"] = { ["iron"] = 3,["steel"] = 1, },
			["amount"] = 1, ["job"] = {			
				["tuners"] = 4,	}
			},
			{ ["lockpick"] = { ["aluminum"] = 5, },
			["amount"] = 1,["job"] = {			
				["tuners"] = 3, ["mechanic"] = 3,["lsc"] = 3,}
			},
			{ ["advancedlockpick"] = { ["steel"] = 6, },
			["amount"] = 1,["job"] = {			
				["tuners"] = 3,["mechanic"] = 3, ["lsc"] = 3,}
			},
		},
	},
	Perform = {
		Header = Loc[Config.Lan]["crafting"].performheader,
		Anims = { animDict = "mini@repair", anim = "fixing_a_ped",},
		Recipes = {
			{ ["turbo"] = { ["steel"] = 15, ["metalscrap"] = 12,},
				["amount"] = 1,
			},
			{ ["car_armor"] = { ["plastic"] = 18, },
				["amount"] = 1,
			},
			{ ["engine1"] = { ["steel"] = 4, },
				["amount"] = 1,
			},
			{ ["engine2"] = { ["steel"] = 9, },
				["amount"] = 1,
			},
			{ ["engine3"] = { ["steel"] = 13, ["metalscrap"] = 6,},
				["amount"] = 1,
			},
			{ ["engine4"] = { ["steel"] = 16, ["metalscrap"] = 15, },
				["amount"] = 1,
			},
			{ ["engine5"] = { ["steel"] = 25, ["metalscrap"] = 20,},
				["amount"] = 1,
			},
			{ ["transmission1"] = { ["steel"] = 5, },
				["amount"] = 1,
			},
			{ ["transmission2"] = { ["steel"] = 10, },
				["amount"] = 1,
			},
			{ ["transmission3"] = { ["steel"] = 18, ["metalscrap"] = 8, },
				["amount"] = 1,
			},
			{ ["transmission4"] = { ["steel"] = 25, ["metalscrap"] = 15,},
				["amount"] = 1,
			},
			{ ["brakes1"] = { ["steel"] = 4, ["metalscrap"] = 4, },
				["amount"] = 1,
			},
			{ ["brakes2"] = { ["steel"] = 7, ["metalscrap"] = 8,},
				["amount"] = 1,
			},
			{ ["brakes3"] = { ["steel"] = 14, ["metalscrap"] = 10,},
				["amount"] = 1,
			},
			{ ["suspension1"] = { ["steel"] = 4, },
				["amount"] = 1,
			},
			{ ["suspension2"] = { ["steel"] = 10, },
				["amount"] = 1,
			},
			{ ["suspension3"] = { ["steel"] = 16, },
				["amount"] = 1,
			},
			{ ["suspension4"] = { ["steel"] = 25, ["metalscrap"] = 12, },
				["amount"] = 1,
			},
			{ ["suspension5"] = { ["steel"] = 35, ["metalscrap"] = 19,},
				["amount"] = 1,
			},
			{ ["bprooftires"] = { ["rubber"] = 20, },
				["amount"] = 1,
			},
			{ ["drifttires"] = { ["rubber"] = 20, },
				["amount"] = 1,
			},

			{ ["oilp1"] = { ["steel"] = 8, },
				["amount"] = 1,
			},
			{ ["oilp2"] = { ["steel"] = 15, },
				["amount"] = 1,
			},
			{ ["oilp3"] = { ["steel"] = 22, },
				["amount"] = 1,
			},
			{ ["drives1"] = { ["steel"] = 3, },
				["amount"] = 1,
			},
			{ ["drives2"] = { ["steel"] = 6, },
				["amount"] = 1,
			},
			{ ["drives3"] = { ["steel"] = 10, },
				["amount"] = 1,
			},
			{ ["cylind1"] = { ["steel"] = 4, },
				["amount"] = 1,
			},
			{ ["cylind2"] = { ["steel"] = 8, },
				["amount"] = 1,
			},
			{ ["cylind3"] = { ["steel"] = 12, },
				["amount"] = 1,
			},
			{ ["cables1"] = { ["steel"] = 5, },
				["amount"] = 1,
			},
			{ ["cables2"] = { ["steel"] = 10, },
				["amount"] = 1,
			},
			{ ["cables3"] = { ["steel"] = 13, },
				["amount"] = 1,
			},
			{ ["fueltank1"] = { ["plastic"] = 4, },
				["amount"] = 1,
			},
			{ ["fueltank2"] = { ["plastic"] = 9, },
				["amount"] = 1,
			},
			{ ["fueltank3"] = { ["plastic"] = 12, },
				["amount"] = 1,
			},

			{ ["harness"] = { ["steel"] = 10, ["plastic"] = 5, },
				["amount"] = 1, ["job"] = {["lsc"] = 3,}
			},
			{ ["antilag"] = { ["steel"] = 6, ["plastic"] = 6,},
				["amount"] = 1,
			},

			{ ["manual"] = { ["steel"] = 3, },
				["amount"] = 1,
			},
		},
	},
	Cosmetic = {
		Header = Loc[Config.Lan]["crafting"].cosmetheader,
		Anims = { animDict = "mini@repair", anim = "fixing_a_ped",},
		Recipes = {
			{ ["hood"] = { ["plastic"] = 50, },
				["amount"] = 1,
			},
			{ ["roof"] = { ["plastic"] = 48, },
				["amount"] = 1,
			},
			{ ["spoiler"] = { ["plastic"] = 58, },
				["amount"] = 1,
			},
			{ ["bumper"] = { ["plastic"] = 45, },
				["amount"] = 1,
			},
			{ ["skirts"] = { ["plastic"] = 39, },
				["amount"] = 1,
			},
			{ ["exhaust"] = { ["iron"] = 43, },
				["amount"] = 1,
			},
			{ ["seat"] = { ["plastic"] = 56, },
				["amount"] = 1,
			},
			{ ["livery"] = { ["plastic"] = 49 },
				["amount"] = 1,
			},
			{ ["tires"] = { ["rubber"] = 65, },
				["amount"] = 1,
			},
			{ ["horn"] = { ["plastic"] = 32, },
				["amount"] = 1,
			},
			{ ["internals"] = { ["plastic"] = 70, },
				["amount"] = 1,
			},
			{ ["externals"] = { ["plastic"] = 67, },
				["amount"] = 1,
			},
			{ ["customplate"] = { ["steel"] = 55, },
				["amount"] = 1,
			},
			{ ["headlights"] = { ["plastic"] = 50, },
				["amount"] = 1,
			},
			{ ["rims"] = { ["iron"] = 75, },
				["amount"] = 1,
			},
			{ ["underglow"] = { ["plastic"] = 30, },
				["amount"] = 1,
			},
			{ ["rollcage"] = { ["steel"] = 35, },
				["amount"] = 1,
			},
		},
	},
}

Stores = {
	NosItems = {
		label = Loc[Config.Lan]["stores"].nos,
		items = {
			{ name = "nos", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "noscolour", price = 0, amount = 50, info = {}, type = "item", },
		},
	},
	RepairItems = {
		label = Loc[Config.Lan]["stores"].repairs,
		items = {
			{ name = "mechanic_tools", price = 0, amount = 10, info = {}, type = "item", },
			{ name = "sparetire", price = 0, amount = 100, info = {}, type = "item", },
			{ name = "axleparts", price = 0, amount = 1000, info = {}, type = "item", },
			{ name = "carbattery", price = 0, amount = 1000, info = {}, type = "item", },
			{ name = "sparkplugs", price = 0, amount = 1000, info = {}, type = "item", },
			{ name = "newoil", price = 0, amount = 1000, info = {}, type = "item", },
		},
	},
	ToolItems = {
		label = Loc[Config.Lan]["stores"].tools,
		items = {
			{ name = "toolbox", price = 0, amount = 10, info = {}, type = "item", },
			{ name = "ducttape", price = 0, amount = 100, info = {}, type = "item", },
			{ name = "paintcan", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "tint_supplies", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "underglow_controller", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "cleaningkit", price = 0, amount = 100, info = {}, type = "item", },
		},
	},
	PerformItems = {
		label = Loc[Config.Lan]["stores"].perform,
		items = {
			{ name = "turbo", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "engine1", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "engine2", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "engine3", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "engine4", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "engine5", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "transmission1", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "transmission2", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "transmission3", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "transmission4", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "brakes1", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "brakes2", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "brakes3", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "car_armor", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "suspension1", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "suspension2", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "suspension3", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "suspension4", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "suspension5", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "bprooftires", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "drifttires", price = 0, amount = 50, info = {}, type = "item", },

			{ name = "oilp1", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "oilp2", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "oilp3", price = 0, amount = 50, info = {}, type = "item", },

			{ name = "drives1", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "drives2", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "drives3", price = 0, amount = 50, info = {}, type = "item", },

			{ name = "cylind1", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "cylind2", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "cylind3", price = 0, amount = 50, info = {}, type = "item", },

			{ name = "cables1", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "cables2", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "cables3", price = 0, amount = 50, info = {}, type = "item", },

			{ name = "fueltank1", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "fueltank2", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "fueltank3", price = 0, amount = 50, info = {}, type = "item", },

			{ name = "harness", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "antilag", price = 0, amount = 50, info = {}, type = "item", },

			{ name = "manual", price = 0, amount = 50, info = {}, type = "item", },
		},
	},
	CosmeticItems = {
		label = Loc[Config.Lan]["stores"].cosmetic,
		items = {
			{ name = "hood", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "roof", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "spoiler", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "bumper", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "skirts", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "exhaust", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "seat", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "livery", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "tires", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "horn", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "internals", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "externals", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "customplate", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "headlights", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "rims", price = 0, amount = 100, info = {}, type = "item", },
			{ name = "rollcage", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "underglow", price = 0, amount = 50, info = {}, type = "item", },
		},
	},
}

MaterialRecieve = {
	turbo = {
		steel = 15,
		metalscrap = 12,
	},
	car_armor = {
		plastic = 18,
	},
	engine1 = {
		steel = 4,
	},
	engine2 = {
		steel = 9,
	},
	engine3 = {
		steel = 13,
		metalscrap = 6,
	},
	engine4 = {
		steel = 16,
		metalscrap = 15,
	},
	engine5 = {
		steel = 25,
		metalscrap = 20,
	},
	transmission1 = {
		steel = 5,
	},
	transmission2 = {
		steel = 10,
	},
	transmission3 = {
		steel = 18,
		metalscrap = 8,
	},
	transmission4 = {
		steel = 25,
		metalscrap = 15,
	},
	brakes1 = {
		steel = 4,
		metalscrap = 4,
	},
	brakes2 = {
		steel = 7,
		metalscrap = 8,
	},
	brakes3 = {
		steel = 14,
		metalscrap = 10,
	},
	suspension1 = {
		steel = 4,
	},
	suspension2 = {
		steel = 10,
	},
	suspension3 = {
		steel = 16,
	},
	suspension4 = {
		steel = 25,
		metalscrap = 12,
	},
	suspension5 = {
		steel = 35,
		metalscrap = 19,
	},
	bprooftires = {
		rubber = 20,
	},
	drifttires = {
		rubber = 20,
	},
	oilp1 = {
		steel = 8,
	},
	oilp2 = {
		steel = 15,
	},
	oilp3 = {
		steel = 22,
	},
	drives1 = {
		steel = 3,
	},
	drives2 = {
		steel = 6,
	},
	drives3 = {
		steel = 10,
	},
	cylind1 = {
		steel = 4,
	},
	cylind2 = {
		steel = 8,
	},
	cylind3 = {
		steel = 12,
	},
	cables1 = {
		steel = 5,
	},
	cables2 = {
		steel = 10,
	},
	cables3 = {
		steel = 13,
	},
	fueltank1 = {
		steel = 4,
	},
	fueltank2 = {
		steel = 9,
	},
	fueltank3 = {
		steel = 12,
	},
	harness = {
		steel = 10,
		plastic = 5,
	},
	antilag = {
		steel = 6,
		plastic = 6,
	},
	manual = {
		steel = 3,
	},
}

-- No Touch
	-- This is corrective code to help simplify the stores for people removing the slot info
	-- Jim shops doesn"t use it but other inventories do
	-- Most people don"t even edit the slots, these lines generate the slot info autoamtically
Stores.CosmeticItems.slots = #Stores.CosmeticItems.items
for k in pairs(Stores.CosmeticItems.items) do Stores.CosmeticItems.items[k].slot = k end
Stores.PerformItems.slots = #Stores.PerformItems.items
for k in pairs(Stores.PerformItems.items) do Stores.PerformItems.items[k].slot = k end
Stores.ToolItems.slots = #Stores.ToolItems.items
for k in pairs(Stores.ToolItems.items) do Stores.ToolItems.items[k].slot = k end
Stores.RepairItems.slots = #Stores.RepairItems.items
for k in pairs(Stores.RepairItems.items) do Stores.RepairItems.items[k].slot = k end
Stores.NosItems.slots = #Stores.NosItems.items
for k in pairs(Stores.NosItems.items) do Stores.NosItems.items[k].slot = k end