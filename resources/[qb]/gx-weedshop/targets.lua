Citizen.CreateThread(function()
    exports['qb-target']:AddBoxZone("weedshop-service", vector3(-940.28, -1186.72, 4.17), 1, 1.2, {
        name = "weedshop-service",
        heading = 307.63,
        debugPoly = false,
        minZ=2,
        maxZ=4,
    }, {
        options = {
            {  
            event = "gx-weedshop:client:Service",
            icon = "far fa-clipboard",
            label = "Clock in/out",
            job = "weedshop",
            },
        },
        distance = 1.5
    })

    exports['qb-target']:AddBoxZone("counterweedshop", vector3(-933.24, -1177.52, 4.0), 1.6, 3.5, {
        name="counterweedshop",
        heading=301.81,
        debugPoly = false,
    }, {
        options = {
            {
            event = "gx-weedshop:client:Counter",
            icon = "far fa-clipboard",
            label = "Counter",
            },
        },
        distance = 3.5
    })

    exports['qb-target']:AddBoxZone("weedshopboard1", vector3(-931.66, -1175.65, 4.04), 0.5, 0.7, {
        name = "weedshopboard1",
        heading = 309.44,
        debugPoly = false,
    }, {
        options = {
            {
            event = "gx-weedshop:client:board1",
            icon = "far fa-clipboard",
            label = "Board",
            },
        },
        distance = 1.5
    })

    exports['qb-target']:AddBoxZone("weedshopstorage", vector3(-930.11, -1181.53, 4.02), 1.2, 2, {
        name="weedshopstorage",
        heading=216.1,
        debugPoly = false,
    }, {
            options = {
                {
                    event = "gx-weedshop:client:StorageIngredients",
                    icon = "fas fa-laptop",
                    label = "Ingredient Storage",
                    job = "weedshop",
                },
            },
            distance = 1.0
        })

    exports['qb-target']:AddBoxZone("weedshop-weed", vector3(-929.7, -1178.52, 4.16), 0.7, 4.0, {
        name="weedshop-weed",
        heading=304.56,
        debugPoly=false,

    }, {
            options = {
                {
                    event = "gx-weedshop:client:WeedMenu",
                    icon = "fas fa-rocket",
                    label = "Roll Joints",
                    job = "weedshop",
                },
            },
            distance = 1.5
    })

    exports['qb-target']:AddBoxZone("weedshop-weedplant", vector3(-927.57, -1186.81, -1.84), 0.7, 3, {
        name="weedshop-weedplant",
        heading=121.29,
        debugPoly=false,

    }, {
            options = {
                {
                    event = "gx-weedshop:client:WeedPlantMenu",
                    icon = "fas fa-rocket",
                    label = "Harvest Weed",
                    job = "weedshop",
                },
            },
            distance = 1.5
    })

    exports['qb-target']:AddBoxZone("weedshop-weedplant2", vector3(-921.69, -1186.51, -1.84), 0.7, 3, {
        name="weedshop-weedplant2",
        heading=216.07,
        debugPoly=false,

    }, {
            options = {
                {
                    event = "gx-weedshop:client:WeedPlantMenu",
                    icon = "fas fa-rocket",
                    label = "Harvest Weed",
                    job = "weedshop",
                },
            },
            distance = 1.5
    })

    exports['qb-target']:AddBoxZone("weedshop-weedplant3", vector3(-929.5, -1188.69, -1.84), 0.7, 3, {
        name="weedshop-weedplant3",
        heading=120.62,
        debugPoly=false,

    }, {
            options = {
                {
                    event = "gx-weedshop:client:WeedPlantMenu",
                    icon = "fas fa-rocket",
                    label = "Harvest Weed",
                    job = "weedshop",
                },
            },
            distance = 1.5
    })

    exports['qb-target']:AddBoxZone("weedshop-seeds", vector3(-927.99, -1180.62, -1.89), 1.5, 1.5, {
        name="weedshop-seeds",
        heading=120,
        debugPoly=false,

    }, {
            options = {
                {
                    event = "gx-weedshop:client:SeedMenu",
                    icon = "fas fa-rocket",
                    label = "Harvest Seeds",
                    job = "weedshop",
                },
            },
            distance = 1.5
    })

    exports['qb-target']:AddBoxZone("weedshop-seeds2", vector3(-927.86, -1190.65, -1.89), 1.5, 1.5, {
        name="weedshop-seeds2",
        heading=30,
        debugPoly=false,

    }, {
            options = {
                {
                    event = "gx-weedshop:client:SeedMenu",
                    icon = "fas fa-rocket",
                    label = "Harvest Seeds",
                    job = "weedshop",
                },
            },
            distance = 1.5
    })

    exports['qb-target']:AddBoxZone("weedshop-bagweed", vector3(-929.08, -1171.4, -1.2), 0.7, 3.5, {
        name="weedshop-bagweedt",
        heading=31.2,
        debugPoly=false,

    }, {
            options = {
                {
                    event = "gx-weedshop:client:WeedBagMenu",
                    icon = "fas fa-rocket",
                    label = "Bag Bud",
                    job = "weedshop",
                },
            },
            distance = 1.5
    })
    
    
    exports['qb-target']:AddBoxZone("weedshop-menu1", vector3(-931.6, -1179.89, 4.0), 1.5, 1.4, {
        name="weedshop-menu1",
        debugPoly = false,
        heading=301.23,
    }, {
            options = {
                {
                    event = "gx-weedshop:client:WeedShopMenu",
                    icon = "fas fa-clipboard",
                    label = "See Menu",
                },
                -- {
                --     event = "gx-weedshop:client:BillPlayer",
                --     icon = "fas fa-clipboard",
                --     label = "Bill Player",
                --     job = "weedshop",
                -- },
            },
            distance = 1.5
    })

    exports['qb-target']:AddBoxZone("weedshop-menu2", vector3(-942.42, -1181.24, 3.91), 1.6, 1.5, {
        name="weedshop-menu2",
        debugPoly = false,
        heading=270,
        }, {
                options = {
                    {
                        event = "gx-weedshop:client:WeedShopMenu",
                        icon = "fas fa-clipboard",
                        label = "See Menu",
                    },
                    -- {
                    --     event = "gx-weedshop:client:BillPlayer",
                    --     icon = "fas fa-clipboard",
                    --     label = "Bill Player",
                    --     job = "weedshop",
                    -- },
                },
                distance = 1.5
            })

    exports['qb-target']:AddBoxZone("weedshop-clothes", vector3(-931.35, -1168.81, 3.88), 1.5, 1, {
        name="weedshop-clothes",
        heading=304.9,
        debugPoly = false,
    }, {
        options = {
            {
            event = "illenium-appearance:client:openOutfitMenu",
            icon = "far fa-tshirt",
            label = "Change Clothes",
            },
        },
        distance = 1.5
    })
end)