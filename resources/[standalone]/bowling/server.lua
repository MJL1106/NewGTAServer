local occupiedTracks = {}

RegisterServerEvent('bowling:start')
AddEventHandler('bowling:start', function()
    TriggerClientEvent('bowling:chooseTrack', source, occupiedTracks)
end)

RegisterServerEvent('bowling:end')
AddEventHandler('bowling:end', function(track)
    local src, old = source, occupiedTracks
    occupiedTracks = {}
    for k, v in pairs(old) do 
        if v ~= src then
            occupiedTracks[k] = v
        end
    end
    TriggerClientEvent('bowling:cancel', src)
end)

RegisterServerEvent('bowling:choose')
AddEventHandler('bowling:choose', function(track)
    local src = source
    if not occupiedTracks[track] then
        occupiedTracks[track] = src
        TriggerClientEvent('bowling:play', src, track)
    else
        TriggerClientEvent('bowling:cancel', src)
    end
end)

AddEventHandler('playerDropped', function()
    local src, old = source, occupiedTracks
    occupiedTracks = {}
    for k, v in pairs(old) do 
        if v ~= src then
            occupiedTracks[k] = v
        end
    end
end)