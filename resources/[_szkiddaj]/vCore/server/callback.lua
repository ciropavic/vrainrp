-- 
-- Receive
-- 

local Callbacks = {};

__SharedEventSecret = {
    Key53 = math.random(1000, 100000000), 
    Key14 = math.random(1000, 100000000)
};

local handleCallback = function(callback, callbackId, client, ...)
    callback.func(client, function(...) TriggerClientEvent(GenerateUniqueEventId(callback.baseEvent .. "::internal::CatchResponse::" .. callbackId), client, ...); end, ...);
end 

function addFetch(eventName, callback)
    if (not eventName or not callback) then 
        return false;
    end 

    if (Callbacks[eventName]) then 
        print("Server callback " .. eventName .. " already exists, overriding..");
        RemoveEventHandler(Callbacks[eventName].handler);
    end 

    local uniqueEventId = GenerateUniqueEventId(eventName);

    Callbacks[eventName] = {
        baseEvent = eventName,
        uniqueId = uniqueEventId, 
        func = callback,
    };
    
    RegisterNetEvent(uniqueEventId);
    Callbacks[eventName].handler = AddEventHandler(uniqueEventId, function(callbackId, ...) handleCallback(Callbacks[eventName], callbackId, source, ...); end);
end 

RegisterNetEvent("vCore::internal::fetchEventSecret");
AddEventHandler("vCore::internal::fetchEventSecret", function() TriggerClientEvent("vCore::internal::catchEventSecret", source, __SharedEventSecret); end);

exports("addFetch", addFetch);

-- 
-- Send
-- 

function useFetchAsync(playerId, event, handler, ...)
    if (
        type(playerId) ~= 'number' or 
        not GetPlayerName(playerId) or 
        type(event) ~= "string"
    ) then 
        return false;
    end 

    local uniqueEventId = GenerateUniqueEventId(event);
    local callbackId = randomString(8);
    local callbackEvent = GenerateUniqueEventId(event .. "::internal::CatchResponse::" .. callbackId);
    local handle;

    RegisterNetEvent(callbackEvent);
    handle = AddEventHandler(callbackEvent, function(...)
        handler(...);
        RemoveEventHandler(handle);
    end);
    
    TriggerClientEvent(uniqueEventId, playerId, callbackId, ...);
end 
exports("useFetchAsync", useFetchAsync);