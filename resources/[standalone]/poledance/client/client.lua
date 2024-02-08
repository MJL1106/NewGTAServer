local QBCore = exports['qb-core']:GetCoreObject()

Citizen.CreateThread(function()
    RequestModel(GetHashKey("a_f_y_topless_01"))

	while not HasModelLoaded(GetHashKey("a_f_y_topless_01")) do
    Wait(10)
	end

	for _, item in pairs(Config.Locations22) do
		local npc = CreatePed(1, 0x9CF26183, item.x, item.y, item.z, item.heading, false, true)
	
		FreezeEntityPosition(npc, true)	
		SetEntityHeading(npc, item.heading)
		SetEntityInvincible(npc, true)
		SetBlockingOfNonTemporaryEvents(npc, true)
		RequestAnimDict("mini@strip_club@pole_dance@pole_dance2")
		while not HasAnimDictLoaded("mini@strip_club@pole_dance@pole_dance2") do
		Citizen.Wait(100)
		end
	
		local netScene2 = CreateSynchronizedScene(item.x, item.y, item.z, vec3(0.0, 0.0, 0.0), 2)
		TaskSynchronizedScene(npc, netScene2, "mini@strip_club@pole_dance@pole_dance2", "pd_dance_02", 1.0, -4.0, 261, 0, 0)
		SetSynchronizedSceneLooped(netScene2, 1)
		SetModelAsNoLongerNeeded(model)
	end
end)

Citizen.CreateThread(function()
    RequestModel(GetHashKey("a_f_y_topless_01"))

	while not HasModelLoaded(GetHashKey("a_f_y_topless_01")) do
    Wait(10)
	end

	for _, item in pairs(Config.Locations23) do
		local npc = CreatePed(1, 0x9CF26183, item.x, item.y, item.z, item.heading, false, true)
	
		FreezeEntityPosition(npc, true)	
		SetEntityHeading(npc, item.heading)
		SetEntityInvincible(npc, true)
		SetBlockingOfNonTemporaryEvents(npc, true)
		RequestAnimDict("mini@strip_club@pole_dance@pole_dance3")
		while not HasAnimDictLoaded("mini@strip_club@pole_dance@pole_dance3") do
		Citizen.Wait(100)
		end
	
		local netScene3 = CreateSynchronizedScene(item.x, item.y, item.z, vec3(0.0, 0.0, 0.0), 2)
		TaskSynchronizedScene(npc, netScene3, "mini@strip_club@pole_dance@pole_dance3", "pd_dance_03", 1.0, -4.0, 261, 0, 0)
		SetSynchronizedSceneLooped(netScene3, 1)
		SetModelAsNoLongerNeeded(model)
	end
end)

Citizen.CreateThread(function()
    RequestModel(GetHashKey("a_f_y_topless_01"))

	while not HasModelLoaded(GetHashKey("a_f_y_topless_01")) do
    Wait(10)
	end

	for _, item in pairs(Config.Locations24) do
		local npc = CreatePed(1, 0x9CF26183, item.x, item.y, item.z, item.heading, false, true)
	
		FreezeEntityPosition(npc, true)	
		SetEntityHeading(npc, item.heading)
		SetEntityInvincible(npc, true)
		SetBlockingOfNonTemporaryEvents(npc, true)
		RequestAnimDict("mini@strip_club@pole_dance@pole_dance3")
		while not HasAnimDictLoaded("mini@strip_club@pole_dance@pole_dance3") do
		Citizen.Wait(100)
		end
	
		local netScene3 = CreateSynchronizedScene(item.x, item.y, item.z, vec3(0.0, 0.0, 0.0), 2)
		TaskSynchronizedScene(npc, netScene3, "mini@strip_club@pole_dance@pole_dance3", "pd_dance_03", 1.0, -4.0, 261, 0, 0)
		SetSynchronizedSceneLooped(netScene3, 1)
		SetModelAsNoLongerNeeded(model)
	end
end)

Citizen.CreateThread(function()
    RequestModel(GetHashKey("a_f_y_topless_01"))

	while not HasModelLoaded(GetHashKey("a_f_y_topless_01")) do
    Wait(10)
	end

	for _, item in pairs(Config.Locations25) do
		local npc = CreatePed(1, 0x9CF26183, item.x, item.y, item.z, item.heading, false, true)
	
		FreezeEntityPosition(npc, true)	
		SetEntityHeading(npc, item.heading)
		SetEntityInvincible(npc, true)
		SetBlockingOfNonTemporaryEvents(npc, true)
		RequestAnimDict("mini@strip_club@pole_dance@pole_dance3")
		while not HasAnimDictLoaded("mini@strip_club@pole_dance@pole_dance3") do
		Citizen.Wait(100)
		end
	
		local netScene3 = CreateSynchronizedScene(item.x, item.y, item.z, vec3(0.0, 0.0, 0.0), 2)
		TaskSynchronizedScene(npc, netScene3, "mini@strip_club@pole_dance@pole_dance3", "pd_dance_03", 1.0, -4.0, 261, 0, 0)
		SetSynchronizedSceneLooped(netScene3, 1)
		SetModelAsNoLongerNeeded(model)
	end
end)
