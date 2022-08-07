EntityConstructors['player'] = function(self)
    
end 

EntityExtensions['player'] = {
    getPosition = function(self)
        return GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(self.__netId)));
    end
};

Citizen.CreateThread(function()
    local localPlayer;

    while (localPlayer == nil) do 
        localPlayer = getLocalPlayer();
        Wait(10);
    end 

    while (true) do
        if (localPlayer) then 
            local playerPed = PlayerPedId();

            if (not localPlayer.getInternalData) then 
                iprint(localPlayer);
                break;
            end 

            if (localPlayer.getInternalData("invincible")) then
                SetEntityInvincible(playerPed, true);
                SetPlayerInvincible(PlayerId(), true);
                SetPedCanRagdoll(playerPed, false);
                ClearPedBloodDamage(playerPed);
                ResetPedVisibleDamage(playerPed);
                ClearPedLastWeaponDamage(playerPed);
                SetEntityProofs(playerPed, true, true, true, true, true, true, true, true);
                SetEntityOnlyDamagedByPlayer(playerPed, false);
                SetEntityCanBeDamaged(playerPed, false);
                SetPedCanBeKnockedOffVehicle(playerPed, 1);
            else 
                local playerPed = PlayerPedId();
                SetEntityInvincible(playerPed, false);
                SetPlayerInvincible(PlayerId(), false)
                SetPedCanRagdoll(playerPed, true);
                ClearPedLastWeaponDamage(playerPed);
                SetEntityProofs(playerPed, false, false, false, false, false, false, false, false);
                SetEntityOnlyDamagedByPlayer(playerPed, false);
                SetEntityCanBeDamaged(playerPed, true);
                SetPedCanBeKnockedOffVehicle(playerPed, 0);
            end 
        end 
        
        Wait(0);
    end 
end);