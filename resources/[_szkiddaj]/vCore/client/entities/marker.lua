local __InStreamingRange = {};
local __MaxStreamingRange = 100;

EntityConstructors['marker'] = function(self)

end 

EntityExtensions['marker'] = {
    getPosition = function(self)
        return self.getInternalData("position");
    end, 

    setPosition = function(self, xOrVector, y, z)
        self.setInternalData(
            (type(xOrVector) == "number") 
                    and vector3(xOrVector, y, z) 
                    or xOrVector
        );
    end, 
};

EntityInternalEvents['marker'] = {
    entitiesWithin = function(self, old, new)       
        for entityId, _ in pairs(old) do 
            local entity = Entities[entityId];
            
            if (entity and not new[entityId]) then 
                entity.__emit("markerLeave", self);
                self.__emit("entityLeave", entity);
                TriggerEvent("onClientEntityMarkerLeave", self, entity);
            end 
        end 
        
        for entityId, _ in pairs(new) do 
            local entity = Entities[entityId];

            if (entity and not old[entityId]) then 
                entity.__emit("markerEnter", self);
                self.__emit("entityEnter", entity);
                TriggerEvent("onClientEntityMarkerEnter", self, entity);
            end 
        end 
    end,
};

Citizen.CreateThread(function()
    while (true) do
        for entityId, _ in pairs(__InStreamingRange) do 
            local entity = Entities[entityId];
            
            if (entity) then 
                local markerType = MarkerTypesEnum[entity.__internalShared.type];
                local position = entity.__internalShared.position;
                local size = entity.__internalShared.size;
                local color = entity.__internalShared.color;
                local options = entity.__internalShared.options;

                DrawMarker(
                    markerType or 0, 
                    position.x, position.y, position.z, 
                    0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 
                    size, size, size, 
                    color[1], color[2], color[3], color[4], 
                    options.bobUpAndDown, options.faceCamera, 2, options.rotate, 
                    options.textureDict, options.textureName, options.drawOnEnts
                );

                position = vector3(position.x - size / 2, position.y - size / 2, position.z - size / 2);

                -- bottom rect
                DrawLine(position.x, position.y, position.z, position.x + size, position.y, position.z, 255, 255, 255, 255); -- bottom
                DrawLine(position.x + size, position.y, position.z, position.x + size, position.y + size, position.z, 255, 255, 255, 255); -- right
                DrawLine(position.x, position.y + size, position.z, position.x + size, position.y + size, position.z, 255, 255, 255, 255); -- top
                DrawLine(position.x, position.y, position.z, position.x, position.y + size, position.z, 255, 255, 255, 255); -- left
        
                -- bottom and top connect
                DrawLine(position.x, position.y, position.z, position.x, position.y, position.z + size, 255, 255, 255, 255); -- bottom left
                DrawLine(position.x + size, position.y, position.z, position.x + size, position.y, position.z + size, 255, 255, 255, 255); -- bottom right
                DrawLine(position.x + size, position.y + size, position.z, position.x + size, position.y + size, position.z + size, 255, 255, 255, 255); -- top right
                DrawLine(position.x, position.y + size, position.z, position.x, position.y + size, position.z + size, 255, 255, 255, 255); -- top left
        
                -- top rect
                DrawLine(position.x, position.y, position.z + size, position.x + size, position.y, position.z + size, 255, 255, 255, 255); -- bottom
                DrawLine(position.x + size, position.y, position.z + size, position.x + size, position.y + size, position.z + size, 255, 255, 255, 255); -- right
                DrawLine(position.x, position.y + size, position.z + size, position.x + size, position.y + size, position.z + size, 255, 255, 255, 255); -- top
                DrawLine(position.x, position.y, position.z + size, position.x, position.y + size, position.z + size, 255, 255, 255, 255); -- left
            end 
        end 

        Wait(0);
    end 
end);

Citizen.CreateThread(function()
    while (true) do
        if (EntityRefs.marker) then 
            local localPed = PlayerPedId();

            for _, entityId in pairs(EntityRefs.marker) do 
                local entity = Entities[entityId];

                if (entity) then 
                    local pedCoords = GetEntityCoords(localPed);
                    local markerCoords = entity.getPosition();
                    local distance = #(pedCoords - markerCoords);
                    
                    if (not __InStreamingRange[entityId] and distance <= __MaxStreamingRange) then 
                        __InStreamingRange[entityId] = true;
                    elseif (__InStreamingRange[entityId] and distance > __MaxStreamingRange) then 
                        __InStreamingRange[entityId] = nil;
                    end 
                else 
                    __InStreamingRange[entityId] = nil;
                end 
            end 
        end 
        
        Wait(250);
    end 
end);