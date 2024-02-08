-- Variables
local QBCore = exports['qb-core']:GetCoreObject()
local frozen = false
local permissions = {
    ['kill'] = 'admin',
    ['ban'] = 'admin',
    ['noclip'] = 'admin',
    ['kickall'] = 'admin',
    ['kick'] = 'admin',
    ["revive"] = "admin",
    ["freeze"] = "admin",
    ["goto"] = "admin",
    ["spectate"] = "admin",
    ["intovehicle"] = "admin",
    ["bring"] = "admin",
    ["inventory"] = "admin",
    ["clothing"] = "admin"
}
local players = {}

-- Get Dealers
QBCore.Functions.CreateCallback('test:getdealers', function(_, cb)
    cb(exports['qb-drugs']:GetDealers())
end)

-- Get Players
QBCore.Functions.CreateCallback('test:getplayers', function(_, cb) -- WORKS
    cb(players)
end)

QBCore.Functions.CreateCallback('qb-admin:server:getrank', function(source, cb)
    if QBCore.Functions.HasPermission(source, 'god') or IsPlayerAceAllowed(source, 'command') then
        cb(true)
    else
        cb(false)
    end
end)

-- Functions
local function tablelength(table)
    local count = 0
    for _ in pairs(table) do
        count = count + 1
    end
    return count
end

local function BanPlayer(src)
    MySQL.insert('INSERT INTO bans (name, license, discord, ip, reason, expire, bannedby) VALUES (?, ?, ?, ?, ?, ?, ?)', {
        GetPlayerName(src),
        QBCore.Functions.GetIdentifier(src, 'license'),
        QBCore.Functions.GetIdentifier(src, 'discord'),
        QBCore.Functions.GetIdentifier(src, 'ip'),
        "Trying to revive theirselves or other players",
        2147483647,
        'qb-adminmenu'
    })
    TriggerEvent('qb-log:server:CreateLog', 'adminmenu', 'Player Banned', 'red', string.format('%s was banned by %s for %s', GetPlayerName(src), 'qb-adminmenu', "Trying to trigger admin options which they dont have permission for"), true)
    DropPlayer(src, 'You were permanently banned by the server for: Exploiting')
end

-- Events
RegisterNetEvent('qb-admin:server:GetPlayersForBlips', function()
    local src = source
    TriggerClientEvent('qb-admin:client:Show', src, players)
end)

RegisterNetEvent('qb-admin:server:kill', function(player)
    local src = source
    if QBCore.Functions.HasPermission(src, permissions['kill']) or IsPlayerAceAllowed(src, 'command')  then
        TriggerClientEvent('hospital:client:KillPlayer', player.id)
    else
        BanPlayer(src)
    end
end)

RegisterNetEvent('qb-admin:server:revive', function(player)
    local src = source
    if QBCore.Functions.HasPermission(src, permissions['revive']) or IsPlayerAceAllowed(src, 'command')  then
        TriggerClientEvent('hospital:client:Revive', player.id)
    else
        BanPlayer(src)
    end
end)

RegisterNetEvent('qb-admin:server:kick', function(player, reason)
    local src = source
    if QBCore.Functions.HasPermission(src, permissions['kick']) or IsPlayerAceAllowed(src, 'command')  then
        TriggerEvent('qb-log:server:CreateLog', 'bans', 'Player Kicked', 'red', string.format('%s was kicked by %s for %s', GetPlayerName(player.id), GetPlayerName(src), reason), true)
        DropPlayer(player.id, Lang:t("info.kicked_server") .. ':\n' .. reason .. '\n\n' .. Lang:t("info.check_discord") .. QBCore.Config.Server.Discord)
    else
        BanPlayer(src)
    end
end)

RegisterNetEvent('qb-admin:server:ban', function(player, time, reason)
    local src = source
    if QBCore.Functions.HasPermission(src, permissions['ban']) or IsPlayerAceAllowed(src, 'command') then
        time = tonumber(time)
        local banTime = tonumber(os.time() + time)
        if banTime > 2147483647 then
            banTime = 2147483647
        end
        local timeTable = os.date('*t', banTime)
        MySQL.insert('INSERT INTO bans (name, license, discord, ip, reason, expire, bannedby) VALUES (?, ?, ?, ?, ?, ?, ?)', {
            GetPlayerName(player.id),
            QBCore.Functions.GetIdentifier(player.id, 'license'),
            QBCore.Functions.GetIdentifier(player.id, 'discord'),
            QBCore.Functions.GetIdentifier(player.id, 'ip'),
            reason,
            banTime,
            GetPlayerName(src)
        })
        TriggerClientEvent('chat:addMessage', -1, {
            template = "<div class=chat-message server'><strong>ANNOUNCEMENT | {0} has been banned:</strong> {1}</div>",
            args = {GetPlayerName(player.id), reason}
        })
        TriggerEvent('qb-log:server:CreateLog', 'bans', 'Player Banned', 'red', string.format('%s was banned by %s for %s', GetPlayerName(player.id), GetPlayerName(src), reason), true)
        if banTime >= 2147483647 then
            DropPlayer(player.id, Lang:t("info.banned") .. '\n' .. reason .. Lang:t("info.ban_perm") .. QBCore.Config.Server.Discord)
        else
            DropPlayer(player.id, Lang:t("info.banned") .. '\n' .. reason .. Lang:t("info.ban_expires") .. timeTable['day'] .. '/' .. timeTable['month'] .. '/' .. timeTable['year'] .. ' ' .. timeTable['hour'] .. ':' .. timeTable['min'] .. '\n🔸 Check our Discord for more information: ' .. QBCore.Config.Server.Discord)
        end
    else
        BanPlayer(src)
    end
end)

RegisterNetEvent('qb-admin:server:spectate', function(player)
    local src = source
    if QBCore.Functions.HasPermission(src, permissions['spectate']) or IsPlayerAceAllowed(src, 'command') then
        local targetped = GetPlayerPed(player.id)
        local coords = GetEntityCoords(targetped)
        TriggerClientEvent('qb-admin:client:spectate', src, player.id, coords)
    else
        BanPlayer(src)
    end
end)

RegisterNetEvent('qb-admin:server:freeze', function(player)
    local src = source
    if QBCore.Functions.HasPermission(src, permissions['freeze']) or IsPlayerAceAllowed(src, 'command') then
        local target = GetPlayerPed(player.id)
        if not frozen then
            frozen = true
            FreezeEntityPosition(target, true)
        else
            frozen = false
            FreezeEntityPosition(target, false)
        end
    else
        BanPlayer(src)
    end
end)

RegisterNetEvent('qb-admin:server:goto', function(player)
    local src = source
    if QBCore.Functions.HasPermission(src, permissions['goto']) or IsPlayerAceAllowed(src, 'command') then
        local admin = GetPlayerPed(src)
        local coords = GetEntityCoords(GetPlayerPed(player.id))
        SetEntityCoords(admin, coords)
    else
        BanPlayer(src)
    end
end)

RegisterNetEvent('qb-admin:server:intovehicle', function(player)
    local src = source
    if QBCore.Functions.HasPermission(src, permissions['intovehicle']) or IsPlayerAceAllowed(src, 'command') then
        local admin = GetPlayerPed(src)
        local targetPed = GetPlayerPed(player.id)
        local vehicle = GetVehiclePedIsIn(targetPed,false)
        local seat = -1
        if vehicle ~= 0 then
            for i=0,8,1 do
                if GetPedInVehicleSeat(vehicle,i) == 0 then
                    seat = i
                    break
                end
            end
            if seat ~= -1 then
                SetPedIntoVehicle(admin,vehicle,seat)
                TriggerClientEvent('QBCore:Notify', src, Lang:t("sucess.entered_vehicle"), 'success', 5000)
            else
                TriggerClientEvent('QBCore:Notify', src, Lang:t("error.no_free_seats"), 'danger', 5000)
            end
        end
    else
        BanPlayer(src)
    end
end)


RegisterNetEvent('qb-admin:server:bring', function(player)
    local src = source
    if QBCore.Functions.HasPermission(src, permissions['bring']) or IsPlayerAceAllowed(src, 'command') then
        local admin = GetPlayerPed(src)
        local coords = GetEntityCoords(admin)
        local target = GetPlayerPed(player.id)
        SetEntityCoords(target, coords)
    else
        BanPlayer(src)
    end
end)

RegisterNetEvent('qb-admin:server:inventory', function(player)
    local src = source
    if QBCore.Functions.HasPermission(src, permissions['inventory']) or IsPlayerAceAllowed(src, 'command') then
        TriggerClientEvent('qb-admin:client:inventory', src, player.id)
    else
        BanPlayer(src)
    end
end)

RegisterNetEvent('qb-admin:server:cloth', function(player)
    local src = source
    if QBCore.Functions.HasPermission(src, permissions['clothing']) or IsPlayerAceAllowed(src, 'command') then
        TriggerClientEvent('qb-clothing:client:openMenu', player.id)
    else
        BanPlayer(src)
    end
end)

RegisterNetEvent('qb-admin:server:setPermissions', function(targetId, group)
    local src = source
    if QBCore.Functions.HasPermission(src, 'god') or IsPlayerAceAllowed(src, 'command') then
        QBCore.Functions.AddPermission(targetId, group[1].rank)
        TriggerClientEvent('QBCore:Notify', targetId, Lang:t("info.rank_level")..group[1].label)
    else
        BanPlayer(src)
    end
end)

RegisterNetEvent('qb-admin:server:SendReport', function(name, targetSrc, msg)
    local src = source
    if QBCore.Functions.HasPermission(src, 'admin') or IsPlayerAceAllowed(src, 'command') then
        if QBCore.Functions.IsOptin(src) then
            TriggerClientEvent('chat:addMessage', src, {
                color = {255, 0, 0},
                multiline = true,
                args = {Lang:t("info.admin_report")..name..' ('..targetSrc..')', msg}
            })
        end
    end
end)

RegisterServerEvent('qb-admin:giveWeapon', function(weapon)
    local src = source
    if QBCore.Functions.HasPermission(src, 'admin') or IsPlayerAceAllowed(src, 'command') then
        local Player = QBCore.Functions.GetPlayer(src)
        Player.Functions.AddItem(weapon, 1)
    else
        BanPlayer(src)
    end
end)

RegisterNetEvent('qb-admin:server:SaveCar', function(mods, vehicle, _, plate)
    local src = source
    if QBCore.Functions.HasPermission(src, 'admin') or IsPlayerAceAllowed(src, 'command') then
        local Player = QBCore.Functions.GetPlayer(src)
        local result = MySQL.query.await('SELECT plate FROM player_vehicles WHERE plate = ?', { plate })
        if result[1] == nil then
            MySQL.insert('INSERT INTO player_vehicles (license, citizenid, vehicle, hash, mods, plate, state) VALUES (?, ?, ?, ?, ?, ?, ?)', {
                Player.PlayerData.license,
                Player.PlayerData.citizenid,
                vehicle.model,
                vehicle.hash,
                json.encode(mods),
                plate,
                0
            })
            TriggerClientEvent('QBCore:Notify', src, Lang:t("success.success_vehicle_owner"), 'success', 5000)
        else
            TriggerClientEvent('QBCore:Notify', src, Lang:t("error.failed_vehicle_owner"), 'error', 3000)
        end
    else
        BanPlayer(src)
    end
end)

-- Commands

QBCore.Commands.Add('maxmods', Lang:t("desc.max_mod_desc"), {}, false, function(source)
    local src = source
    TriggerClientEvent('qb-admin:client:maxmodVehicle', src)
end, 'admin')

QBCore.Commands.Add('blips', Lang:t("commands.blips_for_player"), {}, false, function(source)
    local src = source
    TriggerClientEvent('qb-admin:client:toggleBlips', src)
end, 'admin')

QBCore.Commands.Add('names', Lang:t("commands.player_name_overhead"), {}, false, function(source)
    local src = source
    TriggerClientEvent('qb-admin:client:toggleNames', src)
end, 'admin')

QBCore.Commands.Add('coords', Lang:t("commands.coords_dev_command"), {}, false, function(source)
    local src = source
    TriggerClientEvent('qb-admin:client:ToggleCoords', src)
end, 'admin')

QBCore.Commands.Add('noclip', Lang:t("commands.toogle_noclip"), {}, false, function(source)
    local src = source
    TriggerClientEvent('qb-admin:client:ToggleNoClip', src)
end, 'admin')

QBCore.Commands.Add('admincar', Lang:t("commands.save_vehicle_garage"), {}, false, function(source, _)
    TriggerClientEvent('qb-admin:client:SaveCar', source)
end, 'god')

QBCore.Commands.Add('announce', Lang:t("commands.make_announcement"), {}, false, function(_, args)
    local msg = table.concat(args, ' ')
    if msg == '' then return end
    TriggerClientEvent('chat:addMessage', -1, {
        color = { 255, 0, 0},
        multiline = true,
        args = {"Announcement", msg}
    })
end, 'admin')

QBCore.Commands.Add('admin', Lang:t("commands.open_admin"), {}, false, function(source, _)
    TriggerClientEvent('qb-admin:client:openMenu', source)
end, 'admin')

QBCore.Commands.Add('report', Lang:t("info.admin_report"), {{name='message', help='Message'}}, true, function(source, args)
    local src = source
    local msg = table.concat(args, ' ')
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent('qb-admin:client:SendReport', -1, GetPlayerName(src), src, msg)
    TriggerEvent('qb-log:server:CreateLog', 'report', 'Report', 'green', '**'..GetPlayerName(source)..'** (CitizenID: '..Player.PlayerData.citizenid..' | ID: '..source..') **Report:** ' ..msg, false)
end)

QBCore.Commands.Add('staffchat', Lang:t("commands.staffchat_message"), {{name='message', help='Message'}}, true, function(source, args)
    local msg = table.concat(args, ' ')
    local name = GetPlayerName(source)

    local plrs = QBCore.Functions.GetPlayers()

    for i = 1, #plrs, 1 do
        local plr = plrs[i]
        if QBCore.Functions.HasPermission(plr, 'admin') or IsPlayerAceAllowed(plr, 'command') then
            if QBCore.Functions.IsOptin(plr) then
                TriggerClientEvent('chat:addMessage', plr, {
                    color = {255, 0, 0},
                    multiline = true,
                    args = {Lang:t("info.staffchat")..name, msg}
                })
            end
        end
    end
end, 'admin')

QBCore.Commands.Add('givenuifocus', Lang:t("commands.nui_focus"), {{name='id', help='Player id'}, {name='focus', help='Set focus on/off'}, {name='mouse', help='Set mouse on/off'}}, true, function(_, args)
    local playerid = tonumber(args[1])
    local focus = args[2]
    local mouse = args[3]
    TriggerClientEvent('qb-admin:client:GiveNuiFocus', playerid, focus, mouse)
end, 'admin')

QBCore.Commands.Add('warn', Lang:t("commands.warn_a_player"), {{name='ID', help='Player'}, {name='Reason', help='Mention a reason'}}, true, function(source, args)
    local targetPlayer = QBCore.Functions.GetPlayer(tonumber(args[1]))
    local senderPlayer = QBCore.Functions.GetPlayer(source)
    table.remove(args, 1)
    local msg = table.concat(args, ' ')
    local warnId = 'WARN-'..math.random(1111, 9999)
    if targetPlayer ~= nil then
		TriggerClientEvent('chat:addMessage', targetPlayer.PlayerData.source, { args = { "SYSTEM", Lang:t("info.warning_chat_message")..GetPlayerName(source).."," .. Lang:t("info.reason") .. ": "..msg }, color = 255, 0, 0 })
		TriggerClientEvent('chat:addMessage', source, { args = { "SYSTEM", Lang:t("info.warning_staff_message")..GetPlayerName(targetPlayer.PlayerData.source)..", for: "..msg }, color = 255, 0, 0 })
        MySQL.insert('INSERT INTO player_warns (senderIdentifier, targetIdentifier, reason, warnId) VALUES (?, ?, ?, ?)', {
            senderPlayer.PlayerData.license,
            targetPlayer.PlayerData.license,
            msg,
            warnId
        })
    else
        TriggerClientEvent('QBCore:Notify', source, Lang:t("error.not_online"), 'error')
    end
end, 'admin')

QBCore.Commands.Add('checkwarns', Lang:t("commands.check_player_warning"), {{name='id', help='Player'}, {name='Warning', help='Number of warning, (1, 2 or 3 etc..)'}}, false, function(source, args)
    if args[2] == nil then
        local targetPlayer = QBCore.Functions.GetPlayer(tonumber(args[1]))
        local result = MySQL.query.await('SELECT * FROM player_warns WHERE targetIdentifier = ?', { targetPlayer.PlayerData.license })
        TriggerClientEvent('chat:addMessage', source, 'SYSTEM', 'warning', targetPlayer.PlayerData.name..' has '..tablelength(result)..' warnings!')
    else
        local targetPlayer = QBCore.Functions.GetPlayer(tonumber(args[1]))
        local warnings = MySQL.query.await('SELECT * FROM player_warns WHERE targetIdentifier = ?', { targetPlayer.PlayerData.license })
        local selectedWarning = tonumber(args[2])
        if warnings[selectedWarning] ~= nil then
            local sender = QBCore.Functions.GetPlayer(warnings[selectedWarning].senderIdentifier)
            TriggerClientEvent('chat:addMessage', source, 'SYSTEM', 'warning', targetPlayer.PlayerData.name..' has been warned by '..sender.PlayerData.name..', Reason: '..warnings[selectedWarning].reason)
        end
    end
end, 'admin')

QBCore.Commands.Add('delwarn', Lang:t("commands.delete_player_warning"), {{name='id', help='Player'}, {name='Warning', help='Number of warning, (1, 2 or 3 etc..)'}}, true, function(source, args)
    local targetPlayer = QBCore.Functions.GetPlayer(tonumber(args[1]))
    local warnings = MySQL.query.await('SELECT * FROM player_warns WHERE targetIdentifier = ?', { targetPlayer.PlayerData.license })
    local selectedWarning = tonumber(args[2])
    if warnings[selectedWarning] ~= nil then
        TriggerClientEvent('chat:addMessage', source, 'SYSTEM', 'warning', 'You have deleted warning ('..selectedWarning..') , Reason: '..warnings[selectedWarning].reason)
        MySQL.query('DELETE FROM player_warns WHERE warnId = ?', { warnings[selectedWarning].warnId })
    end
end, 'admin')

QBCore.Commands.Add('reportr', Lang:t("commands.reply_to_report"), {{name='id', help='Player'}, {name = 'message', help = 'Message to respond with'}}, false, function(source, args)
    local src = source
    local playerId = tonumber(args[1])
    table.remove(args, 1)
    local msg = table.concat(args, ' ')
    local OtherPlayer = QBCore.Functions.GetPlayer(playerId)
    if msg == '' then return end
    if not OtherPlayer then return TriggerClientEvent('QBCore:Notify', src, 'Player is not online', 'error') end
    if not QBCore.Functions.HasPermission(src, 'admin') or IsPlayerAceAllowed(src, 'command') ~= 1 then return end
    TriggerClientEvent('chat:addMessage', playerId, {
        color = {255, 0, 0},
        multiline = true,
        args = {'Admin Response', msg}
    })
    TriggerClientEvent('chat:addMessage', src, {
        color = {255, 0, 0},
        multiline = true,
        args = {'Report Response ('..playerId..')', msg}
    })
    TriggerClientEvent('QBCore:Notify', src, 'Reply Sent')
    TriggerEvent('qb-log:server:CreateLog', 'report', 'Report Reply', 'red', '**'..GetPlayerName(src)..'** replied on: **'..OtherPlayer.PlayerData.name.. ' **(ID: '..OtherPlayer.PlayerData.source..') **Message:** ' ..msg, false)
end, 'admin')

QBCore.Commands.Add('setmodel', Lang:t("commands.change_ped_model"), {{name='model', help='Name of the model'}, {name='id', help='Id of the Player (empty for yourself)'}}, false, function(source, args)
    local model = args[1]
    local target = tonumber(args[2])
    if model ~= nil or model ~= '' then
        if target == nil then
            TriggerClientEvent('qb-admin:client:SetModel', source, tostring(model))
        else
            local Trgt = QBCore.Functions.GetPlayer(target)
            if Trgt ~= nil then
                TriggerClientEvent('qb-admin:client:SetModel', target, tostring(model))
            else
                TriggerClientEvent('QBCore:Notify', source, Lang:t("error.not_online"), 'error')
            end
        end
    else
        TriggerClientEvent('QBCore:Notify', source, Lang:t("error.failed_set_model"), 'error')
    end
end, 'admin')

QBCore.Commands.Add('setspeed', Lang:t("commands.set_player_foot_speed"), {}, false, function(source, args)
    local speed = args[1]
    if speed ~= nil then
        TriggerClientEvent('qb-admin:client:SetSpeed', source, tostring(speed))
    else
        TriggerClientEvent('QBCore:Notify', source, Lang:t("error.failed_set_speed"), 'error')
    end
end, 'admin')

QBCore.Commands.Add('reporttoggle', Lang:t("commands.report_toggle"), {}, false, function(source, _)
    local src = source
    QBCore.Functions.ToggleOptin(src)
    if QBCore.Functions.IsOptin(src) then
        TriggerClientEvent('QBCore:Notify', src, Lang:t("success.receive_reports"), 'success')
    else
        TriggerClientEvent('QBCore:Notify', src, Lang:t("error.no_receive_report"), 'error')
    end
end, 'admin')

QBCore.Commands.Add('kickall', Lang:t("commands.kick_all"), {}, false, function(source, args)
    local src = source
    if src > 0 then
        local reason = table.concat(args, ' ')
        if QBCore.Functions.HasPermission(src, 'god') or IsPlayerAceAllowed(src, 'command') then
            if reason and reason ~= '' then
                for _, v in pairs(QBCore.Functions.GetPlayers()) do
                    local Player = QBCore.Functions.GetPlayer(v)
                    if Player then
                        DropPlayer(Player.PlayerData.source, reason)
                    end
                end
            else
                TriggerClientEvent('QBCore:Notify', src, Lang:t("info.no_reason_specified"), 'error')
            end
        end
    else
        for _, v in pairs(QBCore.Functions.GetPlayers()) do
            local Player = QBCore.Functions.GetPlayer(v)
            if Player then
                DropPlayer(Player.PlayerData.source, Lang:t("info.server_restart") .. QBCore.Config.Server.Discord)
            end
        end
    end
end, 'god')

QBCore.Commands.Add('setammo', Lang:t("commands.ammo_amount_set"), {{name='amount', help='Amount of bullets, for example: 20'}, {name='weapon', help='Name of the weapon, for example: WEAPON_VINTAGEPISTOL'}}, false, function(source, args)
    local src = source
    local weapon = args[2]
    local amount = tonumber(args[1])

    if weapon ~= nil then
        TriggerClientEvent('qb-weapons:client:SetWeaponAmmoManual', src, weapon, amount)
    else
        TriggerClientEvent('qb-weapons:client:SetWeaponAmmoManual', src, 'current', amount)
    end
end, 'admin')

QBCore.Commands.Add('vector2', 'Copy vector2 to clipboard (Admin only)', {}, false, function(source)
    local src = source
    TriggerClientEvent('qb-admin:client:copyToClipboard', src, 'coords2')
end, 'admin')

QBCore.Commands.Add('vector3', 'Copy vector3 to clipboard (Admin only)', {}, false, function(source)
    local src = source
    TriggerClientEvent('qb-admin:client:copyToClipboard', src, 'coords3')
end, 'admin')

QBCore.Commands.Add('vector4', 'Copy vector4 to clipboard (Admin only)', {}, false, function(source)
    local src = source
    TriggerClientEvent('qb-admin:client:copyToClipboard', src, 'coords4')
end, 'admin')

QBCore.Commands.Add('heading', 'Copy heading to clipboard (Admin only)', {}, false, function(source)
    local src = source
    TriggerClientEvent('qb-admin:client:copyToClipboard', src, 'heading')
end, 'admin')

CreateThread(function()
    while true do
        local tempPlayers = {}
        for _, v in pairs(QBCore.Functions.GetPlayers()) do
            local targetped = GetPlayerPed(v)
            local ped = QBCore.Functions.GetPlayer(v)
            tempPlayers[#tempPlayers + 1] = {
                name = (ped.PlayerData.charinfo.firstname or '') .. ' ' .. (ped.PlayerData.charinfo.lastname or '') .. ' | (' .. (GetPlayerName(v) or '') .. ')',
                id = v,
                coords = GetEntityCoords(targetped),
                cid = ped.PlayerData.charinfo.firstname .. ' ' .. ped.PlayerData.charinfo.lastname,
                citizenid = ped.PlayerData.citizenid,
                sources = GetPlayerPed(ped.PlayerData.source),
                sourceplayer = ped.PlayerData.source

            }
        end
        -- Sort players list by source ID (1,2,3,4,5, etc) --
        table.sort(tempPlayers, function(a, b)
            return a.id < b.id
        end)
        players = tempPlayers
        Wait(1500)
    end
end)
Config = {}

Config.CommandPermission = 'god' -- permission level for creating new doors
Config.AdminAccess = false -- Enable admins to unlock any door
Config.AdminPermission = 'god' -- The permission needed to get AdminAccess if it is enabled
Config.Warnings = false -- if true it will show warnings in the console when certain requirements aren't met
Config.FallbackDistance = 3.0 -- Distance to fall back on when it is not set
Config.EnableSounds = true -- Enable sounds when unlocking/locking doors (doors triggered by scripts can have the sound manually disabled)
Config.EnableAnimation = true -- Enable the animation when unlocking/locking doors (doors triggered by scripts can have the animation manually disabled)
Config.SaveDoorDialog = true -- Saves the door dialogue popup between door saves
Config.PersistentDoorStates = false -- Persists the door state between server restarts
Config.PersistentSaveInternal = 60000 -- How often door states are saved to the file system, in miliseconds. 

Config.ChangeColor = false -- Change the color of the box of the popup text based on if it is locked or not
Config.DefaultColor = 'rgb(19, 28, 74)' -- The default color of the box of the popup text if Config.ChangeColor is false
Config.LockedColor = 'rgb(219 58 58)' -- The color of the box of the popup text if Config.ChangeColor is true and the door is locked
Config.UnlockedColor = 'rgb(27 195 63)' -- The color of the box of the popup text if Config.ChangeColor is true and the door is unlocked
Config.UseDoorLabelText = false -- Will use the LABEL field as the nui text instead of locked/unlocked
Config.DoorDebug = false -- Enable DRAWTEXT in the world at the coords where the door 'center' is
Config.RemoteTriggerDistance = 15.0 -- This is how far from your camera the raycast will go to try to hit something solid
Config.RemoteTriggerMinDistance = 5.0 -- This is the minimum distance required for the raycast hit to count near a door. It will take the larger two between this and 'distance' option

Config.Consumables = { ['ticket'] = 1, ['paperclip'] = 1 } -- The items will get removed once used on a door that has the item on it

--[[ -- Configuration Options
Config.DoorList['configname-identifier'] = {
	fixText = false, -- Adjusts guess of center of door
	textCoords = vector3(x, y, z) -- Set the text coordinates to a specific location
	setText = true -- Use with above setting
		distance = 2.0, -- Max interact distance
		lockpick = true, -- Alows for lockpicking
	allAuthorized = true, -- Anyone can use door
	authorizedJobs = { ['police']=0, ['bcso']=0, ['sasp]=0 } -- Authorize door access based on job grade
	authorizedGangs = { ['vagos']=0, ['ballas']=0 } -- Authorize door access based on gang grade
	authorizedCitizenIDs = { 'ABC123', 'DEF456' } -- Authorize door access based on citizenid
	items = {'item_1','item_2'} -- Authorize based on items. Must have all items in this list.
		doorLabel = 'Cloakroom', -- Label of room that shows up when nearby
		locked = true, -- Default lock state
		audioRemote = true, -- Play sound from the player instead of the door
		audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6}, -- Play sound on door lock
		audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7}, -- Play sound on door unlock
		autoLock = 1000, -- Auto lock after this many miliseconds
		doorRate = 1.0,  -- Time till auto closes? Needs more testing
	cantUnlock = true -- Set to true to not allow the player to unlock the door, only lock it. This means a script will have to trigger the unlock.
	pickable = true, -- Can use a lockpick to unlock, only need if true
	hideLabel = true, -- Set to true to hide the popup label, for hiding doors ;)
		remoteTrigger = true, -- If you want to be able to remote trigger a door with H, put this here 
} 
]]

Config.DoorStates = {}
Config.DoorList = {
	{
		objName = 'hei_v_ilev_bk_gate2_pris',
		objCoords  = vec3(261.83, 221.39, 106.41),
		textCoords = vec3(261.83, 221.39, 106.41),
		authorizedJobs = { 'police' },
		objYaw = -110.0,
		locked = true,
		pickable = false,
		distance = 1.5,
	},
	--door2 for pacific opened with thermite right near the vault door
	{
		objName = 'hei_v_ilev_bk_safegate_pris',
		objCoords  = vec3(252.98, 220.65, 101.8),
		textCoords = vec3(252.98, 220.65, 101.8),
		authorizedJobs = { 'police' },
		objYaw = 160.0,
		locked = true,
		pickable = false,
		distance = 1.5
	},
	-- door3 for pacific opened with thermite after passing the door near vault
	{
		objName = 'hei_v_ilev_bk_safegate_pris',
		objCoords  = vec3(261.68, 215.62, 101.81),
		textCoords = vec3(261.68, 215.62, 101.81),
		authorizedJobs = { 'police' },
		objYaw = -110.0,
		locked = true,
		pickable = false,
		distance = 1.5
	},
	-- Paleto Door 1 opened with security card A
	{
		objName = 'v_ilev_cbankvaulgate01',
		objCoords  = vec3(-105.77, 6472.59, 31.81),
		textCoords = vec3(-105.77, 6472.59, 31.81),
		objYaw = 45.0,
		authorizedJobs = { 'police' },
		locked = true,
		pickable = false,
		distance = 1.5
	},
	-- Paleto Door 2 opened with thermite
	{
		objName = 'v_ilev_cbankvaulgate02',
		objCoords  = vec3(-106.26, 6476.01, 31.98),
		textCoords = vec3(-105.5, 6475.08, 31.99),
		objYaw = -45.0,
		authorizedJobs = { 'police' },
		locked = true,
		pickable = false,
		distance = 1.5
	},
	-- First Pacific Door opened with lockpick
	{
		objName = 'hei_v_ilev_bk_gate_pris',
		objCoords  = vec3(257.41, 220.25, 106.4),
		textCoords = vec3(257.41, 220.25, 106.4),
		authorizedJobs = { 'police' },
		objYaw = -20.0,
		locked = true,
		pickable = true,
		distance = 1.5
	},
	-- Second Pacific Door opened with lockpick
	{
		objName = 'v_ilev_bk_door',
		objCoords  = vec3(265.19, 217.84, 110.28),
		textCoords = vec3(265.19, 217.84, 110.28),
		authorizedJobs = { 'police' },
		objYaw = -20.0,
		locked = true,
		pickable = true,
		distance = 1.5
	},
	-- Fleeca Door opened with lockpick
	{
		objName = 'v_ilev_gb_vaubar',
		objCoords  = vec3(314.61, -285.82, 54.49),
		textCoords = vec3(313.3, -285.45, 54.49),
		authorizedJobs = { 'police' },
		locked = true,
		pickable = true,
		distance = 1.5
	},
	-- Fleeca Door opened with lockpick
	{
		objName = 'v_ilev_gb_vaubar',
		objCoords  = vec3(148.96, -1047.12, 29.7),
		textCoords = vec3(148.96, -1047.12, 29.7),
		authorizedJobs = { 'police' },
		locked = true,
		pickable = true,
		distance = 1.5
	},
	-- Fleeca Door opened with lockpick
	{
		objName = 'v_ilev_gb_vaubar',
		objCoords  = vec3(-351.7, -56.28, 49.38),
		textCoords = vec3(-351.7, -56.28, 49.38),
		authorizedJobs = { 'police' },
		locked = true,
		pickable = true,
		distance = 1.5
	},
	-- Fleeca Door opened with lockpick
	{
		objName = 'v_ilev_gb_vaubar',
		objCoords  = vec3(-1208.12, -335.586, 37.759),
		textCoords = vec3(-1208.12, -335.586, 37.759),
		authorizedJobs = { 'police' },
		locked = true,
		pickable = true,
		distance = 1.5
	},
	-- Fleeca Door opened with lockpick
	{
		objName = 'v_ilev_gb_vaubar',
		objCoords  = vec3(-2956.18, 483.96, 16.02),
		textCoords = vec3(-2956.18, 483.96, 16.02),
		authorizedJobs = { 'police' },
		locked = true,
		pickable = true,
		distance = 1.5
	},
	-- Prison Door 1
	{
		objName = 'prop_gate_prison_01',
		objCoords  = vec3(1844.9, 2604.8, 44.6),
		textCoords = vec3(1844.9, 2608.5, 48.0),
		authorizedJobs = { 'police' },
		locked = true,
		pickable = false,
		distance = 13
	},
	-- Prison Door 2
	{
		objName = 'prop_gate_prison_01',
		objCoords  = vec3(1818.5, 2604.8, 44.6),
		textCoords = vec3(1818.5, 2608.4, 48.0),
		authorizedJobs = { 'police' },
		locked = true,
		pickable = false,
		distance = 13
	},
	-- Prison Door 3
	{
		objName = 'prop_gate_prison_01',
		objCoords = vec3(1799.237, 2616.303, 44.6),
		textCoords = vec3(1795.941, 2616.969, 48.0),
		authorizedJobs = { 'police' },
		locked = true,
		pickable = false,
		distance = 10
	},
	------------------------------------------Always add new doors below this line for your bank robberies to work!!!---------------------------------
				------------------------------------------End Fixed Doors!!!---------------------------------
	{
		textCoords = vec3(434.81, -981.93, 30.89),
		authorizedJobs = { 'police' },
		locked = false,
		pickable = false,
		distance = 2.5,
		doors = {
			{
				objName = 'v_ilev_ph_door01',
				objYaw = -90.0,
				objCoords = vec3(434.7, -980.6, 30.8)
			},

			{
				objName = 'v_ilev_ph_door002',
				objYaw = -90.0,
				objCoords = vec3(434.7, -983.2, 30.8)
			}
		}
	},
	{
		objName = 'v_ilev_ph_gendoor004',
		objYaw = 90.0,
		objCoords  = vec3(450.13, -986.88, 30.69),
		textCoords = vec3(450.13, -986.88, 30.69),
		authorizedJobs = { 'police' },
		locked = true,
		pickable = false,
		distance = 1.5,
	},
	-- Rooftop
	{
		objName = 'v_ilev_gtdoor02',
		objYaw = 90.0,
		objCoords  = vec3(464.3, -984.6, 43.8),
		textCoords = vec3(464.38, -983.64, 43.8),
		authorizedJobs = { 'police' },
		locked = true,
		pickable = false,
		distance = 1.5,
	},
	-- Hallway to roof
	{
		objName = 'v_ilev_arm_secdoor',
		objYaw = 90.0,
		objCoords  = vec3(461.32, -986.38, 30.69),
		textCoords = vec3(461.32, -986.38, 30.69),
		authorizedJobs = { 'police' },
		locked = true,
		pickable = false,
		distance = 1.5,
	},
	-- Armory
	{
		objName = 'v_ilev_gtdoor',
		objYaw = -90.0,
		objCoords  = vec3(452.6, -982.7, 30.6),
		textCoords = vec3(452.95, -982.16, 30.99),
		authorizedJobs = { 'police' },
		locked = true,
		pickable = false,
		distance = 1.5,
	},
	-- Captain Office
	{
		objName = 'v_ilev_ph_gendoor002',
		objYaw = -180.0,
		objCoords  = vec3(447.72, -980.17, 30.81),
		textCoords = vec3(447.72, -980.17, 30.81),
		authorizedJobs = { 'police' },
		locked = true,
		pickable = false,
		distance = 1.5,
	},
    ---frontgate
    
	-- To downstairs (double doors)
	{
		textCoords = vec3(444.71, -989.43, 30.92),
		authorizedJobs = { 'police' },
		locked = true,
		pickable = false,
		distance = 2.0,
		doors = {
			{
				objName = 'v_ilev_ph_gendoor005',
				objYaw = 180.0,
				objCoords = vec3(443.9, -989.0, 30.6)
			},

			{
				objName = 'v_ilev_ph_gendoor005',
				objYaw = 0.0,
				objCoords = vec3(445.3, -988.7, 30.6)
			}
		}
	},
	-- Mission Row Cells
	-- Main Cells
	{
		objName = 'v_ilev_ph_cellgate',
		objYaw = 0.0,
		objCoords  = vec3(463.45, -992.6, 25.10),
		textCoords = vec3(463.45, -992.6, 25.10),
		authorizedJobs = { 'police' },
		locked = true,
		pickable = false,
		distance = 1.0,
	},
	-- Cell 1
	{
		objName = 'v_ilev_ph_cellgate',
		objYaw = -90.0,
		objCoords  = vec3(461.89, -993.31, 25.13),
		textCoords = vec3(461.89, -993.31, 25.13),
		authorizedJobs = { 'police' },
		locked = true,
		pickable = false,
		distance = 1.0,
	},
	-- Cell 2
	{
		objName = 'v_ilev_ph_cellgate',
		objYaw = 90.0,
		objCoords  = vec3(461.89, -998.81, 25.13),
		textCoords = vec3(461.89, -998.81, 25.13),
		authorizedJobs = { 'police' },
		locked = true,
		pickable = false,
		distance = 1.0,
	},
	-- Cell 3
	{
		objName = 'v_ilev_ph_cellgate',
		objYaw = 90.0,
		objCoords  = vec3(461.89, -1002.44, 25.13),
		textCoords =  vec3(461.89, -1002.44, 25.13),
		authorizedJobs = { 'police' },
		locked = true,
		pickable = false,
		distance = 1.0,
	},
	-- To Back
	{
		objName = 'v_ilev_gtdoor',
		objYaw = 0.0,
		objCoords  = vec3(464.61, -1003.64, 24.98),
		textCoords = vec3(464.61, -1003.64, 24.98),
		authorizedJobs = { 'police' },
		locked = true,
		pickable = false,
		distance = 2.0,
	},
	-- Mission Row Back
	-- Back (double doors)
	{
		textCoords = vec3(468.67, -1014.43, 26.48),
		authorizedJobs = { 'police' },
		locked = true,
		pickable = false,
		distance = 2.5,
		doors = {
			{
				objName = 'v_ilev_rc_door2',
				objYaw = 0.0,
				objCoords  = vec3(467.3, -1014.4, 26.5)
			},

			{
				objName = 'v_ilev_rc_door2',
				objYaw = 180.0,
				objCoords  = vec3(469.9, -1014.4, 26.5)
			}
		}
	},
	-- Back Gate
	-- {
	-- 	objName = 'hei_prop_station_gate',
	-- 	objYaw = 90.0,
	-- 	objCoords  = vec3(488.89, -1017.21, 27.15),
	-- 	textCoords = vec3(488.89, -1017.21, 27.15),
	-- 	authorizedJobs = { 'police' },
	-- 	locked = true,
	-- 	pickable = false,
	-- 	distance = 14
	-- },
	-- Mission Row Extension
	-- Briefing room
	{
		textCoords = vec3(455.86, -981.31, 26.86),
		authorizedJobs = { 'police' },
		locked = false,
		pickable = false,
		distance = 2.5,
		doors = {
			{
				objName = 'v_ilev_ph_gendoor005',
				objYaw = 90.0,
				objCoords  = vec3(455.94, -980.57, 26.67)
			},

			{
				objName = 'v_ilev_ph_gendoor005',
				objYaw = 270.0,
				objCoords  = vec3(455.85, -982.14, 26.67)
			}
		}
	},
	-- To Breakrooms
	{
		objName = 'v_ilev_ph_gendoor005',
		objYaw = 90.0,
		objCoords  = vec3(465.62, -985.93, 25.74),
		textCoords = vec3(465.62, -985.93, 25.74),
		authorizedJobs = { 'police' },
		locked = true,
		pickable = false,
		distance = 1.0,
	},
	-- New Cell 1
	{
		objName = 'v_ilev_ph_cellgate',
		objYaw = 180.0,
		objCoords  = vec3(468.57, -999.44, 25.07),
		textCoords = vec3(468.57, -999.44, 25.07),
		authorizedJobs = { 'police' },
		locked = true,
		pickable = false,
		distance = 1.0,
	},
	-- New Cell 2
	{
		objName = 'v_ilev_ph_cellgate',
		objYaw = 180.0,
		objCoords  = vec3(472.16, -999.47, 25.05),
		textCoords = vec3(472.16, -999.47, 25.05),
		authorizedJobs = { 'police' },
		locked = true,
		pickable = false,
		distance = 1.0,
	},
	-- New Cell 3
	{
		objName = 'v_ilev_ph_cellgate',
		objYaw = 180.0,
		objCoords  = vec3(476.4, -1007.68, 24.41),
		textCoords = vec3(476.4, -1007.68, 24.41),
		authorizedJobs = { 'police' },
		locked = true,
		pickable = false,
		distance = 1.0,
	},
	-- New Cell 4
	{
		objName = 'v_ilev_ph_cellgate',
		objYaw = 180.0,
		objCoords  = vec3(480.0, -1007.7, 24.41),
		textCoords = vec3(480.0, -1007.7, 24.41),
		authorizedJobs = { 'police' },
		locked = true,
		pickable = false,
		distance = 1.0,
	},
	-- To Photoroom
	{
		objName = 'v_ilev_ph_gendoor006',
		objYaw = 0.0,
		objCoords  = vec3(475.05, -995.08, 24.46),
		textCoords = vec3(475.05, -995.08, 24.46),
		authorizedJobs = { 'police' },
		locked = true,
		pickable = false,
		distance = 1.0,
	},
	-- To Standplace
	{
		objName = 'v_ilev_ph_gendoor006',
		objYaw = 180.0,
		objCoords  = vec3(485.71, -996.08, 24.45),
		textCoords = vec3(485.71, -996.08, 24.45),
		authorizedJobs = { 'police' },
		locked = true,
		pickable = false,
		distance = 1.0,
	},
	-- To Interigation 1
	{
		objName = 'v_ilev_ph_gendoor005',
		objYaw = 180.0,
		objCoords  = vec3(484.63, -999.74, 24.46),
		textCoords = vec3(484.63, -999.74, 24.46),
		authorizedJobs = { 'police' },
		locked = true,
		pickable = false,
		distance = 1.0,
	},
	-- To Interigation 2
	{
		objName = 'v_ilev_ph_gendoor005',
		objYaw = 180.0,
		objCoords  = vec3(491.37, -999.81, 24.46),
		textCoords = vec3(491.37, -999.81, 24.46),
		authorizedJobs = { 'police' },
		locked = true,
		pickable = false,
		distance = 1.0,
	},
	-- To Evidence
	{
		objName = 'v_ilev_ph_gendoor005',
		objYaw = 180.0,
		objCoords  = vec3(470.78, -992.21, 25.12),
		textCoords = vec3(470.78, -992.21, 25.12),
		authorizedJobs = { 'police' },
		locked = true,
		pickable = false,
		distance = 1.0,
	},
	-- Bureau Paleto Bay
	{
		textCoords = vec3(-435.57, 6008.76, 27.98),
		authorizedJobs = { 'police' },
		locked = true,
		pickable = false,
		distance = 2.5,
		doors = {
			{
				objName = 'v_ilev_ph_gendoor002',
				objYaw = -135.0,
				objCoords = vec3(-436.5157, 6007.844, 28.13839),
			},
			{
				objName = 'v_ilev_ph_gendoor002',
				objYaw = 45.0,
				objCoords = vec3(-434.6776, 6009.681, 28.13839)
			}
		}
	},
	-- Back door left
	{
		objName = 'v_ilev_rc_door2',
		objYaw = 135.0,
		objCoords  = vec3(-450.9664, 6006.086, 31.99004),
		textCoords = vec3(-451.38, 6006.55, 31.84),
		authorizedJobs = { 'police' },
		locked = true,
		pickable = false,
		distance = 2.0,
	},
	-- Back door right
	{
		objName = 'v_ilev_rc_door2',
		objYaw = -45.0,
		objCoords  = vec3(-447.2363, 6002.317, 31.84003),
		textCoords = vec3(-446.77, 6001.84, 31.68),
		authorizedJobs = { 'police' },
		locked = true,
		pickable = false,
		distance = 2.0,
	},
	-- Locker room
	{
		objName = 'v_ilev_rc_door2',
		objYaw = -45.0,
		objCoords  = vec3(-450.7136, 6016.371, 31.86523),
		textCoords = vec3(-450.15, 6015.96, 31.71),
		authorizedJobs = { 'police' },
		locked = true,
		pickable = false,
		distance = 2.0,
	},
	-- Locker room 2
	{
		objName = 'v_ilev_rc_door2',
		objYaw = 45.0,
		objCoords  = vec3(-454.0435, 6010.243, 31.86106),
		textCoords = vec3(-453.56, 6010.73, 31.71),
		authorizedJobs = { 'police' },
		locked = true,
		pickable = false,
		distance = 2.0,
	},
	-- Armory
	{
		objName = 'v_ilev_arm_secdoor',
		objYaw = -135.0,
		objCoords  = vec3(-439.1576, 5998.157, 31.86815),
		textCoords = vec3(-438.64, 5998.51, 31.71),
		authorizedJobs = { 'police' },
		locked = true,
		pickable = false,
		distance = 2.0,
	},
	-- Interrogation room
	{
		objName = 'v_ilev_arm_secdoor',
		objYaw = 45.0,
		objCoords  = vec3(-436.6276, 6002.548, 28.14062),
		textCoords = vec3(-437.09, 6002.100, 27.98),
		authorizedJobs = { 'police' },
		locked = true,
		pickable = false,
		distance = 2.0,
	},
	-- Entrance cells 1
	{
		objName = 'v_ilev_ph_cellgate1',
		objYaw = 45.0,
		objCoords  = vec3(-438.228, 6006.167, 28.13558),
		textCoords = vec3(-438.610, 6005.64, 27.98),
		authorizedJobs = { 'police' },
		locked = true,
		pickable = false,
		distance = 2.0,
	},
	-- Entrance cells 2
	{
		objName = 'v_ilev_ph_cellgate1',
		objYaw = 45.0,
		objCoords  = vec3(-442.1082, 6010.052, 28.13558),
		textCoords = vec3(-442.55, 6009.61, 27.98),
		authorizedJobs = { 'police' },
		locked = true,
		pickable = false,
		distance = 2.0,
	},
	-- Cel
	{
		objName = 'v_ilev_ph_cellgate1',
		objYaw = 45.0,
		objCoords  = vec3(-444.3682, 6012.223, 28.13558),
		textCoords = vec3(-444.77, 6011.74, 27.98),
		authorizedJobs = { 'police' },
		locked = true,
		pickable = false,
		distance = 2.0,
	},
	-- Hallway (double doors)
	{
		textCoords = vec3(-442.09, 6011.93, 31.86523),
		authorizedJobs = { 'police' },
		locked = true,
		pickable = false,
		distance = 2.5,
		doors = {
			{
				objName = 'v_ilev_rc_door2',
				objYaw = 225.0,
				objCoords  = vec3(-441.0185, 6012.795, 31.86523),
			},

			{
				objName = 'v_ilev_rc_door2',
				objYaw = 45.0,
				objCoords  = vec3(-442.8578, 6010.958, 31.86523)
			}
		}
	},
	-- Hallway to the back (double doors)
	{
		textCoords = vec3(-448.67, 6007.52, 31.86523),
		authorizedJobs = { 'police' },
		locked = true,
		pickable = false,
		distance = 2.5,
		doors = {
			{
				objName = 'v_ilev_rc_door2',
				objYaw = 135.0,
				objCoords = vec3(-447.7283, 6006.702, 31.86523),
			},

			{
				objName = 'v_ilev_rc_door2',
				objYaw = -45.0,
				objCoords = vec3(-449.5656, 6008.538, 31.86523)
			}
		}
	},
	--outside doors
	{
		objName = 'prop_fnclink_03gate5',
		objCoords = vec3(1796.322, 2596.574, 45.565),
		textCoords = vec3(1796.322, 2596.574, 45.965),
		authorizedJobs = { 'police' },
		locked = true,
		pickable = false,
		distance = 2.5
	},
	{
		objName = 'v_ilev_gtdoor',
		objCoords = vec3(1821.677, 2477.265, 45.945),
		textCoords = vec3(1821.677, 2477.265, 45.945),
		authorizedJobs = { 'police' },
		locked = true,
		pickable = false,
		distance = 2.5
	},
	{
		objName = 'v_ilev_gtdoor',
		objCoords = vec3(1760.692, 2413.251, 45.945),
		textCoords = vec3(1760.692, 2413.251, 45.945),
		authorizedJobs = { 'police' },
		locked = true,
		pickable = false,
		distance = 2.5
	},
	{
		objName = 'v_ilev_gtdoor',
		objCoords = vec3(1543.58, 2470.252, 45.945),
		textCoords = vec3(1543.58, 2470.25, 45.945),
		authorizedJobs = { 'police' },
		locked = true,
		pickable = false,
		distance = 2.5
	},
	{
		objName = 'v_ilev_gtdoor',
		objCoords = vec3(1659.733, 2397.475, 45.945),
		textCoords = vec3(1659.733, 2397.475, 45.945),
		authorizedJobs = { 'police' },
		locked = true,
		pickable = false,
		distance = 2.5
	},
	{
		objName = 'v_ilev_gtdoor',
		objCoords = vec3(1537.731, 2584.842, 45.945),
		textCoords = vec3(1537.731, 2584.842, 45.945),
		authorizedJobs = { 'police' },
		locked = true,
		pickable = false,
		distance = 2.5
	},
	{
		objName = 'v_ilev_gtdoor',
		objCoords  = vec3(1571.964, 2678.354, 45.945),
		textCoords = vec3(1571.964, 2678.354, 45.945),
		authorizedJobs = { 'police' },
		locked = true,
		pickable = false,
		distance = 2.5
	},
	{
		objName = 'v_ilev_gtdoor',
		objCoords  = vec3(1650.18, 2755.104, 45.945),
		textCoords = vec3(1650.18, 2755.104, 45.945),
		authorizedJobs = { 'police' },
		locked = true,
		pickable = false,
		distance = 2.5
	},
	{
		objName = 'v_ilev_gtdoor',
		objCoords  = vec3(1771.98, 2759.98, 45.945),
		textCoords = vec3(1771.98, 2759.98, 45.945),
		authorizedJobs = { 'police' },
		locked = true,
		pickable = false,
		distance = 2.5
	},
	{
		objName = 'v_ilev_gtdoor',
		objCoords  = vec3(1845.7, 2699.79, 45.945),
		textCoords = vec3(1845.7, 2699.79, 45.945),
		authorizedJobs = { 'police' },
		locked = true,
		pickable = false,
		distance = 2.5
	},
	{
		objName = 'v_ilev_gtdoor',
		objCoords  = vec3(1820.68, 2621.95, 45.945),
		textCoords = vec3(1820.68, 2621.95, 45.945),
		authorizedJobs = { 'police' },
		locked = true,
		pickable = false,
		distance = 2.5
	},
	-- Bolingbroke Extra
	-- To Offices
	{
		objName = 'v_ilev_gtdoor',
		objYaw = 90.0,
		objCoords  = vec3(1819.129, 2593.64, 46.09929),
		textCoords = vec3(1843.3, 2579.39, 45.98),
		authorizedJobs = { 'police' },
		locked = true,
		pickable = false,
		distance = 2.0
	},
	-- To Changingroom
	{
		objName = 'v_ilev_gtdoor',
		objYaw = 360.0,
		objCoords  = vec3(1827.365, 2587.547, 46.09929),
		textCoords = vec3(1835.76, 2583.15, 45.95),
		authorizedJobs = { 'police' },
		locked = true,
		pickable = false,
		distance = 2.0
	},
	-- To CrimChangingroom
	{
		objName = 'v_ilev_gtdoor',
		objYaw = 90.0,
		objCoords  = vec3(1826.466, 2585.271, 46.09929),
		textCoords = vec3(1835.77, 2589.76, 45.95),
		authorizedJobs = { 'police' },
		locked = true,
		pickable = false,
		distance = 1.0
	},
	-- To CheckingRoom
	{
		objName = 'v_ilev_gtdoor',
		objYaw = 0.0,
		objCoords  = vec3(1827.521, 2583.905, 45.28576),
		textCoords = vec3(1828.638, 2584.675, 45.95233),
		authorizedJobs = { 'police' },
		locked = true,
		pickable = false,
		distance = 2
	},
	-- Checking Gate
	{
		objName = 'v_ilev_gtdoor',
		objYaw = 270.0,
		objCoords  = vec3(1837.714, 2595.185, 46.09929),
		textCoords = vec3(1837.714, 2595.185, 46.09929),
		authorizedJobs = { 'police' },
		locked = true,
		pickable = false,
		distance = 1.5
	},
	-- To CheckingRoomFromCheck
	{
		objName = 'v_ilev_gtdoor',
		objYaw = 90.0,
		objCoords  = vec3(1837.697, 2585.24, 46.09929),
		textCoords = vec3(1837.697, 2585.24, 46.09929),
		authorizedJobs = { 'police' },
		locked = true,
		pickable = false,
		distance = 1.5
	},
	-- To SecondCheckGate
	{
		objName = 'v_ilev_gtdoor',
		objYaw = 90.0,
		objCoords  = vec3(1845.198, 2585.24, 46.09929),
		textCoords = vec3(1845.198, 2585.24, 46.09929),
		authorizedJobs = { 'police' },
		locked = false,
		pickable = false,
		distance = 1.5
	},
	-- To MainHall
	{
		objName = 'v_ilev_ph_door002',
		objYaw = 90.0,
		objCoords  = vec3(1791.18, 2593.11, 546.15),
		textCoords = vec3(1791.18, 2593.11, 546.15),
		authorizedJobs = { 'police' },
		locked = true,
		pickable = false,
		distance = 2.0
	},
	-- To VisitorRoom
	{
		objName = 'prison_prop_door2',
		objYaw = 90.0,
		objCoords  = vec3(1784, 2599, 46),
		textCoords = vec3(1785.808, 2590.02, 44.79703),
		authorizedJobs = { 'police' },
		locked = true,
		pickable = false,
		distance = 2.0
	},
	{
		objName = 'prison_prop_door1',
		objYaw = 0.0,
		objCoords  = vec3(1786, 2600, 46),
		textCoords = vec3(1785.808, 2590.02, 44.79703),
		authorizedJobs = { 'police' },
		locked = true,
		pickable = false,
		distance = 2.0
	},
	{
		textCoords = vec3(1785.83, 2609.59, 45.99),
		authorizedJobs = { 'police' },
		locked = true,
		pickable = false,
		distance = 2.5,
		doors = {
			{
				objName = 'prison_prop_door1',
				objYaw = 182.0,
				objCoords = vec3(1785, 2610, 46),
			},

			{
				objName = 'prison_prop_door1a',
				objYaw = 0.0,
				objCoords = vec3(1787, 2610, 46),
			}
		}
	},
	{
		textCoords = vec3(1779.67, 2601.83, 50.71),
		authorizedJobs = { 'police' },
		locked = true,
		pickable = false,
		distance = 2.5,
		doors = {
			{
				objName = 'prison_prop_door2',
				objYaw = 1.5,
				objCoords = vec3(1781, 2602, 51),
			},

			{
				objName = 'prison_prop_door2',
				objYaw = 180.0,
				objCoords = vec3(1778, 2602, 51),
			}
		}
	},
	{
		objName = 'prison_prop_door2',
		objYaw = 0.0,
		objCoords  = vec3(1780, 2596, 51),
		textCoords = vec3(1785.808, 2590.02, 44.79703),
		authorizedJobs = { 'police' },
		locked = true,
		pickable = false,
		distance = 2.0
	},
	{
		objName = 'prison_prop_door1',
		objYaw = 0.0,
		objCoords  = vec3(1787, 2621, 46),
		textCoords = vec3(1785.808, 2590.02, 44.79703),
		authorizedJobs = { 'police' },
		locked = true,
		pickable = false,
		distance = 2.0
	},
	{
		objName = 'prison_prop_door2',
		objYaw = 270.0,
		objCoords  = vec3(1788, 2606, 51),
		textCoords = vec3(1785.808, 2590.02, 44.79703),
		authorizedJobs = { 'police' },
		locked = true,
		pickable = false,
		distance = 2.0
	},
	{
		textCoords = vec3(1791.08, 2593.76, 46.18),
		authorizedJobs = { 'police' },
		locked = true,
		pickable = false,
		distance = 2.5,
		doors = {
			{
				objName = 'prison_prop_door1',
				objYaw = 272.0,
				objCoords = vec3(1791.1140136719, 2592.50390625, 46.3132473297119),
			},

			{
				objName = 'prison_prop_door1a',
				objYaw = 90.0,
				objCoords = vec3(1791, 2595, 46),
			}
		}
	},
	-- To DoctorRoom
	{
		objName = 'v_ilev_ph_gendoor002',
		objYaw = 90.0,
		objCoords  = vec3(1786.4, 2579.8, 45.97),
		textCoords = vec3(1786.4, 2579.8, 45.97),
		authorizedJobs = { 'police' },
		locked = true,
		pickable = false,
		distance = 1.0
	},
	-- HallGate
	{
		objName = 'prison_prop_door2',
		objYaw = 0.0,
		objCoords  = vec3(1786, 2567, 46),
		textCoords = vec3(1778.91, 2568.91, 46.07),
		authorizedJobs = { 'police' },
		locked = true,
		pickable = false,
		distance = 2.0
	},
	-- HallGate 2
	{
		objName = 'prison_prop_door1',
		objYaw = 270.0,
		objCoords  = vec3(1792, 2551, 46),
		textCoords = vec3(1773.49, 2568.9, 46.07),
		authorizedJobs = { 'police' },
		locked = true,
		pickable = false,
		distance = 2.0
	},
	{
		textCoords = vec3( 1781.72, 2552.07, 49.57),
		authorizedJobs = { 'police' },
		locked = true,
		pickable = false,
		distance = 2.5,
		doors = {
			{
				objName = 'prison_prop_door2',
				objYaw = 269.5,
				objCoords = vec3(1782, 2551, 50),
			},

			{
				objName = 'prison_prop_door2',
				objYaw = 90.0,
				objCoords = vec3(1782, 2553, 50),
			}
		}
	},
	-- Gate To Work
	{
		objName = 'prison_prop_door2',
		objYaw = 90.0,
		objCoords  = vec3(1786, 2552, 50),
		textCoords = vec3(1760.89, 2578.51, 46.07),
		authorizedJobs = { 'police' },
		locked = true,
		pickable = false,
		distance = 2.0
	},
	-- Cell Maindoor
	{
		objName = 'prison_prop_door2',
		objYaw = 180.0,
		objCoords  = vec3(1785, 2550, 46),
		textCoords = vec3(1760.89, 2578.51, 46.07),
		authorizedJobs = { 'police' },
		locked = true,
		pickable = false,
		distance = 2.0
	},
	{
		objName = 'prison_prop_door1a',
		objYaw = 270.0,
		objCoords  = vec3(1776, 2551, 46),
		textCoords = vec3(1760.89, 2578.51, 46.07),
		authorizedJobs = { 'police' },
		locked = true,
		pickable = false,
		distance = 2.0
	},
	-- Police front gate
	-- {
	-- 	objName = 'prop_gate_airport_01',
	-- 	objYaw = -90.0,
	-- 	objCoords  = vec3(416.0326, -1024.81, 28.098),
	-- 	textCoords = vec3(416.0326, -1024.81, 28.098),
	-- 	authorizedJobs = { 'police' },
	-- 	locked = true,
	-- 	pickable = false,
	-- 	distance = 20
	-- },
	-- Luxury Cars
	-- Entrance Doors
	{
		textCoords = vec3(-803.0223, -223.8222, 37.87975),
		authorizedJobs = { 'cardealer', 'police' },
		locked = true,
		pickable = false,
		distance = 3.5,
		doors = {
			{
				objName = 'prop_doorluxyry2',
				objYaw = 120.0,
				objCoords = vec3(-803.0223, -222.5841, 37.87975)
			},

			{
				objName = 'prop_doorluxyry2',
				objYaw = -60.0,
				objCoords = vec3(-801.9622, -224.5203, 37.87975)
			}
		}
	},
	-- Side Entrance Doors
	{
		textCoords = vec3(-777.1855, -244.0013, 37.333889),
		authorizedJobs = { 'cardealer', 'police' },
		locked = true,
		pickable = false,
		distance = 3.5,
		doors = {
			{
				objName = 'prop_doorluxyry',
				objYaw = -160.0,
				objCoords = vec3(-778.1855, -244.3013, 37.33388)
			},

			{
				objName = 'prop_doorluxyry',
				objYaw = 23.0,
				objCoords = vec3(-776.1591, -243.5013, 37.33388)
			}
		}
	},
	-- Garage Doors
	{
		textCoords = vec3(-768.1264, -238.9737, 37.43247),
		authorizedJobs = { 'cardealer', 'police' },
		locked = true,
		pickable = false,
		distance = 13.0,
		doors = {
			{
				objName = 'prop_autodoor',
				objCoords = vec3(-770.6311, -240.0069, 37.43247)
			},

			{
				objName = 'prop_autodoor',
				objCoords = vec3(-765.6217, -237.9405, 37.43247)
			}
		}
	},
	-- Pickle Rental
	-- Front door 1
	{
		objName = 'apa_prop_apa_cutscene_doorb',
		objCoords  = vec3(-21.71276, -1392.778, 29.63847),
		textCoords = vec3(-22.31276, -1392.778, 29.63847),
		authorizedJobs = { 'cardealer' },
		objYaw = -180.0,
		locked = true,
		pickable = false,
		distance = 2.5
	},
	-- Front door 2
	{
		objName = 'apa_prop_apa_cutscene_doorb',
		objCoords  = vec3(-32.67987, -1392.064, 29.63847),
		textCoords = vec3(-32.10987, -1392.064, 29.63847),
		authorizedJobs = { 'cardealer' },
		objYaw = 0.0,
		locked = true,
		pickable = false,
		distance = 2.5
	},
	-- Door to cellar
	{
		objName = 'apa_prop_apa_cutscene_doorb',
		objCoords  = vec3(-24.22668, -1403.067, 29.63847),
		textCoords = vec3(-24.22668, -1402.537, 29.63847),
		authorizedJobs = { 'cardealer' },
		objYaw = 90.0,
		locked = true,
		pickable = false,
		distance = 1.5
	},
	-- Back door
	{
		objName = 'apa_prop_apa_cutscene_doorb',
		objCoords  = vec3(-21.27107, -1406.845, 29.63847),
		textCoords = vec3(-21.27107, -1406.245, 29.63847),
		authorizedJobs = { 'cardealer' },
		objYaw = 90.0,
		locked = true,
		pickable = false,
		distance = 2.0
	},
}
