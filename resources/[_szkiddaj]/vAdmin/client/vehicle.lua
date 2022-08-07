RegisterNetEvent("vAdmin::fixVehicleISeatIn");
AddEventHandler("vAdmin::fixVehicleISeatIn", function()
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false);

    SetVehicleFixed(vehicle);
    SetVehicleDirtLevel(vehicle, 0);
end);