
local function enter(player, callback, interiorId, ...)
    if (
        interiorId and 
        Interiors[interiorId]
    ) then
        local isInside = (...);
        local interior = Interiors[interiorId];
        local error;

        if (not interior.door) then 
            error = SharedConfig.labels['door_closed'];
        end 

        if (not error) then
            local x, y, z;
            if (isInside) then 
                x, y, z = interior.enter.position.x, interior.enter.position.y, interior.enter.position.z;
            else 
                x, y, z = table.unpack(SharedConfig.interiors[interior.type][interior.interior].inside);
            end 

            player.setDimension(isInside and interiorId or 0);
            player.setCoords(x, y, z);
            callback(true);
        else 
            callback(false, error);
        end 

    else 
        callback(false);
    end 
end 

local function close(player, callback, interiorId)
    if (
        interiorId and 
        Interiors[interiorId]
    ) then
        local interior = Interiors[interiorId];
        local error;

        if (not hasAccessToProperty(player, interiorId)) then 
            error = 'Nincs hozzaferesed az interiorhoz.';
        end 

        if (not error) then
            interior.door = not interior.door;
            
            callback(
                true, 
                not interior.door
            );

            local entraceData = Interiors[interiorId].shapes.entrace.getMeta("interior");
            entraceData.locked = not interior.door;
            Interiors[interiorId].shapes.entrace.setSharedMeta("interior", entraceData);

            local exitData = Interiors[interiorId].shapes.exit.getMeta("interior");
            exitData.locked = not interior.door;
            Interiors[interiorId].shapes.exit.setSharedMeta("interior", exitData);
        else 
            callback(false, error);
        end 
    else 
        callback(false, 'Nem talaltam az interiort.');
    end 
end 

Events.enter.house = enter;
Events.enter.business = enter;

Events.door.house = close;
Events.door.business = close;