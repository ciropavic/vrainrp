EntityConstructors['ped'] = function(self, ...)
    local ped = CreatePed(...);
    self.__netId = ped;
end 

EntityDestructors['ped'] = function(self)
    if (DoesEntityExist(self.__netId)) then 
        DeleteEntity(self.__netId);
    end 
end

EntityExtensions['ped'] = {
    __isFrozen = false, 

    freeze = function(self, state)
        self.__isFrozen = state;
        FreezeEntityPosition(self.__netId, state);
    end, 
    
    isFrozen = function(self)
        return self.__isFrozen;
    end, 

    invokeNative = function(self, nativeAddress, ...)
        TriggerClientEvent("vCore::internal::invokeNative", -1, self.id, nativeAddress, ...);
    end, 
};