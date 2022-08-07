local function handleEnter(success, errorOrCoords)
    if (success) then 
        
    else 
        TriggerEvent(
            "vrain_notify:showNotification", 
            (errorOrCoords or 'Ismeretlen hiba.'), 
            success and "success" or "error", 
            3000
        );
    end 
end 

local function enterInterior(interior, inside)
    exports.vCore:useFetchAsync('sProperty:enter', handleEnter, interior.id, interior.type, inside);
end 

local function handleDoorChange(success, errorOrResponse)
    if (not success) then 
        TriggerEvent(
            "vrain_notify:showNotification", 
            (errorOrResponse or 'Ismeretlen hiba.'), 
            "error", 
            3000
        );
    else 
        print("nyitva", errorOrResponse);
        SendNUIMessage({
            action = "UPDATE",
            payload = {
                locked = errorOrResponse
            },
        })
    end 
end 

local function changeDoorState(interior)
    exports.vCore:useFetchAsync('sProperty:door', handleDoorChange, interior.id, interior.type);
end 

MarkerHandlers.enter.house = enterInterior;
MarkerHandlers.enter.business = enterInterior;

MarkerHandlers.door.house = changeDoorState;
MarkerHandlers.door.business = changeDoorState;
