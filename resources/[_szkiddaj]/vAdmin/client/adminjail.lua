local Jail = nil;

local function formatTime(seconds)
    local seconds = tonumber(seconds)
  
    if seconds <= 0 then
      return "00:00:00";
    else
      hours = string.format("%02.f", math.floor(seconds/3600));
      mins = string.format("%02.f", math.floor(seconds/60 - (hours*60)));
      secs = string.format("%02.f", math.floor(seconds - hours*3600 - mins *60));
      return hours..":"..mins..":"..secs
    end
end

function drawText2D(x,y ,width,height,scale, text, r,g,b,a, outline)
    SetTextFont(4)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()

    SetTextCentre(true)

    if(outline)then
	    SetTextOutline()
	end

    SetTextEntry("STRING")
    AddTextComponentString(text)
    EndTextCommandDisplayText(x - width/2, y - height/2 + 0.005)
end

local function jailRender()
    while (Jail ~= nil) do 
        drawText2D(
            0.5, 0.98, 0.06, 0.06, 0.6, 
            "Hátramaradt: " .. formatTime((Jail.left - GetGameTimer()) / 1000), 
            255, 255, 255, 255, true
        );

        Wait(0);
    end 
end 

local function jailStatusReset()
    while (Jail ~= nil) do 
        TriggerEvent("esx_basicneeds:healPlayer");
        Wait(1000);
    end 
end 

RegisterNetEvent("vAdmin::setJailState");
AddEventHandler("vAdmin::setJailState", function(state)
    if (state) then 
        Jail = {
            left = GetGameTimer() + state.left * 1000,
        };

        Citizen.CreateThread(jailRender);
        Citizen.CreateThread(jailStatusReset);
    else 
        Jail = nil;
    end 
end);