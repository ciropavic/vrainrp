Command(
    "getcar", 
    { description = "Jarmu hozzad teleportalasa", required = { admin = 1, off_admin = 5 }, args = { { type = "vehicle" } } }, 
    function(player, vehicle)
        local coords = GetEntityCoords(GetPlayerPed(player.__netId));
        
        SetEntityCoords(vehicle, coords.x, coords.y + 4, coords.z, false, false, false, false);
        SetEntityRotation(vehicle, 0, 0, 0, 0, false);
        outputToAdmins(getPlayerAdminName(player.__netId) .. " magához teleportálta a(z) " .. getVehiclePlate(vehicle) .. " rendszámú járművet.", 1);
    end
);

Command(
    "gotocar", 
    { description = "Járműhöz teleportálás.", required = { admin = 1, off_admin = 5 }, args = { { type = "vehicle" } } }, 
    function(player, vehicle)
        local coords = GetEntityCoords(vehicle);

        SetEntityCoords(GetPlayerPed(player.__netId), coords.x, coords.y + 4, coords.z, false, false, false, false);
        outputToAdmins(getPlayerAdminName(player.__netId) .. " odateleportált a(z) " .. getVehiclePlate(vehicle) .. " rendszámú járműhöz.", 1);
    end
);

Command(
    "repair", 
    { description = "Jármű javítása.", required = { admin = 2, off_admin = 5 }, args = { { type = "player" } }, alias = { "fixveh" }, }, 
    function(player, targetPlayer)
        local vehicle = GetVehiclePedIsIn(GetPlayerPed(targetPlayer.__netId), false);

        if (not vehicle or vehicle == 0) then 
            return exports.vChat:outputChatBox(player.__netId, "A játékos nincs járműben.", "server", "server");
        end 

        TriggerClientEvent("vAdmin::fixVehicleISeatIn", targetPlayer.__netId);

        outputToAdmins(getPlayerAdminName(player.__netId) .. " megjavította " .. getPlayerName(targetPlayer.__netId) .. " járművét.", 1);
        exports.vChat:outputChatBox(player.__netId, "Admin " .. getPlayerAdminName(player.__netId) .." megjavította a járműved.", "server", "server");
    end
);

Command(
    "unflip", 
    { description = "Jarmu visszafordítása. (Játékos ID-jével)", required = { admin = 1, off_admin = 1 }, args = { { type = "player" } } }, 
    function(player, targetPlayer)
        local vehicle = GetVehiclePedIsIn(GetPlayerPed(targetPlayer.__netId), false);

        if (not vehicle or vehicle == 0) then 
            return exports.vChat:outputChatBox(player.__netId, "A játékos nincs járműben.", "server", "server");
        end 
        
        SetEntityRotation(vehicle, 0.0, 0.0, 0.0, 0, false);
        outputToAdmins(getPlayerAdminName(player.__netId) .. " visszafordította " .. getPlayerName(targetPlayer.__netId) .. " járművét!", 1);
        exports.vChat:outputChatBox(player.__netId, "Admin " .. getPlayerAdminName(player.__netId) .." visszafordította a járműved.", "server", "server");
        -- exports.vChat:outputChatBox(player.__netId, "Visszafordítottad " .. getPlayerName(targetPlayer.__netId) .." járművét.", "server", "server");
    end
);

Command(
    "unflip2", 
    { description = "Jarmu visszafordítása.", required = { admin = 1, off_admin = 1 }, args = { { type = "vehicle" } } }, 
    function(player, vehicle)
        SetEntityRotation(vehicle, 0.0, 0.0, 0.0, 0, false);
        outputToAdmins(getPlayerAdminName(player.__netId) .. " visszafordította " .. getVehiclePlate(vehicle) .. " rendszámú járművet!", 1);
        -- exports.vChat:outputChatBox(player.__netId, "Visszafordítottad " .. getVehiclePlate(vehicle) .." rendszámú járművet.", "server", "server");
    end
);

Command(
    "tempcar", 
    {
        description = "ideiglenes jármű lehívása.", 
        required = { admin = 5, off_admin = 5 }, 
        args = { 
            { type = "string", name = "Model", description = "A jármű modelje / \"lehívója\"" }
        } 
    }, 
    function(player, vehicleModel)
        TriggerClientEvent('esx:spawnVehicle', player.__netId, vehicleModel);
    end
);

Command(
    "delveh", 
    {
        description = "Közeli járművek törlése.", 
        required = { admin = 2, off_admin = 2 }, 
        args = { 
            { type = "number", name = "Távolság", optional = true, default = 5, min = 3, max = 25 }
        },
    }, 
    function(player, radius)
        outputToAdmins(getPlayerAdminName(player.__netId) .. " törölve a körülötte lévő járműveket " .. radius .. " unit távolságban.", 1);
        TriggerClientEvent('esx:deleteVehicle', player.__netId, radius);
    end
);