local open = false

RegisterNUICallback('callback', function(data, cb)
	SetNuiFocus(false, false)
    Callbackk(data.success)
    open = false
    cb('ok')
end)

-- function OpenHackingGame(callback, blocks, speed)
--     if not open then
--         Callbackk = callback
--         SetNuiFocus(true, true)
--         SendNUIMessage({
--             type = "open",
--             blocks = blocks,
--             speed = speed,
--         })
--     end
-- end

exports('OpenHackingGame', function(callback, blocks, speed)
    if not open then
        Callbackk = callback
        SetNuiFocus(true, true)
        SendNUIMessage({
            type = "open",
            blocks = blocks,
            speed = speed,
        })
    end
end)

--[[ RegisterCommand("varhack",function()
    exports['varhack']:OpenHackingGame(function(success)
        if success then
            print("sa")
		else
			print("as")
		end
    end, 2, 3)
end) ]]

-- exports('thermiteminigame', function(correctBlocks, incorrectBlocks, timetoShow, timetoLose, success, fail)
--     -- correctBlocks = Number of correct blocks the player needs to click
--     -- incorrectBlocks = number of incorrect blocks after which the game will fail
--     -- timetoShow = time in secs for which the right blocks will be shown
--     -- timetoLose = maximum time after timetoshow expires for player to select the right blocks
--     resultReceived = false
--     successCb = success
--     failCb = fail
--     -- exports['exo-inventory']:ToggleHotBar(false) Toggle so that inventory doesnt work.. this was something I made on my own server.. 
--     SetNuiFocus(true, true)
--     SendNUIMessage({
--         action = "Start",
--         correct = correctBlocks,
--         incorrect = incorrectBlocks,
--         showtime = timetoShow,
--         losetime = timetoLose + timetoShow,
--     })
--     -- TriggerEvent('progressbar:client:ToggleBusyness', true) -- To check if another progressbar is running
-- end)