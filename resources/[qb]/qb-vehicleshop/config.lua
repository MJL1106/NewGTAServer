Config = {}
Config.UsingTarget = GetConvar('UseTarget', 'false') == 'true'
Config.Commission = 0.05 -- Percent that goes to sales person from a full car sale 10%
Config.FinanceCommission = 0.05 -- Percent that goes to sales person from a finance sale 5%
Config.FinanceZone = vector3(-29.53, -1103.67, 26.42)-- Where the finance menu is located
Config.PaymentWarning = 10 -- time in minutes that player has to make payment before repo
Config.PaymentInterval = 24 -- time in hours between payment being due
Config.MinimumDown = 10 -- minimum percentage allowed down
Config.MaximumPayments = 24 -- maximum payments allowed
Config.PreventFinanceSelling = true -- allow/prevent players from using /transfervehicle if financed
Config.Shops = {
    ['pdm'] = {
        ['Type'] = 'managed', -- no player interaction is required to purchase a car
        ['Zone'] = {
            ['Shape'] = {--polygon that surrounds the shop
                vector2(-56.727394104004, -1086.2325439453),
                vector2(-60.612808227539, -1096.7795410156),
                vector2(-58.26834487915, -1100.572265625),
                vector2(-35.927803039551, -1109.0034179688),
                vector2(-34.427627563477, -1108.5111083984),
                vector2(-32.02657699585, -1101.5877685547),
                vector2(-33.342102050781, -1101.0377197266),
                vector2(-31.292987823486, -1095.3717041016)
            },
            ['minZ'] = 25.0, -- min height of the shop zone
            ['maxZ'] = 28.0, -- max height of the shop zone
            ['size'] = 2.75 -- size of the vehicles zones
        },
        ['Job'] = 'cardealer', -- Name of job or none
        ['ShopLabel'] = 'Premium Deluxe Motorsport', -- Blip name
        ['showBlip'] = true, -- true or false
        ['blipSprite'] = 326, -- Blip sprite
        ['blipColor'] = 3, -- Blip color
        ['TestDriveTimeLimit'] = 0.5, -- Time in minutes until the vehicle gets deleted
        ['Location'] = vector3(-45.67, -1098.34, 26.42), -- Blip Location
        ['ReturnLocation'] = vector3(-44.74, -1082.58, 26.68), -- Location to return vehicle, only enables if the vehicleshop has a job owned
        ['VehicleSpawn'] = vector4(-53.81, -1110.84, 26.67, 66.53), -- Spawn location when vehicle is bought
        ['TestDriveSpawn'] = vector4(-23.6, -1094.8, 27.31, 339.12), -- Spawn location for test drive
        ['ShowroomVehicles'] = {
            [1] = {
                coords = vector4(-49.94, -1084.09, 26.23, 182.87), -- where the vehicle will spawn on display
                defaultVehicle = 'champion', -- Default display vehicle
                chosenVehicle = 'champion', -- Same as default but is dynamically changed when swapping vehicles
            },
            [2] = {
                coords = vector4(-47.6, -1091.75, 26.23, 105.58),
                defaultVehicle = 'schafter2',
                chosenVehicle = 'schafter2'
            },
            [3] = {
                coords = vector4(-55.46, -1097.01, 26.23, 267.78),
                defaultVehicle = 'comet2',
                chosenVehicle = 'comet2'
            },
            [4] = {
                coords = vector4(-43.14, -1101.78, 26.23, 320.62),
                defaultVehicle = 'vigero',
                chosenVehicle = 'vigero'
            },
            [5] = {
                coords = vector4(-36.42, -1093.44, 26.23, 46.09),
                defaultVehicle = 't20',
                chosenVehicle = 't20'
            },
        },
    },
    ['luxury'] = {
        ['Type'] = 'free-use', -- meaning a real player has to sell the car
        ['Zone'] = {
            ['Shape'] = {
                vector2(92.8, -152.14),
                vector2(146.37, -172.99),
                vector2(165.27, -126.88),
                vector2(92.8, -104.13)
            },
            ['minZ'] = 54,
            ['maxZ'] = 54.6,
            ['size'] = 2.75 -- size of the vehicles zones
        },
        ['Job'] = 'none', -- Name of job or none
        ['ShopLabel'] = 'Luxury Import Dealership',
        ['showBlip'] = true, -- true or false
        ['blipSprite'] = 523, -- Blip sprite
        ['blipColor'] = 66, -- Blip color
        ['TestDriveTimeLimit'] = 0.5,
        ['Location'] = vector3(136.39, -144.89, 54.8),
        ['ReturnLocation'] = vector3(126.48, -143.84, 54.81),
        ['VehicleSpawn'] = vector4(126.47, -118.97, 54.84, 68.1),
        ['TestDriveSpawn'] = vector4(126.47, -118.97, 54.84, 68.1), -- Spawn location for test drive
        ['ShowroomVehicles'] = {
            [1] = {
                coords = vector4(120.72, -156.67, 54.02, 24.43),
                defaultVehicle = 's15lunar',
                chosenVehicle = 's15lunar'
            },
            [2] = {
                coords = vector4(126.29, -158.6, 54.02, 26.15),
                defaultVehicle = 'evo9',
                chosenVehicle = 'evo9'
            },
            [3] = {
                coords = vector4(132.04, -160.75, 54.02, 19.52),
                defaultVehicle = 'brz13varis',
                chosenVehicle = 'brz13varis'
            },
            [4] = {
                coords = vector4(137.75, -162.81, 54.02, 22.81),
                defaultVehicle = 'escaladeprime',
                chosenVehicle = 'escaladeprime'
            },
            [5] = {
                coords = vector4(143.37, -165.09, 54.02, 22.89),
                defaultVehicle = 'scubieblob',
                chosenVehicle = 'scubieblob'
            },
            [6] = {
                coords = vector4(138.54, -149.89, 54.08, 55.78),
                defaultVehicle = 'rmodpagani',
                chosenVehicle = 'rmodpagani'
            },
        }
    }, -- Add your next table under this comma
    -- ['boats'] = {
    --     ['Type'] = 'managed', -- no player interaction is required to purchase a vehicle
    --     ['Zone'] = {
    --         ['Shape'] = {--polygon that surrounds the shop
    --             vector2(-729.39, -1315.84),
    --             vector2(-766.81, -1360.11),
    --             vector2(-754.21, -1371.49),
    --             vector2(-716.94, -1326.88)
    --         },
    --         ['minZ'] = 0.0, -- min height of the shop zone
    --         ['maxZ'] = 5.0, -- max height of the shop zone
    --         ['size'] = 6.2 -- size of the vehicles zones
    --     },
    --     ['Job'] = 'cardealer', -- Name of job or none
    --     ['ShopLabel'] = 'Marina Shop', -- Blip name
    --     ['showBlip'] = false, -- true or false
    --     ['blipSprite'] = 410, -- Blip sprite
    --     ['blipColor'] = 3, -- Blip color
    --     ['TestDriveTimeLimit'] = 1.5, -- Time in minutes until the vehicle gets deleted
    --     ['Location'] = vector3(-738.25, -1334.38, 1.6), -- Blip Location
    --     ['ReturnLocation'] = vector3(-714.34, -1343.31, 0.0), -- Location to return vehicle, only enables if the vehicleshop has a job owned
    --     ['VehicleSpawn'] = vector4(-727.87, -1353.1, -0.17, 137.09), -- Spawn location when vehicle is bought
    --     ['TestDriveSpawn'] = vector4(-722.23, -1351.98, 0.14, 135.33), -- Spawn location for test drive
    --     ['ShowroomVehicles'] = {
    --         [1] = {
    --             coords = vector4(-727.05, -1326.59, 0.00, 229.5), -- where the vehicle will spawn on display
    --             defaultVehicle = 'seashark', -- Default display vehicle
    --             chosenVehicle = 'seashark' -- Same as default but is dynamically changed when swapping vehicles
    --         },
    --         [2] = {
    --             coords = vector4(-732.84, -1333.5, -0.50, 229.5),
    --             defaultVehicle = 'dinghy',
    --             chosenVehicle = 'dinghy'
    --         },
    --         [3] = {
    --             coords = vector4(-737.84, -1340.83, -0.50, 229.5),
    --             defaultVehicle = 'speeder',
    --             chosenVehicle = 'speeder'
    --         },
    --         [4] = {
    --             coords = vector4(-741.53, -1349.7, -2.00, 229.5),
    --             defaultVehicle = 'marquis',
    --             chosenVehicle = 'marquis'
    --         },
    --     },
    -- },
    -- ['air'] = {
    --     ['Type'] = 'managed', -- no player interaction is required to purchase a vehicle
    --     ['Zone'] = {
    --         ['Shape'] = {--polygon that surrounds the shop
    --             vector2(-1607.58, -3141.7),
    --             vector2(-1672.54, -3103.87),
    --             vector2(-1703.49, -3158.02),
    --             vector2(-1646.03, -3190.84)
    --         },
    --         ['minZ'] = 12.99, -- min height of the shop zone
    --         ['maxZ'] = 16.99, -- max height of the shop zone
    --         ['size'] = 7.0, -- size of the vehicles zones
    --     },
    --     ['Job'] = 'cardealer', -- Name of job or none
    --     ['ShopLabel'] = 'Air Shop', -- Blip name
    --     ['showBlip'] = false, -- true or false
    --     ['blipSprite'] = 251, -- Blip sprite
    --     ['blipColor'] = 3, -- Blip color
    --     ['TestDriveTimeLimit'] = 1.5, -- Time in minutes until the vehicle gets deleted
    --     ['Location'] = vector3(-1652.76, -3143.4, 13.99), -- Blip Location
    --     ['ReturnLocation'] = vector3(-1628.44, -3104.7, 13.94), -- Location to return vehicle, only enables if the vehicleshop has a job owned
    --     ['VehicleSpawn'] = vector4(-1617.49, -3086.17, 13.94, 329.2), -- Spawn location when vehicle is bought
    --     ['TestDriveSpawn'] = vector4(-1625.19, -3103.47, 13.94, 330.28), -- Spawn location for test drive
    --     ['ShowroomVehicles'] = {
    --         [1] = {
    --             coords = vector4(-1651.36, -3162.66, 12.99, 346.89), -- where the vehicle will spawn on display
    --             defaultVehicle = 'volatus', -- Default display vehicle
    --             chosenVehicle = 'volatus' -- Same as default but is dynamically changed when swapping vehicles
    --         },
    --         [2] = {
    --             coords = vector4(-1668.53, -3152.56, 12.99, 303.22),
    --             defaultVehicle = 'luxor2',
    --             chosenVehicle = 'luxor2'
    --         },
    --         [3] = {
    --             coords = vector4(-1632.02, -3144.48, 12.99, 31.08),
    --             defaultVehicle = 'nimbus',
    --             chosenVehicle = 'nimbus'
    --         },
    --         [4] = {
    --             coords = vector4(-1663.74, -3126.32, 12.99, 275.03),
    --             defaultVehicle = 'frogger',
    --             chosenVehicle = 'frogger'
    --         },
    --     },
    -- },
    -- ['truck'] = {
    --     ['Type'] = 'managed', -- no player interaction is required to purchase a car
    --     ['Zone'] = {
    --         ['Shape'] = {--polygon that surrounds the shop
    --             vector2(872.23, -1173.5),
    --             vector2(868.88, -1162.7),
    --             vector2(900.91, -1156.54),
    --             vector2(901.96, -1173.71),
    --             vector2(883.59, -1174.47),
    --             vector2(884.59, -1161.29),
    --             vector2(890.06, -1155.0),
    --             vector2(907.71, -1168.71)
    --         },
    --         ['minZ'] = 25.0, -- min height of the shop zone
    --         ['maxZ'] = 28.0, -- max height of the shop zone
    --         ['size'] = 5.75 -- size of the vehicles zones
    --     },
    --     ['Job'] = 'cardealer', -- Name of job or none
    --     ['ShopLabel'] = 'Truck Motor Shop', -- Blip name
    --     ['showBlip'] = true, -- true or false
    --     ['blipSprite'] = 477, -- Blip sprite
    --     ['blipColor'] = 2, -- Blip color
    --     ['TestDriveTimeLimit'] = 0.5, -- Time in minutes until the vehicle gets deleted
    --     ['Location'] = vector3(900.47, -1155.74, 25.16), -- Blip Location
    --     ['ReturnLocation'] = vector3(900.47, -1155.74, 25.16), -- Location to return vehicle, only enables if the vehicleshop has a job owned
    --     ['VehicleSpawn'] = vector4(909.35, -1181.58, 25.55, 177.57), -- Spawn location when vehicle is bought
    --     ['TestDriveSpawn'] = vector4(867.65, -1192.4, 25.37, 95.72), -- Spawn location for test drive
    --     ['ShowroomVehicles'] = {
    --         [1] = {
    --             coords = vector4(890.84, -1170.92, 25.08, 269.58), -- where the vehicle will spawn on display
    --             defaultVehicle = 'hauler', -- Default display vehicle
    --             chosenVehicle = 'hauler', -- Same as default but is dynamically changed when swapping vehicles
    --         },
    --         [2] = {
    --             coords = vector4(878.45, -1171.04, 25.05, 273.08),
    --             defaultVehicle = 'phantom',
    --             chosenVehicle = 'phantom'
    --         },
    --         [3] = {
    --             coords = vector4(880.44, -1163.59, 24.87, 273.08),
    --             defaultVehicle = 'mule',
    --             chosenVehicle = 'mule'
    --         },
    --         [4] = {
    --             coords = vector4(896.95, -1162.62, 24.98, 273.08),
    --             defaultVehicle = 'mixer',
    --             chosenVehicle = 'mixer'
    --         },
    --     },
    -- },
}
