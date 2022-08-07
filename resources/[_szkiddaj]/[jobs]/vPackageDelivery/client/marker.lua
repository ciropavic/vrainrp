local markers = {};
local drawDistance = 75;

Citizen.CreateThread(function()
    while (true) do 
        local player = GetPlayerPed(-1);
        if (not DoesEntityExist(player)) then 
            player = GetPlayerPed(-1);
        else
            local pCoords = GetEntityCoords(player);

            for i,v in pairs(markers) do 
                if (GetDistanceBetweenCoords(pCoords[1], pCoords[2], pCoords[3], v.x, v.y, v.z, true) <= drawDistance) then 
                    DrawMarker(v.type, v.x, v.y, v.z, 0.0, 0.0, 0.0, v.rx, v.ry, v.rz, 
                    v.radius, v.radius, v.radius, v.r, v.g, v.b, v.a, false, false, 2, false, false, false, false);
                end
            end
        end

        Wait(0);
    end
end);

Citizen.CreateThread(function()
    while (true) do 
        local player = GetPlayerPed(-1);
        if (not DoesEntityExist(player)) then 
            player = GetPlayerPed(-1);
        else
            local pCoords = GetEntityCoords(player);

            for i,v in pairs(markers) do 
                for ped in EnumeratePeds() do 
                    local pedCoords = GetEntityCoords(ped);
                    if (not v.entitiesIn[ped] and GetDistanceBetweenCoords(pedCoords[1], pedCoords[2], pedCoords[3], v.x, v.y, v.z, true) <= v.radius) then 
                        v.entitiesIn[ped] = true;
                        TriggerEvent(Config.resource..':onMarkerHit', i, ped, player == ped, v.data);
                    elseif (v.entitiesIn[ped] and GetDistanceBetweenCoords(pedCoords[1], pedCoords[2], pedCoords[3], v.x, v.y, v.z, true) > v.radius) then 
                        v.entitiesIn[ped] = nil;
                        TriggerEvent(Config.resource..':onMarkerLeave', i, ped, player == ped, v.data);
                    end
                end
            end
        end

        Wait(100);
    end 
end);

RegisterNetEvent(Config.resource..':CreateMarker')
AddEventHandler(Config.resource..':CreateMarker', function(id, x, y, z, type, radius, r, g, b, a, rx, ry, rz, data)
    if (not id or markers[id]) then return false; end
    markers[id] = {
        x = x,
        y = y,
        z = z,
        rx = rx or 0.0,
        ry = ry or 0.0,
        rz = rz or 0.0,
        r = r,
        g = g,
        b = b,
        a = a,
        type = type,
        radius = radius,
        data = data or {},

        entitiesIn = {},
    };
end);

RegisterNetEvent(Config.resource..':DestroyMarker')
AddEventHandler(Config.resource..':DestroyMarker', function(id)
    if (id and markers[id]) then 
        markers[id] = nil;
    end
end);

RegisterNetEvent(Config.resource..':onMarkerHit');
RegisterNetEvent(Config.resource..':onMarkerLeave');

-- Utils

local entityEnumerator = {
    __gc = function(enum)
      if enum.destructor and enum.handle then
        enum.destructor(enum.handle)
      end
      enum.destructor = nil
      enum.handle = nil
    end
};

function EnumerateEntities(initFunc, moveFunc, disposeFunc)
    return coroutine.wrap(function()
      local iter, id = initFunc()
      if not id or id == 0 then
        disposeFunc(iter)
        return
      end
      
      local enum = {handle = iter, destructor = disposeFunc}
      setmetatable(enum, entityEnumerator)
      
      local next = true
      repeat
        coroutine.yield(id)
        next, id = moveFunc(iter)
      until not next
      
      enum.destructor, enum.handle = nil, nil
      disposeFunc(iter)
    end)
end
  
function EnumeratePeds()
    return EnumerateEntities(FindFirstPed, FindNextPed, EndFindPed)
end

function drawText(x,y ,width,height,scale, text, r,g,b,a, outline)
    SetTextFont(0)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    if(outline)then
	    SetTextOutline()
	end
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end