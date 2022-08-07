exports.vAdmin:addCommand(
    "gotointerior", 
    {
        required = { admin = 2, off_admin = 5 },
        args = {
            { type = "interior" }
        },
    },
    function(player, interior)
        local coords = interior.enter.position;
        exports.vCore:iprint(player, coords);
        SetEntityCoords(GetPlayerPed(player.__netId), coords.x, coords.y, coords.z, false, false, false, false);
    end 
);