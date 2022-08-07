Command(
    "gethere", 
    { description = "Játékos hozzádteleportálása.", required = { admin = 1, off_admin = 5 }, args = { { type = "player" } }, alias = { "bring" } }, 
    function(player, targetPlayer)
        targetPlayer.setPosition(player.getPosition());
        targetPlayer.setDimension(player.getDimension());

        -- exports.vChat:outputChatBox(player.__netId, "Magadhoz teleportáltad " .. getPlayerName(targetPlayer.__netId) .." játékost.", "info", "info");
        outputToAdmins(getPlayerAdminName(player.__netId) .. " magához teleportálta " .. getPlayerName(targetPlayer.__netId) .. " játékost.", 1);
        exports.vChat:outputChatBox(targetPlayer.__netId, "Admin " .. getPlayerAdminName(player.__netId) .." magához teleportált.", "info", "info");
    end
);

Command(
    "goto", 
    { description = "Játékoshoz teleportálás.", required = { admin = 1, off_admin = 5 }, args = { { type = "player" } } }, 
    function(player, targetPlayer)
        player.setPosition(targetPlayer.getPosition());
        player.setDimension(targetPlayer.getDimension());

        outputToAdmins(getPlayerAdminName(player.__netId) .. " hozzáteleportált " .. getPlayerName(targetPlayer.__netId) .. " játékoshoz.", 1);
        exports.vChat:outputChatBox(targetPlayer.__netId, "Admin " .. getPlayerAdminName(player.__netId) .." hozzád teleportált.", "info", "info");
        -- exports.vChat:outputChatBox(player.__netId, "Hozzáteleportáltál " .. getPlayerName(targetPlayer.__netId) .." játékoshoz.", "info", "info");
    end
);

Command(
    "sgoto", 
    { description = "Játékoshoz teleportálás a játékos értesítése nélkül.", required = { admin = 5, off_admin = 5 }, args = { { type = "player" } } }, 
    function(player, targetPlayer)
        local coords = GetEntityCoords(GetPlayerPed(targetPlayer.__netId));
        SetEntityCoords(GetPlayerPed(player.__netId), coords.x, coords.y + 8, coords.z, false, false, false, false);

        outputToAdmins(getPlayerAdminName(player.__netId) .. " hozzáteleportált " .. getPlayerName(targetPlayer.__netId) .. " játékoshoz titokban.", 5);
        -- exports.vChat:outputChatBox(targetPlayer, "Admin " .. getPlayerAdminName(player) .." hozzád teleportált.", "info", "info");
    end
);

Command(
    "freeze", 
    { description = "Játékos lefagyasztása.", required = { admin = 2, off_admin = 5 }, args = { { type = "player" } } }, 
    function(player, targetPlayer)
        TriggerClientEvent('esx:freezePlayer', targetPlayer.__netId, "freeze");

        outputToAdmins(getPlayerAdminName(player.__netId) .. " lefagyasztotta " .. getPlayerName(targetPlayer.__netId) .. " játékost.", 5);
        exports.vChat:outputChatBox(targetPlayer.__netId, "Admin " .. getPlayerAdminName(player.__netId) .." lefagyasztott.", "info", "info");
        -- exports.vChat:outputChatBox(player.__netId, "Lefagyasztottad " .. getPlayerName(targetPlayer.__netId) .." játékost.", "info", "info");
    end
);

Command(
    "unfreeze", 
    { description = "Játékos kiolvasztása.", required = { admin = 2, off_admin = 5 }, args = { { type = "player" } } }, 
    function(player, targetPlayer)
        TriggerClientEvent('esx:freezePlayer', targetPlayer.__netId, "unfreeze");

        outputToAdmins(getPlayerAdminName(player.__netId) .. " kiolvasztotta " .. getPlayerName(targetPlayer.__netId) .. " játékost.", 5);
        exports.vChat:outputChatBox(targetPlayer.__netId, "Admin " .. getPlayerAdminName(player.__netId) .." kiolvasztott.", "info", "info");
        -- exports.vChat:outputChatBox(player.__netId, "Kiolvasztottad " .. getPlayerName(targetPlayer.__netId) .." játékost.", "info", "info");
    end
);

Command(
    "freezenearby", 
    { description = "Közeli játékosok lefagyasztása.", required = { admin = 3, off_admin = 5 }, args = { { type = "number", name = "Távolság", min = 5, max = 25, optional = true, default = 15 } } }, 
    function(admin, distance)
        local adminCoords = GetEntityCoords(GetPlayerPed(admin));

        local freezedPlayers = 0;
        for _, playerId in ipairs(GetPlayers()) do 
            playerId = tonumber(playerId); -- anyad fivem

            if (
                playerId ~= admin.__netId and 
                #(adminCoords - GetEntityCoords(GetPlayerPed(playerId))) <= distance
            ) then 
                TriggerClientEvent('esx:freezePlayer', playerId, "freeze");

                outputToAdmins(getPlayerAdminName(admin.__netId) .. " lefagyasztotta " .. getPlayerName(playerId) .. " játékost.", 5);
                exports.vChat:outputChatBox(playerId, "Admin " .. getPlayerAdminName(admin.__netId) .." lefagyasztott.", "info", "info");
                -- exports.vChat:outputChatBox(admin.__netId, "Lefagyasztottad " .. getPlayerName(targetPlayer.__netId) .." játékost.", "info", "info");

                freezedPlayers = freezedPlayers + 1;
            end
        end 

        if (freezedPlayers == 0) then 
            exports.vChat:outputChatBox(admin, "Nincs senki a közeledben akit ki tudtál volna fagyasztani.", "error", "error");
        end
    end
);

Command(
    "unfreezenearby", 
    { description = "Közeli játékosok kiolvasztása.", required = { admin = 3, off_admin = 5 }, args = { { type = "number", name = "Távolság", min = 5, max = 25, optional = true, default = 15 } } }, 
    function(admin, distance)
        local adminCoords = GetEntityCoords(GetPlayerPed(admin));

        local freezedPlayers = 0;
        for _, playerId in ipairs(GetPlayers()) do 
            playerId = tonumber(playerId); -- anyad fivem
            
            if (
                playerId ~= admin.__netId and 
                #(adminCoords - GetEntityCoords(GetPlayerPed(playerId))) <= distance
            ) then 
                TriggerClientEvent('esx:freezePlayer', playerId, "unfreeze");

                outputToAdmins(getPlayerAdminName(admin.__netId) .. " kiolvasztotta " .. getPlayerName(playerId) .. " játékost.", 5);
                exports.vChat:outputChatBox(playerId, "Admin " .. getPlayerAdminName(admin.__netId) .." kiolvasztott.", "info", "info");
                -- exports.vChat:outputChatBox(admin.__netId, "Kiolvasztottad " .. getPlayerName(targetPlayer.__netId) .." játékost.", "info", "info");

                freezedPlayers = freezedPlayers + 1;
            end
        end 

        if (freezedPlayers == 0) then 
            exports.vChat:outputChatBox(admin, "Nincs senki a közeledben akit ki tudtál volna fagyasztani.", "error", "error");
        end 
    end
);

Command(
    "kill", 
    { description = "Játékos megölése annak értesítése nélkül.", required = { admin = 2, off_admin = 5 }, args = { { type = "player" } } }, 
    function(player, targetPlayer)
        -- exports.vChat:outputChatBox(player.__netId, "Megölted sunyiba " .. getPlayerName(targetPlayer.__netId) .." játékost.", "info", "info");
        outputToAdmins(getPlayerAdminName(player.__netId) .. " megölte " .. getPlayerName(targetPlayer.__netId) .. " játékost sunyibae.", 5);
        TriggerClientEvent("esx:killPlayer", targetPlayer.__netId);
    end
);

Command(
    "setdim", 
    { description = "Játékos dimenziójának beállítása.", required = { admin = 3, off_admin = 5 }, args = { { type = "player" }, { type = "number", min = 0, max = 65535 } } }, 
    function(player, targetPlayer, dimension)
        local vehicle = GetVehiclePedIsIn(GetPlayerPed(targetPlayer.__netId), false);
        if (vehicle and vehicle ~= 0) then 
            TaskLeaveVehicle(GetPlayerPed(targetPlayer.__netId), vehicle, 16);
        end 

        targetPlayer.setDimension(dimension);
    end
);

Command(
    "revive", 
    {
        description = "Játékos felkaparása.",
        required = { admin = 1, off_admin = 5 },
        args = { { type = "player" } }, 
        alias = { "asegit", "felkapar" },
    }, 
    function(player, targetPlayer)
        TriggerClientEvent('esx_ambulancejob:revive', targetPlayer.__netId);
        outputToAdmins(getPlayerAdminName(player.__netId) .. " felkaparta " .. getPlayerName(targetPlayer.__netId) .. " játékost.", 1);
        exports.vChat:outputChatBox(targetPlayer.__netId, "Admin " .. getPlayerAdminName(player.__netId) .." felkapart.", "info", "info");
    end
);

Command(
    "heal", 
    {
        description = "Játékos meggyógyítása.",
        required = { admin = 1, off_admin = 5 },
        args = { { type = "player" } }, 
    }, 
    function(player, targetPlayer)
        TriggerClientEvent('esx_basicneeds:healPlayer', targetPlayer.__netId)
        outputToAdmins(getPlayerAdminName(player.__netId) .. " meggyógyította " .. getPlayerName(targetPlayer.__netId) .. " játékost.", 1);
        exports.vChat:outputChatBox(targetPlayer.__netId, "Admin " .. getPlayerAdminName(player.__netId) .." meggyógyított.", "info", "info");
        -- exports.vChat:outputChatBox(player.__netId, "Meggyógyítottad " .. getPlayerName(targetPlayer.__netId) .." játékost.", "info", "info");
    end
);

Command(
    "setarmor", 
    {
        description = "Játékos armorjának beállítása.",
        required = { admin = 2, off_admin = 5 },
        args = { { type = "player" }, { type = 'number', name = "Mennyiség", min = 0, max = 100 } }, 
    }, 
    function(player, targetPlayer, amount)
        SetPedArmour(GetPlayerPed(targetPlayer.__netId), amount);
        outputToAdmins(getPlayerAdminName(player.__netId) .. " beállította " .. getPlayerName(targetPlayer.__netId) .. " armorszintjét erre: " .. amount .. "%", 1);
        exports.vChat:outputChatBox(targetPlayer.__netId, "Admin " .. getPlayerAdminName(player.__netId) .." beállította az armorszinted erre: " .. amount .. "%", "info", "info");
    end
);

local __ActiveSpectates = {};
Command(
    "spectate", 
    {
        description = "Játékos spectatelése.",
        required = { admin = 1, off_admin = 1 },
        args = { { type = "player" } }, 
        alias = { "recon" }
    }, 
    function(player, targetPlayer)
        if (not __ActiveSpectates[player.__netId]) then 
            if (player.__netId == targetPlayer.__netId) then 
                return exports.vChat:outputChatBox(player.__netId, "Miert akarnad magadat nezni huje v?!?!?hmhhmhm?!?", "error", "error");
            end 

            __ActiveSpectates[player.__netId] = true;
            
            outputToAdmins(getPlayerAdminName(player.__netId) .. " elkezdte reconolni " .. getPlayerName(targetPlayer.__netId) .. " játékost.", 1);
            TriggerClientEvent("vAdmin::spectate", player.__netId, GetEntityCoords(GetPlayerPed(targetPlayer.__netId)), targetPlayer.__netId);
        else 
            outputToAdmins(getPlayerAdminName(player.__netId) .. " kilépett reconból.", 1);
            TriggerClientEvent("vAdmin::spectate", player.__netId, vector3(0.0, 0.0, 0.0), -1);
            __ActiveSpectates[player.__netId] = false;
        end 
    end
);

Command(
    "setjob", 
    { 
        description = "Játékos munkájának/frakciójának.", 
        required = { admin = 5, off_admin = 5 }, 
        args = {
            { type = "player" },
            { type = "string" }, 
            { type = "number", min = 0, optional = true, default = 1 }
        }, 
        alias = { "setmunka" }
    }, 
    function(player, targetPlayer, jobId, gradeId)
        if (not ESX.DoesJobExist(jobId, gradeId)) then
            return exports.vChat:outputChatBox(player.__netId, "A megadott jobId vagy gradeId érvénytelen.", "error", "error");
        end

        local xPlayer = ESX.GetPlayerFromId(targetPlayer.__netId);

        if (not xPlayer) then 
            return exports.vChat:outputChatBox(player.__netId, "A megadott játékos még nem töltött be teljesen.", "error", "error");
        end 

        -- exports.vChat:outputChatBox(player.__netId, "Beállítottad " .. getPlayerName(targetPlayer.__netId) .." munkáját a következőre: " .. jobId .. " (" .. gradeId .. ")", "info", "info");
        outputToAdmins(getPlayerAdminName(player.__netId) .. " beállította " .. getPlayerName(targetPlayer.__netId) .. " munkáját/frakcióját a következőre: " .. jobId .. "(" .. gradeId .. ")", 1);
        exports.vChat:outputChatBox(targetPlayer.__netId, "Admin " .. getPlayerAdminName(player.__netId) .." beállított a következő munkába/frakcióba: " .. jobId .. " (" .. gradeId .. ")", "info", "info");
        xPlayer.setJob(jobId, gradeId);
    end
);

Command(
    "setaccountmoney", 
    { 
        description = "Játékos számlájának egyenlegének megváltoztatása.", 
        required = { admin = 6, off_admin = 6 }, 
        args = {
            { type = "player" },
            { type = "string", name = "Típus", values = { "money", "bank", "black_money" } }, 
            { type = "number", name = "Érték", min = 0 }
        }, 
        alias = { "setamoney" }
    }, 
    function(player, targetPlayer, account, amount)
        local xPlayer = ESX.GetPlayerFromId(targetPlayer.__netId);

        if (not xPlayer) then 
            return exports.vChat:outputChatBox(player.__netId, "A megadott játékos még nem töltött be teljesen.", "error", "error");
        end 

        if (not xPlayer.getAccount(account)) then
            return exports.vChat:outputChatBox(player.__netId, "A megadott játékosnak nincs \"" .. account .. "\" számlája.", "error", "error");
        end

        -- exports.vChat:outputChatBox(player.__netId, "Beállítottad " .. getPlayerName(targetPlayer.__netId) .." " .. account .. " összegét a következőre: " .. amount .. "", "info", "info");
        outputToAdmins(getPlayerAdminName(player.__netId) .. " beállította " .. getPlayerName(targetPlayer.__netId) .. " " .. account .. " összegét a következőre: " .. amount, 5);
        exports.vChat:outputChatBox(targetPlayer.__netId, "Admin " .. getPlayerAdminName(player.__netId) .." beállította a(z) " .. account .. " nevű számlád egyenlegét a következőre: " .. amount .. "", "info", "info");
        xPlayer.setAccountMoney(account, amount);
    end
);

Command(
    "setname", 
    {
        description = "Játékos nevének beállítása.",
        required = { admin = 3, off_admin = 3 },
        args = { { type = "player" }, { type = "string", name = "Karakter név", description = "Szóközök helyett használj alulvonást/underscoret!!!!!" } },
        alias = { "changename" }
    }, 
    function(admin, targetPlayer, name)
        local splitted = string.split(name, "_");
        local firstName = splitted[1];
        table.remove(splitted, 1);
        local lastName = table.concat(splitted, " ");

        local result = MySQL.query.await("SELECT COUNT(*) as count FROM `users` WHERE firstname = ? AND lastname = ?", { firstName, lastName });
        if (result and result[1] and result[1].count > 0) then 
            return exports.vChat:outputChatBox(admin.__netId, "A megadott karakternév foglalt!", "error", "error");
        end 

        local identifier = GetPlayerIdentifiers(targetPlayer.__netId);
        if (not identifier or not identifier.license) then 
            return exports.vChat:outputChatBox(admin.__netId, "lol nincs a játékosnak license-exd", "error", "error");
        end 

        local xPlayer = ESX.GetPlayerFromId(targetPlayer.__netId);
        if (xPlayer) then
            outputToAdmins(getPlayerAdminName(admin.__netId) .. " megváltoztatta " .. getPlayerName(targetPlayer.__netId) .. " nevét a következőre: " .. (firstName .. " " .. lastName), 1);
            DropPlayer(targetPlayer.__netId, "Névváltáshoz szükséges az újracsatlakozás, ezért kirúgásra kerültél!");
            MySQL.execute.await("UPDATE `users` SET firstname = ?, lastname = ? WHERE identifier = ?", { firstName, lastName, identifier.license });
        else 
            exports.vChat:outputChatBox(admin.__netId, "Emberunknek nincs xplayere igy nem sikerult..", "error", "error");
        end 
    end
);

Command(
    "giveaccountmoney", 
    { 
        description = "Játékos számlájához egyenleghozzáadás.", 
        required = { admin = 6, off_admin = 6 }, 
        args = {
            { type = "player" },
            { type = "string", name = "Típus", values = { "money", "bank", "black_money" } }, 
            { type = "number", name = "Érték", min = 0 }
        }, 
        alias = { "giveamoney" }
    }, 
    function(player, targetPlayer, account, amount)
        local xPlayer = ESX.GetPlayerFromId(targetPlayer.__netId);

        if (not xPlayer) then 
            return exports.vChat:outputChatBox(player.__netId, "A megadott játékos még nem töltött be teljesen.", "error", "error");
        end 

        if (not xPlayer.getAccount(account)) then
            return exports.vChat:outputChatBox(player.__netId, "A megadott játékosnak nincs \"" .. account .. "\" számlája.", "error", "error");
        end

        -- exports.vChat:outputChatBox(player.__netId, "Hozzáadtál " .. getPlayerName(targetPlayer.__netId) .." " .. account .. " számlájának egyenlegéhez ennyit: " .. amount .. "", "info", "info");
        outputToAdmins(getPlayerAdminName(player.__netId) .. " hozzáadott " .. getPlayerName(targetPlayer.__netId) .. " " .. account .. " számlájának egyenlegéhez ennyit: " .. amount, 5);
        exports.vChat:outputChatBox(targetPlayer.__netId, "Admin " .. getPlayerAdminName(player.__netId) .." hozzáadott a(z) " .. account .. " nevű számlád egyenlegéhez ennyit: " .. amount .. "", "info", "info");
        xPlayer.addAccountMoney(account, amount);
    end
);

local __BanLimits = {
    [2] = { permanent = false, limit = 24 * 3 }, 
    [3] = { permanent = false, limit = 24 * 30 }, 
    [4] = { permanent = false, limit = 24 * 30 * 6 }, 
    [5] = { permanent = false, limit = 24 * 30 * 6 }, 
    [6] = { permanent = true, limit = -1 }, 
    [7] = { permanent = true, limit = -1 }, 
    [8] = { permanent = true, limit = -1 }, 
};

local __BanInterval = 20; -- sec
local __BanCooldowns = {};
local __BanCountLimits = {
    [1] = 0, 
    [2] = 3, 
    [3] = 5
};

local function __hasPermissionToTimePeriod(player, time)
    local level = getPlayerAdminLevel(player.__netId);

    return (
        __BanLimits[level] and
        (
            (time == -1 and __BanLimits[level].permanent) or 
            (time > 0 and (__BanLimits[level].limit == -1 or __BanLimits[level].limit >= time))
        )
    );
end 

local function __checkAdminIsRetardedToBan(player)
    if (not __BanCooldowns[player.__netId]) then 
        __BanCooldowns[player.__netId] = {
            os.time()
        };

        return false;
    end 

    local limit = __BanCountLimits[getPlayerAdminLevel(player.__netId)];
    if (not limit) then 
        return false;
    end 

    table.insert(__BanCooldowns[player.__netId], os.time());

    local banCounts = table.filter(__BanCooldowns[player.__netId], function(x)
        return (x + __BanInterval > os.time());
    end);

    return (limit < #banCounts);
end 

Command(
    "ban", 
    { 
        description = "Játékos kitiltása egy adott időtartamra.", 
        required = { admin = 2, off_admin = 2 }, 
        args = {
            { type = "player" },
            { type = "number", name = "Időtartam (órában, -1 az örökhöz szuperadmin és afölött)", min = -1 }, 
            { type = "text", name = "Indok" }
        }, 
        alias = { "pban" }
    }, 
    function(player, targetPlayer, time, reason)
        if (player.__netId == targetPlayer.__netId) then 
            return exports.vChat:outputChatBox(player.__netId, "Csatlakozz le, és pihend ki magadat!", "error", "error");
        end 

        time = math.ceil(time);

        if (getPlayerAdminLevel(player.__netId) < getPlayerAdminLevel(targetPlayer.__netId)) then 
            exports.vChat:outputChatBox(targetPlayer.__netId, getPlayerName(player.__netId) .. " ki akart tiltani!", "error", "error");
            exports.vChat:outputChatBox(player.__netId, "Miért akarnál kitiltani valakit akinek nagyobb a rangja mint neked hmmhhmhmh??!?!?!.", "error", "error");

            return;
        end 

        if (not __hasPermissionToTimePeriod(player, time)) then 
            return exports.vChat:outputChatBox(player.__netId, "A rangod nem tud több ideig bannolni mint " .. __BanLimits[getPlayerAdminLevel(player)].limit .. " óra!", "error", "error");
        end

        if (time == 0) then 
            return exports.vChat:outputChatBox(player.__netId, "Adj már meg rendes számot, ne nullát..", "error", "error");
        end

        if (__checkAdminIsRetardedToBan(player)) then 
            local admin = getPlayerAdmin(player.__netId);
            
            outputToAdmins(admin.name .. " (" .. AdminTitles[admin.level] .. ")-ról/-ről levételre került az admin a túl sok kitiltás-próbálkozás miatt.", 1);
            removePlayerAdmin(player.__netId);

            return;
        end 

        local formattedTime;
        if (time == -1) then 
            formattedTime = 'örökre';
        else 
            local totalTime = ( ( os.time() + time * 60 * 60 ) - os.time() ) / 60 / 60;
            formattedTime = ((totalTime > 24) and (math.floor(totalTime / 24) .. " napra") or (math.floor(totalTime) .. " órára"))
        end 

        local targetPlayerName = getPlayerName(targetPlayer.__netId);

        exports.vBans:banPlayerById(
            targetPlayer.__netId, 
            time, 
            reason, 
            getPlayerAdminName(player.__netId), 
            function(...)
                -- exports.vLogs:addAdminLog("admin_bans", );

                for _, playerId in ipairs(GetPlayers()) do 
                    exports.vChat:outputChatBox(
                        tonumber(playerId), 
                        getPlayerAdminName(player.__netId) .. " kitiltotta " .. targetPlayerName .. " játékost " .. formattedTime .." a következő indokkal: " .. reason, 
                        "error", "f05e"
                    );
                end 
            end
        );
    end
);

Command(
    "unban", 
    { 
        description = "Kitiltás levétele azonosító alapján.", 
        required = { admin = 5, off_admin = 5 }, 
        args = {
            { type = "number", name = "Azonosító" }
        }
    }, 
    function(player, banId)
        local removed = exports.vBans:removeBanById(banId);

        if (removed) then 
            exports.vChat:outputChatBox(player.__netId, "Sikeresen lekaptad a " .. banId .. " id-jű bant.", "server", "admin");
        else 
            exports.vChat:outputChatBox(player.__netId, "Sikertelen kitiltás levétel! A megadott ban nem létezik vagy már lejárt! (Ha mégse akkor szólj szkiddajnak azt megoldjaxd)", "error", "error");
        end 
    end
);

local __BanInfoText = [[
    ID: %s | 
    Admin: %s | 
    Indok: %s | 
    Státusz: %s | 
    Kitiltás időpontja: %s | 
    Kitiltás lejár: %s
]];
Command(
    "baninfo", 
    { 
        description = "Kitiltás adatok azonosító alapján.", 
        required = { admin = 2, off_admin = 5 }, 
        args = {
            { type = "number", name = "Azonosító" }
        }
    }, 
    function(player, banId)
        local result = MySQL.query.await([[
            SELECT 
                id, admin, reason, state, 
                DATE_FORMAT(ban_date, '%Y/%m/%d %T') as ban_date, 
                DATE_FORMAT(expire_date, '%Y/%m/%d %T') as expire_date
            FROM
                `bans`
            WHERE 
                id = ?
        ]], { banId });

        if (not result or not result[1]) then 
            exports.vChat:outputChatBox(player.__netId, "Nem találtam a kitiltást.", "error", "error");
        end 

        local ban = result[1];
        exports.vChat:outputChatBox(
            player.__netId,
            string.format(
                __BanInfoText, 

                ban.id, 
                ban.admin, 
                ban.reason, 
                ban.state, 
                ban.ban_date, 
                ban.expire_date
            ), 
            "info", "info"
        );
    end
);

Command(
    "setalevel", 
    {
        description = "Játékos adminszintjének beállítása.",
        required = { admin = 6, off_admin = 6 },
        args = { { type = "player" }, { type = "number", name = "Adminszint" } },
        alias = { "makeadmin", "setadminlevel" }
    }, 
    function(player, targetPlayer, level)
        if (not AdminLevels[level]) then 
            return exports.vChat:outputChatBox(player.__netId, "A megadott adminszint nem létezik.", "error", "error");
        end 
        
        local identifier = (GetPlayerIdentifiers(targetPlayer.__netId) or {})[MainIdentifier];
        if (not identifier) then 
            return exports.vChat:outputChatBox(player.__netId, "Nem találtam az embi licensét lol.", "error", "error");
        end

        if (getPlayerAdminLevel(targetPlayer.__netId) == level) then 
            return exports.vChat:outputChatBox(player.__netId, "Emberünk már ugyan ezen a rangon van..", "error", "error");
        end 

        local currLevel = getPlayerAdminLevel(player.__netId);
        if (level ~= 0) then 
            local newAdmin = {
                level = level, 
                name = getPlayerAdminName(targetPlayer.__netId)
            };

            MySQL.update('UPDATE users SET admin = ? WHERE identifier = ?', {json.encode(newAdmin), identifier}, function(affectedRows)
                outputToAdmins(getPlayerAdminName(player.__netId) .. " megváltoztatta " .. getPlayerName(targetPlayer.__netId) .. " admin szintjét a következőre: " .. AdminTitles[level], 2);
                setupPlayerAsAdmin(targetPlayer.__netId, level, (getPlayerAdminName(targetPlayer.__netId) or "Ismeretlen admin"));
            end);
        else 
            MySQL.update('UPDATE users SET admin = ? WHERE identifier = ?', {json.encode({ level = 0, name = "Ismeretlen admin" }), identifier}, function(affectedRows)
                outputToAdmins(getPlayerAdminName(player.__netId) .. " megváltoztatta " .. getPlayerName(targetPlayer.__netId) .. " admin szintjét a következőre: " .. AdminTitles[level], 2);
                removePlayerAdmin(targetPlayer.__netId);
            end);

        end 
    end
);

Command(
    "setaname", 
    {
        description = "Játékos admin nevének beállítása.",
        required = { admin = 5, off_admin = 5 },
        args = { { type = "player" }, { type = "string", name = "Admin név" } },
        alias = { "setanick" }
    }, 
    function(player, targetPlayer, name)
        local identifier = (GetPlayerIdentifiers(targetPlayer.__netId) or {})[MainIdentifier];
        if (not identifier) then 
            return exports.vChat:outputChatBox(player.__netId, "Nem találtam az embi licensét lol.", "error", "error");
        end
        
        if (not Admins[identifier]) then 
            return exports.vChat:outputChatBox(player.__netId, "Emberünk még nem admin! Először adj neki admin szintet /makeadmin parancs használatával!", "error", "error");
        end 

        local newAdmin = {
            level = Admins[identifier].level, 
            name = name
        };

        MySQL.update('UPDATE users SET admin = ? WHERE identifier = ?', {json.encode(newAdmin), identifier}, function(affectedRows)
            outputToAdmins(getPlayerAdminName(player.__netId) .. " megváltoztatta " .. getPlayerAdminName(targetPlayer.__netId) .. " admin nevét a következőre: " .. name, 2);
            Admins[identifier].name = name;
        end);
    end
);

local __KickInterval = 20; -- sec
local __KickCooldowns = {};
local __KickLimits = {
    [1] = 0, 
    [2] = 3, 
    [3] = 5
};

local function __checkAdminIsRetardedToKick(player)
    if (not __KickCooldowns[player.__netId]) then 
        __KickCooldowns[player.__netId] = {
            os.time()
        };

        return false;
    end 

    local limit = __KickLimits[getPlayerAdminLevel(player.__netId)];
    if (not limit) then 
        return false;
    end 

    table.insert(__KickCooldowns[player.__netId], os.time());

    local kicksCount = table.filter(__KickCooldowns[player.__netId], function(x)
        return (x + __KickInterval > os.time());
    end);

    return (limit < #kicksCount);
end 

Command(
    "kick", 
    { description = "Játékos kirúgása a szerverről.", required = { admin = 1, off_admin = 2 }, args = { { type = "player" }, { type = "text", name = "Indok" } } }, 
    function(player, targetPlayer, reason)
        if (getPlayerAdminLevel(player.__netId) < getPlayerAdminLevel(targetPlayer.__netId)) then 
            exports.vChat:outputChatBox(targetPlayer.__netId, getPlayerName(player.__netId) .. " ki akart kickelni!", "error", "error");
            exports.vChat:outputChatBox(player.__netId, "Miért akarnál kikickelni valakit akinek nagyobb a rangja mint neked hmmhhmhmh??!?!?!.", "error", "error");

            return;
        end 

        if (__checkAdminIsRetardedToKick(player)) then 
            local admin = getPlayerAdmin(player.__netId);
            
            outputToAdmins(admin.name .. " (" .. AdminTitles[admin.level] .. ")-ról/-ről levételre került az admin a túl sok kickelés miatt.", 1);
            removePlayerAdmin(player.__netId);

            return;
        end 

        for _, playerId in ipairs(GetPlayers()) do 
            exports.vChat:outputChatBox(tonumber(playerId), getPlayerAdminName(player.__netId) .. " kirúgta " .. getPlayerName(targetPlayer.__netId) .." játékost a következő indokkal: " .. reason, "#dbbb39", "f506");
        end 

        DropPlayer(targetPlayer.__netId, getPlayerAdminName(player.__netId) .. " kirúgott a következő indokkal: " .. reason);
    end
);

local __AJInterval = 20; -- sec
local __AJCooldowns = {};
local __AJLimits = {
    [1] = 0, 
    [2] = 3, 
    [3] = 5
};

local function __checkAdminIsRetardedToAdminJail(player)
    if (not __AJCooldowns[player.__netId]) then 
        __AJCooldowns[player.__netId] = {
            os.time()
        };

        return false;
    end 

    local limit = __AJLimits[getPlayerAdminLevel(player.__netId)];
    if (not limit) then 
        return false;
    end 

    table.insert(__AJCooldowns[player.__netId], os.time());

    local kicksCount = table.filter(__AJCooldowns[player.__netId], function(x)
        return (x + __AJInterval > os.time());
    end);

    return (limit < #kicksCount);
end 

Command(
    "ajail", 
    {
        description = "Játékos adminjailbe rakása.",
        required = { admin = 2, off_admin = 5 },
        args = {
            { type = "player" },
            { type = "number", name = "Perc" },
            { type = "string", name = "Típus", values = { "sima", "kerdezos" } },
            { type = "text", name = "Indok" }
        }, 
        alias = { "adminjail" },
    }, 
    function(player, targetPlayer, minutes, jailType, reason)
        local identifier = (GetPlayerIdentifiers(targetPlayer.__netId) or {})[MainIdentifier];
        if (not identifier) then 
            return exports.vChat:outputChatBox(player.__netId, "Nem találtam az embi licensét lol.", "error", "error");
        end

        local adminIdentifier = (GetPlayerIdentifiers(targetPlayer.__netId) or {})[MainIdentifier];
        if (not adminIdentifier) then 
            return exports.vChat:outputChatBox(player.__netId, "Nem találtam a licensed lol.", "error", "error");
        end

        if (getPlayerAdminLevel(player.__netId) < getPlayerAdminLevel(targetPlayer.__netId)) then 
            exports.vChat:outputChatBox(targetPlayer.__netId, getPlayerName(player.__netId) .. " adminjailbe akart rakni!", "error", "error");
            exports.vChat:outputChatBox(player.__netId, "Miért akarnál adminjailbe rakni valakit akinek nagyobb a rangja mint neked hmmhhmhmh??!?!?!.", "error", "error");
            return;
        end 

        if (__checkAdminIsRetardedToAdminJail(player)) then 
            local admin = getPlayerAdmin(player.__netId);
            
            outputToAdmins(admin.name .. " (" .. AdminTitles[admin.level] .. ")-ról/-ről levételre került az admin a túl sok adminjail miatt.", 1);
            removePlayerAdmin(player.__netId);

            return;
        end 

        local adminJail = {
            admin = {
                id = adminIdentifier, 
                name = getPlayerAdminName(player.__netId)
            }, 

            total = minutes, 
            left = minutes,

            jail_date = os.time(), 
            jail_type = jailType, 

            reason = reason
        };

        MySQL.update('UPDATE `users` SET `adminjail` = ? WHERE `identifier` = ?', { json.encode(adminJail), identifier }, function(affectedRows)            
            sendPlayerToJail(targetPlayer.__netId, minutes, jailType, adminIdentifier, getPlayerAdminName(player.__netId), reason);

            for _, playerId in ipairs(GetPlayers()) do 
                exports.vChat:outputChatBox(
                    tonumber(playerId), getPlayerAdminName(player.__netId) .. " adminjailbe rakta " .. getPlayerName(targetPlayer.__netId) .." játékost " .. minutes .. " percre a következő indokkal: " .. reason, 
                    "#cc6d1f", "f502"
                );
            end 
        end);
    end
);


Command(
    "ojail", 
    {
        description = "Offline játékos adminjailbe rakása.",
        required = { admin = 2, off_admin = 2 },
        args = {
            { type = "string", name = "Azonosító" },
            { type = "number", name = "Perc" },
            { type = "string", name = "Típus", values = { "sima", "kerdezos" } },
            { type = "text", name = "Indok" }
        }, 
        alias = { "offjail" }
    }, 
    function(player, identifier, minutes, jailType, reason)
        local adminIdentifier = (GetPlayerIdentifiers(player.__netId) or { })[MainIdentifier];
        if (not adminIdentifier) then 
            return exports.vChat:outputChatBox(player.__netId, "Nem találtam meg az ember licensét.", "error", "error");
        end
        
        local playerIdentifier, playerName;
        if (tonumber(identifier)) then 
            if (GetPlayerName(tonumber(identifier))) then 
                return exports.vChat:outputChatBox(player.__netId, "A játékos elérhető, használd az ajail parancsot, kösz.", "error", "error");
            end 
            
            playerIdentifier = exports.vBans:getCachedPlayerIdIdentifiers(tonumber(identifier));
            
            if (not playerIdentifier) then
                return exports.vChat:outputChatBox(player.__netId, "Nem találtam a játékost.", "error", "error");
            end 

            playerIdentifier = playerIdentifier.identifiers;
            
            local result = MySQL.query.await(
                "SELECT COUNT(*) as count, identifier, adminjail, firstname, lastname FROM `users` WHERE identifier = ? LIMIT 1", 
                { playerIdentifier.license }
            );
            
            if (not result or not result[1] or result[1].count < 1) then 
                return exports.vChat:outputChatBox(player.__netId, "Nem találtam a játékost az adatbázisban.", "error", "error");
            end 

            playerIdentifier = result[1].identifier;
            playerName = result[1].firstname .. " " .. result[1].lastname;
        else 
            local result = MySQL.query.await("SELECT COUNT(*) as count, identifier, adminjail, firstname, lastname FROM `users` WHERE identifier = ? OR steam_id = ? LIMIT 1", { identifier, identifier });
            
            if (not result or not result[1] or result[1].count < 1) then 
                return exports.vChat:outputChatBox(player.__netId, "Nem találtam a játékost.", "error", "error");
            end 

            local playerId = getPlayerFromAnyIdentifier("license:" .. result[1].identifier);
            if (playerId) then 
                return exports.vChat:outputChatBox(player.__netId, "Ez a játékos elérhető. " .. playerId .. " idvel.", "error", "error");
            end 

            playerIdentifier = result[1].identifier;
            playerName = result[1].firstname .. " " .. result[1].lastname;
        end 

        local adminJail = {
            admin = {
                id = adminIdentifier, 
                name = getPlayerAdminName(player.__netId)
            }, 

            total = minutes, 
            left = minutes,

            jail_date = os.time(), 
            jail_type = jailType, 

            reason = reason
        };
        
        MySQL.update('UPDATE `users` SET `adminjail` = ? WHERE `identifier` = ? LIMIT 1', { json.encode(adminJail), playerIdentifier }, function(...)
            for _, playerId in ipairs(GetPlayers()) do 
                exports.vChat:outputChatBox(
                    tonumber(playerId), getPlayerAdminName(player.__netId) .. " offline adminjailbe rakta " .. playerName .." játékost " .. minutes .. " percre a következő indokkal: " .. reason, 
                    "#cc6d1f", "f502"
                );
            end 
        end);
    end
);

AddEventHandler("playerDropped", function(reason)
    if (__ActiveSpectates[source]) then 
        __ActiveSpectates[source] = false;
    end 
end);