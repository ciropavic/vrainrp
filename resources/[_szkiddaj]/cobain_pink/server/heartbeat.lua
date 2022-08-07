local __PlayerHeartbeats = {};
local __heartbeatEvent;
local __prevSharedSecret;

function onPlayerHeartbeat()
    local playerId = source;
    __PlayerHeartbeats[playerId] = os.time();
    print("Got heartbeat from PlayerId " .. playerId);
end 

Citizen.CreateThread(function()
    while (true) do 
        local secret = SharedConfig.heartbeat.generate();
        if (not __prevSharedSecret or secret ~= __prevSharedSecret) then 
            if (__heartbeatEvent) then 
                RemoveEventHandler(__heartbeatEvent);
            end 

            RegisterNetEvent(secret);
            __heartbeatEvent = AddEventHandler(secret, onPlayerHeartbeat);
            __prevSharedSecret = secret;
        end 

        Wait(500);
    end     
end);

local HeartbeatTolerance = 30;
Citizen.CreateThread(function()
    while (true) do 
        local time = os.time();
        for player, last in pairs(__PlayerHeartbeats) do 
            if (last + HeartbeatTolerance < time) then 
                Config.heartbeat.on_tolarence_timeout(player);
            end 
        end 

        Wait(10000);
    end 
end);

AddEventHandler("playerJoining", function()
    local playerId = source;
    __PlayerHeartbeats[playerId] = os.time();
end);

AddEventHandler("playerDropped", function()
    local playerId = source;
    __PlayerHeartbeats[playerId] = nil;
end);