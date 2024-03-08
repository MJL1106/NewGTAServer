Citizen.CreateThread(function()
    exports['qb-target']:AddBoxZone("weedshop-service", vector3(374.4030, -829.8217, 29.1206), 1, 1.2, {
        name = "weedshop-service",
        heading = 91,
        debugPoly = false,
        minZ=26.1206,
        maxZ=30.1206,
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

    exports['qb-target']:AddBoxZone("counterweedshop", vector3(378.7853, -826.6912, 29.1022), 1.6, 3.6, {
        name="counterweedshop",
        heading=89,
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

    exports['qb-target']:AddBoxZone("weedshopboard1", vector3(375.5658, -828.8251, 29.15014), 0.5, 0.7, {
        name = "weedshopboard1",
        heading = 87.8,
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

    exports['qb-target']:AddBoxZone("weedshopstorage", vector3(379.8752, -819.1209, 29.3026), 1.2, 2, {
        name="weedshopstorage",
        heading=87.61,
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

    exports['qb-target']:AddBoxZone("weedshop-weed", vector3(377.1346, -827.4330, 29.2374), 0.7, 1.5, {
        name="weedshop-weed",
        heading=97.15,
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

    exports['qb-target']:AddBoxZone("weedshop-weedplant", vector3(383.2165, -813.3147, 29.3042), 0.7, 1.5, {
        name="weedshop-weedplant",
        heading=97.15,
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

    exports['qb-target']:AddBoxZone("weedshop-weedplant2", vector3(382.2165, -813.3147, 29.3042), 0.7, 1.5, {
        name="weedshop-weedplant2",
        heading=97.15,
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

    exports['qb-target']:AddBoxZone("weedshop-weedplant3", vector3(380.6, -811.47, 28.41), 0.7, 1.5, {
        name="weedshop-weedplant3",
        heading=3.78,
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

    exports['qb-target']:AddBoxZone("weedshop-seeds", vector3(380.4, -813.34, 28.43), 0.7, 1.5, {
        name="weedshop-seeds",
        heading=97.15,
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

    exports['qb-target']:AddBoxZone("weedshop-seeds2", vector3(379.4, -813.34, 28.43), 0.7, 1.5, {
        name="weedshop-seeds2",
        heading=97.15,
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

    exports['qb-target']:AddBoxZone("weedshop-seeds3", vector3(378.3, -813.34, 28.43), 0.7, 1.5, {
        name="weedshop-seeds3",
        heading=97.15,
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


    exports['qb-target']:AddBoxZone("weedshop-bagweed", vector3(382.49, -817.43, 28.3), 0.7, 1.5, {
        name="weedshop-bagweedt",
        heading=97.15,
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
    
    
    exports['qb-target']:AddBoxZone("weedshop-menu1", vector3(380.1550, -827.4106, 29.3022), 0.5, 0.4, {
        name="weedshop-menu1",
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

    exports['qb-target']:AddBoxZone("weedshop-menu2", vector3(375.4087, -827.3607, 28.3088), 0.6, 0.5, {
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

    exports['qb-target']:AddBoxZone("weedshop-clothes", vector3(373.6913, -824.5279, 29.3030), 1.5, 1, {
        name="weedshop-clothes",
        heading=0,
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