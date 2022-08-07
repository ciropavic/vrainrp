EntityConstructors['marker'] = function(self, ...)
    local x, y, z, markerType, size, r, g, b, a, bobUpAndDown, faceCamera, rotate, textureDict, textureName, drawOnEnts;
    local args = { ... };

    if (type(args[1]) == "number") then 
        x, y, z, markerType, size, r, g, b, a, bobUpAndDown, faceCamera, rotate, textureDict, textureName, drawOnEnts = table.unpack(args); 
    else 
        x, y, z = table.unpack(args[1]);
        markerType = args[2];
        size = args[3];
        r = args[4];
        g = args[5];
        b = args[6];
        a = args[7];
        bobUpAndDown = args[8] or false;
        faceCamera = args[9] or false;
        rotate = args[10] or false;
        textureDict = args[11] or nil;
        textureName = args[12] or nil;
        drawOnEnts = args[13] or false;
    end 

    self.__internalShared.entitiesWithin = {}; -- EntityId[]
    self.__internalShared.position = vector3(x, y, z);
    self.__internalShared.type = markerType or "cylinder";
    self.__internalShared.size = (size or 1.0) + 0.0;
    self.__internalShared.color = { r or 255, g or 255, b or 255, a or 150 };
    self.__internalShared.options = {
        bobUpAndDown = bobUpAndDown,
        faceCamera = faceCamera,
        rotate = rotate,
        textureDict = textureDict,
        textureName = textureName,
        drawOnEnts = drawOnEnts
    };
end 

EntityDestructors['marker'] = function(self)
    
end

EntitySharedInternalKeys['marker'] = {
    entitiesWithin = true, 
    type = true, 
    size = true, 
    color = true, 
    options = true
};

local clamp = function(x, min, max) return (x < min and min or x > max and max or x); end

EntityExtensions['marker'] = {
    setDimension = function(self, newDimension)
        self.setInternalData("dimension", newDimension, true);
    end, 

    getDimension = function()
        return self.getInternalData("dimension");
    end, 

    setPosition = function(self, xOrVector, y, z)
        self.setInternalData(
            "position",
            (type(xOrVector) == "number") 
                    and vector3(xOrVector, y, z) 
                    or xOrVector, 
            true
        );
    end, 

    getPosition = function(self)
        return self.getInternalData("position");
    end, 

    setType = function(self, newType)
        assert(type(newType) == "string" and MarkerTypesEnum[newType], "Bad argument @ '" .. self.__type .. ".setSize', expected MarkerType at argument 1, got '" .. newType .. "'");
        
        self.setInternalData("type", newType, true);
    end, 

    getType = function(self)
        return self.getInternalData("type");
    end, 

    setSize = function(self, newSize)
        assert(type(newSize) == "number", "Bad argument @ '" .. self.__type .. ".setSize', expected number at argument 1, got '" .. type(newSize) .. "'");
        assert(newSize > 0.3 and newSize < 10.0, "Bad argument @ '" .. self.__type .. ".setSize', expected number between 0.3 and 10.0 at argument 1, got '" .. newSize .. "'");

        self.setInternalData("size", newSize, true);
    end, 

    getSize = function(self)
        return self.getInternalData("size");
    end, 

    setColor = function(self, r, g, b, a)
        assert(type(r) == "number", "Bad argument @ '" .. self.__type .. ".setColor', expected number at argument 1, got '" .. type(r) .. "'");
        assert(type(g) == "number", "Bad argument @ '" .. self.__type .. ".setColor', expected number at argument 2, got '" .. type(g) .. "'");
        assert(type(b) == "number", "Bad argument @ '" .. self.__type .. ".setColor', expected number at argument 3, got '" .. type(b) .. "'");
        assert(type(a) == "number", "Bad argument @ '" .. self.__type .. ".setColor', expected number at argument 4, got '" .. type(a) .. "'");

        r = clamp(r, 0, 255);
        g = clamp(g, 0, 255);
        b = clamp(b, 0, 255);
        a = clamp(a, 0, 255);

        self.setInternalData("color", { r, g, b, a }, true);
    end, 

    getColor = function()
        return self.getInternalData("color");
    end, 

    setOption = function(self, key, value)
        local options = self.getInternalData("options");
        options[key] = value;
        self.setInternalData("options", options, true);
    end, 

    getOptions = function(self)
        return self.getInternalData("options");
    end, 

    isPointWithin = function(self, xOrVector, y, z)
        local pos = self.getInternalData("position");
        local size = self.getInternalData("size");

        pos = vector3(pos.x - size / 2, pos.y - size / 2, pos.z - size / 2);

        if (type(xOrVector) == "number") then 
            return (
                xOrVector.x > pos.x and xOrVector.x < pos.x + size and 
                y > pos.y and y < pos.y + size and 
                z > pos.z and z < pos.z + size
            );
        else 
            return (
                xOrVector.x > pos.x and xOrVector.x < pos.x + size and 
                xOrVector.y > pos.y and xOrVector.y < pos.y + size and 
                xOrVector.z > pos.z and xOrVector.z < pos.z + size
            );
        end 
    end 
};

Citizen.CreateThread(function()
    while (true) do
        if (EntityRefs.marker) then 
            for _, markerId in ipairs(EntityRefs.marker) do 
                local marker = Entities[markerId];
                if (marker) then 
                    local entitiesWithin = marker.getInternalData("entitiesWithin");
                    local changed = false;
                    
                    if (EntityRefs.player) then 
                        for _, playerId in ipairs(EntityRefs.player) do 
                            local player = Entities[playerId];
                            
                            if (player) then 
                                local isWithin = marker.isPointWithin(player.getPosition());

                                if (isWithin and not entitiesWithin[player.id]) then 
                                    entitiesWithin[player.id] = true;
                                    changed = true;
                                elseif (not isWithin and entitiesWithin[player.id]) then 
                                    entitiesWithin[player.id] = nil;
                                    changed = true;
                                end 
                            end 
                        end 
                    end 

                    if (changed) then 
                        marker.setInternalData("entitiesWithin", entitiesWithin, true);
                    end 
                end 
            end 
        end 

        Wait(10);
    end 
end);