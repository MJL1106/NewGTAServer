local QBCore = exports['qb-core']:GetCoreObject()

kinghunter = false

CreateThread(function()
    while true do
		Wait(0)
        if Config['PoleDance']['Enabled'] then
            for k, v in pairs(Config['PoleDance']['Locations']) do
                if #(GetEntityCoords(PlayerPedId()) - v['Position']) <= 1.0 then
                    DrawText3D(v['Position'], Strings['Pole_Dance'], 0.35)
                    if IsControlJustReleased(0, 51) and not kinghunter then
						kinghunter = true
                        LoadDict('mini@strip_club@pole_dance@pole_dance' .. v['Number'])
                        local scene = NetworkCreateSynchronisedScene(v['Position'], vector3(0.0, 0.0, 0.0), 2, false, false, 1065353216, 0, 1.3)
                        NetworkAddPedToSynchronisedScene(PlayerPedId(), scene, 'mini@strip_club@pole_dance@pole_dance' .. v['Number'], 'pd_dance_0' .. v['Number'], 1.5, -4.0, 1, 1, 1148846080, 0)
                        NetworkStartSynchronisedScene(scene)
					elseif IsControlJustReleased(0, 51) and kinghunter then
					kinghunter = false
					ClearPedTasksImmediately(PlayerPedId())
                    end
                end
            end
        end
    end
end)

LoadDict = function(Dict)
    while not HasAnimDictLoaded(Dict) do 
        Wait(0)
        RequestAnimDict(Dict)
    end
end

DrawText3D = function(coords, text, scale)
	local onScreen,_x,_y=World3dToScreen2d(coords.x, coords.y, coords.z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())

    SetTextScale(scale, scale)
    SetTextFont(4)
    SetTextProportional(2)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 41, 41, 125)
end


exports['qb-target']:AddBoxZone("stripperbossmenu", vector3(96.14, -1292.82, 29.27), 0.6, 0.6, {
    name="stripperbossmenu",
    heading=310,
    debugPoly=false,
    minZ=29.07,
    maxZ=29.67,
}, {
    options = {
        {
            event = "qb-bossmenu:client:openMenu",
            icon = "fas fa-box",
            label = "BossMenu",
            job = {["stripclub"] = 4,}
        },
    },
    distance = 2.5
})