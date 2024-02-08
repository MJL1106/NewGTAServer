local inizializzato = false
local gpsveicoloselezionato = nil
local SuonoDistacco = false
local SuonoAttacco = false
local SuonoConnessionePersa = false
local SuonoDisconnessione = false
local RangeOut = 3
local VolumeOutput = 1
local VeicoloTracciato = nil
local Connesso = false
if Config.Framework == "esx" then
	ESX = exports["es_extended"]:getSharedObject()
elseif Config.Framework == "qb" then
	QBCore = exports['qb-core']:GetCoreObject()
end

RegisterKeyMapping('MettiGps', 'Toggle Gps on Vehicle', 'keyboard', Config.KeyToAttachGps)

RegisterCommand("MettiGps",function()
	exports[GetCurrentResourceName()]:MettiGps()
end)

exports("MettiGps", function()
	if inizializzato and VeicoloTracciato ~= nil then
		TriggerServerEvent("gilo-segnalatore:rimuoviTracker", gpsveicoloselezionato)
		inizializzato = false
	elseif not inizializzato and not Connesso then
		if IsPedInAnyVehicle(PlayerPedId()) then
			VeicoloTracciato = GetVeicoloTracciato(GetVehiclePedIsIn(PlayerPedId()))
		else
			VeicoloTracciato = GetVeicoloTracciato(PlayerPedId())
		end
		if IsEntityAVehicle(VeicoloTracciato) then
			ItemCheck(VeicoloTracciato)
			
			if b then
				inizializzato = true
				Connesso = false
				Notifications(Config.Translations[Config.Lenguage]["installed"], "success", 2000)
				TriggerServerEvent('gilo-segnalatore:CreaBlip', VeicoloTracciato)
				SuonoDistacco = true
			else
				Notifications(Config.Translations[Config.Lenguage]["no_item"], "error", 2000)
			end
		end
	elseif not inizializzato and Connesso then
		Notifications(Config.Translations[Config.Lenguage]["interrupted"], "alert", 2000)
		SuonoDisconnessione = true
	  	Connesso = false
	end

end)

exports("MEttiGPsAlVeicolo", function(VeicoloTracciato2)
	inizializzato = true
	Connesso = false
	Notifications(Config.Translations[Config.Lenguage]["installed"], "success", 2000)
	TriggerServerEvent('gilo-segnalatore:CreaBlip', VeicoloTracciato2)
	SuonoDistacco = true
end)

function ItemCheck(VeicoloTracciato)
    local check = false
    if Config.UseItem then
		if Config.Framework == "qb" then
			QBCore.Functions.TriggerCallback('Check:Item', function(ris)
				if ris then
					
                    exports[GetCurrentResourceName()]:MEttiGPsAlVeicolo(VeicoloTracciato)
                end
			end)
		else
			ESX.TriggerServerCallback("Check:Item",function(ris)
				if ris then
                    exports[GetCurrentResourceName()]:MEttiGPsAlVeicolo(VeicoloTracciato)
                end
			end)
		end
	else
		return true
	end
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if SuonoDistacco then
			TriggerServerEvent('gilo-segnalatore:TrovaVeicoloTrakkato', VeicoloTracciato)
			Citizen.Wait(500)
			SuonoDistacco = false
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if SuonoAttacco and not SuonoDistacco then
			if IsPedInAnyPoliceVehicle(PlayerPedId()) then
				TriggerServerEvent('gilo-segnalatore:PlayWithinDistance', RangeOut, 'connected', VolumeOutput)
				Citizen.Wait(500)
			end
			SuonoAttacco = false
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if SuonoDisconnessione and not SuonoDistacco and not SuonoAttacco then
			TriggerServerEvent('gilo-segnalatore:PlayWithinDistance', RangeOut, 'disconnected', VolumeOutput)
			Citizen.Wait(500)
			SuonoDisconnessione = false
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if SuonoConnessionePersa then
			TriggerServerEvent('gilo-segnalatore:PlayWithinDistance', RangeOut, 'disconnected', VolumeOutput)
			Citizen.Wait(500)
			TriggerServerEvent('gilo-segnalatore:PlayWithinDistance', RangeOut, 'disconnected', VolumeOutput)
			Citizen.Wait(500)
			TriggerServerEvent('gilo-segnalatore:PlayWithinDistance', RangeOut, 'disconnected', VolumeOutput)
			Citizen.Wait(500)
			SuonoConnessionePersa = false
		end
	end
end)

RegisterNetEvent("gilo-segnalatore:SetTrack")
AddEventHandler("gilo-segnalatore:SetTrack", function(veh)
  	gps = AddBlipForEntity(veh)
  	SetBlipSprite(gps, 42)
  	SetBlipScale(gps, 0.7)
  	if not Connesso then
    	Connesso = true
		Notifications(Config.Translations[Config.Lenguage]["gps_connected"], "success", 2000)
		SuonoAttacco = true
    	if inizializzato then
    	  gpsveicoloselezionato = gps
    	  SetBlipRoute(gps, true)
    	  SetEntityAsMissionEntity(veh, true, true)
    	end

    	while inizializzato or Connesso do
    	  	Citizen.Wait(0)
    	  	if veh ~= nil then
    	      	if not IsEntityAVehicle(veh) then
    	          	Notifications(Config.Translations[Config.Lenguage]["signal_lost"], "alert", 2000)
					SuonoConnessionePersa = true
					inizializzato = false
    	          	Connesso = false
    	      	end
    	  	else
    	    	inizializzato = false
    	    	Connesso = false
    	  	end
    	end
  	end
end)

RegisterNetEvent("gilo-segnalatore:SegnalatoreRimosso")
AddEventHandler("gilo-segnalatore:SegnalatoreRimosso", function(gps)
    RemoveBlip(gps)
    Notifications(Config.Translations[Config.Lenguage]["gps_off"], "alert", 2000)
	SuonoDisconnessione = true
    Connesso = false
end)

function GetVeicoloTracciato(e)
	local coord1 = GetOffsetFromEntityInWorldCoords(e, 0.0, 1.0, 1.0)
	local coord2 = GetOffsetFromEntityInWorldCoords(e, 0.0, 25.0, 0.0)
	local rayresult = StartShapeTestCapsule(coord1, coord2, 3.0, 10, e, 7)
    local a, b, c, d, e = GetShapeTestResult(rayresult)
    if DoesEntityExist(e) then
        return e
    else
        return nil
    end
end



RegisterNetEvent('gilo-segnalatore:playsoundontrackedcar')
AddEventHandler('gilo-segnalatore:playsoundontrackedcar', function(searchedveh)
	local ped = PlayerPedId()
	if IsPedInAnyVehicle(ped, true) then
		currentcar = GetVehiclePedIsIn(ped, false)
		if searchedveh == currentcar then
			TriggerServerEvent('gilo-segnalatore:PlayWithinDistance', 10, 'connected', VolumeOutput)
		end
	else
		TriggerServerEvent('gilo-segnalatore:PlayWithinDistance', 10, 'connected', VolumeOutput)
	end
end)

RegisterNetEvent('gilo-segnalatore:playsoundlocal')
AddEventHandler('gilo-segnalatore:playsoundlocal', function(playerNetId, maxDistance, soundFile, soundVolume)
    local lCoords = GetEntityCoords(PlayerPedId())
    local eCoords = GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(playerNetId)))
    local distIs  = Vdist(lCoords.x, lCoords.y, lCoords.z, eCoords.x, eCoords.y, eCoords.z)
		if distIs <= maxDistance then
			SendNUIMessage({
				transactionType     = 'playSound',
				transactionFile     = soundFile,
				transactionVolume   = soundVolume
			})
	  end
end)
