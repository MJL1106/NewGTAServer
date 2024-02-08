local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('stripclub', function()
    RequestNamedPtfxAsset("core")
        cash = CreateObject(GetHashKey("prop_cash_pile_01"), 0, 0, 0, true, true, true) 
            AttachEntityToEntity(cash, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 18905), 0.12, 0.028, 0.001, 300.00, 180.0, 20.0, true, true, false, true, 1, true)
            local lib, anim = 'anim@mp_player_intcelebrationfemale@raining_cash', 'raining_cash' do
            Wait(900)
			RequestAnimDict("anim@mp_player_intcelebrationfemale@raining_cash")
			while not HasAnimDictLoaded("anim@mp_player_intcelebrationfemale@raining_cash") do
			Wait(100)
			end
            TaskPlayAnim(PlayerPedId(), "anim@mp_player_intcelebrationfemale@raining_cash", "raining_cash", 8.0, -8.0, -1, 0, 0, false, false, false)	
            Wait(1000)
            UseParticleFxAssetNextCall("core")
            local fx = StartParticleFxNonLoopedOnEntity("ent_brk_banknotes", PlayerPedId(), 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 1.0, false, false, false)  --(effectName, entity, offsetX, offsetY, offsetZ, rotX, rotY, rotZ, scale, axisX, axisY, axisZ);   
            end
            TriggerServerEvent('ag-stripclub:pay')
            Wait(4000)
            DeleteEntity(cash)
    Wait(1000)
end)

exports['qb-target']:AddBoxZone("stripclub", vector3(114.25, -1286.28, 28.26), 0.6, 0.6, {
    name="stripclub",
    heading=300,
    debugPoly=false,
    minZ=28.06,
    maxZ=28.66,
}, {
    options = {
        {
            event = "stripclub",
            icon = "fas fa-box",
            label = "Make It Rain Money",
        },
    },
    distance = 2.5
})

RegisterCommand('dropcash', function()
    TriggerEvent('stripclub')
end)