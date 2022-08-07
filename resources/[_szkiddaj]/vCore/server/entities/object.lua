EntityConstructors['object'] = function(self, ...)
    local objNetId = CreateObject(...);
    self.__netId = objNetId;
end 

EntityDestructors['object'] = function(self)
    if (DoesEntityExist(self.__netId)) then 
        DeleteEntity(self.__netId);
    end 
end