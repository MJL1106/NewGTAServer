RegisterNetEvent('qb-bankrobbery:client:robberyCall', function(type, key, streetLabel, coords)
    if PlayerJob.name == 'police' or PlayerJob.name == 'bcso' or PlayerJob.name == 'sast' and onDuty then
        local cameraId = 4
        local bank = 'Fleeca'
        if type == 'small' then
            cameraId = Config.FleecaBanks[key]['camId']
            bank = 'Fleeca'
            PlaySound(-1, 'Lose_1st', 'GTAO_FM_Events_Soundset', 0, 0, 1)
            exports['ps-dispatch']:FleecaBankRobbery(cameraId,coords)
        elseif type == 'paleto' then
            cameraId = Config.PaletoBank['camId']
            bank = 'Blaine County Savings'
            PlaySound(-1, 'Lose_1st', 'GTAO_FM_Events_Soundset', 0, 0, 1)
            Wait(100)
            PlaySoundFrontend( -1, 'Beep_Red', 'DLC_HEIST_HACKING_SNAKE_SOUNDS', 1 )
            Wait(100)
            PlaySound(-1, 'Lose_1st', 'GTAO_FM_Events_Soundset', 0, 0, 1)
            Wait(100)
            PlaySoundFrontend( -1, 'Beep_Red', 'DLC_HEIST_HACKING_SNAKE_SOUNDS', 1 )
            exports['ps-dispatch']:PaletoBankRobbery(camId,coords)
        elseif type == 'pacific' then
            cameraId = Config.PacificBank['camId']
            bank = 'Pacific Standard Bank'
            PlaySound(-1, 'Lose_1st', 'GTAO_FM_Events_Soundset', 0, 0, 1)
            Wait(100)
            PlaySoundFrontend( -1, 'Beep_Red', 'DLC_HEIST_HACKING_SNAKE_SOUNDS', 1 )
            Wait(100)
            PlaySound(-1, 'Lose_1st', 'GTAO_FM_Events_Soundset', 0, 0, 1)
            Wait(100)
            PlaySoundFrontend( -1, 'Beep_Red', 'DLC_HEIST_HACKING_SNAKE_SOUNDS', 1 )
            exports['ps-dispatch']:PacificBankRobbery(camId,coords)
        end
        -- local transG = 250
        -- local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
        -- SetBlipSprite(blip, 487)
        -- SetBlipColour(blip, 4)
        -- SetBlipDisplay(blip, 4)
        -- SetBlipAlpha(blip, transG)
        -- SetBlipScale(blip, 1.2)
        -- SetBlipFlashes(blip, true)
        -- BeginTextCommandSetBlipName('STRING')
        -- AddTextComponentString('10-90: Bank Robbery')
        -- EndTextCommandSetBlipName(blip)
        -- while transG ~= 0 do
        --     Wait(180 * 4)
        --     transG = transG - 1
        --     SetBlipAlpha(blip, transG)
        --     if transG == 0 then
        --         SetBlipSprite(blip, 2)
        --         RemoveBlip(blip)
        --         return
        --     end
        -- end
    end
end)