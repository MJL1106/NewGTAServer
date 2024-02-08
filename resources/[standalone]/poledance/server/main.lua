local QBCore = exports['qb-core']:GetCoreObject()


RegisterServerEvent('ag-stripclub:pay', function(itemName)
    local source = source
    local Player = QBCore.Functions.GetPlayer(source)
   	if Player.PlayerData.money.cash > 500 then
		Player.Functions.RemoveMoney('cash', 500)
		TriggerEvent('qb-bossmenu:server:addAccountMoney', 'stripper', 500)
		TriggerClientEvent('ag-lapdance:lapdance', source)
		TriggerClientEvent("QBCore:Notify", source, { type = 'inform', text = 'You payed: 500 $' })
	elseif Player.PlayerData.money.bank > 500 then
		Player.Functions.RemoveMoney('bank', 500)
		TriggerClientEvent('ag-lapdance:lapdance', source)
		TriggerEvent('qb-bossmenu:server:addAccountMoney', 'stripper', 500)
		TriggerClientEvent("QBCore:Notify", source, { type = 'inform', text = 'You payed: 500 $' })
	end
end)