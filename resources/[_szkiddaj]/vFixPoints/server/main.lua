local ESX;
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj; end);

ESX.RegisterServerCallback('sFixPoints:fixVehicle', 
    function(source, callback, vehicle, cost)
        local xPlayer = ESX.GetPlayerFromId(source);

        if (
            xPlayer and 
            vehicle and 
            cost and 
            type(cost) == 'number' and 
            cost > 0 and 
            cost < 1000000
        ) then 
            xPlayer.removeMoney(cost);
            callback(true);
        else 
            callback(false);
        end 
    end
);