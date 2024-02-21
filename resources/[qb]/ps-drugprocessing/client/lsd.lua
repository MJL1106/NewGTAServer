local isPickingUp, isProcessing = false, false
local QBCore = exports['qb-core']:GetCoreObject()

local function Processlsd()
	isProcessing = true
	local playerPed = PlayerPedId()

	TaskStartScenarioInPlace(playerPed, "PROP_HUMAN_PARKING_METER", 0, true)
	QBCore.Functions.Progressbar("search_register", Lang:t("progressbar.processing"), 15000, false, true, {
		disableMovement = true,
		disableCarMovement = true,
		disableMouse = false,
		disableCombat = true,
		disableKeyboard = true,
	}, {}, {}, {}, function()
		TriggerServerEvent('ps-drugprocessing:Processlsd')

		local timeLeft = Config.Delays.lsdProcessing / 1000
		while timeLeft > 0 do
			Wait(1000)
			timeLeft -= 1
			if #(GetEntityCoords(playerPed)-Config.CircleZones.lsdProcessing.coords) > 5 then
				QBCore.Functions.Notify(Lang:t("error.too_far"))
				TriggerServerEvent('ps-drugprocessing:cancelProcessing')
				break
			end
		end
		ClearPedTasks(playerPed)
		isProcessing = false
	end, function()
		ClearPedTasks(playerPed)
		isProcessing = false
	end)
end

local function Processthionylchloride()
	isProcessing = true
	local playerPed = PlayerPedId()

	TaskStartScenarioInPlace(playerPed, "PROP_HUMAN_PARKING_METER", 0, true)
	QBCore.Functions.Progressbar("search_register", Lang:t("progressbar.processing"), 15000, false, true, {
		disableMovement = true,
		disableCarMovement = true,
		disableMouse = false,
		disableCombat = true,
		disableKeyboard = true,
	}, {}, {}, {}, function()
		TriggerServerEvent('ps-drugprocessing:processThionylChloride')
		local timeLeft = Config.Delays.thionylchlorideProcessing / 1000
		while timeLeft > 0 do
			Wait(1000)
			timeLeft -= 1
			if #(GetEntityCoords(playerPed)-Config.CircleZones.thionylchlorideProcessing.coords) > 5 then
				QBCore.Functions.Notify(Lang:t("error.too_far"))
				TriggerServerEvent('ps-drugprocessing:cancelProcessing')
				break
			end
		end
		ClearPedTasks(playerPed)
		isProcessing = false
	end, function()
		ClearPedTasks(playerPed)
		isProcessing = false
	end)
end

local counter = 0
CreateThread(function()
        local playerPed = PlayerPedId()
        local coords = GetEntityCoords(playerPed)

        exports['qb-target']:AddBoxZone("lsdProcessing", vector3(2503.45, -427.49, 92.99), 2.0,2.0, {
			name="lsdProcessing",
			heading = 356.5,
			debugPoly=false,
			minZ=92.5,
			maxZ=93.3,
		}, {
			options = {
				{
					type = "client",
					action = function()
						if not isProcessing then
							QBCore.Functions.TriggerCallback('ps-drugprocessing:validate_items', function(result)
								if result.ret then
									Processlsd() -- Directly call the processing function
								else
									QBCore.Functions.Notify("You need 1x LSD and 1x Thionyl Chloride")
								end
							end, {lsa = 1, thionyl_chloride = 1})
						end
					end,
					icon = "fas fa-capsules",
					label = "Process LSD",
					job = all,
				},
			},
			distance = 2.0
		})
end)



RegisterNetEvent('ps-drugprocessing:processingThiChlo', function()
	local coords = GetEntityCoords(PlayerPedId(source))
	
	if #(coords-Config.CircleZones.thionylchlorideProcessing.coords) < 5 then
		if not isProcessing then
			QBCore.Functions.TriggerCallback('ps-drugprocessing:validate_items', function(result)
				if result.ret then
					Processthionylchloride()
				else
					QBCore.Functions.Notify("You need 1x LSA and 1x Chemicals")
				end
			end, {lsa = 1, chemicals = 1})
		end
	end
end)
