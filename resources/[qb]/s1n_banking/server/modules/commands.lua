if QBCore then
    QBCore.Commands.Add('givecash', 'Give Cash', { { name = 'id', help = 'Player ID' }, { name = 'amount', help = 'Amount' } }, true, function(source, args)
        local qbPlayer = QBCore.Functions.GetPlayer(source)
        if not qbPlayer then return end

        local qbTarget = QBCore.Functions.GetPlayer(tonumber(args[1]))

        if not qbTarget then
            return TriggerClientEvent('QBCore:Notify', source, "There is no online player with this ID.", 'error')
        end

        local amount = tonumber(args[2])

        if not amount then
            return TriggerClientEvent('QBCore:Notify', source, "The amount is invalid or missing.", 'error')
        end

        if amount <= 0 then
            return TriggerClientEvent('QBCore:Notify', source, "The amount needs to be higher than 0.", 'error')
        end

        if qbPlayer.PlayerData.money.cash < amount then
            return TriggerClientEvent('QBCore:Notify', source, "You don't have enough cash on you.", 'error')
        end

        local playerPed = GetPlayerPed(source)
        local playerCoords = GetEntityCoords(playerPed)

        local targetPed = GetPlayerPed(tonumber(args[1]))
        local targetCoords = GetEntityCoords(targetPed)

        if #(playerCoords - targetCoords) > 5 then
            return TriggerClientEvent('QBCore:Notify', source, "The target player is too far away.", 'error')
        end

        qbPlayer.Functions.RemoveMoney('cash', amount, 'Cash transfer')
        qbTarget.Functions.AddMoney('cash', amount, 'Cash transfer')

        TriggerClientEvent('QBCore:Notify', source, ("You successfully sent $%s."):format(amount), 'success')
        TriggerClientEvent('QBCore:Notify', qbTarget.PlayerData.source, ("You just received $%s"):format(amount), 'success')
    end)
end