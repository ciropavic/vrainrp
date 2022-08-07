ESX = nil;

local MaxParkingFee = 15000;
local CostPerSecond = 0.00231481481;

local cache = {};

TriggerEvent("esx:getSharedObject", function(lib) 
	ESX = lib;
end);

Citizen.CreateThread(function()
    for index, garage in ipairs(Config.points) do 
        local spawnMarker = exports.vCore:createMarker(
            garage.marker.position, garage.marker.type or "car", garage.marker.size, 
            garage.marker.color[1], garage.marker.color[2], garage.marker.color[3], garage.marker.color[4], 
            false, true
        );
		spawnMarker.setSharedMeta("garageId", index);
		spawnMarker.setSharedMeta("garageType", "spawn");

		local despawnMarker = exports.vCore:createMarker(
            garage.despawn.position, garage.despawn.type or "car", garage.despawn.size, 
            garage.despawn.color[1], garage.despawn.color[2], garage.despawn.color[3], garage.despawn.color[4], 
            false, true
        );
		despawnMarker.setSharedMeta("garageId", index);
		despawnMarker.setSharedMeta("garageType", "despawn");
    end 
end);

ESX.RegisterServerCallback(
    'sGarage:fetchPlayerVehicles', 
    function(source, callback, garageId)
        local xPlayer = ESX.GetPlayerFromId(source);

        if (
            xPlayer and 
            garageId and 
            Config.points[garageId]
        ) then 
            local job = xPlayer.getJob().name;
            local garage = Config.points[garageId];

            local query = [[
                SELECT 
                    plate, vehicle, storedAt
                FROM 
                    owned_vehicles
                WHERE 
                    `garage` = @garage AND `type` = @type AND `owner` = @owner
            ]]
            
            -- AND garage = @garage AND type = @type AND job IS NULL

            MySQL.Async.fetchAll(
                query, 
                { 
                    owner = xPlayer.identifier, 
                    garage = garage.dbId,
                    type = garage.vehicle.type or 'car'
                }, 
                function(response)
                    local vehicles = {};

                    local time = os.time();
                    for i, v in pairs(response) do 
                        local parkingCostPerSecond = (type(garage.cost_per_second) == "number")
                                    and garage.cost_per_second
                                    or Config.DefaultCostPerSecond;

                        local parkingFee = (time - v.storedAt) * parkingCostPerSecond;

                        if (parkingFee > MaxParkingFee) then 
                            parkingFee = MaxParkingFee;
                        end 

                        table.insert(vehicles, {
                            plate = v.plate:gsub(" ", "-"),
                            props = json.decode(v.vehicle), 
                            parkingFee = parkingFee
                        });
                    end 

                    cache[source] = { vehicles = vehicles, last = os.time() };
                    callback(true, vehicles);
                end 
            );
        else 
            callback(false, "invalid_garage");
        end 
    end
);

ESX.RegisterServerCallback(
    'sGarage:takeOutVehicle', 
    function(source, callback, props)
        local xPlayer = ESX.GetPlayerFromId(source);
        local identifier = xPlayer.getIdentifier();

        if (
            xPlayer and 
            identifier and 
            props and props.plate
        ) then 
            local query = [[
                SELECT 
                    `state`, `storedAt`, `garage`
                FROM 
                    `owned_vehicles`
                WHERE 
                    `plate` = @plate AND 
                    `owner` = @owner
                LIMIT 1
            ]]

            MySQL.Async.fetchAll(
                query, 
                { plate = props.plate:gsub(" ", "-"), owner = identifier },
                function(response)
                    if (not response or not response[1]) then 
                        return callback(false, "not_found");
                    end 

                    local vehicle = response[1];
                    if (vehicle.state == 0) then 
                        return callback(false, "taken_out");
                    end 
                    
                    local garageIndex = getGarageIndexById(vehicle.garage);
                    if (not garageIndex or not Config.points[garageIndex]) then 
                        return callback(false, "invalid_garage");
                    end 
                    
                    local garage = Config.points[garageIndex];                    

                    local parkingCostPerSecond = (type(garage.cost_per_second) == "number")
                                    and garage.cost_per_second
                                    or Config.DefaultCostPerSecond;

                    local parkingFeeLimit = (type(garage.max_parking_cost) == "number")
                                                and garage.max_parking_cost
                                                or Config.DefaultMaxCost;

                    local parkingFee = (os.time() - vehicle.storedAt) * parkingCostPerSecond;
                    if (parkingFee > parkingFeeLimit) then 
                        parkingFee = parkingFeeLimit;
                    end 

                    parkingFee = math.floor(parkingFee);

                    if (xPlayer.getMoney() < parkingFee) then 
                        callback(false, { code = "not_enough_cash_for_parking_fee", data = { parkingFee } });
                    else 
                        xPlayer.removeMoney(parkingFee);
                        callback(true);
                        MySQL.Async.execute("UPDATE `owned_vehicles` SET `state` = 0, `storedAt` = @time WHERE `plate` = @plate", { time = os.time(), plate = props.plate:gsub(" ", "-") });
                    end
                end
            );
        else 
            callback(false, "invalid_garage");
        end 
    end 
);

ESX.RegisterServerCallback(
    'sGarage:putVehicleInGarage', 
    function(source, callback, props, garageId)
        local player = source;
        local xPlayer = ESX.GetPlayerFromId(source);

        if (xPlayer and props and garageId and Config.points[garageId]) then 
            local garage = Config.points[garageId];

            local query = [[
                SELECT 
                    owner
                FROM 
                    owned_vehicles
                WHERE 
                    plate = @plate AND 
                    owner = @identifier
                LIMIT 1
            ]]

            MySQL.Async.fetchAll(
                query, 
                { plate = props.plate:gsub(" ", "-"), identifier = xPlayer.getIdentifier() },
                function(response)
                    if (response and #response > 0) then 
                        local parkingCostPerSecond = (type(garage.cost_per_second) == "number")
                                                and garage.cost_per_second
                                                or Config.DefaultCostPerSecond;

                        local parkingFeeLimit = (type(garage.max_parking_cost) == "number")
                                                    and garage.max_parking_cost
                                                    or Config.DefaultMaxCost;

                        putVehicleInGarage(props, garageId);

                        exports.vChat:outputChatBox(
                            player, 
                            "A publikus garázsokban tárolt járművek kivételénél parkolási díjat kell fizetni! (Ennél a garázsnál $" .. math.ceil(parkingCostPerSecond * 86400) .. " / nap, $" .. parkingFeeLimit .. " max limit.)", 
                            "info", "info"
                        );

                        callback(true);
                    else 
                        callback(false, "not_found");
                    end 
                end
            );
        else 
            callback(false, "invalid_garage");
        end
    end
);

function putVehicleInGarage(props, garageId)
    local query = [[
        UPDATE 
            owned_vehicles
        SET
            garage = @garage, vehicle = @vehicle, 
            storedAt = @time, state = 1
        WHERE 
            plate = @plate
    ]]

    MySQL.Async.execute(
        query, 
        { 
            garage = Config.points[garageId].dbId, 
            vehicle = json.encode(props), 
            plate = props.plate:gsub(" ", "-"), 
            time = os.time()
        }, 
        function()
            
        end 
    )
end 

AddEventHandler("playerDropped", function()
    local player = source;
    local xPlayer = ESX.GetPlayerFromId(player);

    if (not xPlayer) then 
        return false;
    end 

    local identifier = xPlayer.getIdentifier();
    if (not identifier) then 
        return false;
    end 

    local query = [[
        UPDATE 
            owned_vehicles
        SET
            state = 1
        WHERE 
            owner = @owner
    ]]

    MySQL.Async.execute(
        query, 
        { 
            owner = identifier, 
        }, 
        function()
            
        end 
    );
end);

function getGarageIndexById(id)
    for i, v in ipairs(Config.points) do 
        if (v.dbId == id) then 
            return i;
        end 
    end 

    return false;
end 