ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function getPlayerCharacterName(player)
    if (not player) then 
        return 'Ismeretlen';
    end 
    
    local xPlayer = ESX.GetPlayerFromId(player);
    if (xPlayer) then 
        return xPlayer.getName() or "Ismeretlen";
    end 

    return 'Ismeretlen';
end
exports("getPlayerCharacterName", getPlayerCharacterName)