local ESX = nil
local isCollecting = false

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

function StartCandyCollection()
    if not isCollecting then
        isCollecting = true
        ESX.ShowNotification('Candy collection started!')
        CollectCandies()
    end
end

function StopCandyCollection()
    if isCollecting then
        isCollecting = false
        ESX.ShowNotification('Candy collection stopped!')
    end
end

function CollectCandies()
    Citizen.CreateThread(function()
        while isCollecting do
            local playerPed = PlayerPedId()
            local playerCoords = GetEntityCoords(playerPed)
            
            if #(playerCoords - Config.BossFightLocation) <= Config.BossFightRadius then
                local candies = ESX.Game.GetObjects()
                
                for _, candy in ipairs(candies) do
                    if GetEntityModel(candy) == GetHashKey(Config.CandyModel) then
                        local candyCoords = GetEntityCoords(candy)
                        
                        if #(playerCoords - candyCoords) <= Config.CandyCollectionRadius then
                            DeleteEntity(candy)
                            TriggerServerEvent('giggle_rp_candy_collector:collectCandy')
                        end
                    end
                end
            end
            
            Citizen.Wait(Config.CandyCollectionInterval)
        end
    end)
end

RegisterCommand('startcandycollection', function()
    StartCandyCollection()
end, false)

RegisterCommand('stopcandycollection', function()
    StopCandyCollection()
end, false)