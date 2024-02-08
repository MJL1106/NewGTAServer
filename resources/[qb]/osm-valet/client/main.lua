local QBCore = exports['qb-core']:GetCoreObject()

local ValetActive = false

local enroute = false
local GLVeh, GLDriver, GLData = nil, nil, nil

local driveSpeed = 30.0
local driveStyle = 786603
RegisterNetEvent('OSM-Client-CallValet')
AddEventHandler('OSM-Client-CallValet', function(data)
    local player = PlayerPedId()
    local playerPos = GetEntityCoords(player)
    local vData = data

    if not ValetActive then

        local GarageCoords = Config.Garages[vData.garage].spawnPoint
        local disGarage = #(playerPos - vector3(GarageCoords.x, GarageCoords.y, GarageCoords.z))

        if disGarage > 100 then 

            local spawnedVeh = nil
            
            local driver = nil 

            local driverhash = GetHashKey('csb_tomcasino')
            local vehhash = vData.hash

            while not HasModelLoaded(driverhash) and not HasModelLoaded(vehhash) do
                RequestModel(driverhash)
                RequestModel(vehhash)
                Citizen.Wait(500)
            end

            loadAnimDict('anim@arena@celeb@podium@no_prop@')
            local PlayerDis = #(playerPos - GetEntityCoords(spawnedVeh))

            QBCore.Functions.TriggerCallback('OSM-Server-ChargeValet', function(HasMoney)
                if HasMoney then
                    
                    QBCore.Functions.Notify('Your Vehicle is En-Route to your Location! Check Map for Location', 'success')

                    QBCore.Functions.SpawnVehicle(vData.vehicle, function(veh)
                        QBCore.Functions.TriggerCallback('qb-garage:server:GetVehicleProperties', function(properties)

                            QBCore.Functions.SetVehicleProperties(veh, properties)
                            SetVehicleNumberPlateText(veh, vData.plate)
                            SetEntityHeading(veh, Config.Garages[vData.garage].spawnPoint.w)
                            exports['LegacyFuel']:SetFuel(veh, vData.fuel)
                            SetEntityAsMissionEntity(veh, true, true)
                            TriggerServerEvent('qb-garage:server:updateVehicleState', 0, vData.plate, vData.garage)
                            TaskWarpPedIntoVehicle(driver, veh, -1)
                            TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
                            SetVehicleEngineOn(veh, true, true)

                            driver = CreatePedInsideVehicle(veh, 26, driverhash, -1, true, false)
                            print(driver)
                            SetEntityAsMissionEntity(driver, true, true)
                            spawnedVeh = veh


                        end, vData.plate)
                                Citizen.Wait(2000)

                                driveSpeed = 30.0
                                driveStyle = 2883621

                                if PlayerDis > 300 then
                                    driveSpeed = 60.0
                                end

                                enroute = true

                                TriggerEvent('OSM-Client-StartClientCooldown')

                                GLVeh, GLData = veh, vData
                                local carBlip = AddBlipForEntity(veh)  
                                SetBlipSprite(carBlip, 227)     
                                BeginTextCommandSetBlipName("STRING")
                                AddTextComponentString('VALET - '..vData.plate)
                                EndTextCommandSetBlipName(carBlip)
                                SetBlipColour(carBlip, 5)

                                while enroute do
                                    Citizen.Wait(200)
                                    if IsEntityDead(driver) or not DoesEntityExist(driver) then
                                        TriggerServerEvent('qb-garage:server:updateVehicleState', 1, GLData.plate, GLData.garage)
                                        DeleteEntity(GLVeh)
                                        DeleteEntity(GLDriver)
                                        GLVeh, GLDriver, GLData = nil, nil, nil
                                        spawnedVeh, driver, carBlip = nil, nil, nil
                                        enroute, ValetActive = false, false
                                        -- QBCore.Functions.Notify('Valet Died / Couldn\'t CompleteValet')
                                        TriggerEvent("OSM-Client-CallValetIfFailed", data)
                                        return
                                    end
                                    local player = PlayerPedId()
                                    local playerPos = GetEntityCoords(player)
                                    SetDriverAbility(driver, 1.0)        -- values between 0.0 and 1.0 are allowed.
                                    SetDriverAggressiveness(driver, 0.0)
                                    SetDriveTaskDrivingStyle(driver, 786603)
                                    GLDriver = driver
                                    print('CarSpeed', GetEntitySpeed(GLVeh))
                                    local distanceToTarget = #(playerPos - GetEntityCoords(spawnedVeh))
                                    if distanceToTarget > 25 and distanceToTarget < 150 then
                                        TaskVehicleDriveToCoordLongrange(driver, spawnedVeh, playerPos.x, playerPos.y, playerPos.z, 30.0, 2883621, true)
                                    else
                                        TaskVehicleDriveToCoordLongrange(driver, spawnedVeh, playerPos.x, playerPos.y, playerPos.z, driveSpeed, driveStyle, true)
                                    end
                                    if distanceToTarget < 25 then
                                        TaskVehicleTempAction(driver, spawnedVeh, 27, 2500)
                                        SetEntityHealth(driver, 2000)
                                        TaskLeaveVehicle(driver, spawnedVeh, 0)
                                        enroute = false
                                        GLVeh, GLDriver = nil, nil
                                    end
                                end

                                TriggerServerEvent('OSM-Server-CompleteValet', PlayerDis)
                                Citizen.Wait(3000)
                                ClearPedTasksImmediately(driver)
                                Citizen.Wait(1000)
                                TaskPlayAnim(driver, 'anim@arena@celeb@podium@no_prop@', 'regal_c_1st', 2.0, 2.0, -1, 0, 0, false, false, false)
                                RemoveBlip(carBlip)
                                Citizen.Wait(15000)
                                ClearPedTasks(driver)
                                TaskWanderStandard(driver, 10.0, 10)

                                spawnedVeh, driver, carBlip = nil, nil, nil
                            
                    end, Config.Garages[vData.garage].spawnPoint, true)
                 end
            end, PlayerDis) 
        else
            QBCore.Functions.Notify('You seem to be in Very Close Proximity of the Garage!', 'error', 5000)
        end
    else
        QBCore.Functions.Notify('You used Valet Service Recently! Please wait before using it again!', 'error', 8500)
    end

end)

RegisterNetEvent('OSM-Client-CallValetIfFailed')
AddEventHandler('OSM-Client-CallValetIfFailed', function(data)

    local player = PlayerPedId()
    local playerPos = GetEntityCoords(player)
    local vData = data

    if not ValetActive then
        local GarageCoords = nil
        local coords = GetEntityCoords(player,true)
        local found, outPos, outHeading = GetClosestVehicleNodeWithHeading(coords['x']+200, coords['y']+200, coords['z'], 1, 3.0, 0)

        if found then
            GarageCoords = vector4(outPos.x, outPos.y, outPos.z, outHeading)
        end

        local disGarage = #(playerPos - vector3(GarageCoords.x, GarageCoords.y, GarageCoords.z))

        if disGarage > 100 and GarageCoords ~= nil then  

            local spawnedVeh = nil
            
            local driver = nil 

            local driverhash = GetHashKey('csb_tomcasino')
            local vehhash = vData.hash

            while not HasModelLoaded(driverhash) and not HasModelLoaded(vehhash) do
                RequestModel(driverhash)
                RequestModel(vehhash)
                Citizen.Wait(500)
            end

            loadAnimDict('anim@arena@celeb@podium@no_prop@')
            local PlayerDis = #(playerPos - GetEntityCoords(spawnedVeh))

            -- QBCore.Functions.TriggerCallback('OSM-Server-ChargeValet', function(HasMoney)
            --     if HasMoney then
                    
                    QBCore.Functions.Notify('Your Vehicle is En-Route to your Location! Check Map for Location', 'success')

                    QBCore.Functions.SpawnVehicle(vData.vehicle, function(veh)
                        QBCore.Functions.TriggerCallback('qb-garage:server:GetVehicleProperties', function(properties)

                            QBCore.Functions.SetVehicleProperties(veh, properties)
                            SetVehicleNumberPlateText(veh, vData.plate)
                            SetEntityHeading(veh, GarageCoords.w)
                            exports['LegacyFuel']:SetFuel(veh, vData.fuel)
                            SetEntityAsMissionEntity(veh, true, true)
                            TriggerServerEvent('qb-garage:server:updateVehicleState', 0, vData.plate, vData.garage)
                            TaskWarpPedIntoVehicle(driver, veh, -1)
                            TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
                            SetVehicleEngineOn(veh, true, true)

                            driver = CreatePedInsideVehicle(veh, 26, driverhash, -1, true, false)
                            print(driver)
                            SetEntityAsMissionEntity(driver, true, true)
                            spawnedVeh = veh

                        end, vData.plate)

                                driveSpeed = 30.0
                                driveStyle = 2883621

                                if PlayerDis > 300 then
                                    driveSpeed = 60.0
                                end

                                enroute = true

                                TriggerEvent('OSM-Client-StartClientCooldown')

                                GLVeh, GLData = veh, vData
                                local carBlip = AddBlipForEntity(veh)  
                                SetBlipSprite(carBlip, 227)     
                                BeginTextCommandSetBlipName("STRING")
                                AddTextComponentString('VALET - '..vData.plate)
                                EndTextCommandSetBlipName(carBlip)
                                SetBlipColour(carBlip, 5)

                                while enroute do
                                    Citizen.Wait(200)
                                    if IsEntityDead(driver) or not DoesEntityExist(driver) then
                                        TriggerServerEvent('qb-garage:server:updateVehicleState', 1, GLData.plate, GLData.garage)
                                        DeleteEntity(GLVeh)
                                        DeleteEntity(GLDriver)
                                        GLVeh, GLDriver, GLData = nil, nil, nil
                                        spawnedVeh, driver, carBlip = nil, nil, nil
                                        enroute, ValetActive = false, false
                                        QBCore.Functions.Notify('Valet Died / Couldn\'t CompleteValet')
                                    end
                                    local player = PlayerPedId()
                                    local playerPos = GetEntityCoords(player)
                                    SetDriverAbility(driver, 1.0)        -- values between 0.0 and 1.0 are allowed.
                                    SetDriverAggressiveness(driver, 0.0)
                                    SetDriveTaskDrivingStyle(driver, 786603)
                                    GLDriver = driver
                                    -- print('CarSpeed', GetEntitySpeed(GLVeh))
                                    local distanceToTarget = #(playerPos - GetEntityCoords(spawnedVeh))
                                    if distanceToTarget > 25 and distanceToTarget < 150 then
                                        TaskVehicleDriveToCoordLongrange(driver, spawnedVeh, playerPos.x, playerPos.y, playerPos.z, 30.0, 2883621, true)
                                    else
                                        TaskVehicleDriveToCoordLongrange(driver, spawnedVeh, playerPos.x, playerPos.y, playerPos.z, driveSpeed, driveStyle, true)
                                    end
                                    if distanceToTarget < 25 then
                                        TaskVehicleTempAction(driver, spawnedVeh, 27, 2500)
                                        SetEntityHealth(driver, 2000)
                                        TaskLeaveVehicle(driver, spawnedVeh, 0)
                                        enroute = false
                                        GLVeh, GLDriver = nil, nil
                                    end
                                end

                                TriggerServerEvent('OSM-Server-CompleteValet', PlayerDis)
                                Citizen.Wait(3000)
                                ClearPedTasksImmediately(driver)
                                Citizen.Wait(1000)
                                TaskPlayAnim(driver, 'anim@arena@celeb@podium@no_prop@', 'regal_c_1st', 2.0, 2.0, -1, 0, 0, false, false, false)
                                RemoveBlip(carBlip)
                                Citizen.Wait(15000)
                                ClearPedTasks(driver)
                                TaskWanderStandard(driver, 10.0, 10)

                                spawnedVeh, driver, carBlip = nil, nil, nil
                            
                    end, GarageCoords, true)
            --      end
            -- end, PlayerDis) 
        else
            QBCore.Functions.Notify('You seem to be in Very Close Proximity of the Garage!', 'error', 5000)
        end
    else
        QBCore.Functions.Notify('You used Valet Service Recently! Please wait before using it again!', 'error', 8500)
    end

end)

function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(10)
    end
end

RegisterNetEvent('OSM-Client-StartClientCooldown')
AddEventHandler('OSM-Client-StartClientCooldown', function()
    ValetActive = true
    Citizen.Wait(C.ClientCooldownTime * 60000)
    ValetActive = false
end)


--------
local display = false

RegisterCommand("valetmenu", function(source, args)
        -- print(ValetActive, enroute, GLVeh, GLDriver)
        if ValetActive and enroute and GLVeh ~= nil and GLDriver ~= nil then 
            SetDisplay(not display)
        else
            QBCore.Functions.Notify('No Active Valet Found!')
        end
end)

RegisterNUICallback("exit", function(data)
    SetDisplay(false)
end)

RegisterNUICallback("main", function(data)
    if ValetActive and enroute and GLVeh and GLDriver then  
        local task = data.btn
        if task == 'slow' then 
            if driveSpeed - C.StepChangeSpeed > 0.0 then
                driveSpeed = driveSpeed - C.StepChangeSpeed
                QBCore.Functions.Notify('Valet Max Attainable Speed Decreased to '..driveSpeed..' MPH')
                if driveSpeed < 30.0 then 
                    driveStyle = 2883621
                end
            end
        elseif task == 'fast' then
            if driveSpeed < 200.0 then 
                driveSpeed = driveSpeed + C.StepChangeSpeed
                QBCore.Functions.Notify('Valet Max Attainable Speed Increased to '..driveSpeed..' MPH')
                if driveSpeed > 100.0 then
                    driveStyle = 1074528293
                end
                if driveSpeed > 30.0 then
                    driveStyle = 2883621
                end
            end
        elseif task == 'end' then
            TriggerServerEvent('qb-garage:server:updateVehicleState', 1, GLData.plate, GLData.garage)
            QBCore.Functions.Notify('You cancelled your Active Valet Service.')
            enroute = false
            DeleteEntity(GLVeh)
            DeleteEntity(GLDriver)
            GLVeh, GLDriver, GLData = nil, nil, nil
        else
            SetDisplay(false)
        end
    else
        QBCore.Functions.Notify('No Active Valet Found!')
    end
end)

function SetDisplay(bool)
    display = bool
    SetNuiFocus(bool, bool)
    SendNUIMessage({
        type = "qbvalet",
        status = bool,
    })
end
