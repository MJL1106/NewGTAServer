local QBCore = exports['qb-core']:GetCoreObject()

local Webhooks = {
    ['default'] = 'https://ty/1179508780233412676/80CPHo0vnSC8LhV5l7ZGWjGDj_NXYswUYUaNFoLRPHgI-CXZVvjvDOgR0Y1mnxfz1JdW',
    ['testwebhook'] = 'https://ty/1179508780233412676/80CPHo0vnSC8LhV5l7ZGWjGDj_NXYswUYUaNFoLRPHgI-CXZVvjvDOgR0Y1mnxfz1JdW',
    ['playermoney'] = 'https://ty/1181170406300848238/u-nSBI2bPNHP4cR_qcu3B8jTWqV8soPl7qJGbWKimb839wTW-VUnfobLvgAedvfBGHDT',
    ['playerinventory'] = 'https://ty/1181170593983377418/SBff3kva--8AtZ7M6HyZXhpejmzDmqrGYC3OiYXvG9wVc7DuUctjuquKRDymQnku4M_K',
    ['robbing'] = 'https://ty/1181170888574504980/rtpQWFPqwLTTO2Vb_aKTvA4LPJjAQbbsZgJ7TSkRZRWvNjiwqMp9FkZrBSUANKSU_okJ',
    ['cuffing'] = 'https://ty/1181170888574504980/rtpQWFPqwLTTO2Vb_aKTvA4LPJjAQbbsZgJ7TSkRZRWvNjiwqMp9FkZrBSUANKSU_okJ',
    ['drop'] = 'https://ty/1181170593983377418/SBff3kva--8AtZ7M6HyZXhpejmzDmqrGYC3OiYXvG9wVc7DuUctjuquKRDymQnku4M_K',
    ['trunk'] = 'https://ty/1181170593983377418/SBff3kva--8AtZ7M6HyZXhpejmzDmqrGYC3OiYXvG9wVc7DuUctjuquKRDymQnku4M_K',
    ['stash'] = 'https://ty/1181170593983377418/SBff3kva--8AtZ7M6HyZXhpejmzDmqrGYC3OiYXvG9wVc7DuUctjuquKRDymQnku4M_K',
    ['glovebox'] = 'https://ty/1181170593983377418/SBff3kva--8AtZ7M6HyZXhpejmzDmqrGYC3OiYXvG9wVc7DuUctjuquKRDymQnku4M_K',
    ['banking'] = 'https://ty/1181170406300848238/u-nSBI2bPNHP4cR_qcu3B8jTWqV8soPl7qJGbWKimb839wTW-VUnfobLvgAedvfBGHDT',
    ['vehicleshop'] = 'https://ty/1181171063464402985/i41PD_Ho-1bbqHXP0Ua7I9Msvz9MHFiKKbcMMwlggQYLEwOOrabgMZ7GQOkU7Uop_eBm',
    ['vehicleupgrades'] = 'https://ty/1181171200605565019/CKdDWrrJ8xe5jp7jCGqu0vfPOG-8w9F1zVCOnphQHcOP2mz5t8paKdk5qOYbMhLfeB7T',
    ['shops'] = 'https://ty/1181171200605565019/CKdDWrrJ8xe5jp7jCGqu0vfPOG-8w9F1zVCOnphQHcOP2mz5t8paKdk5qOYbMhLfeB7T',
    ['dealers'] = 'https://ty/1181171200605565019/CKdDWrrJ8xe5jp7jCGqu0vfPOG-8w9F1zVCOnphQHcOP2mz5t8paKdk5qOYbMhLfeB7T',
    ['storerobbery'] = 'https://ty/1181171564755046443/xgoLHbGbSw9vrEy3WjZJf6O-2vD6lmt6lt7voS57N-b_0OYqt78L9UhC_o0TyUn6VbCM',
    ['bankrobbery'] = 'https://ty/1181171564755046443/xgoLHbGbSw9vrEy3WjZJf6O-2vD6lmt6lt7voS57N-b_0OYqt78L9UhC_o0TyUn6VbCM',
    ['powerplants'] = 'https://ty/1181171564755046443/xgoLHbGbSw9vrEy3WjZJf6O-2vD6lmt6lt7voS57N-b_0OYqt78L9UhC_o0TyUn6VbCM',
    ['death'] = 'https://ty/1181171421242740757/Eg_wgCCscvTPdbeXrNaorlkYKuUY0XqVvsWQIgJWQ-ED4EtxzZxkc_Qo4SpUxkoBtnk6',
    ['joinleave'] = 'https://ty/1181170183079997460/HPdyBnuJggfOwzAb2roCt2i4CcbJFY1txQaGbUruXhFeziDKT5rRAsPkIUcZMfwnnbMo',
    ['ooc'] = 'https://ty/1181172062140780605/vCKmoXu5-cRVUXHFndZVOSY1mgMaXztfmQqFBwocbO-YkYh2hV7QcDRamC0uqfZt_rsp',
    ['report'] = 'https://ty/1181172062140780605/vCKmoXu5-cRVUXHFndZVOSY1mgMaXztfmQqFBwocbO-YkYh2hV7QcDRamC0uqfZt_rsp',
    ['me'] = 'https://ty/1181172062140780605/vCKmoXu5-cRVUXHFndZVOSY1mgMaXztfmQqFBwocbO-YkYh2hV7QcDRamC0uqfZt_rsp',
    ['pmelding'] = 'https://ty/1181172062140780605/vCKmoXu5-cRVUXHFndZVOSY1mgMaXztfmQqFBwocbO-YkYh2hV7QcDRamC0uqfZt_rsp',
    ['112'] = 'https://ty/1181172062140780605/vCKmoXu5-cRVUXHFndZVOSY1mgMaXztfmQqFBwocbO-YkYh2hV7QcDRamC0uqfZt_rsp',
    ['bans'] = 'https://ty/1181172883742019615/dJefCaFxPeQEj-eDVpUoSDCFbvIqSDnQWvhBHQ2g8OpbST-W1F7ZqI-hdKfEvJQN22Js',
    ['anticheat'] = 'https://ty/1181172883742019615/dJefCaFxPeQEj-eDVpUoSDCFbvIqSDnQWvhBHQ2g8OpbST-W1F7ZqI-hdKfEvJQN22Js',
    ['weather'] = 'https://ty/1179508780233412676/80CPHo0vnSC8LhV5l7ZGWjGDj_NXYswUYUaNFoLRPHgI-CXZVvjvDOgR0Y1mnxfz1JdW',
    ['moneysafes'] = 'https://ty/1181172554640134185/qrtf-_XLsawKsGRd_3tY_XSLnkBvZawLEc5zJgYXwIEbEO021qRkLvNr_o_4CUxXqL7K',
    ['bennys'] = 'https://ty/1181171200605565019/CKdDWrrJ8xe5jp7jCGqu0vfPOG-8w9F1zVCOnphQHcOP2mz5t8paKdk5qOYbMhLfeB7T',
    ['bossmenu'] = 'https://ty/1181172554640134185/qrtf-_XLsawKsGRd_3tY_XSLnkBvZawLEc5zJgYXwIEbEO021qRkLvNr_o_4CUxXqL7K',
    ['robbery'] = 'https://ty/1181171564755046443/xgoLHbGbSw9vrEy3WjZJf6O-2vD6lmt6lt7voS57N-b_0OYqt78L9UhC_o0TyUn6VbCM',
    ['casino'] = '',
    ['traphouse'] = 'https://ty/1181171564755046443/xgoLHbGbSw9vrEy3WjZJf6O-2vD6lmt6lt7voS57N-b_0OYqt78L9UhC_o0TyUn6VbCM',
    ['911'] = 'https://ty/1181172062140780605/vCKmoXu5-cRVUXHFndZVOSY1mgMaXztfmQqFBwocbO-YkYh2hV7QcDRamC0uqfZt_rsp',
    ['palert'] = 'https://ty/1181172062140780605/vCKmoXu5-cRVUXHFndZVOSY1mgMaXztfmQqFBwocbO-YkYh2hV7QcDRamC0uqfZt_rsp',
    ['house'] = 'https://ty/1161331342131351602/A2dfKf9oR7rTRKpiG23ZOdby7dbWWOUY-BY-FlPXzLKVgwmBgKFglJjQ5J2DIldMEbTv',
    ['qbjobs'] = 'https://ty/1179509081774501960/-TtoEMYGCtsNzwXR61nr11tSLSCBUhNCjFKuzk0VsIrgizVQHLOqjb91OXaSLf2BvrC6',
    ['crafting'] = 'https://ty/1181173140139802696/iXXBTS0Zwr_5Q9J6s_6i8MOUkCjt5zKWuXqdDibsvA4U4WfKiZuMznZUD7wGaBRqZjFy',
    ['shiftlogPolice'] = 'https://ty/1181869493220294767/2JyK1bGKvjRjO57qn_C4NJMNk_PEsIYa_-h7k_xEie0Drrh_NomJTh8dP4ujKDysnPUG',
    ['shiftlogAmbulance'] = 'https://ty/1181630437978804364/JX061R0qeW8qKyi3vagkLqLXgMknKmrSBC8gvq62gFsFFsWTIbh4HYtAuYebFV8V5f4C',
    ['shiftlogmechanic'] = 'https://discord.com/api/q1040305726855315516/ut0aB6GDP743UtqoMj7Q0aqnHsWEBxPQHAzSt8JiEpuHPuiX0DQOXZJOTnMfrMBl7orr',
}

local Colors = { -- https://www.spycolor.com/
    ['default'] = 14423100,
    ['blue'] = 255,
    ['red'] = 16711680,
    ['green'] = 65280,
    ['white'] = 16777215,
    ['black'] = 0,
    ['orange'] = 16744192,
    ['yellow'] = 16776960,
    ['pink'] = 16761035,
    ["lightgreen"] = 65309,
}

RegisterNetEvent('qb-log:server:CreateLog', function(name, title, color, message, tagEveryone)
    local tag = tagEveryone or false
    local webHook = Webhooks[name] or Webhooks['default']
    local embedData = {
        {
            ['title'] = title,
            ['color'] = Colors[color] or Colors['default'],
            ['footer'] = {
                ['text'] = os.date('%c'),
            },
            ['description'] = message,
            ['author'] = {
                ['name'] = 'BanglaPixel Logs',
                ['icon_url'] = 'https://cdn.discordapp.com/attachments/1158063871190368346/1179347717126881301/BP-512.png',
            },
        }
    }
    PerformHttpRequest(webHook, function() end, 'POST', json.encode({ username = 'BanglaPixel Logs', embeds = embedData}), { ['Content-Type'] = 'application/json' })
    Citizen.Wait(100)
    if tag then
        PerformHttpRequest(webHook, function() end, 'POST', json.encode({ username = 'BanglaPixel Logs', content = '@everyone'}), { ['Content-Type'] = 'application/json' })
    end
end)

QBCore.Commands.Add('testwebhook', 'Test Your Discord Webhook For Logs (God Only)', {}, false, function()
    TriggerEvent('qb-log:server:CreateLog', 'testwebhook', 'Test Webhook', 'default', 'Webhook setup successfully')
end, 'god')
