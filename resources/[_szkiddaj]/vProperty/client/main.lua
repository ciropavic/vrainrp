ESX = nil;
Interiors = {};

MarkerHandlers = {
    enter = {}, 
    door = {}
};

local inMarker;

AddEventHandler("onClientColshapeEnter", function(colshape, entity)
    local interior = colshape.getMeta("interior");

    if (
        interior and 
        Interiors[interior.id] and 
        entity.__type == "player" and 
        entity.__netId == GetPlayerServerId(PlayerId()) and 
        not inMarker 
    ) then 
        inMarker = { id = interior.id, inside = interior.inside, locked = interior.locked };

        local interiorType = Interiors[interior.id].type;
        if (interiorType == 'garage') then
            SendNUIMessage({
                action = "ENTER", 
                payload = {
                    id      = interior.id, 
                    name    = "4 Nikola Place St", 
                    owner   = "Kurt Lynch", 
                    type    = "garage", 
                    locked  = false
                },
            });
        elseif (interiorType == 'house' or interiorType == 'business') then 
            SendNUIMessage({
                action = "ENTER", 
                payload = {
                    id      = interior.id, 
                    name    = "4 Nikola Place St", 
                    owner   = "Kurt Lynch", 
                    type    = "house", 
                    locked  = interior.locked
                },
            });
        end  
    end 
end);

AddEventHandler("onClientColshapeLeave", function(colshape, entity)
    if (
        inMarker and 
        entity.__netId == GetPlayerServerId(PlayerId()) 
    ) then 
        SendNUIMessage({
            action = "LEAVE", 
            payload = nil
        });

        inMarker = nil;
    end 
end);

function loadInteriors(interiors)
    Interiors = interiors;

    for interiorId, v in pairs(Interiors) do 
        local position = v.enter.position;
        local x, y, z = position.x, position.y, position.z;

        local type, size, r, g, b, a;

        if (
            ClientConfig.interiorTypes and 
            ClientConfig.interiorTypes[v.type]
        ) then 
            local intData = ClientConfig.interiorTypes[v.type];

            type = intData.type;
            size = intData.size;
            r, g, b, a = table.unpack(intData.color);
        end 

        -- Outside
        local data = v;
        data.inside = false;

        TriggerEvent(
            ClientConfig.resource .. ':CreateMarker',
            'interior_outside_' .. interiorId, 
            x, y, z, type, size, r, g, b, a, 
            { inside = false, interiorId = interiorId }
        );

        -- Inside
        if (SharedConfig.interiors[v.type][v.interior] and not ClientConfig.hasNoInside[v.type]) then 
            local x, y, z = table.unpack(SharedConfig.interiors[v.type][v.interior].inside);
            data = v;
            data.inside = true;

            TriggerEvent(
                ClientConfig.resource .. ':CreateMarker',
                'interior_inside_' .. interiorId, 
                x, y, z, type, size, r, g, b, a, 
                { inside = true, interiorId = interiorId }
            );
        end 
    end 
end 

Citizen.CreateThread(function()
    while (true) do
        if (inMarker) then 
            -- Use entrace door
            if ( 
                IsControlJustPressed( table.unpack(ClientConfig.keys['enter_interior'].key) ) and 
                Interiors[inMarker.id] and 
                MarkerHandlers.enter[Interiors[inMarker.id].type]
            ) then 
                local interior = Interiors[inMarker.id];
                MarkerHandlers.enter[interior.type](interior, inMarker.inside);
            end 

            if (
                IsControlJustPressed( table.unpack(ClientConfig.keys['close_door'].key) ) and 
                Interiors[inMarker.id] and 
                MarkerHandlers.door[Interiors[inMarker.id].type]
            ) then 
                local interior = Interiors[inMarker.id];
                MarkerHandlers.door[interior.type](interior);
            end 

        end 
        
        Wait(1);
    end 
end);

RegisterNetEvent('sProperty:clientAddInterior');
AddEventHandler('sProperty:clientAddInterior', function(interior)

end);

function main()
    while (ESX == nil) do 
        TriggerEvent("esx:getSharedObject", function(obj) ESX = obj end);
        Wait(50);
    end

    exports.vCore:useFetchAsync('sProperty:fetchInteriors', loadInteriors);
end 

Citizen.CreateThread(main);

-- Dimensions.lua
local Dimensions = {};

function updatePlayersDimensions(data)
    local selfDimension = 0;
    local selfServerId = GetPlayerServerId(PlayerId());

    if (data[selfServerId]) then 
        selfDimension = data[selfServerId];
    end 

    for playerId, dimension in pairs(data) do 
        local player = GetPlayerFromServerId(playerId);

		if (selfServerId ~= playerId and NetworkIsPlayerActive(player)) then
			local otherPlayerPed = GetPlayerPed(player);
            local inSameDimension = selfDimension == dimension;

			SetEntityVisible(otherPlayerPed, inSameDimension, inSameDimension);
			SetEntityNoCollisionEntity(playerPed, otherPlayerPed, inSameDimension);
		end
    end 
end 

RegisterNetEvent('sProperty:clientUpdateDimensions');
AddEventHandler('sProperty:clientUpdateDimensions', function(data)
    updatePlayersDimensions(data);
end);
