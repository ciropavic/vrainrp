RegisterNetEvent('backfire')
AddEventHandler('backfire', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local group = xPlayer.getGroup()
    if group  == "superadmin" then 
        TriggerClientEvent('backfire', source)
    end
end)