-- local vehicle = exports.vCore:createVehicle(
--     GetHashKey("infernus"), 
--     0.0, 0.0, 75.0, 0.0, true, true, false
-- );

-- ;

-- SetPedIntoVehicle(GetPlayerPed(1), vehicle.__netId, -1);
-- local coords = GetEntityCoords(vehicle.__netId);
-- SetEntityCoords(GetPlayerPed(1), coords, false, false, false, false);

local vehicle = CreateVehicle(GetHashKey("infernus"), 0.0, 0.0, 75.0, 0.0, true, false, false);
print(vehicle, DoesEntityExist(vehicle))