-----------------For support, scripts, and more----------------
--------------- https://discord.gg/VGYkkAYVv2  -------------
---------------------------------------------------------------

Config = {}

Config.Core = "QBCore" -- ESX or QBCore
Config.PlayerLoadedEvent = "QBCore:Client:OnPlayerLoaded" -- esx:playerLoaded || QBCore:Client:OnPlayerLoaded

Config.ShowBlip = true -- show blip on map

Config.Chances = {
    ["common"] = 100, -- 100%
    ["rare"] = 15, -- 15%
    ["epic"] = 5, -- 5%
}
Config.ShowDrawMaker = true -- show draw marker on in game while prospecting
Config.DetectorItem = "detector"

Config.Zones = {
    [1] = {coords = vector3(-1818.14, -790.87, 7.97), data = "loc1", zoneSize = 100, zoneLocations = 200},
    [2] = {coords = vector3(1615.378, 2095.902, 85.007), data = "loc2", zoneSize = 100, zoneLocations = 100},
}

Config.DefaultItems = {
    [1] = {name = "steel", min = 1, max = 2} 
} -- will be selected if you dont put the common, rare and epic items in the config

Config.Items = {
    ["loc1"] = {
        ["common"] = {
            [1] = {name = "steel", min = 1, max = 3},
            [2] = {name = "metalscrap", min = 1, max = 3},
            [3] = {name = "water_bottle", min = 1, max = 1},
            [4] = {name = "plastic", min = 1, max = 3},
            [5] = {name = "iron", min = 1, max = 3},
            [6] = {name = "bandage", min = 1, max = 1},
            [7] = {name = "bottle", min = 1, max = 1},
            [8] = {name = "coffee", min = 1, max = 1},
        },
        ["rare"] = {
            [1] = {name = "phone", min = 1, max = 1},
            [2] = {name = "joint", min = 1, max = 1},
            [3] = {name = "rolling_paper", min = 1, max = 1},
            [4] = {name = "cleaningkit", min = 1, max = 1},
            [5] = {name = "painkillers", min = 1, max = 1},
            [6] = {name = "lockpick", min = 1, max = 1},
        },
        ["epic"] = {
            [1] = {name = "pistol_ammo", min = 1, max = 1},
            [2] = {name = "thermite", min = 1, max = 1},
            [3] = {name = "advancedlockpick", min = 1, max = 1},
            [4] = {name = "electronickit", min = 1, max = 1},
            [5] = {name = "ifaks", min = 1, max = 1},
        }
    },
    ["loc2"] = {
        ["common"] = {
            [1] = {name = "steel", min = 1, max = 3},
            [2] = {name = "metalscrap", min = 1, max = 3},
            [3] = {name = "water_bottle", min = 1, max = 1},
            [4] = {name = "bandage", min = 1, max = 2},
            [5] = {name = "iron", min = 1, max = 3},
            [6] = {name = "plastic", min = 1, max = 3},
            [7] = {name = "bottle", min = 1, max = 3},
            [8] = {name = "coffee", min = 1, max = 1},
        },
        ["rare"] = {
            [1] = {name = "phone", min = 1, max = 1},
            [2] = {name = "painkillers", min = 1, max = 1},
            [3] = {name = "rolling_paper", min = 1, max = 1},
            [4] = {name = "joint", min = 1, max = 1},
            [5] = {name = "handcuffs", min = 1, max = 1},
        },
        ["epic"] = {
            [1] = {name = "pistol_ammo", min = 1, max = 1},
            [2] = {name = "thermite", min = 1, max = 1},
            [3] = {name = "goldbar", min = 1, max = 1},
            [4] = {name = "armor", min = 1, max = 1},
        }
    },
}
