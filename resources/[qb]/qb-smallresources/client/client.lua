


function AddTextEntry(key, value)
	Citizen.InvokeNative(GetHashKey("ADD_TEXT_ENTRY"), key, value)
end

-- Uncomment if you want add Players Steam or connected players

local id = PlayerId()
local serverID = GetPlayerServerId(PlayerId())
players = {}
for i = 0, 255 do
    if NetworkIsPlayerActive( i ) then
        table.insert( players, i )
    end
end

Citizen.CreateThread(function()
  AddTextEntry('FE_THDR_GTAO', '~y~BanglaPixel')
  AddTextEntry('PM_PANE_LEAVE', '~o~Disconnect')
  AddTextEntry('PM_PANE_QUIT', '~r~Leave The City')
  AddTextEntry('PM_SCR_MAP', '~b~Map')
  AddTextEntry('PM_SCR_GAM', '~r~Game')
  AddTextEntry('PM_SCR_INF', '~g~Info')
  AddTextEntry('PM_SCR_SET', '~p~Settings')
  AddTextEntry('PM_SCR_STA', '~f~Statistics')
  AddTextEntry('PM_SCR_RPL', '~y~Publisher ∑')
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
            if IsPedInAnyVehicle(PlayerPedId()) then
                SetUserRadioControlEnabled(false)
                if GetPlayerRadioStationName() ~= nil then
                SetVehRadioStation(GetVehiclePedIsIn(PlayerPedId()),"OFF")
                end
        end
    end
end)

AddEventHandler('onClientMapStart', function()
    Citizen.CreateThread(function()
      local display = true
  
      TriggerEvent('logo:display', true)
    end)
  end)
  
  RegisterNetEvent('logo:display')
  AddEventHandler('logo:display', function(value)
    SendNUIMessage({
      type = "logo",
      display = value
    })
  end)
  
  function ShowInfo(text, state)
    SetTextComponentFormat("STRING")
    AddTextComponentString(text)
    DisplayHelpTextFromStringLabel(0, state, 0, -1)
  end

function fpson()
    SetTimecycleModifier("cinema")
end

function fpsoff()
        
    SetTimecycleModifier("default")
end

RegisterCommand('fpson', function()
    fpson()
end)

RegisterCommand('fpsoff', function()
    fpsoff()
end)

Citizen.CreateThread(function()
    local angle = 0.0
    local speed = 0.0
    while true do
        Citizen.Wait(0)
        local veh = GetVehiclePedIsUsing(PlayerPedId())
        if DoesEntityExist(veh) then
            local tangle = GetVehicleSteeringAngle(veh)
            if tangle > 10.0 or tangle < -10.0 then
                angle = tangle
            end
            speed = GetEntitySpeed(veh)
            local vehicle = GetVehiclePedIsIn(PlayerPedId(), true)
            if speed < 0.1 and DoesEntityExist(vehicle) and not GetIsTaskActive(PlayerPedId(), 151) and not GetIsVehicleEngineRunning(vehicle) then
                SetVehicleSteeringAngle(GetVehiclePedIsIn(PlayerPedId(), true), angle)
            end
        end
    end
end)
CreateThread(function()
    while true do
        Wait(0)
        local ped = PlayerPedId()
            if IsPedArmed(ped, 6) then
            DisableControlAction(1, 140, true)
            DisableControlAction(1, 141, true)
            DisableControlAction(1, 142, true)
        end
    end
end)
Citizen.CreateThread(function()
	TriggerEvent('chat:addSuggestion', '/twt', 'Creates an tweet!', {
		{name = 'Message', help = 'Enter a Message!'},
	})
	TriggerEvent('chat:addSuggestion', '/do', 'Creates a local DO Message!', {
		{name = 'Message', help = 'Enter a Message!'},
	})
    TriggerEvent('chat:addSuggestion', '/ooc', 'Creates a an ooc Message!', {
		{name = 'Message', help = 'Enter a Message!'},
	})

end)
---vanilla sound off
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if NetworkIsSessionStarted() then
            SetStaticEmitterEnabled('LOS_SANTOS_VANILLA_UNICORN_01_STAGE', false)
            SetStaticEmitterEnabled('LOS_SANTOS_VANILLA_UNICORN_02_MAIN_ROOM', false)
            SetStaticEmitterEnabled('LOS_SANTOS_VANILLA_UNICORN_03_BACK_ROOM', false)
            return
        end
    end
end)

----heli sound effect
function EnableSubmix()
    radioEffectId = CreateAudioSubmix('Radio')
    SetAudioSubmixEffectRadioFx(radioEffectId, 0)
    SetAudioSubmixEffectRadioFx(0, 0)
    SetAudioSubmixEffectParamInt(0, 0, `default`, 1)
    SetAudioSubmixEffectParamFloat(0, 0, `freq_low`, 0.0)
    SetAudioSubmixEffectParamFloat(0, 0, `freq_hi`, 10000.0)
    SetAudioSubmixEffectParamFloat(0, 0, `fudge`, 0.0)
    SetAudioSubmixEffectParamFloat(0, 0, `rm_mix`, 0.2)
end

function DisableSubmix()
    SetAudioSubmixEffectRadioFx(0, 0)
    SetAudioSubmixEffectParamInt(0, 0, `enabled`, 0)
end


local soundmix = false
CreateThread(function()
    while true do
        Wait(5000)
        ped = PlayerPedId()
        currentVehicle = GetVehiclePedIsIn(ped, false)
        local vehmodel = GetEntityModel(currentVehicle)
        if IsThisModelAHeli(vehmodel) or IsThisModelAPlane(vehmodel) then
            if IsPedInAnyVehicle(ped, false) then
                if GetIsVehicleEngineRunning(currentVehicle) then
                    if soundmix == false then
                        EnableSubmix()
                        soundmix = true
                    end
                else
                    if soundmix == true then 
                        DisableSubmix()
                        soundmix = false
                    end        
                end 
            else   
                if soundmix == true then 
                    DisableSubmix() 
                    soundmix = false 
                end                
            end
        end
        if not IsPedInAnyVehicle(ped, false) then
            DisableSubmix()
            soundmix = false
        end   
    end
end)

----disable combatwalk

Citizen.CreateThread(function()
  while true do
      Citizen.Wait(15)
      local ped = PlayerPedId()
      if IsPedUsingActionMode(ped) then
          SetPedUsingActionMode(ped, -1, -1, 1)
      end
  end
end)

