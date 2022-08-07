local ESX;
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj; end);

local deliveryProgresses = {};

ESX.RegisterServerCallback(Config.resource .. ':startJob', function(player, callback)
    if (not deliveryProgresses[player]) then 
        deliveryProgresses[player] = 0;
        callback(true);
    else
        callback(false);
    end 
end);

ESX.RegisterServerCallback(Config.resource .. ':deliver', function(player, callback)
    if (deliveryProgresses[player]) then 
        deliveryProgresses[player] = deliveryProgresses[player] + 1;
        callback(true);

        return;
    else 
        callback(false);
    end 
end);

ESX.RegisterServerCallback(Config.resource .. ':endJob', function(player, callback)
    local xPlayer = ESX.GetPlayerFromId(player);
    if (
        xPlayer and 
        deliveryProgresses[player] and 
        deliveryProgresses[player] > 0
    ) then 
        local wage = 0;
        for i = 1, deliveryProgresses[player] do 
            wage = wage + math.random(Config.DeliveryPrice.min, Config.DeliveryPrice.max);
        end 

        xPlayer.addMoney(wage);
        callback(true);
        return;
    end 

    callback(false);
end);