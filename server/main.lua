local QBCore = exports['qb-core']:GetCoreObject()

-- Functions --

function isAllowedToTestAnimation(source)
    local src = source
    if IsPlayerAceAllowed(src, Config.AceGroup) then
        return true
    end
    return false
end

-- Events --

RegisterNetEvent('g-animationtest:server:requestCommands', function()
    local src = source
    if isAllowedToTestAnimation(src) then
        TriggerClientEvent('g-animationtest:client:requestCommands', src)
    end
end)

-- Callbacks --

QBCore.Functions.CreateCallback('g-animationtest:server:isAllowedToTestAnimation', function(source, cb)
    local src = source
    if isAllowedToTestAnimation(src) then
        cb(true)
    else
        cb(false)
    end
end)