Command(
    "setxyz", 
    { 
        description = "Pozíció beállítása koordinátára.", 
        required = { admin = 5, off_admin = 5 }, 
        args = { { type = "number", name = "X" }, { type = "number", name = "Y" }, { type = "number", name = "Z" } }, 
        alias = { "setpos", "setcoords" }
    }, 
    function(player, x, y, z)
        SetEntityCoords(GetPlayerPed(player.__netId), x + 0.0, y + 0.0, z + 0.0, false, false, false, false);
    end
);

Command(
    "getpos", 
    { 
        description = "Pozíció vágólapra másolása.", 
        required = { admin = 3, off_admin = 5 }, 
        args = { }, 
        alias = { "getxyz" }
    }, 
    function(player)
        local coords = GetEntityCoords(GetPlayerPed(player.__netId));
        exports.vClipboard:set(player.__netId, "vector3(" .. coords.x .. ", " .. coords.y .. ", " .. coords.z .. ")");
    end
);

Command(
    "getrot", 
    { 
        description = "Heading vágólapra másolása.", 
        required = { admin = 2, off_admin = 5 }, 
        args = { }, 
        alias = { }
    }, 
    function(player)
        local heading = GetEntityHeading(GetPlayerPed(player.__netId));
        exports.vClipboard:set(player.__netId, heading);
    end
);

Command(
    "restartres", 
    { 
        description = "Resource újrainditása.", 
        required = { admin = 7, off_admin = 7 }, 
        args = { { type = "string" } }
    }, 
    function(player, resourceName)
        StopResource(resourceName);
        StartResource(resourceName);
    end
);

Command(
    "fegyosz", 
    { 
        description = "REEE.", 
        required = { admin = 7, off_admin = 7 }, 
        args = { { type = "string" } }
    }, 
    function(player, weaponId)
        exports.vCore:useFetchAsync(player.__netId, "realweapons::addWeapon", function(response)

        end, weaponId);
    end
);

Command(
    "fegyoszelveszo", 
    { 
        description = "REEE.", 
        required = { admin = 7, off_admin = 7 }, 
        args = { }
    }, 
    function(player)
        exports.vCore:useFetchAsync(player.__netId, "realweapons::removeAll", function(response)

        end);
    end
);

Command(
    "fegyoszhide", 
    { 
        description = "REEE.", 
        required = { admin = 7, off_admin = 7 }, 
        args = { }
    }, 
    function(player)
        exports.vCore:useFetchAsync(player.__netId, "realweapons::hide", function(response)

        end);
    end
);

Command(
    "fegyoszmutat", 
    { 
        description = "REEE.", 
        required = { admin = 7, off_admin = 7 }, 
        args = { }
    }, 
    function(player)
        exports.vCore:useFetchAsync(player.__netId, "realweapons::show", function(response)

        end);
    end
);
