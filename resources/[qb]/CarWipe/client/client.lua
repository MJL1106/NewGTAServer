ESX = nil
local carWipeInProgress = false

if Config.UseESX then
    Citizen.CreateThread(function()
        while ESX == nil do
            TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
            Citizen.Wait(10)
        end
    end)
end

RegisterNetEvent("delall")
AddEventHandler("delall", function ()
    if carWipeInProgress then
        return -- Prevent starting a new wipe if one is already in progress
    end
    carWipeInProgress = true
    while carWipeInProgress do
        if Config.alerts then
            TriggerEvent('chat:addMessage', {
                template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(202, 45, 45, 1); border-radius: 3px;"><i class="fas fa-car-crash"></i> {0}:<br> {1}</div>',
                args = { 'CarWipe', 'A car wipe is coming in 5 minutes. If you don\'t want your car to disappear, sit in it' }
            })
            Citizen.Wait(60000)
            if (not carWipeInProgress) then
                carWipeInProgress = false
                print("wipe cancelled")
                return
            end
            -- TriggerEvent('chat:addMessage', {
            --     template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(202, 45, 45, 1); border-radius: 3px;"><i class="fas fa-car-crash"></i> {0}:<br> {1}</div>',
            --     args = { 'CarWipe', 'A car wipe is coming in 4 minutes. If you don\'t want your car to disappear, sit in it' }
            -- })
            Citizen.Wait(60000)
            if (not carWipeInProgress) then
                carWipeInProgress = false
                print("wipe cancelled")
                return
            end
            -- TriggerEvent('chat:addMessage', {
            --     template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(202, 45, 45, 1); border-radius: 3px;"><i class="fas fa-car-crash"></i> {0}:<br> {1}</div>',
            --     args = { 'CarWipe', 'A car wipe is coming in 3 minutes. If you don\'t want your car to disappear, sit in it' }
            -- })
            Citizen.Wait(60000)
            if (not carWipeInProgress) then
                carWipeInProgress = false
                print("wipe cancelled")
                return
            end
            -- TriggerEvent('chat:addMessage', {
            --     template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(202, 45, 45, 1); border-radius: 3px;"><i class="fas fa-car-crash"></i> {0}:<br> {1}</div>',
            --     args = { 'CarWipe', 'A car wipe is coming in 2 minutes. If you don\'t want your car to disappear, sit in it' }
            -- })
            Citizen.Wait(60000)
            if (not carWipeInProgress) then
                carWipeInProgress = false
                print("wipe cancelled")
                return
            end
            TriggerEvent('chat:addMessage', {
                template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(202, 45, 45, 1); border-radius: 3px;"><i class="fas fa-car-crash"></i> {0}:<br> {1}</div>',
                args = { 'CarWipe', 'A car wipe is coming in 1 minute. If you don\'t want your car to disappear, sit in it' }
            })
            Citizen.Wait(15000)
            if (not carWipeInProgress) then
                carWipeInProgress = false
                print("wipe cancelled")
                return
            end
            -- TriggerEvent('chat:addMessage', {
            --     template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(202, 45, 45, 1); border-radius: 3px;"><i class="fas fa-car-crash"></i> {0}:<br> {1}</div>',
            --     args = { 'CarWipe', 'A car wipe is coming in 45 seconds. If you don\'t want your car to disappear, sit in it' }
            -- })
            Citizen.Wait(15000)
            if (not carWipeInProgress) then
                carWipeInProgress = false
                print("wipe cancelled")
                return
            end
            -- TriggerEvent('chat:addMessage', {
            --     template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(202, 45, 45, 1); border-radius: 3px;"><i class="fas fa-car-crash"></i> {0}:<br> {1}</div>',
            --     args = { 'CarWipe', 'A car wipe is coming in 30 seconds. If you don\'t want your car to disappear, sit in it' }
            -- })
            Citizen.Wait(15000)
            if (not carWipeInProgress) then
                carWipeInProgress = false
                print("wipe cancelled")
                return
            end
            -- TriggerEvent('chat:addMessage', {
            --     template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(202, 45, 45, 1); border-radius: 3px;"><i class="fas fa-car-crash"></i> {0}:<br> {1}</div>',
            --     args = { 'CarWipe', 'A car wipe is coming in 15 seconds. If you don\'t want your car to disappear, sit in it' }
            -- })
            Citizen.Wait(5000)
            TriggerEvent('chat:addMessage', {
                template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(202, 45, 45, 1); border-radius: 3px;"><i class="fas fa-car-crash"></i> {0}:<br> {1}</div>',
                args = { 'CarWipe', 'A car wipe is coming in 10 seconds. If you don\'t want your car to disappear, sit in it' }
            })
            if (not carWipeInProgress) then
                carWipeInProgress = false
                print("wipe cancelled")
                return
            end
            Citizen.Wait(1000)
            if (not carWipeInProgress) then
                carWipeInProgress = false
                print("wipe cancelled")
                return
            end
            -- TriggerEvent('chat:addMessage', {
            --     template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(202, 45, 45, 1); border-radius: 3px;"><i class="fas fa-car-crash"></i> {0}:<br> {1}</div>',
            --     args = { 'CarWipe', 'A car wipe is coming in 9 seconds. If you don\'t want your car to disappear, sit in it' }
            -- })
            Citizen.Wait(1000)
            if (not carWipeInProgress) then
                carWipeInProgress = false
                print("wipe cancelled")
                return
            end
            -- TriggerEvent('chat:addMessage', {
            --     template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(202, 45, 45, 1); border-radius: 3px;"><i class="fas fa-car-crash"></i> {0}:<br> {1}</div>',
            --     args = { 'CarWipe', 'A car wipe is coming in 8 seconds. If you don\'t want your car to disappear, sit in it' }
            -- })
            Citizen.Wait(1000) 
            if (not carWipeInProgress) then
                carWipeInProgress = false
                print("wipe cancelled")
                return
            end
            -- TriggerEvent('chat:addMessage', {
            --     template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(202, 45, 45, 1); border-radius: 3px;"><i class="fas fa-car-crash"></i> {0}:<br> {1}</div>',
            --     args = { 'CarWipe', 'A car wipe is coming in 7 seconds. If you don\'t want your car to disappear, sit in it' }
            -- })
            Citizen.Wait(1000)
            -- TriggerEvent('chat:addMessage', {
            --     template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(202, 45, 45, 1); border-radius: 3px;"><i class="fas fa-car-crash"></i> {0}:<br> {1}</div>',
            --     args = { 'CarWipe', 'A car wipe is coming in 6 seconds. If you don\'t want your car to disappear, sit in it' }
            -- })
            Citizen.Wait(1000)
            -- TriggerEvent('chat:addMessage', {
            --     template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(202, 45, 45, 1); border-radius: 3px;"><i class="fas fa-car-crash"></i> {0}:<br> {1}</div>',
            --     args = { 'CarWipe', 'A car wipe is coming in 5 seconds. If you don\'t want your car to disappear, sit in it' }
            -- })
            Citizen.Wait(1000)
            -- TriggerEvent('chat:addMessage', {
            --     template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(202, 45, 45, 1); border-radius: 3px;"><i class="fas fa-car-crash"></i> {0}:<br> {1}</div>',
            --     args = { 'CarWipe', 'A car wipe is coming in 4 seconds. If you don\'t want your car to disappear, sit in it' }
            -- })
            Citizen.Wait(1000)
            -- TriggerEvent('chat:addMessage', {
            --     template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(202, 45, 45, 1); border-radius: 3px;"><i class="fas fa-car-crash"></i> {0}:<br> {1}</div>',
            --     args = { 'CarWipe', 'A car wipe is coming in 3 seconds. If you don\'t want your car to disappear, sit in it' }
            -- })
            Citizen.Wait(1000)
            -- TriggerEvent('chat:addMessage', {
            --     template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(202, 45, 45, 1); border-radius: 3px;"><i class="fas fa-car-crash"></i> {0}:<br> {1}</div>',
            --     args = { 'CarWipe', 'A car wipe is coming in 2 seconds. If you don\'t want your car to disappear, sit in it' }
            -- })
            Citizen.Wait(1000)
            if (not carWipeInProgress) then
                carWipeInProgress = false
                print("wipe cancelled")
                return
            end
            -- TriggerEvent('chat:addMessage', {
            --     template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(202, 45, 45, 1); border-radius: 3px;"><i class="fas fa-car-crash"></i> {0}:<br> {1}</div>',
            --     args = { 'CarWipe', 'A car wipe is coming in 1 second. If you don\'t want your car to disappear, sit in it' }
            -- })
        end
        Citizen.Wait(1000) 
        for vehicle in EnumerateVehicles() do            
            if (not IsPedAPlayer(GetPedInVehicleSeat(vehicle, -1))) then 
                if Config.OnlyWipeBroken == true then
                    if GetVehicleEngineHealth(vehicle) <= 100.0 then
                        SetVehicleHasBeenOwnedByPlayer(vehicle, false) 
                        SetEntityAsMissionEntity(vehicle, false, false) 
                        DeleteVehicle(vehicle)
                        if Config.UseESX then
                            ESX.Game.DeleteVehicle(vehicle)
                        end
                        DeleteEntity(vehicle)
                        DeleteVehicle(vehicle) 
                        if Config.UseESX then
                            ESX.Game.DeleteVehicle(vehicle)
                        end
                        DeleteEntity(vehicle)
                        if (DoesEntityExist(vehicle)) then 
                            DeleteVehicle(vehicle) 
                            if Config.UseESX then
                                ESX.Game.DeleteVehicle(vehicle)
                            end
                            DeleteEntity(vehicle)
                            DeleteVehicle(vehicle)
                            if Config.UseESX then 
                                ESX.Game.DeleteVehicle(vehicle)
                            end
                            DeleteEntity(vehicle)
                        end
                    end
                else
                    SetVehicleHasBeenOwnedByPlayer(vehicle, false) 
                    SetEntityAsMissionEntity(vehicle, false, false) 
                    DeleteVehicle(vehicle)
                    if Config.UseESX then
                        ESX.Game.DeleteVehicle(vehicle)
                    end
                    DeleteEntity(vehicle)
                    DeleteVehicle(vehicle) 
                    if Config.UseESX then
                        ESX.Game.DeleteVehicle(vehicle)
                    end
                    DeleteEntity(vehicle)
                    if (DoesEntityExist(vehicle)) then 
                        DeleteVehicle(vehicle) 
                        if Config.UseESX then
                            ESX.Game.DeleteVehicle(vehicle)
                        end
                        DeleteEntity(vehicle)
                        DeleteVehicle(vehicle)
                        if Config.UseESX then 
                            ESX.Game.DeleteVehicle(vehicle)
                        end
                        DeleteEntity(vehicle)
                    end
                end
                if Config.use10msdelay then
                    Citizen.Wait(10)
                end
            end
        end
        if Config.DoneNotify then
            TriggerEvent('chat:addMessage', {
                template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(202, 45, 45, 1); border-radius: 3px;"><i class="fas fa-car-crash"></i> {0}:<br> {1}</div>',
                args = { 'CarWipe', 'Carwipe completed. you can leave your vehicle again (if you were in it)!' }
            })
            carWipeInProgress = false
        end
    end
end)

RegisterNetEvent("cancelCarWipe")
AddEventHandler("cancelCarWipe", function()
    if carWipeInProgress then
        carWipeInProgress = false -- Signal to cancel the car wipe process
        -- Notify the player about the cancellation
        TriggerEvent('chat:addMessage', {
            template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(45, 202, 100, 1); border-radius: 3px;"><i class="fas fa-ban"></i> CarWipe:<br> The car wipe has been canceled!</div>',
        })
    end
end)
