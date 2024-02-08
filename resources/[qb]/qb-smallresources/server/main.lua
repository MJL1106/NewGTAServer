local QBCore = exports['qb-core']:GetCoreObject()
local VehicleNitrous = {}

RegisterNetEvent('tackle:server:TacklePlayer', function(playerId)
    TriggerClientEvent("tackle:client:GetTackled", playerId)
end)

QBCore.Functions.CreateCallback('nos:GetNosLoadedVehs', function(_, cb)
    cb(VehicleNitrous)
end)

QBCore.Commands.Add("id", "Check Your ID #", {}, false, function(source)
    TriggerClientEvent('QBCore:Notify', source,  "ID: "..source)
end)

QBCore.Functions.CreateUseableItem("harness", function(source, item)
    TriggerClientEvent('seatbelt:client:UseHarness', source, item)
end)

RegisterNetEvent('equip:harness', function(item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if not Player then return end

    if not Player.PlayerData.items[item.slot].info.uses then
        Player.PlayerData.items[item.slot].info.uses = Config.HarnessUses - 1
        Player.Functions.SetInventory(Player.PlayerData.items)
    elseif Player.PlayerData.items[item.slot].info.uses == 1 then
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items['harness'], "remove")
        Player.Functions.RemoveItem('harness', 1)
    else
        Player.PlayerData.items[item.slot].info.uses -= 1
        Player.Functions.SetInventory(Player.PlayerData.items)
    end
end)

RegisterNetEvent('seatbelt:DoHarnessDamage', function(hp, data)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if not Player then return end

    if hp == 0 then
        Player.Functions.RemoveItem('harness', 1, data.slot)
    else
        Player.PlayerData.items[data.slot].info.uses -= 1
        Player.Functions.SetInventory(Player.PlayerData.items)
    end
end)

RegisterNetEvent('qb-carwash:server:washCar', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if not Player then return end

    if Player.Functions.RemoveMoney('cash', Config.DefaultPrice, "car-washed") then
        TriggerClientEvent('qb-carwash:client:washCar', src)
    elseif Player.Functions.RemoveMoney('bank', Config.DefaultPrice, "car-washed") then
        TriggerClientEvent('qb-carwash:client:washCar', src)
    else
        TriggerClientEvent('QBCore:Notify', src, Lang:t("error.dont_have_enough_money"), 'error')
    end
end)

QBCore.Functions.CreateCallback('smallresources:server:GetCurrentPlayers', function(_, cb)
    local TotalPlayers = 0
    local players = QBCore.Functions.GetPlayers()
    for _ in pairs(players) do
        TotalPlayers += 1
    end
    cb(TotalPlayers)
end)


RegisterCommand('twt', function(source, args, rawCommand)
    local src = source
    local playerName 
    local Player 
    local time = os.date('%I:%M:%p')
    Player = QBCore.Functions.GetPlayer(tonumber(source))
    playerName = Player.PlayerData.charinfo.firstname .. " ".. Player.PlayerData.charinfo.lastname
    local msg = rawCommand:sub(4)
		local user = '^5TWITTER ^0| ' .. time .. ' |^0 ' .. playerName .. '^0:'
            TriggerClientEvent('chat:addMessage', -1, { 
            args = { user, msg },
            template = '<div style="position: relative; padding: 0.5vw; margin-left: 0.25vw; margin-bottom: 0.10vw; margin-right: 0.25vw; margin-top: 0.1vw; width:fit-content; background-color: #2F3136; border-radius: 8px; overflow:hidden;"><div class="chat-tweet twt"><i class="fab fa-twitter"></i> <span style="position:absolute; left:-0px; top:-1px; width: 4px; color: transparent; background-color: rgb(47, 147, 200); height: 100%;">. </span> <strong>{0}       {1}</div>',
        })
end)


-- DO COMMAND
RegisterCommand('do', function(source, args, rawCommand)
    local src = source
    local playerName 
    local Player 
    Player = QBCore.Functions.GetPlayer(tonumber(source))
    playerName = Player.PlayerData.charinfo.firstname .. " ".. Player.PlayerData.charinfo.lastname
    local msg = rawCommand:sub(3)
		local user = '^3DO ^0| ' .. source .. ' |^0 ' .. playerName .. '^0:'
            TriggerClientEvent('chat:addMessage', -1, { 
            args = { user, msg },
            template = '<div style="position: relative; padding: 0.5vw; margin-left: 0.25vw; margin-bottom: 0.10vw; margin-right: 0.25vw; margin-top: 0.1vw; width:fit-content; background-color: #2F3136; border-radius: 8px; overflow:hidden;"> <span style="position:absolute; left:-0px; top:-1px; width: 4px; color: transparent; background-color: rgb(47, 147, 200); height: 100%;">. </span> <strong>{0}       {1}</div>',
        })
end)

-- OOC COMMAND
RegisterCommand('ooc', function(source, args, rawCommand)
    local src = source
    local playerName 
    local Player 
    Player = QBCore.Functions.GetPlayer(tonumber(source))
    playerName = Player.PlayerData.charinfo.firstname .. " ".. Player.PlayerData.charinfo.lastname
    local msg = rawCommand:sub(4)
		local user = '^4OOC ^0| ' .. source .. ' |^0 ' .. playerName .. '^0:'
            TriggerClientEvent('chat:addMessage', -1, { 
            args = { user, msg },
            template = '<div style="position: relative; padding: 0.5vw; margin-left: 0.25vw; margin-bottom: 0.10vw; margin-right: 0.25vw; margin-top: 0.1vw; width:fit-content; background-color: #2F3136; border-radius: 8px; overflow:hidden;"> <span style="position:absolute; left:-0px; top:-1px; width: 4px; color: transparent; background-color: rgb(47, 147, 200); height: 100%;">. </span> <strong>{0}       {1}</div>',
        })
end)
