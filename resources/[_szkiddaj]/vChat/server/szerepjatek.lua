exports.vAdmin:addCommand(
    "do", 
    {
        required = { admin = 0, off_admin = 0 },
        args = { { type = "text" } },
    },
    function(player, text)
        local playerCoords = player.getPosition();
        local players = exports.vCore:getEntitiesByType("player");

        for id, targetPlayer in pairs(players) do 
            local distance = #(playerCoords - targetPlayer.getPosition());

            if (distance <= 15) then 
                outputChatBox(targetPlayer.__netId, "* " .. text .. " ((" .. exports.vName:getPlayerCharacterName(player.__netId) .. "))", "#ff2850");
            end 
        end  
    end 
);

exports.vAdmin:addCommand(
    "me", 
    {
        required = { admin = 0, off_admin = 0 },
        args = { { type = "text" } },
    },
    function(player, text)
        local playerCoords = player.getPosition();
        local players = exports.vCore:getEntitiesByType("player");

        for id, targetPlayer in pairs(players) do 
            local distance = #(playerCoords - targetPlayer.getPosition());

            if (distance <= 15) then 
                outputChatBox(targetPlayer.__netId, "*** " .. exports.vName:getPlayerCharacterName(player.__netId) .. " " .. text, "#c2a2da");
            end 
        end  
    end 
);

exports.vAdmin:addCommand(
    "dolow", 
    {
        required = { admin = 0, off_admin = 0 },
        args = { { type = "text" } },
    },
    function(player, text)
        local playerCoords = player.getPosition();
        local players = exports.vCore:getEntitiesByType("player");

        for id, targetPlayer in pairs(players) do 
            local distance = #(playerCoords - targetPlayer.getPosition());

            if (distance <= 5) then 
                outputChatBox(targetPlayer.__netId, "* " .. text .. " ((" .. exports.vName:getPlayerCharacterName(player.__netId) .. "))", "#ff6682");
            end 
        end  
    end 
);

exports.vAdmin:addCommand(
    "melow", 
    {
        required = { admin = 0, off_admin = 0 },
        args = { { type = "text" } },
    },
    function(player, text)
        local playerCoords = player.getPosition();
        local players = exports.vCore:getEntitiesByType("player");

        for id, targetPlayer in pairs(players) do 
            local distance = #(playerCoords - targetPlayer.getPosition());

            if (distance <= 5) then 
                outputChatBox(targetPlayer.__netId, "*** " .. exports.vName:getPlayerCharacterName(player.__netId) .. " " .. text, "#dbc5eb");
            end 
        end  
    end 
);

exports.vAdmin:addCommand(
    "ame", 
    {
        required = { admin = 0, off_admin = 0 },
        args = { { type = "text" } },
    },
    function(player, text)
        local playerCoords = player.getPosition();
        local players = exports.vCore:getEntitiesByType("player");

        for id, targetPlayer in pairs(players) do 
            local distance = #(playerCoords - targetPlayer.getPosition());

            if (distance <= 15) then 
                outputChatBox(targetPlayer.__netId, ">> " .. exports.vName:getPlayerCharacterName(player.__netId) .. " " .. text, "#956cb4");
            end 
        end  
    end 
);

exports.vAdmin:addCommand(
    "megprobal", 
    {
        required = { admin = 0, off_admin = 0 },
        args = { { type = "text" } },
        alias = { "try" },
    },
    function(player, text)
        local playerCoords = player.getPosition();
        local players = exports.vCore:getEntitiesByType("player");

        local isSuccess = math.random(25, 100) % 2 == 0;
        local suffix = isSuccess and "és sikerül neki." or "de sajnos nem sikerül neki.";

        for id, targetPlayer in pairs(players) do 
            local distance = #(playerCoords - targetPlayer.getPosition());

            if (distance <= 15) then 
                outputChatBox(
                    targetPlayer.__netId, 
                    "*** " .. exports.vName:getPlayerCharacterName(player.__netId) .. " megpróbál(ja) " .. text .. ", " .. suffix, 
                    isSuccess and "#00e600" or "#e60000", isSuccess and "f00c" or "f00d"
                );
            end 
        end  
    end 
);