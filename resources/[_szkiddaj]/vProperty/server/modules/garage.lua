exports.vCore:addFetch(
    "vProperty::takeOutVehicle", 
    function(player, callback, plate)
        plate = plate:gsub(" ", "-");
        local result = MySQL.query.await("SELECT plate, state FROM owned_vehicles WHERE plate = ? LIMIT 1", { plate });
        if (type(result) == "table" and #result > 0) then 
            local vehicle = result[1];

            if (vehicle.state == 0) then 
                return callback(false, "vehicle_not_stored");
            end 

            MySQL.execute("UPDATE owned_vehicles SET state = 0 WHERE plate = ? LIMIT 1", { plate });
            callback(true);
        end 
    end 
);

local function fetchPlayerVehicles(player, callback, interiorId)
    if (
        interiorId and 
        type(interiorId) == 'number'
    ) then 
        local xPlayer = ESX.GetPlayerFromId(player.__netId);
        
        if (not hasAccessToProperty(player, interiorId)) then 
            return callback(false, "cannot_access_to_garage");
        end 
        
        if (not interiorId or not Interiors[interiorId]) then 
            return callback(false, "unknown_interior");
        end 
        
        local interior = Interiors[interiorId];

        local query = [[
            SELECT 
                plate, vehicle
            FROM 
                owned_vehicles
            WHERE 
                `garage` = @garage AND `type` = @type AND `owner` = @owner %s
        ]]

        query = string.format(
            query, 
            (interior and interior.ownerType == 'faction' and interior.owner == xPlayer.getJob().name)
                and ("OR `job` = '" .. interior.owner .. "'")
                or 'AND job IS NULL'
        );

        MySQL.Async.fetchAll(
            query,
            { 
                owner = xPlayer.getIdentifier(), 
                garage = 'interior_garage_' .. interiorId, 
                job = interior.owner, 
                type = 'car'
            }, 
            function(result)
                if (result and #result > 0) then 
                    local vehicles = {};

                    for i, v in pairs(result) do 
                        table.insert(vehicles, {
                            plate = v.plate,
                            props = json.decode(v.vehicle)
                        });
                    end 

                    callback(true, vehicles);
                else 
                    callback(false, "no_vehicle_in_this_garage");
                end 
            end 
        );
    end 
end 

local function updateVehicle(props, garageId)
    local query = [[
        UPDATE 
            owned_vehicles
        SET
            garage = @garage, vehicle = @vehicle
        WHERE 
            plate = @plate
    ]]

    MySQL.Async.execute(
        query, 
        { 
            garage = 'interior_garage_' .. garageId, 
            vehicle = json.encode(props), 
            plate = props.plate:gsub(' ', '-')
        }, 
        function(rows)
            print(rows)
        end 
    );
end 

local function putVehicleInGarage(player, callback, garageId, props)
    local xPlayer = ESX.GetPlayerFromId(player.__netId);

    if (xPlayer and props and garageId) then 
        if (not hasAccessToProperty(player, garageId)) then 
            return callback(false, "cannot_access_to_garage");
        end 

        local query = [[
            SELECT 
                owner
            FROM 
                owned_vehicles
            WHERE 
                plate = @plate LIMIT 1
        ]]

        MySQL.Async.fetchAll(
            query, 
            { plate = props.plate:gsub(' ', '-') },
            function(response)
                if (response and #response > 0) then 
                    updateVehicle(props, garageId);
                    callback(true);
                else 
                    callback(false, "invalid_vehicle");
                end 
            end
        );
    else 
        callback(false, "invalid_xplayer_or_garage_id");
    end
end 

local function garageMain(player, callback, interiorId, action, props)
    if (action and action == 'spawn') then 
        fetchPlayerVehicles(player, callback, interiorId);
    elseif (action and action == 'despawn' and props) then 
        putVehicleInGarage(player, callback, interiorId, props);
    end 
end

Events.enter.garage = garageMain;