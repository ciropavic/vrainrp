EntityConstructors['vehicle'] = function(self, ...)
    local vehicle = CreateVehicle(...);
    print("returned from CreateVehicle: " .. vehicle, NetworkGetEntityFromNetworkId(vehicle));
    self.__netId = vehicle;
end 

EntityDestructors['vehicle'] = function(self)
    if (DoesEntityExist(self.__netId)) then 
        DeleteEntity(self.__netId);
    end 
end

EntityClientEvents['vehicle'] = {
    enteringVehicle = function(self, ...)
        iprint("enteringVehicle", { ... });
    end, 

    enteringAborted = function(self, ...)
        iprint("enteringAborted", { ... });
    end, 

    enteredVehicle = function(self, ...)
        iprint("enteredVehicle", { ... });
    end, 

    leftVehicle = function(self, ...)
        iprint("leftVehicle", { ... });
    end, 
};

EntityExtensions['vehicle'] = {
    invokeNative = function(self, nativeAddress, ...)
        TriggerClientEvent("vCore::internal::invokeNative", -1, self.id, nativeAddress, ...);
    end, 
};