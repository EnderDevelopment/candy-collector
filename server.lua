local ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('giggle_rp_candy_collector:getCandyCount', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    
    MySQL.Async.fetchScalar('SELECT candy_count FROM player_candies WHERE player_id = @player_id', {
        ['@player_id'] = xPlayer.identifier
    }, function(result)
        if result then
            cb(result)
        else
            cb(0)
        end
    end)
end)

RegisterServerEvent('giggle_rp_candy_collector:collectCandy')
AddEventHandler('giggle_rp_candy_collector:collectCandy', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    
    MySQL.Async.execute('UPDATE player_candies SET candy_count = candy_count + @candy_reward WHERE player_id = @player_id', {
        ['@player_id'] = xPlayer.identifier,
        ['@candy_reward'] = Config.CandyReward
    }, function(rowsChanged)
        if rowsChanged > 0 then
            xPlayer.addInventoryItem(Config.CandyRewardItem, Config.CandyReward)
            TriggerClientEvent('esx:showNotification', source, 'You collected ' .. Config.CandyReward .. ' candies!')
        end
    end)
end)