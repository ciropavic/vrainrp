local __ColshapeRefs = {};

local ValidColshapeTypes = {
    cuboid = true, 
    polygon = true,
};

local __ColshapeEvents = {
    enterOrLeave = {
        player  = true, 
        -- vehicle = true,
    },
};

EntitySharedInternalKeys['colshape'] = {
    __colType = true, 
    __colData = true
};

EntityConstructors['colshape'] = function(self, data)   
    if (
        not data or 
        not data.type or 
        not ValidColshapeTypes[data.type]
    ) then 
        return false;
    end 

    self.__internalShared.__colType = data.type;
    self.__internalShared.__colData = data;

    table.insert(__ColshapeRefs, self.id);
end 

EntityDestructors['colshape'] = function(self)
    print("colshape destructor");
end

EntityExtensions['colshape'] = {
    __entitiesWithin = {},

    __isPointWithin = {
        cuboid = function(self, x, y, z)
            local shape = self.__internalShared.__colData;

            return (
                type(x) == "number" and type(y) == "number" and type(z) == "number" and
                x > shape.position.x and x < shape.position.x + shape.size.x and 
                y > shape.position.y and y < shape.position.y + shape.size.y and 
                z > shape.position.z and z < shape.position.z + shape.size.z
            );
        end, 

        polygon = function(self, point)
            local points = self?.__internalShared?.__colData.points;

            local x, y = point.x, point.y;

            local inside = false;
            local i = 0;
            local j = #points - 1;

            while i < #points do
                local xi = points[i + 1].x;
                local yi = points[i + 1].y;
                local xj = points[j + 1].x;
                local yj = points[j + 1].y;
                local intersect = yi > y ~= (yj > y) and x < (xj - xi) * (y - yi) / (yj - yi) + xi;

                if intersect then
                    inside = not inside;
                end
                
                j = i;
                i = i + 1;
            end
            
            return inside
        end 
    },

    __getCentroid = {
        polygon = function(self)
            local points = self?.__internalShared?.__colData.points;

            local centroid = { x = 0, y = 0 };
            local signed = 0;
            local x0, y0, x1, y1, a;

            do
                local i = 0

                while i < #points do
                    x0 = points[i + 1].x;
                    y0 = points[i + 1].y;
                    x1 = points[(i + 1) % #points + 1].x;
                    y1 = points[(i + 1) % #points + 1].y;
                    a = x0 * y1 - x1 * y0;
                    signed = signed + a;
                    centroid.x = centroid.x + (x0 + x1) * a;
                    centroid.y = centroid.y + (y0 + y1) * a;
                    i = i + 1;
                end
            end

            signed = signed * 0.5;
            centroid.x = centroid.x / (6 * signed);
            centroid.y = centroid.y / (6 * signed);

            return centroid;
        end,
    },

    __getDistance = {
        cuboid = function(self)

        end, 

        polygon = function(self, fromPoint)
            local centre = self.__getCentroid[self.__internalShared.__colType](self);
            return #(fromPoint - vector2(centre.x, centre.y));
        end, 
    },

    isPointWithin = function(self, ...)
        return self.__isPointWithin[self.__internalShared.__colType](self, ...);
    end, 

    getCentre = function(self)
        return self.__getCentroid[self.__internalShared.__colType](self);
    end, 

    getDistance = function(self, ...)
        return self.__getDistance[self.__internalShared.__colType](self, ...);
    end,

    setDimension = function(self, newDimension)
        assert(type(newDimension) == "number", "Bad argument @ '" .. self.__type .. ".setDimension', expected number at argument 1, got '" .. type(newDimension) .. "'");

        self.__internalShared.dimension = newDimension;
    end, 

    getDimension = function(self)
        return self.__internalShared.dimension;
    end 
};

Citizen.CreateThread(function()
    while (true) do 
        for index, colRef in ipairs(__ColshapeRefs) do 
            if (Entities[colRef]) then 
                local colshape = Entities[colRef];
                
                for id, entity in pairs(Entities) do 
                    if (__ColshapeEvents.enterOrLeave[entity.__type]) then 
                        local entityPoint = entity.getPosition();
                        local isWithin = colshape.isPointWithin(entityPoint);
                        local isSameDimension = colshape.getDimension() == entity.getDimension();

                        if (not colshape.__entitiesWithin[entity.id] and isWithin) then 
                            colshape.__emit("onEntityEnter", entity, isSameDimension);
                            entity.__emit("onColshapeEnter", colshape, isSameDimension);
                            TriggerEvent("onColshapeEnter", colshape, entity, isSameDimension);
                            
                            colshape.__entitiesWithin[entity.id] = true;
                        elseif (colshape.__entitiesWithin[entity.id] and not isWithin) then 
                            colshape.__emit("onEntityLeave", entity, isSameDimension);
                            entity.__emit("onColshapeLeave", colshape, isSameDimension);
                            TriggerEvent("onColshapeLeave", colshape, entity, isSameDimension);

                            colshape.__entitiesWithin[entity.id] = nil;
                        end 
                    end 
                end 
            else 
                table.remove(__ColshapeRefs, index);
            end 
        end 

        Wait(1000);
    end 
end);