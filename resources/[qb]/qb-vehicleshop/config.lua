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
                vector2(-814.05, -204.9),
                vector2(-787.85, -249.81),
                vector2(-759.08, -238.3),
                vector2(-792.43, -183.29),
                vector2(-819.45, -197.92)
            },
            ['minZ'] = 34.0, -- min height of the shop zone
            ['maxZ'] = 42.0, -- max height of the shop zone
            ['size'] = 2.75 -- size of the vehicles zones
        },
        ['Job'] = 'cardealer', -- Name of job or none
        ['ShopLabel'] = 'Premium Deluxe Motorsport', -- Blip name
        ['showBlip'] = true, -- true or false
        ['blipSprite'] = 326, -- Blip sprite
        ['blipColor'] = 3, -- Blip color
        ['TestDriveTimeLimit'] = 0.5, -- Time in minutes until the vehicle gets deleted
        ['Location'] = vector3(-796.87, -220.59, 37.25), -- Blip Location
        ['ReturnLocation'] = vector3(-788.78, -197.35, 37.28), -- Location to return vehicle, only enables if the vehicleshop has a job owned
        ['VehicleSpawn'] = vector4(-784.65, -188.93, 37.28, 30.28), -- Spawn location when vehicle is bought
        ['TestDriveSpawn'] = vector4(-758.51, -235.26, 37.28, 208.98), -- Spawn location for test drive
        ['ShowroomVehicles'] = {
            [1] = {
                coords = vector4(-796.21, -206.71, 36.45, 32.82), -- where the vehicle will spawn on display
                defaultVehicle = 'champion', -- Default display vehicle
                chosenVehicle = 'champion', -- Same as default but is dynamically changed when swapping vehicles
            },
            [2] = {
                coords = vector4(-805.36, -212.92, 36.25, 297.54),
                defaultVehicle = 'schafter2',
                chosenVehicle = 'schafter2'
            },
            [3] = {
                coords = vector4(-803.44, -216.74, 36.25, 304.46),
                defaultVehicle = 'comet2',
                chosenVehicle = 'comet2'
            },
            [4] = {
                coords = vector4(-790.14, -222.23, 36.6, 120.31),
                defaultVehicle = 'vigero',
                chosenVehicle = 'vigero'
            },
            [5] = {
                coords = vector4(-785.81, -243.57, 36.53, 26.44),
                defaultVehicle = 't20',
                chosenVehicle = 't20'
            },
        },
        ['InteractionPanel'] = {
             -- Example coordinates for the interaction panel
            [1] = {
                coords = vector3(-796.64, -206.98, 36.45), -- where the vehicle will spawn on display
        
            },
            [2] = {
                coords = vector3(-805.36, -212.92, 36.25),
            
            },
            [3] = {
                coords = vector3(-803.44, -216.74, 36.25),
                
            },
            [4] = {
                coords = vector3(-790.14, -222.23, 36.6),
                
            },
            [5] = {
                coords = vector3(-785.81, -243.57, 36.53),
               
            },
        },
    },
    ['luxury'] = {
        ['Type'] = 'free-use', -- meaning a real player has to sell the car
        ['Zone'] = {
            ['Shape'] = {
                vector2(-1260.6973876953, -349.21334838867),
                vector2(-1268.6248779297, -352.87365722656),
                vector2(-1274.1533203125, -358.29794311523),
                vector2(-1273.8425292969, -362.73715209961),
                vector2(-1270.5701904297, -368.6716003418),
                vector2(-1266.0561523438, -375.14080810547),
                vector2(-1244.3684082031, -362.70278930664),
                vector2(-1249.8704833984, -352.03326416016),
                vector2(-1252.9503173828, -345.85726928711)
            },
            ['minZ'] = 36.646457672119,
            ['maxZ'] = 37.516143798828,
            ['size'] = 2.75 -- size of the vehicles zones
        },
        ['Job'] = 'none', -- Name of job or none
        ['ShopLabel'] = 'Luxury Vehicle Dealership',
        ['showBlip'] = true, -- true or false
        ['blipSprite'] = 523, -- Blip sprite
        ['blipColor'] = 66, -- Blip color
        ['TestDriveTimeLimit'] = 0.5,
        ['Location'] = vector3(-1255.6, -361.16, 36.91),
        ['ReturnLocation'] = vector3(-1231.46, -349.86, 37.33),
        ['VehicleSpawn'] = vector4(-1231.46, -349.86, 37.33, 26.61),
        ['TestDriveSpawn'] = vector4(-1232.81, -347.99, 37.33, 23.28), -- Spawn location for test drive
        ['ShowroomVehicles'] = {
            [1] = {
                coords = vector4(-1265.31, -354.44, 35.91, 205.08),
                defaultVehicle = 's8nm8',
                chosenVehicle = 's8nm8'
            },
            [2] = {
                coords = vector4(-1270.06, -358.55, 35.91, 247.08),
                defaultVehicle = 'CCViper',
                chosenVehicle = 'CCViper'
            },
            [3] = {
                coords = vector4(-1269.21, -365.03, 35.91, 297.12),
                defaultVehicle = 'evo9',
                chosenVehicle = 'evo9'
            },
            [4] = {
                coords = vector4(-1252.07, -364.2, 35.91, 56.44),
                defaultVehicle = 'suprapandem',
                chosenVehicle = 'suprapandem'
            },
            [5] = {
                coords = vector4(-1255.49, -365.91, 35.91, 55.63),
                defaultVehicle = 'manssupersnake',
                chosenVehicle = 'manssupersnake'
            },
            [6] = {
                coords = vector4(-1249.21, -362.97, 35.91, 53.24),
                defaultVehicle = 'rmodpagani',
                chosenVehicle = 'rmodpagani'
            },
        },
        ['InteractionPanel'] = {
            -- Example coordinates for the interaction panel
           [1] = {
               coords = vector3(-1253.58, -348.3, 36.83), -- where the vehicle will spawn on display
       
           },
        --    [2] = {
        --        coords = vector3(124.78, -155.49, 53.4),
           
        --    },
        --    [3] = {
        --        coords = vector3(130.49, -157.46, 53.4),
               
        --    },
        --    [4] = {
        --        coords = vector3(136.34, -159.47, 53.4),
               
        --    },
        --    [5] = {
        --        coords = vector3(141.63, -161.61, 53.4),
        --    },
        --    [6] = {
        --         coords = vector3(134.42, -149.53, 53.4)
        --    },
           
       },
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
