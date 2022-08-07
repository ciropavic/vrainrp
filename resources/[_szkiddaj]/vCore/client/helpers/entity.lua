function getEntitiesByType(entityType)
    if (not IS_READY or not entityType or not EntityRefs[entityType]) then 
        return {};
    end 

    local filteredEntities = {};
    
    for _, entityId in pairs(EntityRefs[entityType]) do 
        if (entityId and Entities[entityId]) then
            table.insert(filteredEntities, Entities[entityId]);
        end 
    end 

    return filteredEntities;
end 
exports("getEntitiesByType", getEntitiesByType);