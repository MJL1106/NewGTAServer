if Config.Version == "new" then
    QBCore = exports['qb-core']:GetCoreObject()

elseif Config.Version == "old" then
    local QBCore = nil
    CreateThread(function()
        while QBCore == nil do
            TriggerEvent("QBCore:GetObject", function(obj)QBCore = obj end)
            Wait(200)
        end
    end)
end

local PowerPlantBomb = 0
local PacificThermiteCounter = 0
local PacificFirstFloorCounter = 0
local PacificHackTypeCounter = 0
local robberyBusy = false
local FirstCode = true
local lockDown = false
local Code1 = 0
local Code2 = 0
local timeOut = false
local Code1Cracked = false
local Code2Cracked = false
local BlackOutActive = false

QBCore.Functions.CreateCallback('qb-bankrobbery:server:isRobberyActive', function(source, cb)
    cb(robberyBusy)
end)

RegisterServerEvent('qb-bankrobbery:server:setBankState', function(state, bank, bankId)
    if bank == 'paleto' then
        if not robberyBusy then
            Config.PaletoBank['isOpened'] = state
            TriggerClientEvent('qb-bankrobbery:client:setBankState', -1, 'paleto', state)
        end
    elseif bank == 'lowerVault' then
        if not robberyBusy then
            Config.lowerVault['isOpened'] = state
            TriggerClientEvent('qb-bankrobbery:client:setBankState', -1, 'lowerVault', state)
        end
    elseif bank == 'pacific' then
        if not robberyBusy then
            Config.PacificBank['isVaultOpened'] = state
            TriggerClientEvent('qb-bankrobbery:client:setBankState', -1, 'pacific', state)
        end
    elseif bank == 'fleeca' then
        if not robberyBusy then
            Config.FleecaBanks[bankId]['isOpened'] = state
            TriggerClientEvent('qb-bankrobbery:client:setBankState', -1, bankId, state)
        end
    end
end)

RegisterServerEvent('qb-bankrobbery:server:setRedLaptopUsed', function(state, bank, bankId)
    if bank == 'pacific' then
        if not robberyBusy then
            Config.PacificBank['isOpened'] = state
            TriggerClientEvent('qb-bankrobbery:client:setRedLaptopUsed', -1, 'pacific', state)
        end
    end
end)

local bankStatus = {
    fleeca = { robberyBusy = false, timeOut = false },
    paleto = { robberyBusy = false, timeOut = false },
    pacific = { robberyBusy = false, timeOut = false },
}

RegisterNetEvent('qb-bankrobbery:server:setTimeout', function(type, closestBank)
    local playerId = sentSource or source
    local Player = QBCore.Functions.GetPlayer(playerId)
    local src = source
    if not bankStatus[type].robberyBusy then
        if not bankStatus[type].timeOut then
            bankStatus[type].robberyBusy = true
            Wait(Config.BankTimer[type] * (60 * 1000))  -- Use specific timer per bank type if needed

            -- Reset the status for the specific bank type
            bankStatus[type].timeOut = false
            bankStatus[type].robberyBusy = false
            TriggerClientEvent('qb-bankrobbery:client:ResetCurrentBank', src, type, closestBank)
        end
    end
end)

RegisterNetEvent('qb-bankrobbery:server:giveVaultGateItem',function()
    local item = 'vault_gate_cracker'
    local src = source
    local Player = QBCore.Functions.GetPlayer(source)

    Player.Functions.AddItem(item, 1, false)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], 'add')
    TriggerClientEvent('QBCore:Notify', src, Config.Notify["Got"] .. 1 .. Config.Notify["VaultCracker"])
    TriggerEvent('qb-log:server:CreateLog', 'bankrobbery', 'Bank Robbery', 'green', '**Goldbars**:\n'..GoldBars..'\n**Person**:\n'..GetPlayerName(src))

end)
RegisterNetEvent('qb-bankrobbery:server:FleecaTable', function(Table, bank, pos, closestBank)
    local src = source
    local Player = QBCore.Functions.GetPlayer(source)
    local info = {worth = math.random(Config.MarkedBillsWorthMin, Config.MarkedBillsWorthMax)} -- How much are Marked Bills worth


    if bank == 'fleeca' then
        local FleecaDist = #(pos - vector3(Config.FleecaBanks[closestBank]['coords'].x, Config.FleecaBanks[closestBank]['coords'].y, Config.FleecaBanks[closestBank]['coords'].z ))
        if FleecaDist <= 15 then 
            --local MarkedBags = math.random(Config.FleecaBagsMin, Config.FleecaBagsMax) -- How many bags can you get per trolly in a Fleeca
            local GoldBars = math.random(Config.FleecaGoldMin, Config.FleecaGoldMax) -- How many gold bars can you get in a fleeca?

            if Table == -180074230 then 
                local item = 'goldbar'

                Player.Functions.AddItem(item, GoldBars, false)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], 'add')
                TriggerClientEvent('QBCore:Notify', src, Config.Notify["Got"] .. GoldBars .. Config.Notify["GoldBars"])
                TriggerEvent('qb-log:server:CreateLog', 'bankrobbery', 'Bank Robbery', 'green', '**Goldbars**:\n'..GoldBars..'\n**Person**:\n'..GetPlayerName(src))

            else 
                local item = Config.BillsItem
                Player.Functions.AddItem(item, MarkedBags, false, info)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], 'add')
                TriggerClientEvent('QBCore:Notify', src, Config.Notify["Got"] .. MarkedBags .. Config.Notify["BagsOfInked"])
                TriggerEvent('qb-log:server:CreateLog', 'bankrobbery', 'Bank Robbery', 'green', '**Cash**:\n'..MarkedBags..'\n**Person**:\n'..GetPlayerName(src))
            end
        end

    elseif bank == 'paleto' then 
        local PaletoDist = #(pos - vector3(Config.PaletoBank['coords'].x, Config.PaletoBank['coords'].y, Config.PaletoBank['coords'].z ))
        if PaletoDist <= 15 then
            local MarkedBags = math.random(Config.PaletoBagsMin, Config.PaletoBagsMax) -- How many bags can you get per trolly in a Fleeca
            local GoldBars = math.random(Config.PaletoGoldMin, Config.PaletoGoldMax) -- How many gold bars can you get in a fleeca?

            if Table == -180074230 then 
                local item = 'goldbar'

                Player.Functions.AddItem(item, GoldBars, false)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], 'add')
                TriggerClientEvent('QBCore:Notify', src, Config.Notify["Got"] .. GoldBars .. Config.Notify["GoldBars"])
                TriggerEvent('qb-log:server:CreateLog', 'bankrobbery', 'Bank Robbery', 'green', '**Goldbars**:\n'..GoldBars..'\n**Person**:\n'..GetPlayerName(src))

            else 
                local item = Config.BillsItem

                Player.Functions.AddItem(item, MarkedBags, false, info)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], 'add')
                TriggerClientEvent('QBCore:Notify', src, Config.Notify["Got"] .. MarkedBags .. Config.Notify["BagsOfInked"])
                TriggerEvent('qb-log:server:CreateLog', 'bankrobbery', 'Bank Robbery', 'green', '**Cash**:\n'..MarkedBags..'\n**Person**:\n'..GetPlayerName(src))
            end
        end

    elseif bank == 'pacific' then 
        local MarkedBags = math.random(Config.PacificBagsMin, Config.PacificBagsMax) -- How many bags can you get per trolly in a Fleeca
        local GoldBars = math.random(Config.PacificGoldMin, Config.PacificGoldMax) -- How many gold bars can you get in a fleeca?

        if Table == -180074230 then 
            local item = 'goldbar'

            Player.Functions.AddItem(item, GoldBars, false)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], 'add')
            TriggerClientEvent('QBCore:Notify', src, Config.Notify["Got"] .. GoldBars .. Config.Notify["GoldBars"])
            TriggerEvent('qb-log:server:CreateLog', 'bankrobbery', 'Bank Robbery', 'green', '**Goldbars**:\n'..GoldBars..'\n**Person**:\n'..GetPlayerName(src))

        else 
            local item = Config.BillsItem

            Player.Functions.AddItem(item, MarkedBags, false, info)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], 'add')
            TriggerClientEvent('QBCore:Notify', src, Config.Notify["Got"] .. MarkedBags .. Config.Notify["BagsOfInked"])
            TriggerEvent('qb-log:server:CreateLog', 'bankrobbery', 'Bank Robbery', 'green', '**Cash**:\n'..MarkedBags..'\n**Person**:\n'..GetPlayerName(src))
        end

    elseif bank == 'lowerVault' then 
        local MarkedBags = math.random(Config.LowerVaultBagsMin, Config.LowerVaultBagsMax) -- How many bags can you get per trolly in a Fleeca
        local GoldBars = math.random(Config.LowerVaultGoldMin, Config.LowerVaultGoldMax) -- How many gold bars can you get in a fleeca?
        local Diamond = math.random(Config.LowerVaultDiamondMin, Config.LowerVaultDiamondMax) -- How many gold bars can you get in a fleeca?

        if Table == -180074230 then 
            local item = 'goldbar'

            Player.Functions.AddItem(item, GoldBars, false)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], 'add')
            TriggerClientEvent('QBCore:Notify', src, Config.Notify["Got"] .. GoldBars .. Config.Notify["GoldBars"])
            TriggerEvent('qb-log:server:CreateLog', 'bankrobbery', 'Bank Robbery', 'green', '**Goldbars**:\n'..GoldBars..'\n**Person**:\n'..GetPlayerName(src))
        
        elseif Table == 'Diamonds' then 
            local item = 'diamond'

            Player.Functions.AddItem(item, Diamond, false)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], 'add')
            TriggerClientEvent('QBCore:Notify', src, Config.Notify["Got"] .. Diamond .. Config.Notify["Diamonds"])
            TriggerEvent('qb-log:server:CreateLog', 'bankrobbery', 'Bank Robbery', 'green', '**Diamonds**:\n'..Diamond..'\n**Person**:\n'..GetPlayerName(src))

        else 
            local item = Config.BillsItem

            Player.Functions.AddItem(item, MarkedBags, false, info)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], 'add')
            TriggerClientEvent('QBCore:Notify', src, Config.Notify["Got"] .. MarkedBags .. Config.Notify["BagsOfInked"])
            TriggerEvent('qb-log:server:CreateLog', 'bankrobbery', 'Bank Robbery', 'green', '**Cash**:\n'..MarkedBags..'\n**Person**:\n'..GetPlayerName(src))
        end
    end
end)

RegisterNetEvent('qb-bankrobbery:server:drillLoot', function(bank, pos, closestBank)
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
    local info = {worth = math.random(Config.MarkedBillsWorthMin, Config.MarkedBillsWorthMax)}

    if bank == 'fleeca' then
        local item = Config.Lockers["Fleeca"]["items"][math.random(1, #Config.Lockers["Fleeca"]["items"])]
        local goldBars = Config.Lockers["Fleeca"]["gold"]
        local doubleitem = Config.Lockers["Fleeca"]["Rare"][math.random(1, #Config.Lockers["Fleeca"]["Rare"])]
        local cashitem = Config.Lockers["Fleeca"]["Cash"]
        local cashamount = Config.Lockers["Fleeca"]["CashAmount"]
        local FleecaDist = #(pos - vector3(Config.FleecaBanks[closestBank]['coords'].x, Config.FleecaBanks[closestBank]['coords'].y, Config.FleecaBanks[closestBank]['coords'].z ))
        if FleecaDist <= 15 then 
            local amount = Config.Lockers["Fleeca"]["ItemAmount"]
            local amountBars = Config.Lockers["Fleeca"]["GoldAmount"]
            Player.Functions.AddItem(item, amount, false)
            Player.Functions.AddItem(goldBars, amountBars, false)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], 'add')
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[goldBars], 'add')
            TriggerClientEvent('QBCore:Notify', src, Config.Notify["found"] .. amount .. ' '..item)
            TriggerEvent('qb-log:server:CreateLog', 'bankrobbery', 'Bank Robbery', 'green', '**Goldbars**:\n'..item..'\n**Person**:\n'..GetPlayerName(src))
            TriggerClientEvent('QBCore:Notify', src, Config.Notify["found"] .. amountBars .. ' '..goldBars)
            TriggerEvent('qb-log:server:CreateLog', 'bankrobbery', 'Bank Robbery', 'green', '**Goldbars**:\n'..item..'\n**Person**:\n'..GetPlayerName(src))

            Wait(2000)
            local UsbChance = math.random(1,100)
            if UsbChance <= Config.Lockers["Fleeca"]["Chance"] then
                amount = Config.Lockers["Fleeca"]["RareAmount"]
                Player.Functions.AddItem(doubleitem, amount, false)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[doubleitem], 'add')
                TriggerEvent('qb-log:server:CreateLog', 'bankrobbery', 'Bank Robbery', 'green', '**Goldbars**:\n'..doubleitem..'\n**Person**:\n'..GetPlayerName(src))
            end
            Wait(2000)
            local CardChance = math.random(1,100)
            if CardChance <= Config.Lockers["Fleeca"]["Card"] then
                amount = Config.Lockers["Fleeca"]["CashAmount"]
                Player.Functions.AddItem(cashitem, amount, false)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[cashitem], 'add')
                TriggerEvent('qb-log:server:CreateLog', 'bankrobbery', 'Bank Robbery', 'green', '**Goldbars**:\n'..doubleitem..'\n**Person**:\n'..GetPlayerName(src))
            end
        end
    elseif bank == 'paleto' then
        local item = Config.Lockers["Paleto"]["items"][math.random(1, #Config.Lockers["Paleto"]["items"])]
        local doubleitem = Config.Lockers["Paleto"]["Rare"][math.random(1, #Config.Lockers["Paleto"]["Rare"])]
        local cashitem = Config.Lockers["Paleto"]["Cash"]
        local cashamount = Config.Lockers["Paleto"]["CashAmount"]
        local PaletoDist = #(pos - vector3(Config.PaletoBank['coords'].x, Config.PaletoBank['coords'].y, Config.PaletoBank['coords'].z ))

        if PaletoDist <= 30 then
            local amount = Config.Lockers["Paleto"]["ItemAmount"]
            Player.Functions.AddItem(item, amount, false)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], 'add')
            TriggerClientEvent('QBCore:Notify', src, Config.Notify["found"] .. amount .. ' '..item)
            TriggerEvent('qb-log:server:CreateLog', 'bankrobbery', 'Bank Robbery', 'green', '**Goldbars**:\n'..item..'\n**Person**:\n'..GetPlayerName(src))

            Wait(2000)
            local UsbChance = math.random(1,100)
            if UsbChance <= Config.Lockers["Paleto"]["Chance"] then
                amount = Config.Lockers["Paleto"]["RareAmount"]
                Player.Functions.AddItem(doubleitem, amount, false)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[doubleitem], 'add')
                TriggerEvent('qb-log:server:CreateLog', 'bankrobbery', 'Bank Robbery', 'green', '**Goldbars**:\n'..doubleitem..'\n**Person**:\n'..GetPlayerName(src))
            end
            Wait(2000)
            local CardChance = math.random(1,100)
            if CardChance <= Config.Lockers["Paleto"]["Card"] then
                amount = Config.Lockers["Paleto"]["CashAmount"]
                Player.Functions.AddItem(cashitem, amount, false)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[cashitem], 'add')
                TriggerEvent('qb-log:server:CreateLog', 'bankrobbery', 'Bank Robbery', 'green', '**Goldbars**:\n'..doubleitem..'\n**Person**:\n'..GetPlayerName(src))
            end
        end

    elseif bank == 'PaletoVault' then 
        local item = Config.Lockers["PaletoVault"]["items"][math.random(1, #Config.Lockers["PaletoVault"]["items"])]
        local doubleitem = Config.Lockers["PaletoVault"]["Rare"][math.random(1, #Config.Lockers["PaletoVault"]["Rare"])]
        local cashitem = Config.Lockers["PaletoVault"]["Cash"]
        local cashamount = Config.Lockers["PaletoVault"]["CashAmount"]

        local amount = Config.Lockers["PaletoVault"]["ItemAmount"]
        Player.Functions.AddItem(item, amount, false)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], 'add')
        TriggerClientEvent('QBCore:Notify', src, Config.Notify["found"] .. amount .. ' '..item)
        TriggerEvent('qb-log:server:CreateLog', 'bankrobbery', 'Bank Robbery', 'green', '**Goldbars**:\n'..item..'\n**Person**:\n'..GetPlayerName(src))

        Wait(2000)
        local UsbChance = math.random(1,100)
        if UsbChance <= Config.Lockers["Pacific"]["Chance"] then
            amount = Config.Lockers["Pacific"]["RareAmount"]
            Player.Functions.AddItem(doubleitem, amount, false)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[doubleitem], 'add')
            TriggerEvent('qb-log:server:CreateLog', 'bankrobbery', 'Bank Robbery', 'green', '**Goldbars**:\n'..doubleitem..'\n**Person**:\n'..GetPlayerName(src))
        end
        Wait(2000)
        local CardChance = math.random(1,100)
        if CardChance <= Config.Lockers["Pacific"]["Card"] then
            amount = Config.Lockers["Pacific"]["CashAmount"]
            Player.Functions.AddItem(cashitem, amount, false)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[cashitem], 'add')
            TriggerEvent('qb-log:server:CreateLog', 'bankrobbery', 'Bank Robbery', 'green', '**Goldbars**:\n'..doubleitem..'\n**Person**:\n'..GetPlayerName(src))
        end

    elseif bank == 'pacific' then 
        local item = Config.Lockers["Pacific"]["items"][math.random(1, #Config.Lockers["Pacific"]["items"])]
        local doubleitem = Config.Lockers["Pacific"]["Rare"][math.random(1, #Config.Lockers["Pacific"]["Rare"])]
        local cashitem = Config.Lockers["Pacific"]["Cash"]
        local cashamount = Config.Lockers["Pacific"]["CashAmount"]

        local amount = Config.Lockers["Pacific"]["ItemAmount"]
        Player.Functions.AddItem(item, amount, false)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], 'add')
        TriggerClientEvent('QBCore:Notify', src, Config.Notify["found"] .. amount .. ' '..item)
        TriggerEvent('qb-log:server:CreateLog', 'bankrobbery', 'Bank Robbery', 'green', '**Goldbars**:\n'..item..'\n**Person**:\n'..GetPlayerName(src))

        Wait(2000)
        Wait(2000)
        local UsbChance = math.random(1,100)
        if UsbChance <= Config.Lockers["Pacific"]["Chance"] then
            amount = Config.Lockers["Pacific"]["RareAmount"]
            Player.Functions.AddItem(doubleitem, amount, false)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[doubleitem], 'add')
            TriggerEvent('qb-log:server:CreateLog', 'bankrobbery', 'Bank Robbery', 'green', '**Goldbars**:\n'..doubleitem..'\n**Person**:\n'..GetPlayerName(src))
        end
        Wait(2000)
        local CardChance = math.random(1,100)
        if CardChance <= Config.Lockers["Pacific"]["Card"] then
            amount = Config.Lockers["Pacific"]["CashAmount"]
            Player.Functions.AddItem(cashitem, amount, false)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[cashitem], 'add')
            TriggerEvent('qb-log:server:CreateLog', 'bankrobbery', 'Bank Robbery', 'green', '**Goldbars**:\n'..doubleitem..'\n**Person**:\n'..GetPlayerName(src))
        end
    elseif bank == 'lowerVault' then 
        local item = Config.Lockers["Vault"]["items"][math.random(1, #Config.Lockers["Vault"]["items"])]
        local doubleitem = Config.Lockers["Vault"]["Rare"][math.random(1, #Config.Lockers["Vault"]["Rare"])]
        local cashitem = Config.Lockers["Vault"]["Cash"]
        local cashamount = Config.Lockers["Vault"]["CashAmount"]

        local amount = Config.Lockers["Vault"]["ItemAmount"]
        Player.Functions.AddItem(item, amount, false)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], 'add')
        TriggerClientEvent('QBCore:Notify', src, Config.Notify["found"] .. amount .. ' '..item)
        TriggerEvent('qb-log:server:CreateLog', 'bankrobbery', 'Bank Robbery', 'green', '**Goldbars**:\n'..item..'\n**Person**:\n'..GetPlayerName(src))

        Wait(2000)
        Wait(2000)
        local UsbChance = math.random(1,100)
        if UsbChance <= Config.Lockers["Vault"]["Chance"] then
            amount = Config.Lockers["Vault"]["RareAmount"]
            Player.Functions.AddItem(doubleitem, amount, false)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[doubleitem], 'add')
            TriggerEvent('qb-log:server:CreateLog', 'bankrobbery', 'Bank Robbery', 'green', '**Goldbars**:\n'..doubleitem..'\n**Person**:\n'..GetPlayerName(src))
        end
        Wait(2000)
        local CardChance = math.random(1,100)
        if CardChance <= Config.Lockers["Vault"]["Card"] then
            amount = Config.Lockers["Vault"]["CashAmount"]
            Player.Functions.AddItem(cashitem, amount, false)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[cashitem], 'add')
            TriggerEvent('qb-log:server:CreateLog', 'bankrobbery', 'Bank Robbery', 'green', '**Goldbars**:\n'..doubleitem..'\n**Person**:\n'..GetPlayerName(src))
        end
    end
end)

RegisterNetEvent('qb-bankrobbery:server:officeDrillLoot', function()
    local src = source
	local Player = QBCore.Functions.GetPlayer(src)
    local item = Config.Lockers["Pacific"]["OfficeItem"]
    local amount = 1

    Player.Functions.AddItem(item, amount, false)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], 'add')
    TriggerClientEvent('QBCore:Notify', src, Config.Notify["found"] .. amount .. ' '..item)
    TriggerEvent('qb-log:server:CreateLog', 'bankrobbery', 'Bank Robbery', 'green', '**Goldbars**:\n'..item..'\n**Person**:\n'..GetPlayerName(src))
end)


RegisterNetEvent('qb-bankrobbery:server:GetTrolleyLoot', function(Trolley, bank, pos, closestBank)
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
    local info = {worth = math.random(Config.MarkedBillsWorthMin, Config.MarkedBillsWorthMax)} -- How much are Marked Bills worth
    local item

    if bank == 'fleeca' then
        local FleecaDist = #(pos - vector3(Config.FleecaBanks[closestBank]['coords'].x, Config.FleecaBanks[closestBank]['coords'].y, Config.FleecaBanks[closestBank]['coords'].z ))
        if FleecaDist <= 15 then 
            local MarkedBags = math.random(Config.FleecaBagsMin, Config.FleecaBagsMax) -- How many bags can you get per trolly in a Fleeca
            local GoldBars = math.random(Config.FleecaGoldMin, Config.FleecaGoldMax) -- How many gold bars can you get in a fleeca?

            if Trolley == 'ch_prop_gold_bar_01a' then 
                item = 'goldbar'
                Player.Functions.AddItem(item, GoldBars, false)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], 'add')
                TriggerClientEvent('QBCore:Notify', src, Config.Notify["Got"] .. GoldBars .. Config.Notify["GoldBars"])
                TriggerEvent('qb-log:server:CreateLog', 'bankrobbery', 'Bank Robbery', 'green', '**Goldbars**:\n'..GoldBars..'\n**Person**:\n'..GetPlayerName(src))

            elseif Trolley == 'hei_prop_heist_cash_pile' then 
                local item = Config.BillsItem

                Player.Functions.AddItem(item, MarkedBags, false, info)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], 'add')
                TriggerClientEvent('QBCore:Notify', src, Config.Notify["Got"] .. MarkedBags .. Config.Notify["BagsOfInked"])
                TriggerEvent('qb-log:server:CreateLog', 'bankrobbery', 'Bank Robbery', 'green', '**Cash**:\n'..MarkedBags..'\n**Person**:\n'..GetPlayerName(src))
            end
        end

    elseif bank == 'paleto' then 
        print("paleto bank trolleys")
        local PaletoDist = #(pos - vector3(Config.PaletoBank['doorLocation'].x, Config.PaletoBank['doorLocation'].y, Config.PaletoBank['doorLocation'].z ))
        if PaletoDist <= 15 then
            print("close enough distance")
            local MarkedBags = math.random(Config.PaletoBagsMin, Config.PaletoBagsMax) -- How many bags can you get per trolly in a Paleto
            local GoldBars = math.random(Config.PaletoGoldMin, Config.PaletoGoldMax) -- How many gold bars can you get in a Paleto
            print("total marked bags for grabs" .. MarkedBags)
            if Trolley == 'ch_prop_gold_bar_01a' then 
                item = 'goldbar'
                Player.Functions.AddItem(item, GoldBars, false)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], 'add')
                TriggerClientEvent('QBCore:Notify', src, Config.Notify["Got"] .. GoldBars .. Config.Notify["GoldBars"])
            elseif Trolley == 'hei_prop_heist_cash_pile' then 
                local item = Config.BillsItem
                print("trying to give bags" .. item)
                Player.Functions.AddItem(item, MarkedBags, false, info)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], 'add')
                TriggerClientEvent('QBCore:Notify', src, Config.Notify["Got"] .. MarkedBags .. Config.Notify["BagsOfInked"])
            end
        end

    elseif bank == 'PaletoVault' then 
        local MarkedBags = math.random(Config.PaletoSecondMinBags,Config.PaletoSecondMaxBags) -- How many bags can you get per trolly in a Paleto Second Vault
        local GoldBars = math.random(Config.PaletoSecondGoldMin, Config.PaletoSecondGoldMax) -- How many gold bars can you get in a Paleto Second Vault

        if Trolley == 'ch_prop_gold_bar_01a' then 
            item = 'goldbar'
            Player.Functions.AddItem(item, GoldBars, false)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], 'add')
            TriggerClientEvent('QBCore:Notify', src, Config.Notify["Got"] .. GoldBars .. Config.Notify["GoldBars"])
        elseif Trolley == 'hei_prop_heist_cash_pile' then 
            local item = Config.BillsItem

            Player.Functions.AddItem(item, MarkedBags, false, info)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], 'add')
            TriggerClientEvent('QBCore:Notify', src, Config.Notify["Got"] .. MarkedBags .. Config.Notify["BagsOfInked"])
        end

    elseif bank == 'pacific' then 
        local MarkedBags = math.random(Config.PacificBagsMin, Config.PacificBagsMax) -- How many bags can you get per trolly in a Pacific
        local GoldBars = math.random(Config.PacificGoldMin, Config.PacificGoldMax) -- How many gold bars can you get in a Pacific

        if Trolley == 'ch_prop_gold_bar_01a' then 
            item = 'goldbar'
            Player.Functions.AddItem(item, GoldBars, false)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], 'add')
            TriggerClientEvent('QBCore:Notify', src, Config.Notify["Got"] .. GoldBars .. Config.Notify["GoldBars"])
        elseif Trolley == 'hei_prop_heist_cash_pile' then 
            local item = Config.BillsItem

            Player.Functions.AddItem(item, MarkedBags, false, info)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], 'add')
            TriggerClientEvent('QBCore:Notify', src, Config.Notify["Got"] .. MarkedBags .. Config.Notify["BagsOfInked"])
        end
    elseif bank == 'lowerVault' then 
        local MarkedBags = math.random(Config.LowerVaultBagsMin, Config.LowerVaultBagsMax) -- How many bags can you get per trolly in lowerVault
        local GoldBars = math.random(Config.LowerVaultGoldMin, Config.LowerVaultGoldMax) -- How many gold bars can you get in lowerVault

        if Trolley == 'ch_prop_gold_bar_01a' then 
            item = 'goldbar'
            Player.Functions.AddItem(item, GoldBars, false)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], 'add')
            TriggerClientEvent('QBCore:Notify', src, Config.Notify["Got"] .. GoldBars .. Config.Notify["GoldBars"])
        elseif Trolley == 'hei_prop_heist_cash_pile' then 
            local item = Config.BillsItem

            Player.Functions.AddItem(item, MarkedBags, false, info)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], 'add')
            TriggerClientEvent('QBCore:Notify', src, Config.Notify["Got"] .. MarkedBags .. Config.Notify["BagsOfInked"])
        end
    end
end)

-- Chance of drill getting destroyed when failing
RegisterNetEvent('qb-bankrobbery:server:drilldamaged', function()
    local src = source
	local Player = QBCore.Functions.GetPlayer(src)
    local chance = math.random(1,100)
    if chance <= 20 then 
        local item = Config.LockerRequired
        Player.Functions.RemoveItem(item, 1, false)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], 'remove')
        TriggerClientEvent('QBCore:Notify', src, Config.Notify["DrillBroke"])
    else 
        TriggerClientEvent('QBCore:Notify', src, Config.Notify["LockBroke"])
    end
end)

RegisterNetEvent('qb-bankrobbery:server:RemoveLaptop', function(item)
    local src = source
	local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem(item, 1, false)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], 'remove')
end)



RegisterNetEvent('qb-bankrobbery:server:RemovePaletoDoorItem', function()
    local src = source
	local Player = QBCore.Functions.GetPlayer(src)
    local item = Config.PaletoPacificDoor
    Player.Functions.RemoveItem(item, 1, false)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], 'remove')
end)

RegisterNetEvent('qb-bankrobbery:server:RemovePaletoDoorCard', function()
    local src = source
	local Player = QBCore.Functions.GetPlayer(src)
    local item = Config.PaletoDoorCard
    Player.Functions.RemoveItem(item, 1, false)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], 'remove')
end)

RegisterNetEvent('qb-bankrobbery:server:RemovePacificDoorCard', function()
    local src = source
	local Player = QBCore.Functions.GetPlayer(src)
    local item = Config.PacificDoorCard
    Player.Functions.RemoveItem(item, 1, false)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], 'remove')
end)

RegisterNetEvent('qb-bankrobbery:server:RemovePacificVaultCracker', function()
    local src = source
	local Player = QBCore.Functions.GetPlayer(src)
    local item = 'vault_gate_cracker'
    Player.Functions.RemoveItem(item, 1, false)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], 'remove')
end)

RegisterNetEvent('qb-bankrobbery:server:RemovePowerplantitem', function()
    local src = source
	local Player = QBCore.Functions.GetPlayer(src)
    local item = Config.PowerplantRequired
    Player.Functions.RemoveItem(item, 1, false)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], 'remove')
end)

RegisterNetEvent('qb-bankrobbery:server:RemoveLowerVaultItem', function()
    local src = source
	local Player = QBCore.Functions.GetPlayer(src)
    local item = Config.LowerVaultDoors
    Player.Functions.RemoveItem(item, 1, false)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], 'remove')
end)

RegisterNetEvent('qb-bankrobbery:server:RemoveHDD', function()
    local src = source
	local Player = QBCore.Functions.GetPlayer(src)
    local item = "encrypted_hdd"
    Player.Functions.RemoveItem(item, 1, false)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], 'remove')
end)


RegisterNetEvent('qb-bankrobbery:server:giveHardDrive', function(Pos)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local BoxDist = #(Pos - vector3(Config.PacificBank['coords'].x, Config.PacificBank['coords'].y, Config.PacificBank['coords'].z))
    if BoxDist <= 15 then
        TriggerClientEvent('QBCore:Notify', src, Config.Notify["FoundHDD"])
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['encrypted_hdd'], 'add')
        Player.Functions.AddItem('encrypted_hdd', 1, false)
    end
end)


-- Lower vault Keypins and what not
RegisterServerEvent('qb-bankrobbery:server:GetCode', function()
    local src = source
	local Player = QBCore.Functions.GetPlayer(src)
    if FirstCode then
        FirstCode = false 
        Code1 = math.random(100000,9999999)
        Config.lowerVault['LWCode1'] = Code1
        TriggerClientEvent('QBCore:Notify', src, Config.Notify["FirstCode"]..Code1)
    else 
        Code2 = math.random(100000,9999999)
        Config.lowerVault['LWCode1'] = Code2
        TriggerClientEvent('QBCore:Notify', src, Config.Notify["SecondCode"]..Code2)
    end
end)

RegisterNetEvent('qb-bankrobbery:server:IsComvination1Right', function(data)
    local src = source
	local Player = QBCore.Functions.GetPlayer(src)
    if not lockDown then
        local code = ''..Code1..''
        if data == code then 
            Code1Cracked = true
            TriggerClientEvent('QBCore:Notify', src, Config.Notify["Code1Cracked"])
        else
            lockDown = true
            TriggerClientEvent('QBCore:Notify', src, Config.Notify["WrongCode"])
        end
    else 
        TriggerClientEvent('QBCore:Notify', src, Config.Notify["LockDownActivated"])
end
end)


RegisterNetEvent('qb-bankrobbery:server:IsComvination2Right', function(data)
    local src = source
	local Player = QBCore.Functions.GetPlayer(src)
    if not lockDown then
        if Code1Cracked == true then 
            local code = ''..Code2..''
            if data == code then
                Code2Cracked = true
                TriggerClientEvent('QBCore:Notify', src, 'Code 2 Cracked')
                Wait(1000)
                TriggerClientEvent('qb-bankrobbery:client:SetUpLower', src)
                if Code1Cracked == true and Code2Cracked == true then
                    TriggerEvent('qb-bankrobbery:server:setBankState', true, 'lowerVault')
                else 
                    TriggerClientEvent('QBCore:Notify', src, Config.Notify["LWHackFail"])
                end
            else
                lockDown = true
                TriggerClientEvent('QBCore:Notify', src, Config.Notify["WrongCode"])
            end
        else 
            TriggerClientEvent('QBCore:Notify', src, Config.Notify["CrackCode1"])
        end
    else 
        TriggerClientEvent('QBCore:Notify', src, Config.Notify["LockDownActivated"])
    end
end)

RegisterServerEvent('qb-bankrobbery:server:RemoveLaptopUse', function(itemData)
    local Player = QBCore.Functions.GetPlayer(source)

    if Player.PlayerData.items[itemData.slot].info.uses == nil then
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[itemData.name], 'remove')
        Player.Functions.RemoveItem(itemData, 1)
    elseif Player.PlayerData.items[itemData.slot].info.uses - 1 == 0 then
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[itemData.name], 'remove')
        Player.Functions.RemoveItem(itemData, 1)
    else
        Player.PlayerData.items[itemData.slot].info.uses = Player.PlayerData.items[itemData.slot].info.uses - 1
        Player.Functions.SetInventory(Player.PlayerData.items)
    end
end)

-- Buying Laptops
RegisterServerEvent('qb-bankrobbery:server:BuyLaptop', function(name)
    local Player = QBCore.Functions.GetPlayer(source)
    local item = Config.LaptopLocations[name]['TradeItem']
    local laptop = Config.LaptopLocations[name]['laptop']
    local itemToPrint = ''

    if item == 'usb_green' then
        itemToPrint = 'Green Usb'
    elseif item == 'usb_blue' then
        itemToPrint = 'Blue Usb'
    elseif item == 'usb_red' then
        itemToPrint = 'Red Usb'
    else
        itemToPrint = 'Gold Usb'
    end

    info = {  
        uses = Config.LaptopUses,
    }
    if Player.Functions.GetItemByName(item) ~= nil then
        if Player.PlayerData.money.cash >= Config.LaptopLocations[name]['price'] then
            Player.Functions.RemoveItem(item, 1)
            TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[item], 'remove')

            Player.Functions.RemoveMoney('cash', Config.LaptopLocations[name]['price'])
            Player.Functions.AddItem(laptop, 1, false, info)
            TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[laptop], 'add')
            TriggerClientEvent('QBCore:Notify', source, 'You purchased a laptop from '..laptop..' for $'..Config.LaptopLocations[name]['price']..' cash', 'success', 3000)
        else
            TriggerClientEvent('QBCore:Notify', source, "You don't have enough cash", 'error', 3000)
        end
    else
        TriggerClientEvent('QBCore:Notify', source, "You are missing a ".. itemToPrint, 'error', 3000)
    end
end)



RegisterServerEvent('qb-bankrobbery:server:ExplodePowerPlant', function(k)
    if not BlackOutActive then 
        TriggerClientEvent('qb-bankrobbery:client:PowerPlantgoBoom', -1, k)
        Config.PowerPlant["locations"][k]['open'] = true
        PowerPlantBomb = PowerPlantBomb + 1

    end

    if PowerPlantBomb == Config.PowerPlantLocations then
        TriggerClientEvent('QBCore:Notify', -1, Config.Notify["PowerOff"], 'info', 10000)
        TriggerEvent('qb-bankrobbery:server:SetPowerTimeout')
    end
end)

RegisterNetEvent('qb-bankrobbery:server:SetPowerTimeout', function()
    if not BlackOutActive then
        TriggerEvent("qb-weathersync:server:toggleBlackout", true)
        BlackOutActive = true
        Wait(Config.BlackoutTimer * (60 * 1000))  --(45 * (60 * 1000))
        BlackOutActive = false
        TriggerEvent("qb-weathersync:server:toggleBlackout", false)
    end
end)

QBCore.Functions.CreateCallback('qb-bankrobbery:server:IsServerBlackedout', function(source, cb)
    cb(BlackOutActive)
end)


RegisterServerEvent('qb-bankrobbery:server:PacificThermiteCounter', function()
    PacificThermiteCounter = PacificThermiteCounter + 1

    if PacificThermiteCounter == 3 then
        TriggerClientEvent('qb-bankrobbery:pacific:thermitecounter', -1)
    end
end)

RegisterServerEvent('qb-bankrobbery:server:PacificFirstFloorCounter', function()
    PacificFirstFloorCounter = PacificFirstFloorCounter + 1
    
    if PacificFirstFloorCounter == 4 then
        TriggerClientEvent('qb-bankrobbery:pacific:firstfloorcounter', -1)
    end
end)

RegisterServerEvent('qb-bankrobbery:server:PacificHackTypeCounter', function()
    PacificHackTypeCounter = PacificHackTypeCounter + 1

    if PacificHackTypeCounter == 4 then
        TriggerClientEvent('qb-bankrobbery:pacific:hacktypecounter', -1)
    end
end)




--Paleto security card disabled from being used in inventory
-- QBCore.Functions.CreateUseableItem('security_card_01', function(source, item)
--     local Player = QBCore.Functions.GetPlayer(source)
-- 	if Player.Functions.GetItemByName('security_card_01') ~= nil then
--         TriggerClientEvent('qb-bankrobbery:UsePaletoCard', source)
--     end
-- end)

-- QBCore.Functions.CreateUseableItem('security_card_02', function(source, item)
--     local Player = QBCore.Functions.GetPlayer(source)
-- 	if Player.Functions.GetItemByName('security_card_02') ~= nil then
--         TriggerClientEvent('qb-bankrobbery:UsePacificCard', source)
--     end
-- end)

QBCore.Functions.CreateUseableItem('security_card_03', function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemByName('security_card_03') ~= nil then
        TriggerClientEvent('qb-bankrobbery:UseLowerCard', source)
    end
end)

QBCore.Functions.CreateUseableItem('security_card_04', function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemByName('security_card_04') ~= nil then
        TriggerClientEvent('qb-bankrobbery:UsePaletoCard2', source)
    end
end)

-- Fleeca laptop disalbed so it had to be used as a third eeye
-- QBCore.Functions.CreateUseableItem('laptop_green', function(source, item)
--     local Player = QBCore.Functions.GetPlayer(source)
-- 	if Player.Functions.GetItemByName('laptop_green') ~= nil then
--         TriggerClientEvent('qb-bankrobbery:UseBankLaptop', source, 'green', item)
--     end
-- end)

-- Pacific
QBCore.Functions.CreateUseableItem('laptop_red', function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemByName('laptop_red') ~= nil then
        TriggerClientEvent('qb-bankrobbery:UseBankLaptop', source, 'red', item)
    end
end)

--Paleto laptop disabled from being used in inventory
-- QBCore.Functions.CreateUseableItem('laptop_blue', function(source, item)
--     local Player = QBCore.Functions.GetPlayer(source)
-- 	if Player.Functions.GetItemByName('laptop_blue') ~= nil then
--         TriggerClientEvent('qb-bankrobbery:UseBankLaptop', source, 'blue', item)
--     end
-- end)

-- Paleto Second
QBCore.Functions.CreateUseableItem('laptop_pink', function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemByName('laptop_pink') ~= nil then
        TriggerClientEvent('qb-bankrobbery:UseBankLaptop', source, 'pink', item)
    end
end)

-- Lowervault
QBCore.Functions.CreateUseableItem('laptop_gold', function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemByName('laptop_gold') ~= nil then
        TriggerClientEvent('qb-bankrobbery:UseBankLaptop', source, 'gold', item)
    end
end)

-- Item Checks suitable for old cores
QBCore.Functions.CreateCallback('qb-Bankrobbery:server:GetItemsNeeded', function(source, cb, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player ~= nil then 
        local Drill = Player.Functions.GetItemByName(item)
        if Drill ~= nil then
            cb(true)
        else
            cb(false)
        end
    else
        cb(false)
    end
end)

RegisterServerEvent('qb-bankrobbery:server:paletoVault:modelSync', function(k, model)
    TriggerClientEvent('qb-bankrobbery:client:paletoVault:modelSync', -1, k, model)
end)

RegisterServerEvent('qb-bankrobbery:server:paletoVault:lootSync', function(type, k)
    TriggerClientEvent('qb-bankrobbery:client:paletoVault:lootSync', -1, type, k)
end)

RegisterNetEvent('qb-paleto:server:addexplosion', function(place) 
    TriggerClientEvent('qb-paleto:client:ExplodeSync', -1, place)
end)

local cachedPoliceAmount = {}
QBCore.Functions.CreateCallback('qb-bankrobbery:server:getCops', function(source, cb)
	local amount = 0
    for _, v in pairs(QBCore.Functions.GetQBPlayers()) do
        if v.PlayerData.job.name == "police" and v.PlayerData.job.onduty then
            amount = amount + 1
        end
    end
    cachedPoliceAmount[source] = amount
    cb(amount)
end)


