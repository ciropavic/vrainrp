if Config.ESX then
    ESX = nil
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
end

RegisterNetEvent('admin:noClip')
AddEventHandler('admin:noClip', function()
    local authorized = false
    if IsPlayerAceAllowed(source, "command.fix") then
        TriggerClientEvent('admin:toggleNoClip', source)
        authorized = true
    end
end)