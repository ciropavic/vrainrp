RegisterNetEvent("vCore::internal::events::enteringVehicle");
AddEventHandler("vCore::internal::events::enteringVehicle", function(vehicle, ...)
    local player = source;
    iprint(player, "enteringVehicle", NetworkGetEntityFromNetworkId(vehicle), vehicle, ...);
end);

-- RegisterNetEvent("vCore::internal::events::enteredVehicle");
-- AddEventHandler("vCore::internal::events::enteredVehicle", function(...)
--     local player = source;
--     iprint(player, "enteredVehicle", ...);
-- end);

-- RegisterNetEvent("vCore::internal::events::leftVehicle");
-- AddEventHandler("vCore::internal::events::leftVehicle", function(...)
--     local player = source;
--     iprint(player, "leftVehicle", ...);
-- end);

-- RegisterNetEvent("vCore::internal::events::enteringVehicle");
-- AddEventHandler("vCore::internal::events::enteringVehicle", function(...)
--     local player = source;
--     iprint(player, "enteringVehicle", ...);
-- end);