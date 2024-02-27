-- --============================================================== Exports
CreateThread(function() 
    for bankId, bankData in pairs(Config.GearLocations) do
        exports['qb-target']:AddBoxZone('FishingGear' .. bankId, bankData["coords"], 1, 1, {
            name = 'FishingGear' .. bankId,
            heading = bankData["heading"],  
            debugPoly = false,  
            minZ = bankData["coords"].z - 1,  
            maxZ = bankData["coords"].z + 1,  
        }, {
            options = {
                {
                    event = "doj:client:BoatMenu",
                    icon = "fas fa-anchor",
                    label = "Boat Rental",
                    location = bankId -- Assuming location index as an identifier; adjust if you have specific location IDs
                },
                {
                    event = "doj:client:buyFishingGear",
                    icon = "fas fa-fish",
                    label = "Fishing Gear",
                },
            },
            distance = 10.0
        })
    end
end)

-- exports[Config.targetExport]:AddTargetModel(`s_m_y_busboy_01`, {
--     options = {
--         {
--             event = "doj:client:SellLegalFish",
--             icon = "fa fa-fish",
--             label = "Sell Fish",
--         },
-- 		{
--             event = "doj:client:SellillegalFish",
--             icon = "fa fa-fish",
--             label = "Sell Exotic Fish",
--         },
--     },
--     distance = 10.0
-- })

CreateThread(function() 
    for bankId, bankData in pairs(Config.SellLocations) do
        exports['qb-target']:AddBoxZone('Sell' .. bankId, bankData["coords"], 1, 1, {
            name = 'Sell' .. bankId,
            heading = bankData["heading"],  
            debugPoly = false,  
            minZ = bankData["coords"].z - 1,  
            maxZ = bankData["coords"].z + 1,  
        }, {
            options = {
                {
                    event = "doj:client:SellLegalFish",
                    icon = "fa fa-fish",
                    label = "Sell Fish",
                },
                {
                    event = "doj:client:SellillegalFish",
                    icon = "fa fa-fish",
                    label = "Sell Exotic Fish",
                },
            },
            distance = 10.0
        })
    end
end)