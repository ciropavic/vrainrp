local ESX

local IsForceDisabled;
local maxDistance = 25;
local isSelfVisible = true;

local PlayersData = {};
local PlayerTags = {};

local gtEnum = {
    GAMER_NAME = 0,
    CREW_TAG = 1,
    HEALTH_ARMOUR = 2,
    BIG_TEXT = 3,
    AUDIO_ICON = 4,
    MP_USING_MENU = 5,
    MP_PASSIVE_MODE = 6,
    WANTED_STARS = 7,
    MP_DRIVER = 8,
    MP_CO_DRIVER = 9,
    MP_TAGGED = 10,
    GAMER_NAME_NEARBY = 11,
    ARROW = 12,
    MP_PACKAGES = 13,
    INV_IF_PED_FOLLOWING = 14,
    RANK_TEXT = 15,
    MP_TYPING = 16
}

local __PlayersInAdminDuty = {};
local __InvisiblePlayers = {};
local __PlayersLastName = {};
local __AdminTitles = nil;
local __AdminColors = nil;
local __ANamesEnabled = false;

function rootRender()
    while (true) do
        local localPed = PlayerPedId();
        local localCoords = GetEntityCoords(localPed);

        if (__AdminTitles and __AdminColors and not IsForceDisabled) then 
            for _, id in ipairs(GetActivePlayers()) do 
                if (NetworkIsPlayerActive(id)) then
                    local playerId = GetPlayerServerId(id);
                    local playerPed = GetPlayerPed(id);

                    local playerData = PlayersData[playerId];
                    local playerAdmin = __PlayersInAdminDuty[playerId];
                    if (playerData) then 
                        local name = (playerAdmin and playerAdmin.level and playerAdmin.name)
                                    and "(" .. playerId .. ") " .. (playerAdmin.name or "Ismeretlen admin") .. " [" .. __AdminTitles[(playerAdmin.level or 0)] .. "]"
                                    or ((playerData?.char_name) and ("(" .. playerId .. ") " .. playerData?.char_name) or playerId);

                        if (
                            not PlayerTags[playerId] or 
                            not IsMpGamerTagActive(PlayerTags[playerId]) or 
                            (__PlayersLastName[playerId] and __PlayersLastName[playerId] ~= name)
                        ) then 
                            if (PlayerTags[playerId]) then 
                                RemoveMpGamerTag(PlayerTags[playerId]);
                            end 

                            PlayerTags[playerId] = CreateFakeMpGamerTag(playerPed, name, false, false, '', 0);
                            __PlayersLastName[playerId] = name;
                        end 

                        local tag = PlayerTags[playerId];

                        local playerCoords = GetEntityCoords(playerPed);
                        local distance = #(playerCoords - localCoords);
                        
                        if (
                            (isSelfVisible or localPed ~= playerPed) and 
                            not __InvisiblePlayers[playerId] and 
                            distance < (__ANamesEnabled and 500 or 15) and 
                            (__ANamesEnabled or HasEntityClearLosToEntity(localPed, playerPed, 17))
                        ) then
                            Citizen.InvokeNative(0xD61676B3, __ANamesEnabled and 500.0 or 15.0);

                            SetMpGamerTagVisibility(tag, gtEnum.GAMER_NAME, true);
                            SetMpGamerTagVisibility(tag, gtEnum.AUDIO_ICON, NetworkIsPlayerTalking(id));
            
                            SetMpGamerTagVisibility(tag, gtEnum.MP_USING_MENU, playerAdmin ~= nil);

                            -- ha van anames
                            SetMpGamerTagVisibility(tag, gtEnum.HEALTH_ARMOUR, __ANamesEnabled);
            
                            local color = __AdminColors[((playerAdmin and playerAdmin.level) or 0)].gamecolor;
                            SetMpGamerTagColour(tag, 0, color);
                            SetMpGamerTagColour(tag, 5, color);
                            SetMpGamerTagColour(tag, 15, color);
            
                            SetMpGamerTagAlpha(tag, gtEnum.AUDIO_ICON, 255);
                            SetMpGamerTagAlpha(tag, gtEnum.HEALTH_ARMOUR, __ANamesEnabled and 255 or 0);
                        else
                            SetMpGamerTagVisibility(tag, gtEnum.GAMER_NAME, false);
                            SetMpGamerTagVisibility(tag, gtEnum.AUDIO_ICON, false);
                            SetMpGamerTagVisibility(tag, gtEnum.MP_USING_MENU, false);
                            SetMpGamerTagVisibility(tag, gtEnum.HEALTH_ARMOUR, false);
                        end
                    end
                end
            end
        end

        Wait(100);
    end
end 

function setState(newState)
    isSelfVisible = newState;
end 
exports("setState", setState);

function update(data)
    PlayersData = data
end

RegisterNetEvent("vNametag::setANames");
AddEventHandler("vNametag::setANames", function(newState)
    __ANamesEnabled = newState;
end);

AddEventHandler("onClientEntityCreated", function(entity)
    if (entity.__type == "player") then 
        local admin = entity.getMeta("admin");
        if (admin and admin.duty) then 
            __PlayersInAdminDuty[entity.__netId] = {
                level = admin.level, 
                name = admin.name, 
            };
        end 
    end 
end);

AddEventHandler("onClientMetaChangeOnAnyEntity", function(entity, key, oldValue, newValue)
    if (entity.__type == "player") then 
        if (key == "invisible") then 
            if (not __InvisiblePlayers[entity.__netId]) then 
                __InvisiblePlayers[entity.__netId] = true;
            else
                __InvisiblePlayers[entity.__netId] = nil;
            end 
        elseif (key == "admin") then 
            if (newValue ~= nil and newValue.level and newValue.level > 0 and newValue.duty) then 
                __PlayersInAdminDuty[entity.__netId] = {
                    level = newValue.level, 
                    name = newValue.name, 
                };
            else 
                __PlayersInAdminDuty[entity.__netId] = nil;
            end 
        end 
    end 
end);

AddEventHandler('onResourceStop', function(name)
    if (name == GetCurrentResourceName()) then
        IsForceDisabled = true;
        
        for _, tag in pairs(PlayerTags) do
            
            RemoveMpGamerTag(tag);
            PlayerTags[_] = nil;
        end
    end
end);

Citizen.CreateThread(
    function()
        while (ESX == nil) do
            TriggerEvent(
                "esx:getSharedObject",
                function(obj)
                    ESX = obj
                end
            )
            Wait(50)
        end

        while (true) do
            ESX.TriggerServerCallback("vNametag:fetchPlayersData", update)
            Citizen.Wait(2000)
        end
    end
);

Citizen.CreateThread(function()
    while (GetResourceState("vAdmin") ~= "started") do 
        Wait(100);
    end 

    __AdminTitles = exports.vAdmin:getAdminTitles();
    __AdminColors = exports.vAdmin:getAdminColors();
end);

Citizen.CreateThread(
    function()
        Wait(5000);
        rootRender();
    end
);

Citizen.CreateThread(function()
    while (true) do 
        local players = exports.vCore:getEntitiesByType("player");
        for _, player in ipairs(players) do 
            local playerPed = GetPlayerPed(GetPlayerFromServerId(player.__netId));
            local isInvisible = player.getMeta("invisible");

            if (not __InvisiblePlayers[player.__netId] and isInvisible) then 
                __InvisiblePlayers[player.__netId] = true;
            elseif (__InvisiblePlayers[player.__netId] and not isInvisible) then 
                __InvisiblePlayers[player.__netId] = nil;
            end 
        end 

        Wait(5000);
    end 
end);