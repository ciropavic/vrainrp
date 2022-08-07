local Interactions = {};

--[[
    Add interaction the right side of the screen
    @key - The bind's key
    @description - Short description of the bind
    @callback - Callback which will be called when the interaction reaches 100% progress
    @options - An object of optional settings. { progressStep: number }
]]
function addInteraction(key, description, callback, options)
    if (
        type(key) ~= "string" or 
        not KeyList[string.upper(key)] or 
        Interactions[ KeyList[string.upper(key)] ] ~= nil
    ) then 
        return false;
    end 
    
    local keyCode = KeyList[string.upper(key)];

    Interactions[keyCode] = {
        key = key, 
        description = description, 
        callback = callback, 
        options = options,
    };

    SendNUIMessage({
        action = "ADD", 
        payload = {
            key = key, 
            description = description, 
            options = {
                interval = (options?.interval or 800)
            }, 
        }
    });

    return true;
end     
exports("addInteraction", addInteraction);

--[[
    @key - The key lol 
]]
function removeInteraction(key)
    print("TOROL1", key);
    if (
        type(key) == "string" and 
        KeyList[string.upper(key)] and 
        Interactions[ KeyList[string.upper(key)] ] ~= nil
    ) then 
        print("TOROL2", key);
        local interaction = Interactions[KeyList[string.upper(key)]];

        SendNUIMessage({ action = "REMOVE", payload = { key = interaction.key } });
        Interactions[KeyList[string.upper(key)]] = nil;

        return true;
    end 

    return false;
end 
exports("removeInteraction", removeInteraction);

RegisterNUICallback("on_interaction", function(data)
    if (data and data.key and Interactions[KeyList[data.key]]) then 
        local interaction = Interactions[KeyList[data.key]];

        interaction.callback(interaction.key);
        Interactions[KeyList[data.key]] = nil;
    end 
end);

Citizen.CreateThread(function()
    while (true) do
        for keyCode, interaction in pairs(Interactions) do 
            if (IsControlJustPressed(0, keyCode)) then 
                SendNUIMessage({
                    action = "ON_KEY_PRESS", 
                    payload = {
                        key = interaction.key
                    }
                });
            elseif (IsControlJustReleased(0, keyCode)) then 
                SendNUIMessage({
                    action = "ON_KEY_RELEASE", 
                    payload = {
                        key = interaction.key
                    }
                });
            end 
        end 
        
        Wait(0);
    end 
end);