local Laptops = {
    [1] = {
        name = 'Ph03nix',
        item = 'usb_green',
        laptop = 'laptop_green',
        price = 1,
        coords = Config.GreenLaptop
    },
    [2] = {
        name = 'Ramsay',
        item = 'usb_blue',
        laptop = 'laptop_blue',
        price = 1,
        coords = Config.BlueLaptop
    },
    [3] = {
        name = 'Plague',
        item = 'usb_red',
        laptop = 'laptop_red',
        price = 1,
        coords = Config.RedLaptop
    },
    [4] = {
        name = 'Trinity',
        item = 'usb_gold',
        laptop = 'laptop_gold',
        price = 1,
        coords = Config.GoldLaptop
    }
}

local greyUSBPrice = 291

RegisterNetEvent('qb-bankrobbery:server:BuyLaptop', function(data)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    
    local index = data.index
    local coords = GetEntityCoords(GetPlayerPed(src))
    if #(coords - Laptops[index].coords.xyz) > 5 then
        exports['qb-core']:ExploitBan(src, "Bankrobbery-Buy-Laptop")
        return 
    end

    local item = Laptops[index].item
    if Player.Functions.GetItemByName(item) then
        if (Player.PlayerData.money.crypto - Laptops[index].price) >= 0 then
            -- Remove USB
            Player.Functions.RemoveItem(item, 1, false)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "remove", 1)

            -- Remove Crypto
            Player.Functions.RemoveMoney('crypto', Laptops[index].price)

            -- Add Laptop
            local laptop = Laptops[index].laptop
            local info = {uses = 3}
            Player.Functions.AddItem(laptop, 1, false, info)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[laptop], "add", 1)

            -- Log, debug print and notify client
            if debug then
                print('^3[qb-bankrobbery] ^5'..Player.PlayerData.name..'(citizenid: '..Player.PlayerData.citizenid..' | id: '..src..') Purchased '..laptop..' for '..Laptops[index].price..' crypto^7')
            end
            TriggerEvent("qb-log:server:CreateLog", "bankrobbery", "Purchased "..laptop, "white", "**".. Player.PlayerData.name .. "** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..src.."*) purchased one "..laptop.." from "..Laptops[index].name.." for "..Laptops[index].price.." crypto")
            TriggerClientEvent('QBCore:Notify', src, "You purchased a laptop from "..Laptops[index].name.." for "..Laptops[index].price.." crypto", "success", 2500)
        else
            TriggerClientEvent('QBCore:Notify', src, "You don't have enough crypto", "error", 2500)
        end
    else
        TriggerClientEvent('QBCore:Notify', src, "You don't have anything to offer", "error", 2500)
    end
end)

RegisterNetEvent('qb-bankrobbery:server:BuyGreyUsb', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end

    local coords = GetEntityCoords(GetPlayerPed(src))
    if #(coords - Config.GreyUsb.xyz) > 5 then
        exports['qb-core']:ExploitBan(src, "Bankrobbery-Buy-Grey")
        return 
    end

    if (Player.PlayerData.money.crypto - greyUSBPrice) >= 0 then
        Player.Functions.RemoveMoney('crypto', greyUSBPrice)

        local info = {uses = 3}
        Player.Functions.AddItem("usb_grey", 1, false, info)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["usb_grey"], "add", 1)
        
        if debug then
            print('^3[qb-bankrobbery] ^5'..Player.PlayerData.name..'(citizenid: '..Player.PlayerData.citizenid..' | id: '..src..') Purchased Grey USB for '..greyUSBPrice..' crypto^7')
        end
        TriggerEvent("qb-log:server:CreateLog", "bankrobbery", "Purchased Grey USB", "white", "**".. Player.PlayerData.name .. "** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..src.."*) purchased one usb_grey from Daut for "..greyUSBPrice.." crypto")
        TriggerClientEvent('QBCore:Notify', src, "You purchased a laptop from Daut for "..greyUSBPrice.." crypto", "success", 2500)
    else
        TriggerClientEvent('QBCore:Notify', src, "You don't have enough crypto", "error", 2500)
    end
end)

RegisterNetEvent('qb-bankrobbery:server:LaptopDamage', function(laptop)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end

    local item = Player.Functions.GetItemByName(laptop)
    if not item then
        exports['qb-core']:ExploitBan(src, "Bankrobbery-No-Laptop")
        return
    end

    if (Player.PlayerData.items[item.slot].info.uses - 1) <= 0 then
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items[item.name], "remove", 1)
        Player.Functions.RemoveItem(item.name, 1, item.slot)
        TriggerEvent('qb-log:server:CreateLog', 'bankrobbery', 'Removed '..laptop, 'default', '**'..Player.PlayerData.name..'** (citizenid: *'..Player.PlayerData.citizenid..'* | id: *'..src..'*) removed: **'..laptop..'**')
        if debug then
            print('^3[qb-bankrobbery] ^5Removed '..laptop..' from '..Player.PlayerData.name..' (citizenid: '..Player.PlayerData.citizenid..' | id: '..src..')^7')
        end
    else
        Player.PlayerData.items[item.slot].info.uses = Player.PlayerData.items[item.slot].info.uses - 1
        Player.Functions.SetInventory(Player.PlayerData.items)
    end
end)
