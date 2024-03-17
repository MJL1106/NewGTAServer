local CurrentCallsign = {}

local function checkVehicleList(curVeh)
  for _, v in pairs(Config.Vehicles) do
    if GetEntityModel(curVeh) == v then
      return true
    end
  end

  return false
end

local function hasJob()
  if not Framework == 'qb' or not Framework == "esx" then
    return false
  end

  if Framework == "qb" then
    for k, v in pairs(Config.Jobs) do
      if QBCore.Functions.GetPlayerData().job.name == k and QBCore.Functions.GetPlayerData().job.grade.level >= v then
        return true
      end
    end
  elseif Framework == "esx" then
    for k, v in pairs(Config.Jobs) do
      if ESX.PlayerData.job.name == k and ESX.PlayerData.job.grade >= v then
        return true
      end
    end
  end

  return false
end

RegisterCommand("nk", function()
  if not Framework == "qb" or not Framework == "esx" then
    TriggerEvent("chatMessage", "^1[ERROR]^7 You must be using either QBCore or ESX to use this command.")
    return
  end

  if not hasJob() then
    TriggerEvent("chatMessage", "^1[ERROR]^7 You must be a police officer to use this command.")
    return
  end

  local playerPed = PlayerPedId()
  local vehicle = GetVehiclePedIsIn(playerPed, false)

  if vehicle == 0 then
    TriggerEvent("chatMessage", "^1[ERROR]^7 You must be in a vehicle to use this command.")
    return
  end

  if not checkVehicleList(vehicle) then
    TriggerEvent("chatMessage", "^1[ERROR]^7 You must be in a vehicle that has a callsign to use this command.")
    return
  end

  SetVehicleModKit(vehicle, 0)

  CurrentCallsign = {
    GetVehicleMod(vehicle, 8),
    GetVehicleMod(vehicle, 9),
    GetVehicleMod(vehicle, 10)
  }

  SendNUIMessage({
    type = "openCallsignMenu",
    payload = {
      currentCallsign = CurrentCallsign
    }
  })

  SetNuiFocus(true, true)
end, false)

RegisterNUICallback("closeCallsignMenu", function(_, cb)
  local playerPed = PlayerPedId()
  local vehicle = GetVehiclePedIsIn(playerPed, false)

  if vehicle == 0 then
    cb(0)
    return
  end

  SetVehicleModKit(vehicle, 0)
  SetVehicleMod(vehicle, 8, CurrentCallsign[1], false)
  SetVehicleMod(vehicle, 9, CurrentCallsign[2], false)
  SetVehicleMod(vehicle, 10, CurrentCallsign[3], false)

  SetNuiFocus(false, false)

  cb(0)
end)

RegisterNUICallback("setCallsign", function(payload, cb)
  local playerPed = PlayerPedId()
  local vehicle = GetVehiclePedIsIn(playerPed, false)

  if vehicle == 0 then
    cb(0)
    return
  end

  SetVehicleMod(vehicle, payload.index, payload.number, false)

  cb(0)
end)

RegisterNUICallback("clearCallsigns", function(_, cb)
  local playerPed = PlayerPedId()
  local vehicle = GetVehiclePedIsIn(playerPed, false)

  if vehicle == 0 then
    cb(0)
    return
  end

  SetVehicleMod(vehicle, 8, -1, false)
  SetVehicleMod(vehicle, 9, -1, false)
  SetVehicleMod(vehicle, 10, -1, false)

  cb(0)
end)

RegisterNUICallback("saveCallsignMenu", function(_, cb)
  SetNuiFocus(false, false)

  cb(0)
end)