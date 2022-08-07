
local dutyCooldowns = {};
Command(
    "aduty", 
    { description = "Adminszolgálatba be-ki lépés.", required = { admin = 1, off_admin = 1 }, args = { } }, 
    function(player)
        if (getPlayerAdminLevel(player.__netId) < 1) then 
            return exports.vChat:outputChatBox(player.__netId, "Oke tesom hogy sudoer vagy de ne akarj mar admindutyba allni rang nelkul..", "error", "error");
        end 

        if (dutyCooldowns[player.__netId] and dutyCooldowns[player.__netId] + 3 > os.time()) then 
            return exports.vChat:outputChatBox(player.__netId, "Várj már egy picit...", "error", "error");
        end 

        dutyCooldowns[player.__netId] = os.time();

        if (not isAdminInDuty(player.__netId)) then 
            setAdminDutyState(player.__netId, true);
            player.setInvincible(true);
            exports.vChat:outputChatBoxToAll(
                (getPlayerAdminName(player.__netId) or GetPlayerName(player.__netId)) .. " (" .. AdminTitles[getPlayerAdminLevel(player.__netId)] .. ") adminszolgálatba lépett.", 
                "info", "info"
            );
        else 
            setAdminDutyState(player.__netId, false);
            player.setInvincible(false);
            exports.vChat:outputChatBoxToAll(
                (getPlayerAdminName(player.__netId) or GetPlayerName(player.__netId)) .. " (" .. AdminTitles[getPlayerAdminLevel(player.__netId)] .. ") kilépett az adminszolgálatból.", 
                "info", "info"
            );
        end 
    end
);

local noclipAdmins = {};
Command(
    "fly", 
    { description = "Noclip be-ki kapcsolása.", required = { admin = 1, off_admin = 5 }, args = { }, alias = { "noclip" } }, 
    function(player)
        if (not noclipAdmins[player.__netId]) then 
            noclipAdmins[player.__netId] = true;
            TriggerClientEvent("vAdmin:toggle", player.__netId, true);
            player.setSharedMeta("invisible", true);
        else 
            noclipAdmins[player.__netId] = nil;
            TriggerClientEvent("vAdmin:toggle", player.__netId, false);
            player.setSharedMeta("invisible", false);
        end 
    end
);

Command(
    "a", 
    { description = "Adminchatbe üzenet küldés.", required = { admin = 1, off_admin = 1 }, args = { { type = "text" } } }, 
    function(player, text)
        print(player.__netId, text)
        if (text:gsub(" ", "") == "") then 
            return;
        end 

        for _, playerId in ipairs(GetPlayers()) do 
            playerId = tonumber(playerId); -- anyad fivem
            local adminLevel = getPlayerAdminLevel(playerId);

            if (type(adminLevel) == "number" and adminLevel > 1) then 
                exports.vChat:outputChatBox(playerId, "Adminchat | " .. getPlayerAdminName(player.__netId) .. ": " .. text, "#1f8fcc", "f086");
            end
        end 
    end
);

Command(
    "asay", 
    { description = "Adminfelhívás közzététele.", required = { admin = 2, off_admin = 2 }, args = { { type = "text" } } }, 
    function(player, text)
        if (text:gsub(" ", "") == "") then 
            return;
        end 

        for _, playerId in ipairs(GetPlayers()) do 
            playerId = tonumber(playerId); -- anyad fivem
            exports.vChat:outputChatBox(playerId, "Adminfelhívás | " .. getPlayerAdminTitle(player.__netId) .. " " .. getPlayerAdminName(player.__netId) .. ": " .. text, "#9c0909", "f0a1");
        end 
    end
);

Command(
    "clear", 
    { description = "Saját chat kiürítése.", required = { admin = 0, off_admin = 0 }, args = { }, alias = { "cls" } }, 
    function(player)
        exports.vChat:clearPlayerChat(player.__netId);

        SetTimeout(1000, function()
            exports.vChat:outputChatBox(player.__netId, "Sikeresen kiürítetted a chated.", "info", "info");
        end);
    end
);

 Command(
     "clearall", 
     { description = "Összes játékos chatének kiürítése.", required = { admin = 5, off_admin = 5 }, args = { }, alias = { "clsall" } }, 
     function(player)
         exports.vChat:clearPlayerChat(-1);

         SetTimeout(1000, function()
             for _, playerId in ipairs(GetPlayers()) do 
                 exports.vChat:outputChatBox(playerId, getPlayerAdminName(player.__netId) .. " Kiürítette mindenkinek a chatét.", "info", "info");
             end 
         end);
    end
);

Command(
    "tpm", 
    { 
        description = "Waypointra teleportálás.", 
        required = { admin = 2, off_admin = 5 }, 
        args = { }, 
        alias = { "gotowaypoint" }
    }, 
    function(player)
        TriggerClientEvent("esx:tpm", player.__netId);
    end
);

Command(
    "nearbyvehs", 
    { 
        required = { admin = 0, off_admin = 0 }, 
        args = { }
    }, 
    function(player)
        local playerCoords = player.getPosition();

        for _, vehicle in ipairs(GetAllVehicles()) do 
            local dist = #(playerCoords - GetEntityCoords(vehicle));

            if (dist < 30) then 
                exports.vChat:outputChatBox(
                    player.__netId, GetVehicleNumberPlateText(vehicle):gsub('[ \t]+%f[\r\n%z]', ''):gsub(" ", "-") .. " - " .. string.format("%g", string.format("%.1f", dist)) .. " unit", 
                    "info", "server"
                );
            end 
        end 
    end
);

-- Command(
--     "save", 
--     { description = "Játékos adatainak elmentése.", required = { admin = 5, off_admin = 5 }, args = { { type = "player" } } }, 
--     function(player)
--         TriggerClientEvent('chat:clear', -1);
--     end
-- );

-- Command(
--     "saveall", 
--     { description = "Játékos adatainak elmentése.", required = { admin = 5, off_admin = 5 }, args = { { type = "player" } } }, 
--     function(player)
--         TriggerClientEvent('chat:clear', -1);
--     end
-- );

Command(
    "reportlist", 
    { 
        description = "Reportlist megnyitása.", 
        required = { admin = 1, off_admin = 5 }, 
        args = { }, 
        alias = { "reports" }
    }, 
    function(player)
        TriggerClientEvent("report::openFeedbackMenu", player.__netId);
    end
);

Command(
    "report", 
    { 
        description = "Report tab megnyitása.", 
        required = { admin = 0, off_admin = 0 }, 
        args = { }, 
        alias = { }
    }, 
    function(player)
        TriggerClientEvent("report::openReportMenu", player.__netId);
    end
);

Command(
    "ah", 
    { 
        description = "", 
        required = { admin = 1, off_admin = 1 }, 
        args = { }
    }, 
    function(player)
        local sortedCommands = {};

        for command, self in pairs(__Commands) do 
            table.insert(sortedCommands, { level = self.required.admin, command = command, aliases = (type(self.alias) == "string") and { self.alias } or self.alias, args = self.__outputErrorArgsCache })
        end 

        table.sort(sortedCommands, function(a, b)
            local aRequired = a.level or 0;
            local bRequired = b.level or 0;

            if (aRequired ~= bRequired) then 
                return (aRequired < bRequired);
            else 
                return (a.command < b.command);
            end 
        end);

        local str = "";
        local lastLevel = -1;
        for i, v in ipairs(sortedCommands) do 
            if (lastLevel ~= v.level) then 
                lastLevel = v.level;

                str = str .. [[
                    <br>]] .. AdminTitles[lastLevel] .. [[ parancsai<br><br>
                ]]
            end 

            str = str .. "/" .. v.command .. " " .. v.args .. " " .. ((v.aliases and #v.aliases > 0) and "(aliasok: " .. (table.concat(v.aliases, ", ")) .. ")" or "") .. "<br>"
        end 

        exports.vClipboard:set(player.__netId, str);
        exports.vChat:outputChatBox(player.__netId, str);
    end
);

Command(
    "toggleoutput", 
    {
        description = "Ki és bekapcsolja hogy megkapd az admin üzeneteket.",
        required = { admin = 1, off_admin = 1 },
        args = { }
    }, 
    function(player)
        if (not OutputDisabledAdmins[player.__netId]) then 
            exports.vChat:outputChatBox(player.__netId, "Kikapcsoltad az admin üzeneteket.", "success", "success");
            OutputDisabledAdmins[player.__netId] = true;
        else 
            exports.vChat:outputChatBox(player.__netId, "Bekapcsoltad az admin üzeneteket.", "success", "success");
            OutputDisabledAdmins[player.__netId] = false;
        end 
    end
);

local __Places, __PlacesByIndex = {
    ['vh'] = { name = "Városháza", position = vector3(-258.51428222656, -977.947265625, 31.217529296875) },
    ['vwpd'] = { name = "Vinewood PD", position = vector3(650.87475585938, -10.79999923706, 82.811767578125) },
    ['carshop'] = { name = "Autókereskedés", position = vector3(-37.687911987304, -1113.389038086, 26.432250976562) },
    ['mechanic'] = { name = "Szerelőtelep", position = vector3(-358.35165405274, -147.27032470704, 38.243896484375) },
}, {}; for id, _ in pairs(__Places) do table.insert(__PlacesByIndex, id); end;
Command(
    "tpto", 
    {
        description = "Játékos teleportálása előre meghatározott helyekre.",
        required = { admin = 2, off_admin = 5 },
        args = {
            { type = "player" },
            { type = "string", name = "Hely", values = __PlacesByIndex, description = "Lista: " .. (table.concat(table.map(__PlacesByIndex, function(x) return x .. " (" .. __Places[x].name .. ")"; end), ", ")) }
        }
    }, 
    function(player, targetPlayer, placeId)
        SetEntityCoords(GetPlayerPed(targetPlayer.__netId), __Places[placeId].position);
    end
);

-- Command(
--     "test", 
--     { description = "test.", required = { admin = 8, off_admin = 8 }, args = { { type = "string" }, { type = "number" } } }, 
--     function(admin, key, value)
--         local players = exports.vCore:getEntitiesByType("player");
        
--         for id, player in pairs(players) do 
--             player.setLocalMeta(key, value);
--         end 
--     end
-- );

AddEventHandler("onMetaChangeOnAnyEntity", function(entity, key, old, new)

end);