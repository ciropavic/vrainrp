local BaseEvents = {
    addEvent            = AddEventHandler, 
    removeEvent         = RemoveEventHandler,
    addNetEvent         = RegisterNetEvent,
    emit                = TriggerEvent,
    emitServer          = TriggerServerEvent, 
    emitClient          = TriggerClientEvent
};

local InternalEvents = {
    FetchTunnelingData                = GetCurrentResourceName() .. "::PZANWXUDKZAYEQNYRZLEGRHMYNPTHNCG", 
    HandleTunnelingResponse           = GetCurrentResourceName() .. "::UFETWZLSCFEVVQPKDGCVRTZDDQMTFCWH"
};

local IgnoredEvents = {
    entityCreated = true, 
    entityCreating = true, 
    entityRemoved = true, 
    onResourceListRefresh = true, 
    onResourceStart = true, 
    onResourceStarting = true, 
    onResourceStop = true, 
    onServerResourceStart = true, 
    onServerResourceStop = true, 
    playerConnecting = true, 
    playerEnteredScope = true, 
    playerJoining = true, 
    playerLeftScope = true, 
    ptFxEvent = true, 
    removeAllWeaponsEvent = true, 
    startProjectileEvent = true, 
    weaponDamageEvent = true, 
};

-- AddEventHandler         = nil;
-- RemoveEventHandler      = nil;

-- if (IsDuplicityVersion()) then 
--     TriggerServerEvent = nil;
-- else 
--     TriggerClientEvent = nil;
-- end 

(function()
    local store = {};

    local helpers = {
        randomString = function(length)
            local str = "";
            local __randomStringCharacterSet = "qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM1234567890";

            for i = 1, length do 
                local rand = math.random(1, string.len(__randomStringCharacterSet));
                str = str .. __randomStringCharacterSet:sub(rand, rand);
            end 

            return str;
        end,

        log = function(...)
            print(...);
        end, 

        generateEventWithSecret = function(value, secret)
            local secretNum = 0;

            for str in string.gmatch(secret, "([^.]+)") do 
                secretNum = secretNum + string.byte(str) ^ 3.14;
            end 

            secretNum = math.floor(secretNum);

            
            -- Cipher shit
            
            local Key53 = secretNum;
            local Key14 = math.ceil((secretNum ^ 1.54) % 2147483647);
            local inv256;

            if not inv256 then
                inv256 = {}
                for M = 0, 127 do
                    local inv = -1
                    repeat inv = inv + 2
                    until inv * (2*M + 1) % 256 == 1
                    inv256[M] = inv
                end
            end

            local K, F = Key53, 16384 + Key14
            return (value:gsub('.',
                function(m)
                    local L = K % 274877906944  -- 2^38
                    local H = (K - L) / 274877906944
                    local M = H % 128
                    m = m:byte()
                    local c = (m * inv256[M] - (H - M) / 128) % 256
                    K = L * F + H + c + m
                    return ('%02x'):format(c)
                end
            ));       
        end 
    };

    if (IsDuplicityVersion()) then -- Szerver
        store.events            = {};
        store.netEvents         = {};

        if (GetResourceState("cobain_pink") ~= "started") then 
            return helpers.log("To use event tunneling, resource `cobain_pink` must running.")
        end 

        local config = (exports.cobain_pink:getConfig() or { events = nil }).events;
        if (not config) then 
            return helpers.log("nincs kfg");
        end 

        if (config.tunnel) then 
            if (
                not config.tunnel.mode or 
                config.tunnel.mode == "disabled"
            ) then 
                helpers.log("tunneling disabled");
            else 
                local mode = config.tunnel[config.tunnel.mode];

                store.tunnel = {
                    mode = config.tunnel.mode
                };

                if (config.tunnel.mode == "shared_secret") then
                    if (type(mode.secret_code) == "string") then 
                        store.tunnel.secret = mode.secret_code;
                    else 
                        store.tunnel.secret = helpers.randomString(type(mode.length) == "number" and mode.length or 16);
                    end 
                elseif (config.tunnel.mode == "time") then 
                    
                else 
                    helpers.log("Invalid tunneling mode.")
                end 
            end 
        end

        RegisterServerEvent = function(eventName, handler, ignore)            
            if (type(handler) == "function") then
                RegisterNetEvent(eventName, ignore);
                AddEventHandler(handler, ignore); 
            else 
                RegisterNetEvent(eventName, handler);
            end 
        end

        -- RegisterServerEvent = function(eventName, handler, ignore)
        --     if (not ignore) then 
        --         local uniqueEventId = helpers.generateEventWithSecret(eventName, store.tunnel.secret);
        --         BaseEvents.addNetEvent(uniqueEventId);
        --         store.netEvents[eventName] = true;
        --         helpers.log("Netevent added", eventName .. " -> " .. uniqueEventId);
        --     else 
        --         BaseEvents.addNetEvent(eventName);
        --     end 

        --     if (handler) then 
        --         local handle;

        --         if (not ignore) then 
        --             store.events[eventName] = true;
        --             local uniqueEventId = helpers.generateEventWithSecret(eventName, store.tunnel.secret);
        --             handle = BaseEvents.addEvent(uniqueEventId, handler);
        --             helpers.log("Handle incoming server triggers", eventName .. " -> " .. uniqueEventId);
        --         else
        --             handle = BaseEvents.addEvent(eventName, handler);
        --         end

        --         return handle;
        --     end 

        --     return true;
        -- end

        RegisterNetEvent = function(eventName, ignore)
            if (
                (not store.events[eventName] or 
                not store.events[eventName].tunneled) and 
                not ignore
            ) then 
                local uniqueEventId = helpers.generateEventWithSecret(eventName, store.tunnel.secret);
                BaseEvents.addNetEvent(uniqueEventId);
                
                store.netEvents[eventName] = { tunneled = true };
                helpers.log("Netevent added", eventName .. " -> " .. uniqueEventId);
                
                return handle;
            else
                store.netEvents[eventName] = { tunneled = false };
                BaseEvents.addNetEvent(eventName);

                return true;
            end 

            -- if (not ignore) then 
            --     local uniqueEventId = helpers.generateEventWithSecret(eventName, store.tunnel.secret);
            --     local handle = BaseEvents.addNetEvent(uniqueEventId);

            --     store.netEvents[eventName] = true;
            --     helpers.log("Netevent added", eventName .. " -> " .. uniqueEventId);

            --     return handle;
            -- else 
            --     return BaseEvents.addNetEvent(eventName);
            -- end 
        end

        -- @ignore 
        -- Ha Resource "A"-bol TriggerEventezik a Resource "B"-ben talalhato EventHandlerre,
        -- es nincs explicitly megadva true 3. paramnak, akkor nem fog meghivodni. (mert mas az eventName, vao)
        AddEventHandler = function(eventName, callback, ignore)
            if (
                store.netEvents[eventName] and 
                not ignore and 
                not IgnoredEvents[eventName]
            ) then 
                local uniqueEventId = helpers.generateEventWithSecret(eventName, store.tunnel.secret);
                local handle = BaseEvents.addEvent(uniqueEventId, callback);

                store.events[eventName] = { handle = handle, callback = callback, tunneled = true };
                helpers.log("Event added", eventName .. " -> " .. uniqueEventId);
            else 
                local handle = BaseEvents.addEvent(eventName, handler);
                store.events[eventName] = { handle = handle, callback = callback, tunneled = false };

                return handle;
            end 

            return false;
        end 

        -- AddEventHandler = function(eventName, handler, ignore)
        --     if (not ignore) then 
        --         store.events[eventName] = true;

        --         local uniqueEventId = helpers.generateEventWithSecret(eventName, store.tunnel.secret);
        --         local handle = BaseEvents.addEvent(uniqueEventId, handler);

        --         helpers.log("Handle incoming server triggers", eventName .. " -> " .. uniqueEventId);

        --         return handle;
        --     else 
        --         return BaseEvents.addEvent(eventName, handler);
        --     end 
        -- end 

        TriggerEvent = function(eventName, ...)
            if (store.events[eventName]) then 
                local uniqueEventId = helpers.generateEventWithSecret(eventName, store.tunnel.secret);
                BaseEvents.emit(uniqueEventId, ...);
            else 
                BaseEvents.emit(eventName, ...);
            end 
        end

        RemoveEventHandler = function(handle)
            BaseEvents.removeEvent(handle);
        end 

        -- Client config fetch
        BaseEvents.addNetEvent(InternalEvents.FetchTunnelingData);
        BaseEvents.addEvent(InternalEvents.FetchTunnelingData, function()
            local _player = source;
            BaseEvents.emitClient(InternalEvents.HandleTunnelingResponse, _player, {
                config = store.tunnel,
                events = store.events
            });
        end);
    else -- Client
        local handleTunnelingData = function(data)
            BaseEvents.removeEvent(store.tunnelingEventHandler);
            store.tunnelingEventHandler = nil;

            store.tunnel = data.config;
            store.events = data.events;
        end 

        TriggerServerEvent = function(eventName, ...)
            local args = { ... };

            if (store.events and store.events[eventName]) then 
                local uniqueEventId = helpers.generateEventWithSecret(eventName, store.tunnel.secret);
                BaseEvents.emitServer(uniqueEventId, ...);
                print("Outgoing server trigger", eventName .. " -> " .. uniqueEventId, ...);
            else 
                BaseEvents.emitServer(eventName, ...);
            end 
        end 

        BaseEvents.addNetEvent(InternalEvents.HandleTunnelingResponse);
        store.tunnelingEventHandler = BaseEvents.addEvent(InternalEvents.HandleTunnelingResponse, handleTunnelingData);
        BaseEvents.emitServer(InternalEvents.FetchTunnelingData);
    end 
end)();