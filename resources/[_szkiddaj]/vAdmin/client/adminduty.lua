local State = false;

local function adminRender()
    while (State) do         
        -- Text
        color = RGBRainbow(1);
        SetTextFont(0);
        SetTextProportional(1);
        SetTextScale(0.0, 0.3);
        SetTextColour(color.r, color.g, color.b, 255);
        SetTextDropshadow(0, 0, 0, 0, 255);
        SetTextEdge(1, 20, 0, 0, 255);
        SetTextDropShadow();
        SetTextOutline();
        SetTextEntry("STRING");
        AddTextComponentString("Admin szolgálatban");
        DrawText(0.46, 0.975);
        
        Wait(0);
    end 
end 

function RGBRainbow(frequency)
    local result = {};
    local curtime = GetGameTimer() / 1000;
    
    result.r = math.floor(math.sin(curtime * frequency + 0) * 127 + 128);
    result.g = math.floor(math.sin(curtime * frequency + 2) * 127 + 128);
    result.b = math.floor(math.sin(curtime * frequency + 4) * 127 + 128);
    
    return result;
end

function onLocalPlayerMetaChange(entity, key, old, new)
    if (key == "admin") then 
        if (new and new.duty) then 
            State = true;
            Citizen.CreateThread(adminRender);
        else 
            State = false;
        end 
    end 
end 

Citizen.CreateThread(function()
    local localPlayer;
    while (not localPlayer) do 
        localPlayer = exports.vCore:getLocalPlayer();
        Wait(500);
    end 

    localPlayer.on("onClientMetaChange", onLocalPlayerMetaChange);
end);