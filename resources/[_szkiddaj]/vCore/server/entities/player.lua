EntityConstructors['player'] = function(self, playerId)
    self.__netId = playerId;
end 

EntitySharedInternalKeys['player'] = {
    invicible = true, 
};

EntityExtensions['player'] = {
    setInvincible = function(self, newState)
        self.setInternalData("invincible", (type(newState) == "boolean" and newState == true), true);
    end, 

    isInvincible = function(self)
        return self.getInternalData("invincible");
    end, 

    setPosition = function(self, xOrVector, y, z)
        return SetEntityCoords(
            GetPlayerPed(self.__netId), 
            (type(xOrVector) == "number") 
                    and vector3(xOrVector, y, z) 
                    or xOrVector, 
            false, false, false, false
        );
    end, 

    getPosition = function(self)
        return GetEntityCoords(GetPlayerPed(self.__netId));
    end, 

    setDimension = function(self, target)
        if (
            type(target) ~= 'number' or 
            target < 0 or 
            target > 65535
        ) then 
            return false;
        end 
        
        local canceled = self.__emit("onDimensionChange", self.__Dimension, target);
        if (not canceled) then 
            self.setInternalData("dimension", target, true);
            
            useFetchAsync(self.__netId, "realweapons::hide", function(success)
                if (success) then 
                    SetPlayerRoutingBucket(self.__netId, target);
                    useFetchAsync(self.__netId, "realweapons::show", function() end);
                end 
            end);

            return true;
        end 

        return false;
    end,
    
    getDimension = function(self)
        return self.getInternalData("dimension");
    end, 

    triggerEvent = function(self, event, ...)
        TriggerClientEvent(event, self.__netId, ...);
    end, 
};