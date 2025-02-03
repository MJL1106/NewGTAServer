CreateThread(function()
    local laptopConfigs = {
        {coords = Config.GreenLaptop, item = 'usb_green', id = 1},
        {coords = Config.BlueLaptop, item = 'usb_blue', id = 2},
        {coords = Config.RedLaptop, item = 'usb_red', id = 3},
        {coords = Config.GoldLaptop, item = 'usb_gold', id = 4}
    }

    for i, config in ipairs(laptopConfigs) do
        exports['qb-target']:AddBoxZone(
            "LaptopInteraction_" .. i,
            config.coords,
            1.0,
            1.0,
            {
                name = "LaptopInteraction_" .. i,
                heading = 0,
                debugPoly = false,
                minZ = config.coords.z - 1,
                maxZ = config.coords.z + 1
            },
            {
                options = {
                    {
                        num = 1,
                        type = "client",
                        icon = "fas fa-hand-holding",
                        label = "Offer Item",
                        item = config.item,
                        action = function()
                            TriggerServerEvent("qb-bankrobbery:server:BuyLaptop", {index = config.id})
                        end
                    }
                },
                distance = 2.0
            }
        )
    end

    exports['qb-target']:AddBoxZone(
        "GreyUsbInteraction",
        Config.GreyUsb,
        1.0,
        1.0,
        {
            name = "GreyUsbInteraction",
            heading = 0,
            debugPoly = false,
            minZ = Config.GreyUsb.z - 1,
            maxZ = Config.GreyUsb.z + 1
        },
        {
            options = {
                {
                    num = 1,
                    type = "client",
                    icon = "fas fa-hand-holding",
                    label = "Purchase USB",
                    action = function()
                        TriggerEvent("qb-bankrobbery:client:BuyGreyUsb")
                    end
                }
            },
            distance = 2.0
        }
    )
end)