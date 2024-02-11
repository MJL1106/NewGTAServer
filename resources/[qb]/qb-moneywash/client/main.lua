local currentMachine = -1
local globalCoords = vector3(0,0,0)
local notWashing = true

Citizen.CreateThread(function()

	for k, v in pairs(CONFIG['Machines']) do
        local machineId = "washingMachine" .. k
        
        -- Interaction for loading the machine
        exports['qb-target']:AddBoxZone(machineId, v.vec, 1, 1, {
            name = machineId,
            heading = 0,
            debugPoly = false,
            minZ = v.vec.z - 1,
            maxZ = v.vec.z + 1,
        }, {
            options = {
                {
                    event = "qb-overlord-laundering:client:tryLoadMachine",
                    icon = "fas fa-dollar-sign",
                    label = "Load Washing Machine",
                    machineKey = k,
                    canInteract = function(entity)
                        return CONFIG['Machines'][k].available and not CONFIG['Machines'][k].finished
                    end,
                },
                {
                    event = "qb-overlord-laundering:client:collectMoney",
                    icon = "fas fa-hand-holding-usd",
                    label = "Collect Money",
                    machineKey = k,
                    canInteract = function(entity)
                        return not CONFIG['Machines'][k].available and CONFIG['Machines'][k].finished
                    end,
                }
            },
            distance = 2.5
        })
    end
end)

Citizen.CreateThread(function()
	while true do Citizen.Wait(0)
		for k,v in pairs(CONFIG['Machines']) do
			if v.available == false then
				if #(v.vec - globalCoords) < 8.0 then
					if v.lastsound + math.random(15000, 25000) < GetGameTimer() then
						-- play sound
						if v.finished then
							-- play launder ready
							TriggerEvent('InteractSound_CL:PlayOnOne', 'washingmachinedone', 1.0)
						else
							-- play launder not ready
							TriggerEvent('InteractSound_CL:PlayOnOne', 'washingmachine', 0.1)
						end
						CONFIG['Machines'][k]['lastsound'] = GetGameTimer()
					end
				end
			end
		end
	end
end)

RegisterNetEvent('qb-overlord-laundering:state', function(machine, occupied, finished)
	CONFIG['Machines'][machine]['available'] = occupied
	CONFIG['Machines'][machine]['finished'] = finished
end)

RegisterNetEvent('qb-overlord-laundering:reset', function()
	--currentMachine = -1
end)

RegisterNetEvent('qb-overlord-laundering:client:tryLoadMachine', function(data)
    TriggerServerEvent('qb-overlord-laundering:load', data.machineKey)
end)

RegisterNetEvent('qb-overlord-laundering:client:collectMoney', function(data)
    TriggerServerEvent('qb-overlord-laundering:collect', data.machineKey)
end)