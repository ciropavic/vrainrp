__Commands = {};
local __CommandRefs = {};

local cmdExecFails = {
    argument_missing = "Hiányos érték!", 

    player_has_no_permission = "Nincs jogosultságod a parancs használatához!",
    player_not_in_adminduty = "A parancs használatához adminszolgálatba kell állnod!",

    player_not_found = "Nincs játékos ezzel az azonosítóval!", 
    player_more_than_one = "Több játékosra is ráíllik az általad megadott szűrő!",

    vehicle_invalid_self = "Nem vagy járműben!",
    vehicle_not_found = "Nincs jármű ezzel az azonosítóval!",

    interior_not_found = "Nincs interior ezzel az azonosítóval!",

    number_invalid_type = "A megadott érték nem szám!",
    number_below_minimum = "A megadott szám alacsonyabb mint a minimum megengedett %d!",
    number_upper_maximum = "A megadott szám nagyobb mint a maximum megengedett %d!",
    number_not_between_values = "A megadott szám nincs az opciók között!",

    string_invalid = "Érvénytelen érték!",
    string_upper_minimum = "A megadott szó túl rövid! (Minimum %d karakter!)",
    string_not_between_values = "A megadott szó nincs az opciók között!",
    string_upper_maximum = "A megadott szó túl hosszú! (Maximum %d karakter!)",

    text_below_minimum = "A megadott szöveg túl rövid! (Minimum %d karakter!)",
    text_below_maximum = "A megadott szöveg túl hosszú! (Maximum %d karakter!)",
};

local defaultArgumentNames = {
    player = "Játékos", 
    vehicle = "Jármű",
    interior = "Interior",
    number = "Szám", 
    string = "Szöveg",
    text = "...Hosszabb szöveg",
};

local defaultArgumentDescriptions = {
    player = "Játékos ID-je", 
    vehicle = "Jármű ID-je vagy rendszámtáblája. (Rendszámnál a spaceket kötőjellel kell kicserélni!)", 
    number = "Szám", 
    string = "Szöveg",
    text = "...Hosszabb szöveg",
};

-- (Rendszámnál a spaceket kötőjellel kell kicserélni! 
-- Illetve ha \"AAA-111\" formátumú rendszámtábla van az autón, a végére is kell kötőjelet tenni.)

local canHaveOptionalValue = { number = true, string = true };

local defaultRequired = {
    admin = 0, 
    off_admin = 5, 
};

local outputDebugString = function(...) print(...); end

function Command(...) 
    local self = {};

    self.initialize = function(cmd, settings, handler)
        if (__Commands[cmd]) then 
            __Commands[cmd].destroy();
            print(cmd .. " parancs már le van regisztrálva, törlés!");
        end 

        self.command = cmd;
        self.alias = (settings.alias or {});
        self.args = (settings.args or {});
        self.logType = settings.logType;
        self.required = (table.merge_keytbl(defaultRequired, settings.required) or defaultRequired);
        self.description = settings.description;
        self.handler = (handler or nil);

        local optionalArgIndex = table.findIndex(self.args, function(x)
            return (x.optional);
        end);

        if (optionalArgIndex) then 
            for i = optionalArgIndex, #self.args do 
                if (not self.args[i].optional) then 
                    self = nil;
                    return print("Optional argument után már csak optional lehet!");
                end 
            end 
        end 

        local hasInvalidTextArg = table.findIndex(self.args, function(x)
            return (x.type == "text");
        end);

        if (hasInvalidTextArg and hasInvalidTextArg < #self.args) then 
            self = nil;
            return print("Kurva anyad text csak utolso lehet!");
        end 

        self.outputError = (settings.outputError ~= false) and true or false;
        self.__outputArgsCache = (self.args and #self.args > 0) and "[" .. table.concat(
            table.map(self.args, function(x)
                return (x.name or defaultArgumentNames[x.type]); 
            end), 
            "] ["
        ) .. "]" or "";
        
        if (type(settings.alias) == "string") then
            RegisterCommand(settings.alias, self.__onCommand, false);
            __CommandRefs[settings.alias] = self.command;
        elseif (type(settings.alias) == "table") then 
            for _, alias in ipairs(settings.alias) do                
                RegisterCommand(alias, self.__onCommand, false);
                __CommandRefs[alias] = self.command;
            end 
        end 
        
        RegisterCommand(cmd, self.__onCommand, false);
        __Commands[cmd] = self;
        return self;
    end

    self.destroy = function()
        local baseCommand = self.command;

        for alias, reference in pairs(__CommandRefs) do 
            if (reference == baseCommand) then 
                __CommandRefs[alias] = nil;
            end 
        end 

        for k,v in pairs(self) do 
            self[k] = nil;
        end 

        __Commands[baseCommand] = nil;
        self = nil;
    end 

    self.__onCommand = function(player, args)
        local qPlayer = exports.vCore:getPlayerEntityFromId(player);

        if (not qPlayer) then 
            return exports.vChat:outputChatBox(
                player, "Nincs qPlayer", "error", "error"
            );
        end 

        local canExecute, error = self.__playerCanExecute(player);

        if (not canExecute) then 
            return exports.vChat:outputChatBox(
                player,
                (cmdExecFails[error] or "Nincs jogosultságod a parancs használatához!"), 
                "error", "error"
            );
        end 

        local result = self.__validateArgs(player, args);
        if (not result.valid) then 
            if (self.outputError) then 
                self.__onValidateFails(player, result);
            end 

            return;
        end 

        -- print(
        --     "__onCommand", player, self.command, 
        --     exports.vName:getPlayerCharacterName(player), 
        --     getPlayerAdminName(player), getPlayerAdminLevel(player)
        -- );

        if (self.handler) then 
            local success, error = pcall(function() self.handler(qPlayer, table.unpack(result.validated)) end);
            if (not success) then 
                print(self.command .. " parancs torolve, mivel a handle valoszinuleg eltunt, meghalt, elpusztult, elpatkolt.. (" .. (error or "Ismeretlen hiba") .. ")");
                self.destroy();
            end 
        end 
    end

    self.__onValidateFails = function(player, argument)
        local error = (cmdExecFails[argument.error]) and cmdExecFails[argument.error] or argument.error;

        exports.vChat:outputChatBox(player, "/" .. self.command .. " " .. self.__outputArgsCache, "error", "error");
        exports.vChat:outputChatBox(player, "#" .. argument.failed .. " - " .. string.format(error, table.unpack(argument.details or {})), "error", "error");
    end

    self.__playerCanExecute = function(player)
        local playerIdentifiers = GetPlayerIdentifiers(player);
        for authType, authId in pairs(playerIdentifiers) do 
            if (Sudoers[authType .. ":" .. authId]) then 
                return true;
            end 
        end 

        local admin = getPlayerAdminLevel(player);
        local inDuty = isAdminInDuty(player);

        if (not admin) then 
            return false, "player_has_no_permission";
        end 
        
        if (self.required) then 
            if (self.required.off_admin and admin >= self.required.off_admin) then
                return true;
            end 
            
            if (self.required.admin and admin >= self.required.admin) then 
                if (inDuty) then
                    return true;
                end 

                return false, "player_not_in_adminduty";
            end 
        end 

        return false, "player_has_no_permission";
    end 

    self.__validateArgs = function(player, args)
        local validated = {};

        for i, v in ipairs(self.args) do 
            if (not args[i]) then 
                if (not v.optional or not v.default or not canHaveOptionalValue[v.type]) then
                    return { valid = false, failed = i, error = "argument_missing" };
                end 

                table.insert(validated, i, v.default);
            else 
                if (v.type == "player") then 
                    if (tonumber(args[i])) then 
                        args[i] = tonumber(args[i]);
                    end 

                    local foundPlayer;
    
                    if (type(args[i]) == "string") then 
                        if (args[i] == "*") then 
                            foundPlayer = exports.vCore:getPlayerEntityFromId(player);
    
                            if (not foundPlayer or not foundPlayer.__netId) then 
                                return { valid = false, failed = i, error = "player_invalid_entity_self" };
                            end 
                        else 
                            local givenName = args[i]:lower();

                            local players = table.filter(GetPlayers(), function(x)                                
                                return (
                                    string.lower(exports.vName:getPlayerCharacterName(tonumber(x))):find(givenName) or 
                                    string.lower(getPlayerAdminName(tonumber(x))):find(givenName)
                                );
                            end);

                            if (not players or #players < 1) then 
                                return { valid = false, failed = i, error = "player_not_found" };
                            end 

                            if (players and #players > 1) then 
                                return { valid = false, failed = i, error = "player_more_than_one" };
                            end 

                            foundPlayer = exports.vCore:getPlayerEntityFromId(players[1]);

                            if (not foundPlayer or not foundPlayer.__netId) then 
                                return { valid = false, failed = i, error = "player_invalid_entity_self" };
                            end 
                        end 
                    else 
                        foundPlayer = exports.vCore:getPlayerEntityFromId(args[i]);

                        if (not foundPlayer or not foundPlayer.__netId) then 
                            return { valid = false, failed = i, error = "player_not_found" };
                        end 
                    end 

                    table.insert(validated, i, foundPlayer);
                elseif (v.type == "vehicle") then 
                    local foundVehicle;
    
                    if (type(args[i]) == "string" and args[i] == "*") then 
                        foundVehicle = GetVehiclePedIsIn(GetPlayerPed(player), false);
    
                        if (not foundVehicle or foundVehicle == 0) then 
                            return { valid = false, failed = i, error = "vehicle_invalid_self" };
                        end 
                    else 
                        if (tonumber(args[i])) then 
                            args[i] = tonumber(args[i]);
                        end 

                        foundVehicle = table.find(GetAllVehicles(), function(x)
                            return (
                                (type(args[i]) == "number" and tonumber(x) == args[i]) or 
                                (type(args[i]) == "string" and GetVehicleNumberPlateText(x):gsub('[ \t]+%f[\r\n%z]', ''):gsub(" ", "-") == args[i])
                            );
                        end);
    
                        if (not foundVehicle) then 
                            return { valid = false, failed = i, error = "vehicle_not_found" };
                        end 
                    end 
    
                    table.insert(validated, i, foundVehicle);
                elseif (v.type == "interior") then 
                    if (tonumber(args[i])) then 
                        args[i] = tonumber(args[i]);
                    end 

                    local foundInterior = exports.vProperty:getInteriorById(args[i]);

                    if (not foundInterior) then 
                        return { valid = false, failed = i, error = "interior_not_found" };
                    end 

                    table.insert(validated, i, foundInterior);
                elseif (v.type == "number") then 
                    if (not tonumber(args[i])) then 
                        return { valid = false, failed = i, error = "number_invalid_type" };
                    end 
    
                    args[i] = tonumber(args[i]);
    
                    if (v.min and v.min > args[i]) then 
                        return { valid = false, failed = i, error = "number_below_minimum", details = { v.min } }; 
                    end 
    
                    if (v.max and v.max < args[i]) then 
                        return { valid = false, failed = i, error = "number_upper_maximum", details = { v.max } }; 
                    end 
    
                    if (v.values) then 
                        local index = table.findIndex(v.values, function(x) return (x == args[i]); end);
    
                        if (not index) then 
                            return { valid = false, failed = i, error = "number_not_between_values" }; 
                        end 
                    end 
    
                    table.insert(validated, i, args[i]);
                elseif (v.type == "string") then 
                    if (type(args[i]) ~= "string") then 
                        return { valid = false, failed = i, error = "string_invalid" }; 
                    end 
    
                    if (v.min and v.min > string.len(args[i])) then 
                        return { valid = false, failed = i, error = "string_below_minimum" }; 
                    end 
    
                    if (v.max and v.max < string.len(args[i])) then 
                        return { valid = false, failed = i, error = "string_upper_maximum" }; 
                    end 
    
                    if (v.values) then 
                        local index = table.findIndex(v.values, function(x) return (x == args[i]); end);
    
                        if (not index) then 
                            return { valid = false, failed = i, error = "string_not_between_values" }; 
                        end 
                    end 
    
                    table.insert(validated, i, args[i]);
                elseif (v.type == "text") then 
                    local text = table.concat(args, " ", i);
    
                    if (v.min and v.min > string.len(text)) then 
                        return { valid = false, failed = i, error = "text_below_minimum" }; 
                    end 
    
                    if (v.max and v.max > string.len(text)) then 
                        return { valid = false, failed = i, error = "text_upper_maximum" }; 
                    end 
    
                    table.insert(validated, i, text);
                end 
            end 
        end 

        return {
            valid = true, 
            validated = validated, 
        };
    end

    return self.initialize(...);
end 
exports("addCommand", Command);

-- RegisterNetEvent("vAdmin::emitCommand");
-- AddEventHandler("vAdmin::emitCommand", function(command, ...)
--     local player = source;

--     if (type(command) ~= 'string') then 
--         return false;
--     end 

--     local command = (__Commands[command] or (__CommandRefs[command] and __Commands[__CommandRefs[command]]));
--     if (command) then 
--         command.__onCommand(player, { ... });
--     end 
-- end);

exports.vCore:addFetch(
    "vAdmin::emitCommand", 
    function(player, callback, command, ...)
        if (type(command) ~= 'string') then 
            return callback(false);
        end 
    
        local commandInstance = (__Commands[command] or (__CommandRefs[command] and __Commands[__CommandRefs[command]]));
        if (commandInstance) then 
            commandInstance.__onCommand(player, { ... });
            return callback(true);
        end 
    
        callback(false);
    end
);

local __FloodProtecton = {};
RegisterNetEvent("global::fetchSuggestions");
AddEventHandler("global::fetchSuggestions", function()
    local player = source;
    if (
        __FloodProtecton[player] and 
        __FloodProtecton[player] + 5.0 > os.time()
    ) then 
        return;
    end 

    __FloodProtecton[player] = os.time();

    local suggestions = {};

    for _, self in pairs(__Commands) do 
        if (type(self.alias) == "string") then
            table.insert(suggestions, {
                "/" .. self.alias .. " " .. self.__outputArgsCache,
                self.description
            });
        elseif (type(self.alias) == "table") then 
            for _, alias in ipairs(self.alias) do                
                table.insert(suggestions, {
                    "/" .. alias .. " " .. self.__outputArgsCache,
                    self.description
                });
            end 
        end 
        
        table.insert(suggestions, {
            "/" .. self.command .. " " .. self.__outputArgsCache,
            self.description
        });
    end 

    TriggerClientEvent("vChat::receiveSuggestions", player, suggestions);
end);

AddEventHandler("playerDropped", function()
    if (__FloodProtecton[source]) then 
        __FloodProtecton[source] = nil;
    end 
end);

AddEventHandler("onResourceStop", function(resourceName)
    -- if (resourceName == GetCurrentResourceName()) then 
    --     for cmd, command in pairs(__Commands) do 
    --         TriggerClientEvent('chat:removeSuggestion', -1, '/' .. cmd);
    --     end 
    -- end 
end);