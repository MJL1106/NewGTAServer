local QBCore = exports['qb-core']:GetCoreObject()
local cashA = 200 				--<<how much minimum you can get from a robbery
local cashB = 300				--<< how much maximum you can get from a robbery
local ScashA = 5000 			--<<how much minimum you can get from a robbery
local ScashB = 8500				--<< how much maximum you can get from a robbery

RegisterNetEvent('qb-storerobbery:server:takeMoney', function(register, isDone, usingAdvanced)
    local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	-- Add some stuff if you want, this here above the if statement will trigger every 2 seconds of the animation when robbing a cash register.
    if isDone then
	    local bags = math.random(2500,3000)
	    Player.Functions.AddMoney('cash', bags)
        local chance = usingAdvanced and 20 or 10
        if math.random(1, 100) <= chance then 
            Player.Functions.AddItem("safecracker", 1)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["safecracker"], 'add') 
        end
    end
end)

RegisterNetEvent('qb-storerobbery:server:setRegisterStatus', function(register)
      -- Set all registers to robbed status and assign reset time
    for regId, _ in pairs(Config.Registers) do
        Config.Registers[regId].robbed = true
        Config.Registers[regId].time = Config.resetTime
        TriggerClientEvent('qb-storerobbery:client:setRegisterStatus', -1, regId, Config.Registers[regId])
    end

    -- Set a global timeout to reset the robbed status for all registers
    Citizen.SetTimeout(Config.resetTime, function()
        for regId, _ in pairs(Config.Registers) do
            Config.Registers[regId].robbed = false
            -- Optionally reset the time or handle it differently based on your logic
            Config.Registers[regId].time = 0  -- Reset or adjust based on your needs
            TriggerClientEvent('qb-storerobbery:client:setRegisterStatus', -1, regId, Config.Registers[regId])
        end
    end)
end)

RegisterNetEvent('qb-storerobbery:server:setSafeStatus', function(safe)
    for safeId, _ in pairs(Config.Safes) do
        TriggerClientEvent('qb-storerobbery:client:setSafeStatus', -1, safeId, true)
        Config.Safes[safeId].robbed = true
    end

    -- Set a timeout to reset the robbed status for all safes
    SetTimeout((60000)*30, function()
        for safeId, _ in pairs(Config.Safes) do
            TriggerClientEvent('qb-storerobbery:client:setSafeStatus', -1, safeId, false)
            Config.Safes[safeId].robbed = false

        end
        TriggerClientEvent('qb-storerobbery:client:resetLootState', -1)
    end)
end)

RegisterNetEvent('qb-storerobbery:server:SafeReward', function(safe)
    local src = source
	local Player = QBCore.Functions.GetPlayer(src)
    local rolexAmount = math.random(3,6)
        
    Player.Functions.AddItem('rolex', rolexAmount)
	TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['rolex'], "add")
        
    if math.random(1, 100) <= 10 then
    		Player.Functions.AddItem('laptop_green', 1)
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['laptop_green'], "add")
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
