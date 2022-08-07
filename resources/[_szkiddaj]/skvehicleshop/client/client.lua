shopId = nil;
ESX = nil;

-- ESX bekérése, mert kell xd
Citizen.CreateThread(function()
    while ESX == nil do 
        TriggerEvent("esx:getSharedObject", function(obj) ESX = obj end);
        Wait(50);
    end
end);

-- Markerek betöltése
Citizen.CreateThread(function()
    Wait(5000);
    for i,v in pairs(config.shops) do
        -- TriggerEvent(config.resource..':CreateMarker', 'vehicleshop_'..i, v.coords[1], v.coords[2], v.coords[3] - 0.25, config.markers.shop, 1.0, 255, 255, 255, 150, {id = i, type = 'shop'});
        -- TriggerEvent(config.resource..':CreateMarker', 'vehicleshop_boss_'..i, v.boss[1], v.boss[2], v.boss[3] - 0.25, config.markers.boss, 1.0, 255, 255, 255, 150, {id = i, type = 'boss'});

        local blip = AddBlipForCoord(v.coords[1], v.coords[2], v.coords[3]);
		SetBlipSprite(blip, 326);
		SetBlipScale(blip, 1.0);
		SetBlipColour(blip, 2);
		SetBlipAsShortRange(blip, true);
		BeginTextCommandSetBlipName('STRING');
        AddTextComponentString(v.name or 'Autókereskedés');
		EndTextCommandSetBlipName(blip);
    end
end);

SetPedConfigFlag(PlayerPedId(), 35, false);