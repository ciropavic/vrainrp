-- 
-- Send
-- 

__SharedEventSecret = nil;

local EventQueue = {};

local doEventCallback = function(event, callback, ...)
    local uniqueEventId = GenerateUniqueEventId(event);
    local callbackId = randomString(8);
    local callbackEvent = GenerateUniqueEventId(event .. "::internal::CatchResponse::" .. callbackId);
    local handle;
    
    RegisterNetEvent(callbackEvent);
    handle = AddEventHandler(callbackEvent, function(...)
        callback(...);
        RemoveEventHandler(handle);
    end);
    
    TriggerServerEvent(uniqueEventId, callbackId, ...);
end

local doEventPromise = function(event, promiseHandle, ...)
    local uniqueEventId = GenerateUniqueEventId(event);
    local callbackId = randomString(8);
    local callbackEvent = GenerateUniqueEventId(event .. "::internal::CatchResponse::" .. callbackId);
    local handle;

    RegisterNetEvent(callbackEvent);
    handle = AddEventHandler(callbackEvent, function(...)
        promiseHandle:resolve({ ... });
        RemoveEventHandler(handle);
    end);
    
    TriggerServerEvent(uniqueEventId, callbackId, ...);
end 

function useFetch(event, ...)
    local newPromise = promise.new();

    if (__SharedEventSecret) then 
        doEventPromise(event, newPromise, ...);
    else 
        table.insert(EventQueue, {
            type = "sync",
            event = event, 
            promise = newPromise, 
            args = { ... },
        });
    end

    local result = Citizen.Await(newPromise);
    return table.unpack(result);
end 
exports("useFetch", useFetch);

function useFetchAsync(event, callback, ...)
    if (__SharedEventSecret) then 
        doEventCallback(event, callback, ...);
    else 
        table.insert(EventQueue, {
            type = "async",
            event = event, 
            callback = callback, 
            args = { ... },
        });
    end 
end 
exports("useFetchAsync", useFetchAsync);

Citizen.CreateThread(function()
    RegisterNetEvent("vCore::internal::catchEventSecret");
    local catchEvent = AddEventHandler("vCore::internal::catchEventSecret", function(secret)
        __SharedEventSecret = secret;
    end);
    
    TriggerServerEvent("vCore::internal::fetchEventSecret");
    
    while (__SharedEventSecret == nil) do 
        Wait(25);
    end 

    RemoveEventHandler(catchEvent);
    
    for i,v in ipairs(EventQueue) do
        local func = (v.type == "sync") and doEventPromise or doEventCallback;
        if (v.type == "sync") then 
            func(v.event, v.promise, table.unpack(v.args));
        elseif (v.type == "async") then 
            func(v.event, v.callback, table.unpack(v.args));
        end 
    end 
end);

-- 
-- Receive
-- 

local FetchQueue = {};
local FetchList = {};

local handleFetch = function(callback, callbackId, ...)
    callback.func(function(...) TriggerServerEvent(GenerateUniqueEventId(callback.baseEvent .. "::internal::CatchResponse::" .. callbackId), ...); end, ...);
end 

local __registerNewFetch = function(eventName, callback)
    if (not eventName or not callback) then 
        return false;
    end 
    
    if (FetchList[eventName]) then 
        print("Client callback " .. eventName .. " already exists, overriding..");
        RemoveEventHandler(FetchList[eventName].handler);
    end 
    
    local uniqueEventId = GenerateUniqueEventId(eventName);
    
    FetchList[eventName] = {
        baseEvent = eventName,
        uniqueId = uniqueEventId, 
        func = callback,
    };

    RegisterNetEvent(uniqueEventId);
    FetchList[eventName].handler = AddEventHandler(uniqueEventId, function(callbackId, ...) 
        handleFetch(FetchList[eventName], callbackId, ...); 
    end);
end 

function addFetch(eventName, callback)
    if (__SharedEventSecret ~= nil) then 
        __registerNewFetch(eventName, callback);
    else 
        table.insert(FetchQueue, {
            event = eventName, 
            callback = callback
        });
    end 
end 
exports("addFetch", addFetch);

Citizen.CreateThread(function()
    while (__SharedEventSecret == nil) do 
        Wait(25);
    end 

    for i,v in ipairs(FetchQueue) do
        __registerNewFetch(v.event, v.callback);
    end 
end);