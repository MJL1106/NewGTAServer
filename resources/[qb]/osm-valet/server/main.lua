local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent('OSM-Server-CallValet')
AddEventHandler('OSM-Server-CallValet', function(plate)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local plate = plate
    local vehData = GetStatus(plate)
    local status = vehData.state
    if status == 1 then 
        TriggerClientEvent('OSM-Client-CallValet', src, vehData)
        -- TriggerClientEvent('QBCore:Notify', src, 'Your Vehicle is En-Route to your Location! Check Map for Location', 'success')
    elseif status == 2 then
        TriggerClientEvent('QBCore:Notify', src, 'Your Car is in the Impound Lot.', 'error')
    else
        TriggerClientEvent('QBCore:Notify', src, 'Your Car seems already out on Streets.', 'error')
    end
end)

QBCore.Functions.CreateCallback('OSM-Server-ChargeValet', function(source, cb, distance)
    local Player = QBCore.Functions.GetPlayer(source)
    local citizenid = Player.PlayerData.citizenid

    local driverName = C.DriverNames[math.random(1, #(C.DriverNames))]

    local lev = GetLevel(citizenid)

    local valetCost = math.floor((distance * 0.00014) * C.Levels[lev].CostPerMile)
    
    if C.Levels[lev].randomBonus then 
        if math.random(1,100) > C.Levels[lev].bonusChance then
            valetCost = valetCost - ((valetCost / 100) * C.Levels[lev].bonusPerc)
            TriggerClientEvent('QBCore:Notify', source, 'Level '..lev..' | Special Discount has been Applied', 12000)
        end
    end

    if Player.PlayerData.money.bank >= valetCost then
        Player.Functions.RemoveMoney('bank', valetCost, 'valet-payment')
        TriggerClientEvent('QBCore:Notify', source, 'You Paid $'..valetCost..' for Valet Service. | Driver Name : '..driverName, 'success', 15000)
        cb(true)
    else
        TriggerClientEvent('QBCore:Notify', source, 'Seems Like you don\'t have enough Bank Balance. | Min. Required $'..valetCost, 'success')
        cb(false)
    end
end)

RegisterServerEvent('OSM-Server-CompleteValet')
AddEventHandler('OSM-Server-CompleteValet', function(distance)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local citizenid = Player.PlayerData.citizenid
    TriggerClientEvent('QBCore:Notify', src, 'Your Valet has Succesfully Reached your Location!', 'success', 8000)
    if distance > C.MinimumDisforLevel then 
        local level1 = SetTotalCalls(citizenid)
    end
end)

--OSM-Server:CompleteValet

function GetStatus(plate)
    local val = {}
    MySQL.query('SELECT * FROM player_vehicles WHERE plate = ?', {plate}, function(result)
        if result[1] ~= nil then
            val = result[1]
        end
    end)
    -- 0 - out, 1 garage, 2 impound'
    Wait(500)
    return val
end

function GetLevel(citizenid)
    local lev = 1
    MySQL.query('SELECT * FROM osm_valet WHERE cid = ?', {citizenid}, function(result)
        if result[1] ~= nil then
            lev = result[1].level
        end
    end)
    return lev
end

function SetTotalCalls(cid)
    local level, totalcalls = 1, 1
    MySQL.query('SELECT * FROM osm_valet WHERE cid = ?', {cid}, function(result)
        if result[1] ~= nil then
            level = result[1].level
            totalcalls = result[1].totalcalls + 1
            if (level+1) <= #(C.Levels) then 
                if totalcalls >= C.Levels[(level+1)].requiredCalls then
                    level = level + 1
                end
            end
            MySQL.update.await('UPDATE osm_valet SET level = ?, totalcalls = ? WHERE cid = ?',
            {level, totalcalls, cid})
        else
            MySQL.insert.await('INSERT INTO osm_valet (cid, level, totalcalls) VALUES (?, ?, ?)', {
                cid,
                level,
                totalcalls
            })
        end
    end)
    return level
end

-- 7623
-- 7634