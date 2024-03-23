local lastHungerNotification = 0
local lastThirstNotification = 0

CreateThread(function()
    while true do
        local sleep = 0
        if LocalPlayer.state.isLoggedIn then
            sleep = (1000 * 60) * QBCore.Config.UpdateInterval
            TriggerServerEvent('QBCore:UpdatePlayer')
        end
        Wait(sleep)
    end
end)

CreateThread(function()
    while true do
        if LocalPlayer.state.isLoggedIn then
            local currentTime = GetGameTimer()

            if QBCore.PlayerData.metadata['hunger'] <= 20 and not QBCore.PlayerData.metadata['isdead'] then
                if currentTime - lastHungerNotification > 120000 then -- 300 seconds or 5 minutes
                    QBCore.Functions.Notify("You are feeling hungry, you should eat something soon.", "primary", 7500)
                    lastHungerNotification = currentTime
                end
            end
    
            -- Check if thirst is low and not dead to display thirst notification
            if QBCore.PlayerData.metadata['thirst'] <= 10 and not QBCore.PlayerData.metadata['isdead'] then
                if currentTime - lastThirstNotification > 120000 then
                    QBCore.Functions.Notify("You are feeling thirsty, you should drink something soon.", "primary", 7500)
                    lastThirstNotification = currentTime
                end
            end

            if (QBCore.PlayerData.metadata['hunger'] <= 0 or QBCore.PlayerData.metadata['thirst'] <= 0) and not QBCore.PlayerData.metadata['isdead'] then
                local ped = PlayerPedId()
                local currentHealth = GetEntityHealth(ped)
                local decreaseThreshold = math.random(1, 3)
                SetEntityHealth(ped, currentHealth - decreaseThreshold)
            end
        end
        Wait(QBCore.Config.StatusInterval)
    end
end)
