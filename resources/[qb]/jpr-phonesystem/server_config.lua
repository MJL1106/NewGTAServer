local QBCore                  = exports[Config.CoreName]:GetCoreObject()

function PayToSociety(society, amount, senderCitizenid)
    exports[Config.JobManageScript]:AddMoney(society, amount)

    for k, v in pairs(QBCore.Functions.GetQBPlayers()) do
        local item = GetPhoneItem(v)

        if item then
            if Config.Inventory == "ox_inventory" then
                if item.metadata.serial ~= nil or item.metadata.serial ~= "" then
                    if v.PlayerData.citizenid == senderCitizenid then
                        TriggerClientEvent("jpr-phonesystem:client:customnotification", v.PlayerData.source, {
                            app = "Custom", -- dont change
                            title = Config.Locales["69"],
                            img = "https://r2.fivemanage.com/PztPJI1MS4DPN1q0LBqaP/ey4BGlT.png",
                            text = Config.Locales["70"]..amount..Config.Locales["3"],
                            time = 2600,
                        })

                        break
                    end
                end
            else
                if item.info.serie ~= nil or item.info.serie ~= "" then
                    if v.PlayerData.citizenid == senderCitizenid then
                        TriggerClientEvent("jpr-phonesystem:client:customnotification", v.PlayerData.source, {
                            app = "Custom", -- dont change
                            title = Config.Locales["69"],
                            img = "https://r2.fivemanage.com/PztPJI1MS4DPN1q0LBqaP/ey4BGlT.png",
                            text = Config.Locales["70"]..amount..Config.Locales["3"],
                            time = 2600,
                        })

                        break
                    end
                end
            end
        end
    end
end

function SendWebhookSocial(app, webhook, message, photo, title, image, color, perfil, mostraravatar)
    local webhook = webhook
    if webhook == '' then
        return
    end

    local headers = {
        ['Content-Type'] = 'application/json'
    }
    local data = nil
    
    if perfil ~= nil and mostraravatar then
        if perfil == '' or perfil == nil or perfil == 'default' then
            perfil = 'https://r2.fivemanage.com/PztPJI1MS4DPN1q0LBqaP/8UaNhbE.png'
        end

        data = {
            ["username"] = app,
            ["embeds"] = {{
                    ["thumbnail"] = {
                        ["url"] = perfil
                    },
                    ["color"] = color
            }}
        }
    else
        data = {
            ["username"] = app,
            ["embeds"] = {{
                    ["color"] = color
            }}
        }
    end

    if image ~= "" and image ~= nil then
        if string.match(image, "%.webm$") then
            data['embeds'][1]['description'] = '**'..title..' ** \n ' ..message..'\n'..image
        else
            data['embeds'][1]['image'] = {['url'] = image}
            data['embeds'][1]['description'] = '**'..title..' ** \n ' ..message
        end
    else
        data['embeds'][1]['description'] = '**'..title..' ** \n ' ..message
    end
    
    PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode(data), headers)
end

function PegarVeiculosJogadorFunction(citizenid)
    local Veiculos = MySQL.Sync.fetchAll('SELECT * FROM player_vehicles WHERE citizenid = ?', {citizenid})

    return Veiculos
end

if Config.CustomEventsFramework == false then
    QBCore.Commands.Add(Config.BillingCommand, 'Bill A Player', {{name = 'id', help = 'Player ID'}, {name = 'amount', help = 'Amount'}}, false, function(source, args)
        local biller = QBCore.Functions.GetPlayer(source)
        local billed = QBCore.Functions.GetPlayer(tonumber(args[1]))
        local amount = tonumber(args[2])

        if biller.PlayerData.job.name == "police" or biller.PlayerData.job.name == 'ambulance' or biller.PlayerData.job.name == 'mechanic' or biller.PlayerData.job.name == 'tuners' or biller.PlayerData.job.name == 'burgershot' or biller.PlayerData.job.name == 'uwu' or biller.PlayerData.job.name == 'carsales' or biller.PlayerData.job.name == 'cardealer' or biller.PlayerData.job.name == 'weedshop' or biller.PlayerData.job.name == 'lsc' then
            if billed ~= nil then
                if biller.PlayerData.citizenid ~= billed.PlayerData.citizenid then
                    if amount and amount > 0 then
                        local idunico = tostring(QBCore.Shared.RandomInt(2) .. QBCore.Shared.RandomStr(3) .. QBCore.Shared.RandomInt(1) .. QBCore.Shared.RandomStr(2) .. QBCore.Shared.RandomInt(3) .. QBCore.Shared.RandomStr(4))
                        MySQL.insert(
                            'INSERT INTO jpr_phonesystem_faturas (citizenid, senderCitizenID, amount, society, joblabel, date, idfatura) VALUES (?, ?, ?, ?, ?, now(), ?)',
                            {billed.PlayerData.citizenid, biller.PlayerData.citizenid, amount, biller.PlayerData.job.name,
                             biller.PlayerData.job.label, idunico})
    
                        TriggerEvent('jpr-phonesystem:server:RefreshBank', billed.PlayerData.source, billed.PlayerData.citizenid)
                        
                        TriggerClientEvent('QBCore:Notify', source, 'Invoice Successfully Sent', 'success')
                        TriggerClientEvent('QBCore:Notify', billed.PlayerData.source, 'New Invoice Received')
                    else
                        TriggerClientEvent('QBCore:Notify', source, 'Must Be A Valid Amount Above 0', 'error')
                    end
                else
                    TriggerClientEvent('QBCore:Notify', source, 'You Cannot Bill Yourself', 'error')
                end
            else
                TriggerClientEvent('QBCore:Notify', source, 'Player Not Online', 'error')
            end
        else
            TriggerClientEvent('QBCore:Notify', source, 'No Access', 'error')
        end
    end)
else
    QBCore.Commands.Add(Config.BillingCommand, 'Bill A Player', {{name = 'id', help = 'Player ID'}, {name = 'amount', help = 'Amount'}}, false, function(source, args)
        local biller = exports[Config.CoreName]:GetPlayer(source)
        local billed = exports[Config.CoreName]:GetPlayer(tonumber(args[1]))
        local amount = tonumber(args[2])

        if biller.PlayerData.job.name == "police" or biller.PlayerData.job.name == 'ambulance' or biller.PlayerData.job.name == 'mechanic' or biller.PlayerData.job.name == 'tuners' or biller.PlayerData.job.name == 'burgershot' or biller.PlayerData.job.name == 'uwu' or biller.PlayerData.job.name == 'carsales' or biller.PlayerData.job.name == 'cardealer' or biller.PlayerData.job.name == 'weedshop' or biller.PlayerData.job.name == 'lsc' then
            if billed ~= nil then
                if biller.PlayerData.citizenid ~= billed.PlayerData.citizenid then
                    if amount and amount > 0 then
                        local idunico = tostring(QBCore.Shared.RandomInt(2) .. QBCore.Shared.RandomStr(3) .. QBCore.Shared.RandomInt(1) .. QBCore.Shared.RandomStr(2) .. QBCore.Shared.RandomInt(3) .. QBCore.Shared.RandomStr(4))
                        MySQL.insert(
                            'INSERT INTO jpr_phonesystem_faturas (citizenid, amount, society, joblabel, date, idfatura) VALUES (?, ?, ?, ?, now(), ?)',
                            {billed.PlayerData.citizenid, amount, biller.PlayerData.job.name,
                             biller.PlayerData.job.label, idunico})
    
                        TriggerEvent('jpr-phonesystem:server:RefreshBank', billed.PlayerData.source, billed.PlayerData.citizenid)
                        
                        TriggerClientEvent('QBCore:Notify', source, 'Invoice Successfully Sent', 'success')
                        TriggerClientEvent('QBCore:Notify', billed.PlayerData.source, 'New Invoice Received')
                    else
                        TriggerClientEvent('QBCore:Notify', source, 'Must Be A Valid Amount Above 0', 'error')
                    end
                else
                    TriggerClientEvent('QBCore:Notify', source, 'You Cannot Bill Yourself', 'error')
                end
            else
                TriggerClientEvent('QBCore:Notify', source, 'Player Not Online', 'error')
            end
        else
            TriggerClientEvent('QBCore:Notify', source, 'No Access', 'error')
        end
    end)
end

RegisterNetEvent('jpr-phonesystem:server:updateJPRHousingSystem', function(plate)
    MySQL.Sync.fetchAll('DELETE FROM jpr_housingsystem_houses_garages WHERE plate = ?', {plate})
end)

QBCore.Functions.CreateCallback('jpr-phonesystem:server:getServerTimeInfos', function(source, cb)
    local date = os.date("%d-%m-%Y")
    local time = os.date("%H:%M:%S")
    
    date = string.gsub(date, "(%d+)-(%d+)-(%d+)", function(day, month, year)
        return day.."-"..tostring(tonumber(month) - 1).."-"..year
    end)
    
    local data = {
        date = date,
        time = time
    }
    cb(data)
end)

QBCore.Functions.CreateCallback('jpr-phonesystem:server:GetInfosForMDT', function(source, cb)
    local vehicles = MySQL.Sync.fetchAll('SELECT * FROM player_vehicles', {})
    local players = MySQL.Sync.fetchAll('SELECT * FROM players', {})
    local houses = MySQL.Sync.fetchAll('SELECT * FROM player_houses', {})

    for k,v in pairs(houses) do
        if v then
            local houseInfo = MySQL.Sync.fetchAll('SELECT * FROM houselocations WHERE name = ?', {v.house})

            if (#houseInfo > 0) then
                v.label = houseInfo[1].label
                v.tier = houseInfo[1].tier

                houseInfo[1].coords = json.decode(houseInfo[1].coords)
                houseInfo[1].coords = json.encode(houseInfo[1].coords.enter)
                
                v.coords = houseInfo[1].coords
            end
        end
    end

    local data = {
        vehicles,
        players,
        houses
    }

    cb(data)
end)

function AntiErrorItemSerialValidation(item, player)
    if Config.UniquePhones then
        if item.info then
            return true
        else
            return false
        end 
    else
        return player.PlayerData.citizenid
    end
end

function ItemSerialValidation(item, player)
    if Config.UniquePhones then
        if item.info.serie ~= nil or item.info.serie ~= "" then
            return true
        else
            return false
        end 
    else
        return player.PlayerData.citizenid
    end
end

function GetSerialFromItem(item, player)
    if Config.UniquePhones then
        if item.info.serie ~= nil or item.info.serie ~= "" then
            return item.info.serie
        else
            return nil
        end 
    else
        return player.PlayerData.citizenid
    end
end

function GetPhoneItem(playerInfos)
    local phone = nil

    if playerInfos then
        for _, phoneItem in ipairs(Config.PhoneItems) do
            local item = playerInfos.Functions.GetItemByName(phoneItem)

            if item then
                phone = item

                break
            end
        end
    end

    return phone
end