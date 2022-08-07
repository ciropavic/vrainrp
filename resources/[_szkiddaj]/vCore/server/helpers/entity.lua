function getEntitiesByType(entityType)
    local filteredEntities = {};
    for id, entity in pairs(Entities) do 
        if (entity.__type == entityType) then
            table.insert(filteredEntities, entity);
        end 
    end 

    return filteredEntities;
end 
exports("getEntitiesByType", getEntitiesByType);

function getEntityFromId(id)
    return table.find_keytbl(Entities, function(x)
        return (x.id == id);
    end);
end 
exports("getEntityFromId", getEntityFromId);

--[[ Entity finding ]]--

function getPlayerEntityFromId(playerId)
    playerId = tonumber(playerId);

    return table.find_keytbl(Entities, function(x)
        return (x.__type == "player" and x.__netId == playerId);
    end);
end 
exports("getPlayerEntityFromId", getPlayerEntityFromId);

--[[ Entity Creation ]]--

function createVehicle(...)
    return Entity({
        type = "vehicle", 
        parentResource = (GetInvokingResource() or nil),
        __to_constructor = { ... },
    });
end 
exports("createVehicle", createVehicle);

function createObject(...)
    return Entity({
        type = "object", 
        parentResource = (GetInvokingResource() or nil),
        __to_constructor = { ... },
    });
end 
exports("createObject", createObject);

function createPed(...)
    return Entity({
        type = "ped", 
        parentResource = (GetInvokingResource() or nil),
        __to_constructor = { ... },
    });
end 
exports("createPed", createPed);

function createMarker(...)
    return Entity({
        type = "marker", 
        parentResource = (GetInvokingResource() or nil),
        __to_constructor = { ... },
    });
end
exports("createMarker", createMarker);

function createColCuboid(x, y, z, width, depth, height)
    return Entity({
        type = "colshape", 
        parentResource = (GetInvokingResource() or nil),
        __to_constructor = {
            {
                type = "cuboid", 
                position = vector3(x, y, z), 
                size = vector3(width, depth, height)
            }
        },
    });
end 
exports("createColCuboid", createColCuboid);

function createColPolygon(points)
    return Entity({
        type = "colshape", 
        parentResource = (GetInvokingResource() or nil),
        __to_constructor = {
            {
                type = "polygon", 
                points = points,
            }
        },
    });
end 
exports("createColPolygon", createColPolygon);