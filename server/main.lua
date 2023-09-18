ESX.RegisterUsableItem('wallet', function(source)
    local source = tonumber(source)
    local xPlayer = ESX.GetPlayerFromId(source) 
    local cash = math.random(20, 120)
    local chance = math.random(1,2)

    if chance == 2 then
        TriggerClientEvent('bulletin:send', source, Translation[Config.Locale]['cash'] .. cash .. Translation[Config.Locale]['cash_1'], 3000, Config.Position, true, 'success')
        xPlayer.addMoney(cash)
    else
        TriggerClientEvent('bulletin:send', source, Translation[Config.Locale]['empty'], 3000, Config.Position, true, 'error')
    end

    xPlayer.removeInventoryItem('wallet', 1)
end)

RegisterServerEvent('sc_dumpster:startDumpsterTimer')
AddEventHandler('sc_dumpster:startDumpsterTimer', function(dumpster)
    startTimer(source, dumpster)
end)

RegisterServerEvent('sc_dumpster:giveDumpsterReward')
AddEventHandler('sc_dumpster:giveDumpsterReward', function()
    local source = tonumber(source)
    local item = {}
    local xPlayer = ESX.GetPlayerFromId(source)
    local gotID = {}
    local rolls = math.random(1, 2)
    local foundItem = false

    for i = 1, rolls do
        item = Config.dumpsterItems[math.random(1, #Config.dumpsterItems)]
        if math.random(1, 10) >= item.chance then
            if item.isWeapon and not gotID[item.id] then
                if item.limit > 0 then
                    local count = xPlayer.getInventoryItem(item.id).count
                    if count >= item.limit then
                        if Config.BulletinEnable then
                            TriggerClientEvent('bulletin:send', source, Translation[Config.Locale]['find_1'] .. item.name .. Translation[Config.Locale]['error'], 3000, Config.Position, true, 'error')
                        else
                            TriggerClientEvent('esx:showNotification', source, Translation[Config.Locale]['find_1'] .. item.name .. Translation[Config.Locale]['error'])
                        end
                    else
                        gotID[item.id] = true
                        if Config.BulletinEnable then
                            TriggerClientEvent('bulletin:send', source, Translation[Config.Locale]['find_1'] .. item.name, 3000, Config.Position, true, 'success')
                        else
                            TriggerClientEvent('esx:showNotification', source, Translation[Config.Locale]['find_1'] .. item.name)
                        end
                        foundItem = true
                        xPlayer.addWeapon(item.id, 50)
                    end
                else
                    gotID[item.id] = true
                    if Config.BulletinEnable then
                        TriggerClientEvent('bulletin:send', source, Translation[Config.Locale]['find_1'] .. item.name, 3000, Config.Position, true, 'success')
                    else
                        TriggerClientEvent('esx:showNotification', source, Translation[Config.Locale]['find_1'] .. item.name)
                    end
                    foundItem = true
                    xPlayer.addWeapon(item.id, 50)
                end
            elseif not gotID[item.id] then
                if item.limit > 0 then
                    local count = xPlayer.getInventoryItem(item.id).count
                    if count >= item.limit then
                        if Config.BulletinEnable then
                            TriggerClientEvent('bulletin:send', source, Translation[Config.Locale]['find'] .. item.quantity .. 'x ' .. item.name .. Translation[Config.Locale]['error'], 3000, Config.Position, true, 'error')
                        else
                            TriggerClientEvent('esx:showNotification', source, Translation[Config.Locale]['find'] .. item.quantity .. 'x ' .. item.name .. Translation[Config.Locale]['error'])
                        end
                    else
                        gotID[item.id] = true
                        if Config.BulletinEnable then
                            TriggerClientEvent('bulletin:send', source, Translation[Config.Locale]['find'] .. item.quantity .. 'x ' .. item.name, 3000, Config.Position, true, 'success')
                        else
                            TriggerClientEvent('esx:showNotification', source, Translation[Config.Locale]['find'] .. item.quantity .. 'x ' .. item.name)
                        end
                        xPlayer.addInventoryItem(item.id, item.quantity)
                        foundItem = true
                    end
                else
                    gotID[item.id] = true
                    if Config.BulletinEnable then
                        TriggerClientEvent('bulletin:send', source, Translation[Config.Locale]['find'] .. item.quantity .. 'x ' .. item.name, 3000, Config.Position, true, 'success')
                    else
                        TriggerClientEvent('esx:showNotification', source, Translation[Config.Locale]['find'] .. item.quantity .. 'x ' .. item.name)
                    end
                    xPlayer.addInventoryItem(item.id, item.quantity)
                    foundItem = true
                end
            end
        end
        if i == rolls and not gotID[item.id] and not foundItem then
            if Config.BulletinEnable then
                TriggerClientEvent('bulletin:send', source, Translation[Config.Locale]['find_2'], 3000, Config.Position, true, 'info')
            else
                TriggerClientEvent('esx:showNotification', source, Translation[Config.Locale]['find_2'])
            end
        end
    end
end)

function startTimer(id, object)
    while Config.Timer > 0 do
        Wait(1000)
        Config.Timer = Config.Timer - 1000
        if Config.Timer == 0 then
            TriggerClientEvent('sc_dumpster:removeDumpster', id, object)
        end
    end
end