local state = false;
local ESX;

Citizen.CreateThread(function()
    while ESX == nil do 
        TriggerEvent("esx:getSharedObject", function(obj) ESX = obj end);
        Wait(50);
    end
end);

RegisterNetEvent('vAdmin:toggle');
AddEventHandler('vAdmin:toggle', function(toggle)
	state = toggle;

    local player = PlayerPedId();
    -- SetEntityAlpha(player, state and 0 or 255, false);
    FreezeEntityPosition(player, toggle);
    SetEntityCollision(player, not toggle, toggle and true or false);

    if (toggle) then 
        Citizen.CreateThread(rootRender);
    end 
end);

local __InvisiblePlayers = {};

AddEventHandler("onClientMetaChangeOnAnyEntity", function(entity, key, oldValue, newValue)
    if (
        key == "invisible" and 
        entity.__type == "player"
    ) then 
        local playerPed = GetPlayerPed(GetPlayerFromServerId(entity.__netId));
        local isLocalPlayer = (entity.__netId == GetPlayerServerId(PlayerId()));

        if (
            GetPlayerServerId(PlayerId()) ~= entity.__netId and 
            playerPed == PlayerPedId()
        ) then 
            __InvisiblePlayers[entity.__netId] = (__InvisiblePlayers[entity.__netId] ~= nil) and true or nil;
            return;
        end 
        
        if (not __InvisiblePlayers[entity.__netId]) then 
            __InvisiblePlayers[entity.__netId] = true;
            SetEntityAlpha(playerPed, isLocalPlayer and 100 or 0, false);
        else
            __InvisiblePlayers[entity.__netId] = nil;
            SetEntityAlpha(playerPed, 255, false);
        end 
    end 
end);

CreateThread(function()
    while (true) do 
        local players = exports.vCore:getEntitiesByType("player");
        for _, player in ipairs(players) do 
            local playerPed = GetPlayerPed(GetPlayerFromServerId(player.__netId));
            local isLocalPlayer = (player.__netId == GetPlayerServerId(PlayerId()));
            local isInvisible = player.getMeta("invisible");
            
            if (
                GetPlayerServerId(PlayerId()) ~= player.__netId and 
                playerPed == PlayerPedId()
            ) then 
                __InvisiblePlayers[player.__netId] = (__InvisiblePlayers[player.__netId] ~= nil) and true or nil;
            else 
                if (not __InvisiblePlayers[player.__netId] and isInvisible) then 
                    __InvisiblePlayers[player.__netId] = true;
                    SetEntityAlpha(playerPed, isLocalPlayer and 100 or 0, false);
                elseif (__InvisiblePlayers[player.__netId] and not isInvisible) then 
                    __InvisiblePlayers[player.__netId] = nil;
                    SetEntityAlpha(playerPed, 255, false);
                end 
            end 
        end 

        Wait(5000);
    end 
end);

RegisterCommand("+toggleretardednoclip", function()
    local success = exports.vCore:useFetch("vAdmin::emitCommand", "fly", { });
end, false)
RegisterKeyMapping('+toggleretardednoclip', 'Noclip engedélyezése/tiltása adminoknak.', 'keyboard', 'NUMPAD8');

local VerticalSpeeds = {
    [80] = 4.0, 
    [15] = 1.0, 
    [1] = 0.1,
};

function rootRender()
    local player = PlayerPedId();
    while (true) do 
        Wait(0);

        if (not DoesEntityExist(player)) then 
            player = PlayerPedId();
            Wait(200);
            ::continue::;
        end 

        if (state) then 
            local coords = GetEntityCoords(player);
            local speed = 3;
            local x, y, z = coords[1], coords[2], coords[3];
            local rot = 0;

            if (IsControlPressed(0, 24)) then
                speed = 80;
            elseif (IsControlPressed(0, 21)) then 
                speed = 15;
            elseif (IsControlPressed(0, 19)) then 
                speed = 1;
            end

            if (IsControlPressed(0, 22)) then -- Space
                z = z + ((speed and VerticalSpeeds[speed]) or 1.0);
            elseif (IsDisabledControlPressed(0, 36)) then -- LCtrl
                z = z - ((speed and VerticalSpeeds[speed]) or 1.0);
            end
            
            speed = speed * 0.3334;

            if (IsControlPressed(0, 32)) then -- W
                a, rot = rotFromCam(0.0);
                SetEntityHeading(player, a);
                local ox, oy = dirMove(a);
                x = x + ox * speed;
                y = y + oy * speed;
            end

            if (IsControlPressed(0, 33)) then -- A
                a, rot = rotFromCam(180.0);
                SetEntityHeading(player, a);
                local ox, oy = dirMove(a);
                x = x + ox * speed;
                y = y + oy * speed;
            end

            if (IsControlPressed(0, 34)) then -- S
                a, rot = rotFromCam(-90.0);
                SetEntityHeading(player, a);
                local ox, oy = dirMove(a);
                x = x + ox * speed;
                y = y + oy * speed;
            end

            if (IsControlPressed(0, 35)) then -- D
                a, rot = rotFromCam(90.0);
                SetEntityHeading(player, a);
                local ox, oy = dirMove(a);
                x = x + ox * speed;
                y = y + oy * speed;
            end

            SetEntityCoordsNoOffset(player, x + 0.0, y + 0.0, z - 0.0, false, false, false);
            SetEntityHeading(player, rot - 180.0);
        else 
            return;
        end
    end
end 

function rotFromCam(rzOffset)
    local camCoords = GetGameplayCamCoord();
    local camPointCoords, rotation = RayCastGamePlayCamera(10);
    local cx, cy, fx, fy = camCoords[1], camCoords[2], camPointCoords[1], camPointCoords[2];
	local deltaY,deltaX = fy-cy,fx-cx
	local rotZ = math.deg(math.atan((deltaY)/(deltaX)))
	if deltaY >= 0 and deltaX <= 0 then -- 4 cwiartka
		rotZ = rotZ+180
	elseif deltaY <= 0 and deltaX <= 0 then -- 3 cwiartka
		rotZ = rotZ+180
	end
	return -rotZ+90 + rzOffset, rotation;
end

function dirMove(a)
	local x = math.sin(math.rad(a))
	local y = math.cos(math.rad(a))
	return x,y
end

function RotationToDirection(rotation)
    local adjustedRotation = 
    { 
        x = (math.pi / 180) * rotation.x, 
        y = (math.pi / 180) * rotation.y, 
        z = (math.pi / 180) * rotation.z 
    }
    local direction = 
    {
        x = -math.sin(adjustedRotation.z) * math.abs(math.cos(adjustedRotation.x)), 
        y = math.cos(adjustedRotation.z) * math.abs(math.cos(adjustedRotation.x)), 
        z = math.sin(adjustedRotation.x)
    }
    return direction
end

function RayCastGamePlayCamera(distance)
    local cameraRotation = GetGameplayCamRot()
    local cameraCoord = GetGameplayCamCoord()
    local direction = RotationToDirection(cameraRotation)
    local destination = 
    { 
        x = cameraCoord.x + direction.x * distance, 
        y = cameraCoord.y + direction.y * distance, 
        z = cameraCoord.z + direction.z * distance 
    }

    return vector3(destination.x, destination.y, destination.z), findRotation(cameraCoord.x, cameraCoord.y, destination.x, destination.y);
end

function findRotation(x1, y1, x2, y2) 
    local t = -math.deg( math.atan2( x2 - x1, y2 - y1 ) )
    return t < 0 and t + 360 or t
end