local __ColshapeRefs = {};
local __InRangeColshapes = {};

local __DrawRange = 185.0;
local __StreamRange = 250.0;

local __CanEmitColshapeEvents = {
    player      = true, 
    vehicle     = true,
};

EntityConstructors['colshape'] = function(self)
    debug("halo", self);

    table.insert(__ColshapeRefs, self.id);
end 

EntityDestructors['colshape'] = function(self)
    -- table.insert(__ColshapeRefs, self.id);\
    for i,v in ipairs(__ColshapeRefs) do 
        if (v == self.id) then 
            table.remove(__ColshapeRefs, i);
            break;
        end 
    end 
end 

EntityExtensions['colshape'] = {
    __render = {
        cuboid = function(self)
            local pos = self?.__internalShared?.__colData.position;
            local size = self?.__internalShared?.__colData.size;
    
            -- bottom rect
            DrawLine(pos.x, pos.y, pos.z, pos.x + size.x, pos.y, pos.z, 255, 255, 255, 255); -- bottom
            DrawLine(pos.x + size.x, pos.y, pos.z, pos.x + size.x, pos.y + size.y, pos.z, 255, 255, 255, 255); -- right
            DrawLine(pos.x, pos.y + size.y, pos.z, pos.x + size.x, pos.y + size.y, pos.z, 255, 255, 255, 255); -- top
            DrawLine(pos.x, pos.y, pos.z, pos.x, pos.y + size.y, pos.z, 255, 255, 255, 255); -- left
    
            -- bottom and top connect
            DrawLine(pos.x, pos.y, pos.z, pos.x, pos.y, pos.z + size.z, 255, 255, 255, 255); -- bottom left
            DrawLine(pos.x + size.x, pos.y, pos.z, pos.x + size.x, pos.y, pos.z + size.z, 255, 255, 255, 255); -- bottom right
            DrawLine(pos.x + size.x, pos.y + size.y, pos.z, pos.x + size.x, pos.y + size.y, pos.z + size.z, 255, 255, 255, 255); -- top right
            DrawLine(pos.x, pos.y + size.y, pos.z, pos.x, pos.y + size.y, pos.z + size.z, 255, 255, 255, 255); -- top left
    
            -- top rect
            DrawLine(pos.x, pos.y, pos.z + size.z, pos.x + size.x, pos.y, pos.z + size.z, 255, 255, 255, 255); -- bottom
            DrawLine(pos.x + size.x, pos.y, pos.z + size.z, pos.x + size.x, pos.y + size.y, pos.z + size.z, 255, 255, 255, 255); -- right
            DrawLine(pos.x, pos.y + size.y, pos.z + size.z, pos.x + size.x, pos.y + size.y, pos.z + size.z, 255, 255, 255, 255); -- top
            DrawLine(pos.x, pos.y, pos.z + size.z, pos.x, pos.y + size.y, pos.z + size.z, 255, 255, 255, 255); -- left
        end, 

        polygon = function(self)
            local points = self?.__internalShared?.__colData.points;

            for i = 1, #points do 
                local cPoint = points[i];
                local tPoint = (not points[i + 1]) and points[1] or points[i + 1];

                DrawLine(
                    cPoint.x + 0.0, cPoint.y + 0.0, cPoint.z and cPoint.z or 72.0, 
                    tPoint.x + 0.0, tPoint.y + 0.0, tPoint.z and tPoint.z or 72.0, 
                    255, 255, 255, 255
                );
            end 
        end,
    },

    __isPointWithin = {
        cuboid = function(self, point)
            local shape = self.__internalShared.__colData;

            return (
                point.x > shape.position.x and point.x < shape.position.x + shape.size.x and 
                point.y > shape.position.y and point.y < shape.position.y + shape.size.y and 
                point.z > shape.position.z and point.z < shape.position.z + shape.size.z
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
        cuboid = function(self)
            local shape = self.__internalShared.__colData;

            return vector3(
                shape.position.x + shape.size.x / 2, 
                shape.position.y + shape.size.y / 2, 
                shape.position.z + shape.size.z / 2
            );
        end, 

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
        cuboid = function(self, fromPoint)
            local centre = self.__getCentroid[self.__internalShared.__colType](self);
            return (fromPoint.z ~= nil)
                    and #(fromPoint - vector3(centre.x, centre.y, centre.z))
                    or #(fromPoint - vector2(centre.x, centre.y));
        end, 

        polygon = function(self, fromPoint)
            local centre = self.__getCentroid[self.__internalShared.__colType](self);
            return (fromPoint.z ~= nil)
                    and #(vector2(fromPoint.x, fromPoint.y) - vector2(centre.x, centre.y))
                    or #(fromPoint - vector2(centre.x, centre.y));
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

    render = function(self)
        self.__render[self.__internalShared.__colType](self);
    end,
};

Citizen.CreateThread(function()
    while (true) do 
        local playerPed = PlayerPedId();
        local playerCoords = GetEntityCoords(playerPed);

        for colRef, _ in pairs(__InRangeColshapes) do 
            local colshape = Entities[colRef];
            local data = colshape?.__internalShared?.__colData;

            if (colshape) then 
                local distance = colshape.getDistance(playerCoords);

                if (not colshape.__internalShared.entitiesWithin) then 
                    colshape.__internalShared.entitiesWithin = {};
                end

                for id, entity in pairs(Entities) do 
                    if (
                        __CanEmitColshapeEvents[entity.__type] and 
                        entity.getPosition ~= nil
                    ) then 
                        local entityPoint = entity.getPosition();
                        local isWithin = colshape.isPointWithin(entityPoint);

                        if (not colshape.__internalShared.entitiesWithin[entity.id] and isWithin) then 
                            colshape.__emit("onEntityEnter", entity);
                            TriggerEvent("onClientColshapeEnter", colshape, entity);
                            
                            colshape.__internalShared.entitiesWithin[entity.id] = true;
                        elseif (colshape.__internalShared.entitiesWithin[entity.id] and not isWithin) then 
                            colshape.__emit("onEntityLeave", entity);
                            TriggerEvent("onClientColshapeLeave", colshape, entity);

                            colshape.__internalShared.entitiesWithin[entity.id] = nil;
                        end 
                    end 
                end 
            end 
        end 

        Wait(10);
    end 
end);

Citizen.CreateThread(function()
    while (true) do 
        local playerPed = PlayerPedId();
        local playerCoords = GetEntityCoords(playerPed);

        for colRef, _ in pairs(__InRangeColshapes) do 
            local colshape = Entities[colRef];
            local data = colshape?.__internalShared?.__colData;

            if (colshape) then 
                local distance = colshape.getDistance(playerCoords);

                if (RENDER_COLHAPES and distance < __DrawRange) then 
                    colshape.render();
                end 
            else 
                table.remove(__InRangeColshapes, index);
            end 
        end 

        Wait(0);
    end 
end);

Citizen.CreateThread(function()
    while (true) do 
        local coords = GetEntityCoords(PlayerPedId());

        for index, colRef in ipairs(__ColshapeRefs) do 
            local colshape = Entities[colRef];

            if (colshape and colshape.getDistance(vector2(coords.x, coords.y)) <= __StreamRange) then 
                __InRangeColshapes[colRef] = true;
            else 
                __InRangeColshapes[colRef] = nil;
            end 
        end 

        Wait(500);
    end 
end);

function drawText2D(text, x, y)
    SetTextFont(0);
    SetTextProportional(1);
    SetTextScale(0.0, 0.3);
    SetTextColour(128, 128, 128, 255);
    SetTextDropshadow(0, 0, 0, 0, 255);
    SetTextEdge(1, 0, 0, 0, 255);
    SetTextDropShadow();
    SetTextOutline();
    SetTextEntry("STRING");
    AddTextComponentString(text);
    DrawText(x, y);
end 