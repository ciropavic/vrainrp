ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx_location:Buy')
AddEventHandler('esx_location:Buy', function(vehIndex)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    if (not vehIndex or not vehInLocation[vehIndex]) then 
        return;
    end 

    xPlayer.removeMoney(vehInLocation[vehIndex].price);
end)