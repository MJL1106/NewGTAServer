local QBCore = exports['qb-core']:GetCoreObject()
local cashA = 200 				--<<how much minimum you can get from a robbery
local cashB = 300				--<< how much maximum you can get from a robbery
local ScashA = 5000 			--<<how much minimum you can get from a robbery
local ScashB = 8500				--<< how much maximum you can get from a robbery

RegisterNetEvent('qb-storerobbery:server:takeMoney', function(register, isDone)
    local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	-- Add some stuff if you want, this here above the if statement will trigger every 2 seconds of the animation when robbing a cash register.
    if isDone then
	local bags = math.random(500,1500)
	Player.Functions.AddMoney('cash', bags)
        if math.random(1, 100) <= 10 then
            -- Give Special Item (Safe Cracker)
            Player.Functions.AddItem("safecracker", 1)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["safecracker"], 'add')
        end
    end
end)

RegisterNetEvent('qb-storerobbery:server:setRegisterStatus', function(register)
    Config.Registers[register].robbed   = true
    Config.Registers[register].time     = Config.resetTime
    TriggerClientEvent('qb-storerobbery:client:setRegisterStatus', -1, register, Config.Registers[register])
end)

RegisterNetEvent('qb-storerobbery:server:setSafeStatus', function(safe)
    TriggerClientEvent('qb-storerobbery:client:setSafeStatus', -1, safe, true)
    Config.Safes[safe].robbed = true

    SetTimeout(math.random(1800,1900), function()
        TriggerClientEvent('qb-storerobbery:client:setSafeStatus', -1, safe, false)
        Config.Safes[safe].robbed = false
    end)
end)

RegisterNetEvent('qb-storerobbery:server:SafeReward', function(safe)
    local src = source
	local Player = QBCore.Functions.GetPlayer(src)
    local ammoBullets = math.random(1,3)
        
    Player.Functions.AddItem('pistol_ammo', ammoBullets)
	TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['pistol_ammo'], "add")
        
    Player.Functions.AddItem('rolex', ammoBullets)
	TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['rolex'], "add")
        
    local luck = math.random(1, 100)
    if luck <= 20 then
    		Player.Functions.AddItem('weapon_snspistol', 1)
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['weapon_snspistol'], "add")
    end
    if luck <= 25 then
            Player.Functions.AddItem('pistol_extendedclip', 1)
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['pistol_extendedclip'], "add")
    end
    if luck <= 5 then
    		Player.Functions.AddItem('weapon_pistol', 1)
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['weapon_pistol'], "add")
    end
   	
end)

RegisterNetEvent('qb-storerobbery:server:callCops', function(type, safe, streetLabel, coords)
    local cameraId = 4
    if type == "safe" then
        cameraId = Config.Safes[safe].camId
    else
        cameraId = Config.Registers[safe].camId
    end
    local alertData = {
        title = "10-33 | Shop Robbery",
        coords = {x = coords.x, y = coords.y, z = coords.z},
        description = "Someone Is Trying To Rob A Store At "..streetLabel.." (CAMERA ID: "..cameraId..")"
    }
    TriggerClientEvent("qb-storerobbery:client:robberyCall", -1, type, safe, streetLabel, coords)
    TriggerClientEvent("qb-phone:client:addPoliceAlert", -1, alertData)
end)

CreateThread(function()
    while true do
        local toSend = {}
        for k, v in ipairs(Config.Registers) do

            if Config.Registers[k].time > 0 and (Config.Registers[k].time - Config.tickInterval) >= 0 then
                Config.Registers[k].time = Config.Registers[k].time - Config.tickInterval
            else
                if Config.Registers[k].robbed then
                    Config.Registers[k].time = 0
                    Config.Registers[k].robbed = false
					toSend[#toSend+1] = Config.Registers[k]
                end
            end
        end

        if #toSend > 0 then
            --The false on the end of this is redundant
            TriggerClientEvent('qb-storerobbery:client:setRegisterStatus', -1, toSend, false)
        end

        Wait(Config.tickInterval)
    end
end)

QBCore.Functions.CreateCallback('qb-storerobbery:server:getRegisterStatus', function(source, cb)
    cb(Config.Registers)
end)

QBCore.Functions.CreateCallback('qb-storerobbery:server:getSafeStatus', function(source, cb)
    cb(Config.Safes)
end)

RegisterNetEvent('qb-storerobbery:server:CheckItem', function()
    local Player = QBCore.Functions.GetPlayer(source)
    local ItemData = Player.Functions.GetItemByName("safecracker")
    if ItemData ~= nil then
        TriggerClientEvent('qb-storerobbery:client:hacksafe', source)
    else
        TriggerClientEvent('QBCore:Notify', source, "You appear to be missing something?")
    end
end)
