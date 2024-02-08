

if Config.Framework == "esx" then
	ESX = exports["es_extended"]:getSharedObject()
elseif Config.Framework == "qb" then
	QBCore = exports['qb-core']:GetCoreObject()
end





if Config.Framework == "esx" then
	ESX.RegisterServerCallback("Check:Item", function(source, cb)
		local xPlayer = ESX.GetPlayerFromId(source)
		local Item = xPlayer.getInventoryItem(Config.ItemName).count
		if Item >= 1 then
			xPlayer.removeInventoryItem(Config.ItemName, 1)
			cb(true)
		else
			cb(false)
		end
	end)
elseif Config.Framework == "qb" then
	QBCore.Functions.CreateCallback('Check:Item', function(_, cb, plate)
		local Player = QBCore.Functions.GetPlayer(_)
		local Item = Player.Functions.GetItemByName(Config.ItemName)
		if Item.amount >= 1 then
			Player.Functions.RemoveItem(Config.ItemName, 1)
			cb(true)
		else
			cb(false)
		end
	end)
end








RegisterServerEvent('gilo-segnalatore:CreaBlip')
AddEventHandler('gilo-segnalatore:CreaBlip', function(veh)
	if Config.Framework == "esx" then
		local xPlayers = ESX.GetPlayers()
		for i=1, #xPlayers, 1 do
			local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
			for f,k in pairs(Config.WhitelistedJobs) do
				if xPlayer.job.name == k then
					TriggerClientEvent('gilo-segnalatore:SetTrack', xPlayers[i],veh)
				end
			end
		end
	else
		for _, v in pairs(QBCore.Functions.GetPlayers()) do
			local Player = QBCore.Functions.GetPlayer(v)
			if Player ~= nil then
				for f,k in pairs(Config.WhitelistedJobs) do
					if Player.PlayerData.job.name == k then
						TriggerClientEvent('gilo-segnalatore:SetTrack', v,veh)
					end
				end
			end
		end
	end
end)

RegisterServerEvent('gilo-segnalatore:rimuoviTracker')
AddEventHandler('gilo-segnalatore:rimuoviTracker', function(gps)
	if Config.Framework == "esx" then
		local xPlayers = ESX.GetPlayers()
		for i=1, #xPlayers, 1 do
			local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
			if xPlayer.job.name == 'police' then
				TriggerClientEvent('gilo-segnalatore:SegnalatoreRimosso', xPlayers[i],gps)
			end
		end
	else
		for _, v in pairs(QBCore.Functions.GetPlayers()) do
			local Player = QBCore.Functions.GetPlayer(v)
			if Player ~= nil then
				for f,k in pairs(Config.WhitelistedJobs) do
					if Player.PlayerData.job.name == k then
						TriggerClientEvent('gilo-segnalatore:SegnalatoreRimosso', Player,gps)
					end
				end
			end
		end
	end
end)

RegisterServerEvent('gilo-segnalatore:PlayWithinDistance')
AddEventHandler('gilo-segnalatore:PlayWithinDistance', function(maxDistance, soundFile, soundVolume)
    TriggerClientEvent('gilo-segnalatore:playsoundlocal', -1, source, maxDistance, soundFile, soundVolume)
end)

RegisterServerEvent('gilo-segnalatore:TrovaVeicoloTrakkato')
AddEventHandler('gilo-segnalatore:TrovaVeicoloTrakkato', function(vehicle)
    TriggerClientEvent('gilo-segnalatore:playsoundontrackedcar', -1, vehicle)
end)
