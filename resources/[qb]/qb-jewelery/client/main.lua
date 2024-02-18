local QBCore = exports['qb-core']:GetCoreObject()
local firstAlarm = false
local smashing = false

-- Functions

local function loadParticle()
	if not HasNamedPtfxAssetLoaded("scr_jewelheist") then
		RequestNamedPtfxAsset("scr_jewelheist")
    end
    while not HasNamedPtfxAssetLoaded("scr_jewelheist") do
		Wait(0)
    end
    SetPtfxAssetNextCall("scr_jewelheist")
end

local function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Wait(3)
    end
end

local function validWeapon()
    local ped = PlayerPedId()
    local pedWeapon = GetSelectedPedWeapon(ped)

    for k, _ in pairs(Config.WhitelistedWeapons) do
        if pedWeapon == k then
            return true
        end
    end
    return false
end

local function IsWearingHandshoes()
    local armIndex = GetPedDrawableVariation(PlayerPedId(), 3)
    local model = GetEntityModel(PlayerPedId())
    local retval = true
    if model == `mp_m_freemode_01` then
        if Config.MaleNoHandshoes[armIndex] ~= nil and Config.MaleNoHandshoes[armIndex] then
            retval = false
        end
    else
        if Config.FemaleNoHandshoes[armIndex] ~= nil and Config.FemaleNoHandshoes[armIndex] then
            retval = false
        end
    end
    return retval
end

local function smashVitrine(k)
    if not firstAlarm then
        TriggerServerEvent('police:server:policeAlert', 'Robbery in progress')
        firstAlarm = true
    end

    QBCore.Functions.TriggerCallback('qb-jewellery:server:getCops', function(cops)
        if cops >= Config.RequiredCops then
            local animDict = "missheist_jewel"
            local animName = "smash_case"
            local ped = PlayerPedId()
            local plyCoords = GetOffsetFromEntityInWorldCoords(ped, 0, 0.6, 0)
            local pedWeapon = GetSelectedPedWeapon(ped)
            if math.random(1, 100) <= 80 and not IsWearingHandshoes() then
                TriggerServerEvent("evidence:server:CreateFingerDrop", plyCoords)
            elseif math.random(1, 100) <= 5 and IsWearingHandshoes() then
                TriggerServerEvent("evidence:server:CreateFingerDrop", plyCoords)
                QBCore.Functions.Notify(Lang:t('error.fingerprints'), "error")
            end
            smashing = true
            QBCore.Functions.Progressbar("smash_vitrine", Lang:t('info.progressbar'), Config.WhitelistedWeapons[pedWeapon]["timeOut"], false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {}, {}, {}, function() -- Done
                TriggerServerEvent('qb-jewellery:server:vitrineReward', k)
                TriggerServerEvent('qb-jewellery:server:setTimeout')

                smashing = false
                TaskPlayAnim(ped, animDict, "exit", 3.0, 3.0, -1, 2, 0, 0, 0, 0)
            end, function() -- Cancel
                TriggerServerEvent('qb-jewellery:server:setVitrineState', "isBusy", false, k)
                smashing = false
                TaskPlayAnim(ped, animDict, "exit", 3.0, 3.0, -1, 2, 0, 0, 0, 0)
            end)
            TriggerServerEvent('qb-jewellery:server:setVitrineState', "isBusy", true, k)

            CreateThread(function()
                while smashing do
                    loadAnimDict(animDict)
                    TaskPlayAnim(ped, animDict, animName, 3.0, 3.0, -1, 2, 0, 0, 0, 0 )
                    Wait(500)
                    TriggerServerEvent("InteractSound_SV:PlayOnSource", "breaking_vitrine_glass", 0.25)
                    loadParticle()
                    StartParticleFxLoopedAtCoord("scr_jewel_cab_smash", plyCoords.x, plyCoords.y, plyCoords.z, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
                    Wait(2500)
                end
            end)
        else
            QBCore.Functions.Notify(Lang:t('error.minimum_police', {value = Config.RequiredCops}), 'error')
        end
    end)
end

-- Events

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
	QBCore.Functions.TriggerCallback('qb-jewellery:server:getVitrineState', function(result)
		Config.Locations = result
	end)
end)

RegisterNetEvent('qb-jewellery:client:setVitrineState', function(stateType, state, k)
    Config.Locations[k][stateType] = state
end)

-- Threads

CreateThread(function()
    local Dealer = AddBlipForCoord(Config.JewelleryLocation["coords"]["x"], Config.JewelleryLocation["coords"]["y"], Config.JewelleryLocation["coords"]["z"])
    SetBlipSprite (Dealer, 617)
    SetBlipDisplay(Dealer, 4)
    SetBlipScale  (Dealer, 0.7)
    SetBlipAsShortRange(Dealer, true)
    SetBlipColour(Dealer, 3)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName("Vangelico Jewelry")
    EndTextCommandSetBlipName(Dealer)
end)

local listen = false
local function Listen4Control(case)
    listen = true
    CreateThread(function()
        while listen do
            if IsControlJustPressed(0, 38) then
                listen = false
                if not Config.Locations[case]["isBusy"] and not Config.Locations[case]["isOpened"] then
                    exports['qb-core']:KeyPressed()
                        if validWeapon() then
                            smashVitrine(case)
                        else
                            QBCore.Functions.Notify(Lang:t('error.wrong_weapon'), 'error')
                        end
                    else
                        exports['qb-core']:DrawText(Lang:t('general.drawtextui_broken'), 'left')
                    end
                end
            Wait(1)
        end
    end)
end

CreateThread(function()
    if Config.UseTarget then
        for k, v in pairs(Config.Locations) do
            exports["qb-target"]:AddBoxZone("jewelstore" .. k, v.coords, 1, 1, {
                name = "jewelstore" .. k,
                heading = 40,
                minZ = v.coords.z - 1,
                maxZ = v.coords.z + 1,
                debugPoly = false
            }, {
                options = {
                    {
                        type = "client",
                        icon = "fa fa-hand",
                        label = Lang:t('general.target_label'),
                        action = function()
                            if validWeapon() then
                                smashVitrine(k)
                            else
                                QBCore.Functions.Notify(Lang:t('error.wrong_weapon'), 'error')
                            end
                        end,
                        canInteract = function()
                            if v["isOpened"] or v["isBusy"] then
                                return false
                            end
                            return true
                        end,
                    }
                },
                distance = 1.5
            })
        end
    else
        for k, v in pairs(Config.Locations) do
            local boxZone = BoxZone:Create(v.coords, 1, 1, {
                name="jewelstore"..k,
                heading = 40,
                minZ = v.coords.z - 1,
                maxZ = v.coords.z + 1,
                debugPoly = false
            })
            boxZone:onPlayerInOut(function(isPointInside)
                if isPointInside then
                    Listen4Control(k)
                    exports['qb-core']:DrawText(Lang:t('general.drawtextui_grab'), 'left')
                else
                    listen = false
                    exports['qb-core']:HideText()
                end
            end)
        end
    end
end)

CreateThread(function()
    for k,v in pairs(Config.ThermiteLocations['thermite']) do
        exports['qb-target']:AddBoxZone('OpenDoor'..math.random(1,100), vector3(Config.ThermiteLocations['thermite'][k]['coords'].x, Config.ThermiteLocations['thermite'][k]['coords'].y, Config.ThermiteLocations['thermite'][k]['coords'].z), 0.4, 1.2, {
            name = 'OpenDoor'..math.random(1,100), 
            heading = Config.ThermiteLocations['thermite'][k]['coords'].w,
            debugPoly = false, 
            minZ = Config.ThermiteLocations['thermite'][k]['coords'].z-1,
            maxZ = Config.ThermiteLocations['thermite'][k]['coords'].z+1,
            }, {
            options = { 
            { 
                type = 'client',
                event = 'jewstore:thermitedoor',
                icon = 'fas fa-bomb',
                label = 'Blow Fuse',
                job = all,
            }
            },
            distance = 1.2,
        })
    end
end)

local totalCompleted = 0
RegisterNetEvent('jewstore:thermitedoor', function()
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    for k,v in pairs(Config.ThermiteLocations['thermite']) do
        local Dist = #(coords - vector3(v['coords'].x, v['coords'].y, v['coords'].z))
        if Dist <= 1.5 then
            SetEntityHeading(ped, Config.ThermiteLocations['thermite'][k]['coords'].w)
            TriggerServerEvent('qb-bankrobbery:server:RemoveThermite')
            exports['memorygame']:thermiteminigame(1, 3, 4, 7,
            function() -- success
                totalCompleted = totalCompleted + 1
                QBCore.Functions.Notify("Thermite Placed", 'success', 4500)
                local loc = Config.ThermiteLocations['thermite'][k]['anim']
                local rotx, roty, rotz = table.unpack(vec3(GetEntityRotation(ped)))
                local bagscene = NetworkCreateSynchronisedScene(loc.x, loc.y, loc.z, rotx, roty, rotz, 2, false, false, 1065353216, 0, 1.3)
                local bag = CreateObject(GetHashKey('hei_p_m_bag_var22_arm_s'), loc.x, loc.y, loc.z,  true,  true, false)
                SetEntityCollision(bag, false, true)
                NetworkAddPedToSynchronisedScene(ped, bagscene, 'anim@heists@ornate_bank@thermal_charge', 'thermal_charge', 1.5, -4.0, 1, 16, 1148846080, 0)
                NetworkAddEntityToSynchronisedScene(bag, bagscene, 'anim@heists@ornate_bank@thermal_charge', 'bag_thermal_charge', 4.0, -8.0, 1)
                NetworkStartSynchronisedScene(bagscene)
                Wait(1500)
                local x, y, z = table.unpack(GetEntityCoords(ped))
                local thermal_charge = CreateObject(GetHashKey('hei_prop_heist_thermite'), x, y, z + 0.2,  true,  true, true)
            
                SetEntityCollision(thermal_charge, false, true)
                AttachEntityToEntity(thermal_charge, ped, GetPedBoneIndex(ped, 28422), 0, 0, 0, 0, 0, 200.0, true, true, false, true, 1, true)
                Wait(4000)
    
            
                DetachEntity(thermal_charge, 1, 1)
                FreezeEntityPosition(thermal_charge, true)
                Wait(100)
                DeleteObject(bag)
                ClearPedTasks(ped)
            
                Wait(100)
                RequestNamedPtfxAsset('scr_ornate_heist')
                while not HasNamedPtfxAssetLoaded('scr_ornate_heist') do
                    Wait(1)
                end
    
                ptfx = vector3(Config.ThermiteLocations['thermite'][k]['effect'].x, Config.ThermiteLocations['thermite'][k]['effect'].y, Config.ThermiteLocations['thermite'][k]['effect'].z)
                SetPtfxAssetNextCall('scr_ornate_heist')
                local effect = StartParticleFxLoopedAtCoord('scr_heist_ornate_thermal_burn', ptfx, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
                Wait(3000)
                StopParticleFxLooped(effect, 0)
                DeleteObject(thermal_charge)
    

                
                if totalCompleted == 3 then
                    TriggerServerEvent('police:server:policeAlert', 'Suspicious Activity: Electrical Fuse')
                    TriggerServerEvent('qb-doorlock:server:updateState', 'JeweleryDoorMain', false, false, false, true, false, false)
                    QBCore.Functions.Notify('Security System Cracked', 'error', 4500)
                end
            end,
            function() -- failure
                QBCore.Functions.Notify('Hack failed', 'error', 4500)
    
            end)
        end
    end
end)
