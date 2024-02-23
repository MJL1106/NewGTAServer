--
-- Server-side event examples and functions which can be used if you need them for some custom development reasons.
--
local QBCore = exports['qb-core']:GetCoreObject()
-- Used to determine if a player can join a race. For example you can check for items/jobs here, if needed.
function isPlayerAllowedToJoinRace(playerId)
    local Player = QBCore.Functions.GetPlayer(playerId)
    if Player then
        local item = Player.Functions.GetItemByName('racingtablet')
        if item and item.amount > 0 then
            -- Player has at least one 'racingtablet', allowed to join
            return true
        else
            -- Player does not have a 'racingtablet', not allowed to join
            return false
        end
    end

    -- If for some reason the player object wasn't retrieved
    TriggerClientEvent('QBCore:Notify', playerId, "Player not found.", 'error')
    return false
end



AddEventHandler('rahe-racing:server:playerJoinedRace', function(playerId)
    --print('rahe-racing:server:playerJoinedRace')
    --print(playerId)
end)


-- Placeholder function for executing an asynchronous SQL query
-- This is a conceptual implementation; adapt it based on your server framework and database access library
local function executeSQLQuery(query, parameters)
    local promise = promise.new()
    MySQL.Async.fetchAll(query, parameters, function(result)
        promise:resolve(result)
    end)
    return Citizen.Await(promise)
end

-- Function to get all player identifiers who have opened the race tablet
-- Simplified synchronous query execution for demonstration; adjust based on your actual DB library
function getPlayersWhoHaveRacedBefore()
    local result = MySQL.Sync.fetchAll("SELECT DISTINCT player_identifier FROM ra_racing_user_settings", {})
    local playerIdentifiers = {}

    for _, row in ipairs(result) do
        table.insert(playerIdentifiers, row.player_identifier)
    end

    return playerIdentifiers
end

function GetPlayerIdFromIdentifier(playerIdentifier)
    local players = QBCore.Functions.GetPlayers()
    for _, playerId in ipairs(players) do
        local Player = QBCore.Functions.GetPlayer(playerId)
        if Player and Player.PlayerData.citizenid == playerIdentifier then
            return playerId -- Found the player session ID
        end
    end
    return nil -- No player found with that identifier
end



AddEventHandler('rahe-racing:server:newRaceCreated', function(startCoords, trackName, startDuration, isCompetition)
    -- Retrieve player identifiers who have opened the race tablet before
    local interestedPlayers = getPlayersWhoHaveRacedBefore()
    
    local currentTime = os.time()
    local startTime = currentTime + startDuration -- Calculate the actual start time
    
    local timeDifference = startTime - currentTime -- Should be equal to startDuration

    -- Convert time difference to a human-readable format (hours and minutes)
    local minutesToStart = math.floor(timeDifference / 60)
    local hoursToStart = math.floor(minutesToStart / 60)
    minutesToStart = minutesToStart % 60 -- Remainder in minutes after converting to hours

    local timeMessage
    if hoursToStart > 0 then
        timeMessage = string.format("Race starts in %d hour(s) and %d minute(s)!", hoursToStart, minutesToStart)
    else
        timeMessage = string.format("Race starts in %d minute(s)!", minutesToStart)
    end

    local raceType = isCompetition and "Competition Race" or "Casual Race"
    local emailContent = string.format("A new race has been created!\n\nTrack Name: %s\n%s\nRace Type: %s\n\nGet ready to join!", trackName, timeMessage, raceType)


    -- Iterate over each interested player
    for _, playerIdentifier in ipairs(interestedPlayers) do
        -- Assuming you have a way to map player_identifier to online player session ID
        local playerId = GetPlayerIdFromIdentifier(playerIdentifier) -- You'll need to implement this mapping
        if playerId then
            local Player = QBCore.Functions.GetPlayer(playerId)
            if Player then
                -- Check if the player has the 'racingtablet' item
                TriggerEvent('jpr-phonesystem:server:sendEmail', {
                    Assunto = "RACE ALERT!", -- Subject
                    Conteudo = emailContent, -- Content
                    Enviado = "RaceingRyan@TunerRacing.com", -- Submitted by
                    Destinatario = Player.PlayerData.citizenid, -- Target
                    Event = {}, -- Optional 
                })
            end
        end
    end
end)



AddEventHandler('rahe-racing:server:raceStarted', function(startCoords, participants)
    --print('rahe-racing:server:raceStarted')
    --print('startCoords: ', startCoords)
    --print('participants:')
    --print(DumpTable(participants))
end)

AddEventHandler('rahe-racing:server:raceFinished', function(raceData)
    --print('rahe-racing:server:raceFinished')
    --print('raceData:')
    --print(DumpTable(raceData))
end)