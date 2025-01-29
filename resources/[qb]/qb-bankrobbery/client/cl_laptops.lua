CreateThread(function()
    -- Add box zones for each laptop location
    exports.ox_target:addBoxZone({
        coords = Config.GreenLaptop,
        size = vec3(1, 1, 2),
        rotation = 0,
        debug = true, -- Add debug flag
        options = {
            {
                label = 'Offer Item',
                icon = 'fas fa-hand-holding', 
                items = 'usb_green',
                onSelect = function()
                    TriggerServerEvent("qb-bankrobbery:server:BuyLaptop", 1)
                end
            }
        }
    })
 
    exports.ox_target:addBoxZone({
        coords = Config.BlueLaptop,
        size = vec3(1, 1, 2),
        rotation = 0,
        debug = true, -- Add debug flag
        options = {
            {
                label = 'Offer Item',
                icon = 'fas fa-hand-holding',
                items = 'usb_blue',
                onSelect = function()
                    TriggerServerEvent("qb-bankrobbery:server:BuyLaptop", 2)
                end
            }
        }
    })
 
    exports.ox_target:addBoxZone({
        coords = Config.RedLaptop,
        size = vec3(1, 1, 2),
        rotation = 0,
        debug = true, -- Add debug flag
        options = {
            {
                label = 'Offer Item',
                icon = 'fas fa-hand-holding',
                items = 'usb_red',
                onSelect = function()
                    TriggerServerEvent("qb-bankrobbery:server:BuyLaptop", 3)
                end
            }
        }
    })
 
    exports.ox_target:addBoxZone({
        coords = Config.GoldLaptop,
        size = vec3(1, 1, 2),
        rotation = 0,
        debug = true, -- Add debug flag
        options = {
            {
                label = 'Offer Item',
                icon = 'fas fa-hand-holding',
                items = 'usb_gold',
                onSelect = function()
                    TriggerServerEvent("qb-bankrobbery:server:BuyLaptop", 4)
                end
            }
        }
    })
 
    exports.ox_target:addBoxZone({
        coords = Config.GreyUsb,
        size = vec3(1, 1, 2),
        rotation = 0,
        debug = true, -- Add debug flag
        options = {
            {
                label = 'Purchase USB',
                icon = 'fas fa-hand-holding',
                onSelect = function()
                    TriggerServerEvent("qb-bankrobbery:server:BuyGreyUsb")
                end
            }
        }
    })
 
    -- Add debug prints
    print('Green Laptop Zone Added at:', json.encode(Config.GreenLaptop))
    print('Blue Laptop Zone Added at:', json.encode(Config.BlueLaptop))
    print('Red Laptop Zone Added at:', json.encode(Config.RedLaptop))
    print('Gold Laptop Zone Added at:', json.encode(Config.GoldLaptop))
    print('Grey USB Zone Added at:', json.encode(Config.GreyUsb))
 end)