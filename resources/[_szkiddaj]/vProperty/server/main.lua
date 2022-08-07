assert(load(exports.vCore:require({ "identifier" })))();

ESX = nil;

Interiors = {};
Dimensions = {};
Events = {
    enter = {}, 
    door = {}
};

local interiorsLoaded = false;

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj; end);

local ShapeSize = 2.0;

function main()
    Wait(1000);

    MySQL.Async.fetchAll(
        'SELECT * FROM interiors', 
        { },
        function(result)
            if (result and #result > 0) then 
                for _, interior in ipairs(result) do 
                    Interiors[interior.id] = interior;
                    Interiors[interior.id].enter = json.decode(Interiors[interior.id].enter);

                    Interiors[interior.id].shapes = {};
                    Interiors[interior.id].shapes.entrace = exports.vCore:createColCuboid(
                        Interiors[interior.id].enter.position.x - ShapeSize / 2, 
                        Interiors[interior.id].enter.position.y - ShapeSize / 2, 
                        Interiors[interior.id].enter.position.z - ShapeSize / 2, 
                        ShapeSize, ShapeSize, ShapeSize
                    );

                    Interiors[interior.id].shapes.entrace.setSharedMeta("interior", { id = interior.id, type = interior.type, inside = false, locked = true });

                    if (interior.type ~= "garage") then 
                        print(
                            interior.type, 
                            interior.interior,
                            SharedConfig.interiors, 
                            SharedConfig.interiors[interior.type], 
                            SharedConfig.interiors[interior.type][interior.interior]
                        )

                        local position = SharedConfig.interiors[interior.type][interior.interior].inside;

                        Interiors[interior.id].shapes.exit = exports.vCore:createColCuboid(
                            position.x - ShapeSize / 2, 
                            position.y - ShapeSize / 2, 
                            position.z - ShapeSize / 2, 
                            ShapeSize, ShapeSize, ShapeSize
                        );

                        Interiors[interior.id].shapes.exit.setSharedMeta("interior", { id = interior.id, type = interior.type, inside = true, locked = true });
                    end 
                end 
            end 

            interiorsLoaded = true;
        end 
    );
end 

Citizen.CreateThread(main);

-- 
-- Exports
-- 

function getInteriorById(id)
    if (
        type(id) ~= 'number' or 
        not Interiors[id]
    ) then 
        return false;
    end 

    return Interiors[id];
end 
exports("getInteriorById", getInteriorById);

-- 
-- Utils
-- 

function hasAccessToProperty(player, interiorId)
    if (
        player and 
        player.__netId and 
        interiorId and 
        Interiors[interiorId]
    ) then 
        local interior = Interiors[interiorId];
        
        if (interior.ownerType == 'player') then 
            local identifiers = GetPlayerIdentifiers(player.__netId);
            
            return (identifiers and identifiers.license and interior.owner == identifiers.license);
        elseif (interior.ownerType == 'faction') then 
            local xPlayer = ESX.GetPlayerFromId(player.__netId);

            return (
                xPlayer and 
                xPlayer.getJob() and 
                xPlayer.getJob().name == interior.owner
            );
        end 
    end 

    return false;
end

-- 
-- Events
-- 

exports.vCore:addFetch('sProperty:fetchInteriors', function(player, callback)
    while (not interiorsLoaded) do 
        Wait(1000);
    end 

    callback(Interiors);
end);

exports.vCore:addFetch('sProperty:enter', function(player, callback, interiorId, interiorType, ...)
    if (
        interiorId and 
        interiorType and 
        Events.enter[interiorType]
    ) then 
        local qPlayer = exports.vCore:getPlayerEntityFromId(player);
        if (qPlayer) then 
            Events.enter[interiorType](qPlayer, callback, interiorId, ...);
        end 
    else 
        callback(false);
    end 
end);

-- Door state change
exports.vCore:addFetch('sProperty:door', function(player, callback, interiorId, interiorType)
    if (
        interiorId and 
        interiorType and 
        Events.door[interiorType]
    ) then 
        local qPlayer = exports.vCore:getPlayerEntityFromId(player);
        if (qPlayer) then 
            Events.door[interiorType](qPlayer, callback, interiorId)
        end 
    else 
        callback(
            false, 
            SharedConfig.labels['cannot_change_door_state']
        );
    end 
end);