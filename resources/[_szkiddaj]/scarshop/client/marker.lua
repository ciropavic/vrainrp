local markers = {};
local closeMarkers = {};
local drawDistance = 50;

-- Draw markers
Citizen.CreateThread(function()
    while true do 
        local player = GetPlayerPed(-1);
        if (not DoesEntityExist(player)) then 
            player = GetPlayerPed(-1);
        else
            local pCoords = GetEntityCoords(player);

            for markerId, _ in pairs(closeMarkers) do 
                local marker = markers[markerId];

                if (marker) then 
                    local x, y, z = table.unpack(marker.position);

                    DrawMarker(marker.type, x, y, z, 0.0, 0.0, 0.0, marker.rx, marker.ry, marker.rz, 
                            marker.radius, marker.radius, marker.radius, marker.r, marker.g, marker.b, marker.a, false, false, 2, 30, false, false, false);
                end
            end 
        end

        Wait(0);
    end
end);

-- Hit detection
Citizen.CreateThread(function()
    local player = GetPlayerPed(-1);
    while (true) do 
        if (not DoesEntityExist(player)) then 
            player = GetPlayerPed(-1);
        else
            local pCoords = GetEntityCoords(player);
    
            for markerId, _ in pairs(closeMarkers) do 
                local marker = markers[markerId];

                if (marker) then 
                    for ped in EnumeratePeds() do 
                        local pedCoords = GetEntityCoords(ped);
                        local dist = #( pedCoords - marker.position );

                        if (not marker.entitiesIn[ped] and dist <= marker.radius) then 
                            marker.entitiesIn[ped] = true;
                            TriggerEvent(ClientConfig.resource..':onMarkerHit', i, ped, player == ped, marker.data);
                        elseif (marker.entitiesIn[ped] and dist > marker.radius) then 
                            marker.entitiesIn[ped] = nil;
                            TriggerEvent(ClientConfig.resource..':onMarkerLeave', i, ped, player == ped, marker.data);
                        end
                    end
                end
            end 
        end

        Wait(100);
    end 
end);

-- load/unload markers
Citizen.CreateThread(function()
    while (true) do 
        if (not DoesEntityExist(player)) then 
            player = GetPlayerPed(-1);
        else
            local pCoords = GetEntityCoords(player);

            for k,v in pairs(markers) do 
                local dist = #( pCoords - v.position );

                if ( dist < drawDistance and not closeMarkers[k] ) then 
                    closeMarkers[k] = true;
                elseif ( dist > drawDistance and closeMarkers[k] ) then 
                    closeMarkers[k] = nil;
                end 
            end
        end

        Wait(2500);
    end 
end);

RegisterNetEvent(ClientConfig.resource..':CreateMarker')
AddEventHandler(ClientConfig.resource..':CreateMarker', function(id, x, y, z, type, radius, r, g, b, a, data)
    if (not id or markers[id]) then return false; end
    markers[id] = {
        position = vector3(x, y, z),
        rx = rx or 0.0,
        ry = ry or 0.0,
        rz = rz or 0.0,
        r = r,
        g = g,
        b = b,
        a = a,
        type = type,
        radius = radius,
        data = data,

        entitiesIn = {},
    };
end);

RegisterNetEvent(ClientConfig.resource..':DestroyMarker')
AddEventHandler(ClientConfig.resource..':DestroyMarker', function(id)
    if (id and markers[id]) then 
        markers[id] = nil;
    end
end);

RegisterNetEvent(ClientConfig.resource..':onMarkerHit');
RegisterNetEvent(ClientConfig.resource..':onMarkerLeave');

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